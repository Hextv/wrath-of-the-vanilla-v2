/*
 * This file is part of the AzerothCore Project. See AUTHORS file for Copyright information
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Affero General Public License as published by the
 * Free Software Foundation; either version 3 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "Cell.h"
#include "CellImpl.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "InstanceScript.h"
#include "ObjectDefines.h"
#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "../../../src/server/scripts/EasternKingdoms/BlackrockMountain/BlackrockSpire/instance_blackrock_spire.cpp"
#include "../../../src/server/scripts/EasternKingdoms/BlackrockMountain/BlackrockSpire/blackrock_spire.h"

enum UbrsDoorIds
{
    EVENT_UBRS_DOOR        = 4,
    TIMER_UBRS_DOOR        = 3000,
    GO_DOOR_UBRS           = 164725,
    GO_BRAZIER_1           = 175528,
    GO_BRAZIER_2           = 175529,
    GO_BRAZIER_3           = 175530,
    GO_BRAZIER_4           = 175531,
    GO_BRAZIER_5           = 175532,
    GO_BRAZIER_6           = 175533,
    ITEM_SEAL_OF_ASCENSION = 12344
};

class instance_blackrock_spire_vanilla : public InstanceMapScript
{
    public:
        instance_blackrock_spire_vanilla() : InstanceMapScript(BRSScriptName, 229) { }

        struct instance_blackrock_spire_vanillaMapScript : public InstanceScript
        {
            uint32 CurrentSolakarWave = 0;
            uint32 SolakarState       = NOT_STARTED; // there should be a global instance encounter state, where is it?
            std::vector<TempSummon*> SolakarSummons;
            uint32 CurrentUbrsDoorStage = 0;
            uint32 UbrsDoorState = NOT_STARTED;

            instance_blackrock_spire_vanillaMapScript(InstanceMap* map) : InstanceScript(map)
            {
                SetBossNumber(EncounterCount);
                LoadMinionData(minionData);
                LoadDoorData(doorData);
                CurrentSolakarWave = 0;
                SolakarState = NOT_STARTED;
                SolakarSummons.clear();
            }

            void CreatureLooted(Creature* creature, LootType loot) override
            {
                switch (creature->GetEntry())
                {
                    case NPC_THE_BEAST:
                        if (loot == LOOT_SKINNING)
                        {
                            creature->CastSpell(creature, SPELL_FINKLE_IS_EINHORN, true);
                        }
                        break;
                }
            }

            void OnCreatureCreate(Creature* creature) override
            {
                switch (creature->GetEntry())
                {
                    case NPC_UROK_MAGUS:
                        [[fallthrough]];
                    case NPC_UROK_ENFORCER:
                        UrokMobs.push_back(creature->GetGUID());
                        break;
                    case NPC_HIGHLORD_OMOKK:
                        HighlordOmokk = creature->GetGUID();
                        break;
                    case NPC_SHADOW_HUNTER_VOSHGAJIN:
                        ShadowHunterVoshgajin = creature->GetGUID();
                        break;
                    case NPC_WARMASTER_VOONE:
                        WarMasterVoone = creature->GetGUID();
                        break;
                    case NPC_MOTHER_SMOLDERWEB:
                        MotherSmolderweb = creature->GetGUID();
                        break;
                    case NPC_UROK_DOOMHOWL:
                        UrokDoomhowl = creature->GetGUID();
                        break;
                    case NPC_QUARTERMASTER_ZIGRIS:
                        QuartermasterZigris = creature->GetGUID();
                        break;
                    case NPC_GIZRUL_THE_SLAVENER:
                        GizrultheSlavener = creature->GetGUID();
                        break;
                    case NPC_HALYCON:
                        Halycon = creature->GetGUID();
                        break;
                    case NPC_OVERLORD_WYRMTHALAK:
                        OverlordWyrmthalak = creature->GetGUID();
                        break;
                    case NPC_PYROGAURD_EMBERSEER:
                        PyroguardEmberseer = creature->GetGUID();
                        if (GetBossState(DATA_PYROGAURD_EMBERSEER) == DONE)
                            creature->DisappearAndDie();
                        break;
                    case NPC_WARCHIEF_REND_BLACKHAND:
                        if (GetBossState(DATA_GYTH) != IN_PROGRESS)
                        {
                            WarchiefRendBlackhand = creature->GetGUID();
                        }

                        if (GetBossState(DATA_GYTH) == DONE)
                            creature->DisappearAndDie();
                        break;
                    case NPC_GYTH:
                        Gyth = creature->GetGUID();
                        break;
                    case NPC_THE_BEAST:
                        TheBeast = creature->GetGUID();
                        break;
                    case NPC_GENERAL_DRAKKISATH:
                        GeneralDrakkisath = creature->GetGUID();
                        break;
                    case NPC_LORD_VICTOR_NEFARIUS:
                        LordVictorNefarius = creature->GetGUID();
                        if (GetBossState(DATA_GYTH) == DONE)
                            creature->DisappearAndDie();
                        break;
                    case NPC_FINKLE_EINHORN:
                        creature->AI()->Talk(SAY_FINKLE_GANG);
                        break;
                    case NPC_CHROMATIC_ELITE_GUARD:
                        AddMinion(creature, true);
                        break;
                }
            }

            void OnGameObjectCreate(GameObject* go) override
            {
                switch (go->GetEntry())
                {
                    case GO_EMBERSEER_IN:
                        go_emberseerin = go->GetGUID();
                        HandleGameObject(ObjectGuid::Empty, GetBossState(DATA_DRAGONSPIRE_ROOM) == DONE, go);
                        break;
                    case GO_DOORS:
                        go_doors = go->GetGUID();
                        if (GetBossState(DATA_DRAGONSPIRE_ROOM) == DONE)
                            HandleGameObject(ObjectGuid::Empty, true, go);
                        break;
                    case GO_EMBERSEER_OUT:
                        go_emberseerout = go->GetGUID();
                        if (GetBossState(DATA_PYROGAURD_EMBERSEER) == DONE)
                            HandleGameObject(ObjectGuid::Empty, true, go);
                        break;
                    case GO_HALL_RUNE_1:
                        go_roomrunes[0] = go->GetGUID();
                        if (GetBossState(DATA_HALL_RUNE_1) == DONE)
                            HandleGameObject(ObjectGuid::Empty, false, go);
                        break;
                    case GO_HALL_RUNE_2:
                        go_roomrunes[1] = go->GetGUID();
                        if (GetBossState(DATA_HALL_RUNE_2) == DONE)
                            HandleGameObject(ObjectGuid::Empty, false, go);
                        break;
                    case GO_HALL_RUNE_3:
                        go_roomrunes[2] = go->GetGUID();
                        if (GetBossState(DATA_HALL_RUNE_3) == DONE)
                            HandleGameObject(ObjectGuid::Empty, false, go);
                        break;
                    case GO_HALL_RUNE_4:
                        go_roomrunes[3] = go->GetGUID();
                        if (GetBossState(DATA_HALL_RUNE_4) == DONE)
                            HandleGameObject(ObjectGuid::Empty, false, go);
                        break;
                    case GO_HALL_RUNE_5:
                        go_roomrunes[4] = go->GetGUID();
                        if (GetBossState(DATA_HALL_RUNE_5) == DONE)
                            HandleGameObject(ObjectGuid::Empty, false, go);
                        break;
                    case GO_HALL_RUNE_6:
                        go_roomrunes[5] = go->GetGUID();
                        if (GetBossState(DATA_HALL_RUNE_6) == DONE)
                            HandleGameObject(ObjectGuid::Empty, false, go);
                        break;
                    case GO_HALL_RUNE_7:
                        go_roomrunes[6] = go->GetGUID();
                        if (GetBossState(DATA_HALL_RUNE_7) == DONE)
                            HandleGameObject(ObjectGuid::Empty, false, go);
                        break;
                    case GO_EMBERSEER_RUNE_1:
                        go_emberseerrunes[0] = go->GetGUID();
                        if (GetBossState(DATA_PYROGAURD_EMBERSEER) == DONE)
                            HandleGameObject(ObjectGuid::Empty, false, go);
                        break;
                    case GO_EMBERSEER_RUNE_2:
                        go_emberseerrunes[1] = go->GetGUID();
                        if (GetBossState(DATA_PYROGAURD_EMBERSEER) == DONE)
                            HandleGameObject(ObjectGuid::Empty, false, go);
                        break;
                    case GO_EMBERSEER_RUNE_3:
                        go_emberseerrunes[2] = go->GetGUID();
                        if (GetBossState(DATA_PYROGAURD_EMBERSEER) == DONE)
                            HandleGameObject(ObjectGuid::Empty, false, go);
                        break;
                    case GO_EMBERSEER_RUNE_4:
                        go_emberseerrunes[3] = go->GetGUID();
                        if (GetBossState(DATA_PYROGAURD_EMBERSEER) == DONE)
                            HandleGameObject(ObjectGuid::Empty, false, go);
                        break;
                    case GO_EMBERSEER_RUNE_5:
                        go_emberseerrunes[4] = go->GetGUID();
                        if (GetBossState(DATA_PYROGAURD_EMBERSEER) == DONE)
                            HandleGameObject(ObjectGuid::Empty, false, go);
                        break;
                    case GO_EMBERSEER_RUNE_6:
                        go_emberseerrunes[5] = go->GetGUID();
                        if (GetBossState(DATA_PYROGAURD_EMBERSEER) == DONE)
                            HandleGameObject(ObjectGuid::Empty, false, go);
                        break;
                    case GO_EMBERSEER_RUNE_7:
                        go_emberseerrunes[6] = go->GetGUID();
                        if (GetBossState(DATA_PYROGAURD_EMBERSEER) == DONE)
                            HandleGameObject(ObjectGuid::Empty, false, go);
                        break;
                    case GO_PORTCULLIS_ACTIVE:
                        go_portcullis_active = go->GetGUID();
                        if (GetBossState(DATA_GYTH) == DONE)
                            HandleGameObject(ObjectGuid::Empty, true, go);
                        break;
                    case GO_UROK_PILE:
                        go_urokPile = go->GetGUID();
                        break;
                    case GO_UROK_CIRCLE:
                        go_urokOgreCirles.push_back(go->GetGUID());
                        break;
                    case GO_UROK_CHALLENGE:
                        go_urokChallenge = go->GetGUID();
                        break;
                    case GO_DOOR_UBRS:
                        go_door_ubrs = go->GetGUID();
                        if (GetData(DATA_DRAGONSPIRE_ROOM) == DONE)
                            HandleGameObject(ObjectGuid::Empty, true, go);
                        break;
                    case GO_BRAZIER_1:
                        go_braziers[0] = go->GetGUID();
                        if (GetData(DATA_DRAGONSPIRE_ROOM) == DONE)
                            HandleGameObject(ObjectGuid::Empty, true, go);
                        break;
                    case GO_BRAZIER_2:
                        go_braziers[1] = go->GetGUID();
                        if (GetData(DATA_DRAGONSPIRE_ROOM) == DONE)
                            HandleGameObject(ObjectGuid::Empty, true, go);
                        break;
                    case GO_BRAZIER_3:
                        go_braziers[2] = go->GetGUID();
                        if (GetData(DATA_DRAGONSPIRE_ROOM) == DONE)
                            HandleGameObject(ObjectGuid::Empty, true, go);
                        break;
                    case GO_BRAZIER_4:
                        go_braziers[3] = go->GetGUID();
                        if (GetData(DATA_DRAGONSPIRE_ROOM) == DONE)
                            HandleGameObject(ObjectGuid::Empty, true, go);
                        break;
                    case GO_BRAZIER_5:
                        go_braziers[4] = go->GetGUID();
                        if (GetData(DATA_DRAGONSPIRE_ROOM) == DONE)
                            HandleGameObject(ObjectGuid::Empty, true, go);
                        break;
                    case GO_BRAZIER_6:
                        go_braziers[5] = go->GetGUID();
                        if (GetData(DATA_DRAGONSPIRE_ROOM) == DONE)
                            HandleGameObject(ObjectGuid::Empty, true, go);
                        break;
                    default:
                        break;
                }

                InstanceScript::OnGameObjectCreate(go);
            }

            bool SetBossState(uint32 type, EncounterState state) override
            {
                if (!InstanceScript::SetBossState(type, state))
                    return false;

                switch (type)
                {
                    case DATA_WARCHIEF_REND_BLACKHAND:
                        if (state == FAIL)
                        {
                            if (Creature* rend = instance->GetCreature(WarchiefRendBlackhand))
                            {
                                rend->Respawn(true);
                            }

                            if (Creature* nefarius = instance->GetCreature(LordVictorNefarius))
                            {
                                nefarius->AI()->Talk(SAY_NEFARIUS_REND_WIPE);
                            }
                        }
                        break;
                    default:
                        break;
                }

                return true;
            }

            void ProcessEvent(WorldObject* /*obj*/, uint32 eventId) override
            {
                switch (eventId)
                {
                    case EVENT_PYROGUARD_EMBERSEER:
                        if (GetBossState(DATA_PYROGAURD_EMBERSEER) == NOT_STARTED)
                        {
                            if (Creature* Emberseer = instance->GetCreature(PyroguardEmberseer))
                                Emberseer->AI()->SetData(1, 1);
                        }
                        break;
                    case EVENT_UROK_DOOMHOWL:
                        if (GetBossState(DATA_UROK_DOOMHOWL) == NOT_STARTED)
                        {
                            SetBossState(DATA_UROK_DOOMHOWL, IN_PROGRESS);
                            if (GameObject* pile = instance->GetGameObject(go_urokPile))
                            {
                                pile->SetLootState(GO_JUST_DEACTIVATED);
                            }
                        }
                        break;
                    default:
                        break;
                }
            }

            void SetData(uint32 type, uint32 data) override
            {
                switch (type)
                {
                    case AREATRIGGER:
                        if (data == AREATRIGGER_DRAGONSPIRE_HALL)
                        {
                            if (GetBossState(DATA_DRAGONSPIRE_ROOM) != DONE)
                                Events.ScheduleEvent(EVENT_DARGONSPIRE_ROOM_STORE, 1000);

                            if (UbrsDoorState == NOT_STARTED)
                                Events.ScheduleEvent(EVENT_UBRS_DOOR, TIMER_UBRS_DOOR);
                        }
                        break;
                    case DATA_SOLAKAR_FLAMEWREATH:
                        switch(data)
                        {
                            case IN_PROGRESS:
                                if (SolakarState == NOT_STARTED)
                                {
                                    Events.ScheduleEvent(EVENT_SOLAKAR_WAVE, 500);
                                }
                                break;
                            case FAIL:
                                for (const auto& creature : SolakarSummons)
                                {
                                    creature->RemoveFromWorld();
                                }
                                SolakarSummons.clear();
                                CurrentSolakarWave = 0;
                                SetData(DATA_SOLAKAR_FLAMEWREATH, NOT_STARTED);
                                break;
                            case DONE:
                                break;
                        }
                        SolakarState = data;
                        break;
                    case DATA_UROK_DOOMHOWL:
                        if (data == FAIL)
                        {
                            if (GetBossState(DATA_UROK_DOOMHOWL) != NOT_STARTED)
                            {
                                SetBossState(DATA_UROK_DOOMHOWL, NOT_STARTED);
                                if (GameObject* challenge = instance->GetGameObject(go_urokChallenge))
                                {
                                    challenge->Delete();
                                }
                                if (GameObject* pile = instance->GetGameObject(go_urokPile))
                                {
                                    pile->SetLootState(GO_READY);
                                    pile->Respawn();
                                }
                                for (const auto& circleGUID : go_urokOgreCirles)
                                {
                                    if (GameObject* circle = instance->GetGameObject(circleGUID))
                                    {
                                        circle->Delete();
                                    }
                                }
                                for (const auto& mobGUID : UrokMobs)
                                {
                                    if (Creature* mob = instance->GetCreature(mobGUID))
                                    {
                                        mob->DespawnOrUnsummon();
                                    }
                                }
                            }
                        }
                        break;
                    default:
                        break;
                }
            }

            uint32 GetData(uint32 type) const override
            {
                if (type == DATA_SOLAKAR_FLAMEWREATH)
                {
                    return SolakarState;
                }
                else
                {
                    return InstanceScript::GetData(type);
                }
            }

            void SummonSolakarWave(uint8 number)
            {
                if (number < MAX_WAVE_COUNT)
                {
                    SolakarSummons.push_back(instance->SummonCreature(NPC_ROOKERY_GUARDIAN, SolakarPosLeft));
                    SolakarSummons.push_back(instance->SummonCreature(NPC_ROOKERY_HATCHER, SolakarPosRight));
                    if (number == 0)
                    {
                        if (Creature* FirstHatcher = SolakarSummons.back()) // works because we spawned a hatcher second
                        {
                            FirstHatcher->AI()->Talk(SAY_SOLAKAR_FIRST_HATCHER);
                        }
                    }
                }
                else if (number == MAX_WAVE_COUNT)
                {
                    SolakarSummons.push_back(instance->SummonCreature(NPC_SOLAKAR, SolakarPosBoss));
                }
            }

            ObjectGuid GetGuidData(uint32 type) const override
            {
                switch (type)
                {
                    case DATA_HIGHLORD_OMOKK:
                        return HighlordOmokk;
                    case DATA_SHADOW_HUNTER_VOSHGAJIN:
                        return ShadowHunterVoshgajin;
                    case DATA_WARMASTER_VOONE:
                        return WarMasterVoone;
                    case DATA_MOTHER_SMOLDERWEB:
                        return MotherSmolderweb;
                    case DATA_UROK_DOOMHOWL:
                        return UrokDoomhowl;
                    case DATA_QUARTERMASTER_ZIGRIS:
                        return QuartermasterZigris;
                    case DATA_GIZRUL_THE_SLAVENER:
                        return GizrultheSlavener;
                    case DATA_HALYCON:
                        return Halycon;
                    case DATA_OVERLORD_WYRMTHALAK:
                        return OverlordWyrmthalak;
                    case DATA_PYROGAURD_EMBERSEER:
                        return PyroguardEmberseer;
                    case DATA_WARCHIEF_REND_BLACKHAND:
                        return WarchiefRendBlackhand;
                    case DATA_GYTH:
                        return Gyth;
                    case DATA_THE_BEAST:
                        return TheBeast;
                    case DATA_GENERAL_DRAKKISATH:
                        return GeneralDrakkisath;
                    case GO_EMBERSEER_IN:
                        return go_emberseerin;
                    case GO_DOORS:
                        return go_doors;
                    case GO_EMBERSEER_OUT:
                        return go_emberseerout;
                    case GO_HALL_RUNE_1:
                        return go_roomrunes[0];
                    case GO_HALL_RUNE_2:
                        return go_roomrunes[1];
                    case GO_HALL_RUNE_3:
                        return go_roomrunes[2];
                    case GO_HALL_RUNE_4:
                        return go_roomrunes[3];
                    case GO_HALL_RUNE_5:
                        return go_roomrunes[4];
                    case GO_HALL_RUNE_6:
                        return go_roomrunes[5];
                    case GO_HALL_RUNE_7:
                        return go_roomrunes[6];
                    case GO_EMBERSEER_RUNE_1:
                        return go_emberseerrunes[0];
                    case GO_EMBERSEER_RUNE_2:
                        return go_emberseerrunes[1];
                    case GO_EMBERSEER_RUNE_3:
                        return go_emberseerrunes[2];
                    case GO_EMBERSEER_RUNE_4:
                        return go_emberseerrunes[3];
                    case GO_EMBERSEER_RUNE_5:
                        return go_emberseerrunes[4];
                    case GO_EMBERSEER_RUNE_6:
                        return go_emberseerrunes[5];
                    case GO_EMBERSEER_RUNE_7:
                        return go_emberseerrunes[6];
                    case GO_PORTCULLIS_ACTIVE:
                        return go_portcullis_active;
                    case GO_UROK_PILE:
                        return go_urokPile;
                    case GO_UROK_CHALLENGE:
                        return go_urokChallenge;
                    case GO_DOOR_UBRS:
                        return go_door_ubrs;
                    case GO_BRAZIER_1:
                        return go_braziers[0];
                    case GO_BRAZIER_2:
                        return go_braziers[1];
                    case GO_BRAZIER_3:
                        return go_braziers[2];
                    case GO_BRAZIER_4:
                        return go_braziers[3];
                    case GO_BRAZIER_5:
                        return go_braziers[4];
                    case GO_BRAZIER_6:
                        return go_braziers[5];
                    default:
                        break;
                }

                return ObjectGuid::Empty;
            }

            void Update(uint32 diff) override
            {
                Events.Update(diff);

                while (uint32 eventId = Events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_DARGONSPIRE_ROOM_STORE:
                            Dragonspireroomstore();
                            Events.ScheduleEvent(EVENT_DARGONSPIRE_ROOM_CHECK, 3000);
                            break;
                        case EVENT_DARGONSPIRE_ROOM_CHECK:
                            Dragonspireroomcheck();
                            if ((GetBossState(DATA_DRAGONSPIRE_ROOM) != DONE))
                                Events.ScheduleEvent(EVENT_DARGONSPIRE_ROOM_CHECK, 3000);
                            break;
                        case EVENT_SOLAKAR_WAVE:
                            SummonSolakarWave(CurrentSolakarWave);
                            if (CurrentSolakarWave < MAX_WAVE_COUNT)
                            {
                                Events.ScheduleEvent(EVENT_SOLAKAR_WAVE, TIMER_SOLAKAR_WAVE);
                                CurrentSolakarWave++;
                            }
                            break;
                        case EVENT_UBRS_DOOR:
                            if (UbrsDoorState == NOT_STARTED)
                                UbrsDoorState = DONE;

                            switch (CurrentUbrsDoorStage)
                            {
                                case 0:
                                    if (GameObject* brazier = instance->GetGameObject(go_braziers[0]))
                                        brazier->SetGoState(GO_STATE_ACTIVE);
                                    if (GameObject* brazier = instance->GetGameObject(go_braziers[1]))
                                        brazier->SetGoState(GO_STATE_ACTIVE);

                                    CurrentUbrsDoorStage++;
                                    Events.ScheduleEvent(EVENT_UBRS_DOOR, TIMER_UBRS_DOOR);
                                    break;
                                case 1:
                                    if (GameObject* brazier = instance->GetGameObject(go_braziers[2]))
                                        brazier->SetGoState(GO_STATE_ACTIVE);
                                    if (GameObject* brazier = instance->GetGameObject(go_braziers[3]))
                                        brazier->SetGoState(GO_STATE_ACTIVE);

                                    CurrentUbrsDoorStage++;
                                    Events.ScheduleEvent(EVENT_UBRS_DOOR, TIMER_UBRS_DOOR);
                                    break;
                                case 2:
                                    if (GameObject* brazier = instance->GetGameObject(go_braziers[4]))
                                        brazier->SetGoState(GO_STATE_ACTIVE);
                                    if (GameObject* brazier = instance->GetGameObject(go_braziers[5]))
                                        brazier->SetGoState(GO_STATE_ACTIVE);

                                    CurrentUbrsDoorStage++;
                                    Events.ScheduleEvent(EVENT_UBRS_DOOR, TIMER_UBRS_DOOR);
                                    break;
                                case 3:
                                    if (GameObject* door = instance->GetGameObject(go_door_ubrs))
                                        door->SetGoState(GO_STATE_ACTIVE);
                                    break;
                                default:
                                    break;
                            }
                            break;
                        default:
                            break;
                    }
                }
            }

            void Dragonspireroomstore()
            {

                for (uint8 i = 0; i < 7; ++i)
                {
                    // Refresh the creature list
                    runecreaturelist[i].clear();

                    if (GameObject* rune = instance->GetGameObject(go_roomrunes[i]))
                    {
                        for (uint8 j = 0; j < 3; ++j)
                        {
                            std::list<Creature*> creatureList;
                            GetCreatureListWithEntryInGrid(creatureList, rune, DragonspireMobs[j], 15.0f);
                            for (std::list<Creature*>::iterator itr = creatureList.begin(); itr != creatureList.end(); ++itr)
                            {
                                if (Creature* creature = *itr)
                                {
                                    runecreaturelist[i].push_back(creature->GetGUID());
                                }
                            }
                        }
                    }
                }
            }

            void Dragonspireroomcheck()
            {
                Creature* mob = nullptr;
                GameObject* rune = nullptr;

                for (uint8 i = 0; i < 7; ++i)
                {
                    bool _mobAlive = false;
                    rune = instance->GetGameObject(go_roomrunes[i]);
                    if (!rune)
                        continue;

                    if (rune->GetGoState() == GO_STATE_ACTIVE)
                    {
                        for (ObjectGuid const& guid : runecreaturelist[i])
                        {
                            mob = instance->GetCreature(guid);
                            if (mob && mob->IsAlive())
                                _mobAlive = true;
                        }
                    }

                    if (!_mobAlive && rune->GetGoState() == GO_STATE_ACTIVE)
                    {
                        HandleGameObject(ObjectGuid::Empty, false, rune);

                        switch (rune->GetEntry())
                        {
                            case GO_HALL_RUNE_1:
                                SetBossState(DATA_HALL_RUNE_1, DONE);
                                break;
                            case GO_HALL_RUNE_2:
                                SetBossState(DATA_HALL_RUNE_2, DONE);
                                break;
                            case GO_HALL_RUNE_3:
                                SetBossState(DATA_HALL_RUNE_3, DONE);
                                break;
                            case GO_HALL_RUNE_4:
                                SetBossState(DATA_HALL_RUNE_4, DONE);
                                break;
                            case GO_HALL_RUNE_5:
                                SetBossState(DATA_HALL_RUNE_5, DONE);
                                break;
                            case GO_HALL_RUNE_6:
                                SetBossState(DATA_HALL_RUNE_6, DONE);
                                break;
                            case GO_HALL_RUNE_7:
                                SetBossState(DATA_HALL_RUNE_7, DONE);
                                break;
                            default:
                                break;
                        }
                    }
                }

                if (GetBossState(DATA_HALL_RUNE_1) == DONE && GetBossState(DATA_HALL_RUNE_2) == DONE && GetBossState(DATA_HALL_RUNE_3) == DONE &&
                        GetBossState(DATA_HALL_RUNE_4) == DONE && GetBossState(DATA_HALL_RUNE_5) == DONE && GetBossState(DATA_HALL_RUNE_6) == DONE &&
                        GetBossState(DATA_HALL_RUNE_7) == DONE)
                {
                    SetBossState(DATA_DRAGONSPIRE_ROOM, DONE);
                    if (GameObject* door1 = instance->GetGameObject(go_emberseerin))
                        HandleGameObject(ObjectGuid::Empty, true, door1);
                    if (GameObject* door2 = instance->GetGameObject(go_doors))
                        HandleGameObject(ObjectGuid::Empty, true, door2);
                    if (GameObject* door3 = instance->GetGameObject(go_emberseerin))
                        HandleGameObject(ObjectGuid::Empty, true, door3);
                }
            }

            std::string GetSaveData() override
            {
                OUT_SAVE_INST_DATA;

                std::ostringstream saveStream;
                saveStream << "B S " << GetBossSaveData();

                OUT_SAVE_INST_DATA_COMPLETE;
                return saveStream.str();
            }

            void Load(const char* strIn) override
            {
                if (!strIn)
                {
                    OUT_LOAD_INST_DATA_FAIL;
                    return;
                }

                OUT_LOAD_INST_DATA(strIn);

                char dataHead1, dataHead2;

                std::istringstream loadStream(strIn);
                loadStream >> dataHead1 >> dataHead2;

                if (dataHead1 == 'B' && dataHead2 == 'S')
                {
                    for (uint8 i = 0; i < EncounterCount; ++i)
                    {
                        uint32 tmpState;
                        loadStream >> tmpState;
                        if (tmpState == IN_PROGRESS || tmpState > SPECIAL)
                            tmpState = NOT_STARTED;

                        SetBossState(i, EncounterState(tmpState));
                    }
                }
                else
                    OUT_LOAD_INST_DATA_FAIL;

                OUT_LOAD_INST_DATA_COMPLETE;
            }

        protected:
            EventMap Events;
            ObjectGuid HighlordOmokk;
            ObjectGuid ShadowHunterVoshgajin;
            ObjectGuid WarMasterVoone;
            ObjectGuid MotherSmolderweb;
            ObjectGuid UrokDoomhowl;
            ObjectGuid QuartermasterZigris;
            ObjectGuid GizrultheSlavener;
            ObjectGuid Halycon;
            ObjectGuid OverlordWyrmthalak;
            ObjectGuid PyroguardEmberseer;
            ObjectGuid WarchiefRendBlackhand;
            ObjectGuid Gyth;
            ObjectGuid LordVictorNefarius;
            ObjectGuid TheBeast;
            ObjectGuid GeneralDrakkisath;
            ObjectGuid go_emberseerin;
            ObjectGuid go_doors;
            ObjectGuid go_emberseerout;
            ObjectGuid go_blackrockaltar;
            ObjectGuid go_roomrunes[7];
            ObjectGuid go_emberseerrunes[7];
            GuidVector runecreaturelist[7];
            ObjectGuid go_portcullis_active;
            ObjectGuid go_urokPile;
            ObjectGuid go_urokChallenge;
            std::vector<ObjectGuid> go_urokOgreCirles;
            std::vector<ObjectGuid> UrokMobs;
            ObjectGuid go_door_ubrs;
            ObjectGuid go_braziers[6];
        };

        InstanceScript* GetInstanceScript(InstanceMap* map) const override
        {
            return new instance_blackrock_spire_vanillaMapScript(map);
        }
};

/*#####
# at_dragonspire_hall
#####*/

class at_dragonspire_hall_vanilla : public AreaTriggerScript
{
    public:
        at_dragonspire_hall_vanilla() : AreaTriggerScript("at_dragonspire_hall") { }

        bool OnTrigger(Player* player, const AreaTrigger* /*at*/) override
        {
            if (player && player->IsAlive())
            {
                if (InstanceScript* instance = player->GetInstanceScript())
                {
                    if (player->HasItemCount(ITEM_SEAL_OF_ASCENSION, 1))
                    {
                        instance->SetData(AREATRIGGER, AREATRIGGER_DRAGONSPIRE_HALL);
                        return true;
                    }
                }
            }

            return false;
        }
};

void AddSC_instance_blackrock_spire_vanilla()
{
    new instance_blackrock_spire_vanilla();
    new at_dragonspire_hall_vanilla();
}
