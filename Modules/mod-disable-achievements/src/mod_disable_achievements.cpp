#include "ScriptMgr.h"

class DisableAchievements : public PlayerScript
{
    public:
        DisableAchievements() : PlayerScript("DisableAchievements") {}

        bool OnBeforeCriteriaProgress(Player* /*player*/, AchievementCriteriaEntry const* /*criteria*/) override
        {
            return false;
        }

        bool OnBeforeAchiComplete(Player* /*player*/, AchievementEntry const* /*achievement*/) override
        {
            return false;
        }
};

void AddSC_mod_disable_achievements()
{
    new DisableAchievements();
}
