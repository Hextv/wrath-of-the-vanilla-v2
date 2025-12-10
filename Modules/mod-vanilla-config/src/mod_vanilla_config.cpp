#include "ScriptMgr.h"

class VanillaConfig : public WorldScript
{
    public:
        VanillaConfig() : WorldScript("VanillaConfig") {}

        void OnAfterConfigLoad(bool /*reload*/) override
        {
            sWorld->setIntConfig(CONFIG_EXPANSION, EXPANSION_CLASSIC);
            sWorld->setIntConfig(CONFIG_LFG_OPTIONSMASK, 0);
            sWorld->setIntConfig(CONFIG_MAX_PLAYER_LEVEL, 60);
        }
};

void AddSC_mod_vanilla_config()
{
    new VanillaConfig();
}
