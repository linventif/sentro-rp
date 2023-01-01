local languages = {}

// -- // -- // -- // -- // -- // -- // -- //
// DO NOT EDIT ABOVE THIS LINE
// -- // -- // -- // -- // -- // -- // -- //

languages["french"] = {
    ["health"] = "Se soigner",
    ["close"] = "Fermer",
    ["AdSpeJob"] = "Votre métier est spéciale, les soins son gratuis.",
    ["MedInTow"] = "Un médecin est en ville les soins coute 2x",
    ["IfMedInTow"] = "Si un médecin est en ville les soins coute 2x.",
    ["HealthCost"] = "Vous soignez coute : ",
    ["YouHasHeal"] = "Vous avez été soigné !",
    ["NoMoney"] = "Vous n'avez pas assez d'argent pour vous faire soigner !",
    ["FullHeal"] = "Vous n'avez pas besoin de vous faire soigner !"
}

languages["english"] = {
    ["health"] = "Heal",
    ["close"] = "Close",
    ["AdSpeJob"] = "Your job is special, the heal is free.",
    ["MedInTow"] = "A medic is in town the heal cost 10x",
    ["IfMedInTow"] = "If a medic is in town the heal cost 10x.",
    ["HealthCost"] = "Your heal cost : ",
    ["YouHasHeal"] = "You have been healed !",
    ["NoMoney"] = "You don't have enough money to heal yourself !",
    ["FullHeal"] = "You don't need to heal yourself !"
}

languages["russian"] = {
    ["health"] = "Лечение",
    ["close"] = "Закрыть",
    ["AdSpeJob"] = "Ваша работа особенная, лечение бесплатно.",
    ["MedInTow"] = "Медик в городе, лечение стоит 10x",
    ["IfMedInTow"] = "Если медик в городе, лечение стоит 10x.",
    ["HealthCost"] = "Ваше лечение стоит : ",
    ["YouHasHeal"] = "Вы были вылечены !",
    ["NoMoney"] = "У вас недостаточно денег, чтобы вылечить себя !",
    ["FullHeal"] = "Вам не нужно вылечиваться !"
}

languages["spanish"] = {
    ["health"] = "Curar",
    ["close"] = "Cerrar",
    ["AdSpeJob"] = "Tu trabajo es especial, la curación es gratis.",
    ["MedInTow"] = "Un medico esta en la ciudad, la curación cuesta 10x",
    ["IfMedInTow"] = "Si un medico esta en la ciudad, la curación cuesta 10x.",
    ["HealthCost"] = "Tu curación cuesta : ",
    ["YouHasHeal"] = "Has sido curado !",
    ["NoMoney"] = "No tienes suficiente dinero para curarte !",
    ["FullHeal"] = "No necesitas curarte !"
}

// -- // -- // -- // -- // -- // -- // -- //
// DO NOT EDIT BELOW THIS LINE
// -- // -- // -- // -- // -- // -- // -- //

function NPCMedic.GetTranslation(id)
    return languages[NPCMedic.Config.Language][id] or "ERROR"
end