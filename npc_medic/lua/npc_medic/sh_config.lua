// -- // -- // -- // -- // -- // -- // -- //
//                                        //
//            General Settings            //
//                                        //
// -- // -- // -- // -- // -- // -- // -- //

// General Settings
NPCMedic.Config.Language = "french" // Language (english - french - spanish - russian) you can add your own language in sh_language.lua
NPCMedic.Config.Cost = 10000 // Cost of the heal
NPCMedic.Config.Multi = 2 // Multiplicator of cost if they have medic

// Money Settings
NPCMedic.Config.MoneySymbol = "$" // Symbol of the money
NPCMedic.Config.MoneySeparator = " " // Separator of the money

// NPC Settings
NPCMedic.Config.NPCName = "Médecin" // Name of the NPC

// Job Settings
NPCMedic.Config.MedicJob = { // Jobs that can heal for free
    ["Médecin"] = true
}
NPCMedic.Config.FreeJob = { // Jobs that can heal for free
    ["Médecin"] = true
}