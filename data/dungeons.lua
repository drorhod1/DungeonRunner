local dungeons = {
    DGN_Frac_DeadMansDredge = {
        quest_id = 586309,
        objectives = {
            "animus",
            "prisoners"
        }
    },
    DGN_Scos_SaratsLair = {
        quest_id = 433938,
        objectives = {
            "kill",
            "boss_sphere"
        },
        kill = {
            name = "DRLG_Structure_Spider_Cocoon",
            count = 3
        },
        boss_sphere = {
            name = "spider_adult_miniboss_unique_DGN_SaratsLair"
        }
    }
}

return dungeons