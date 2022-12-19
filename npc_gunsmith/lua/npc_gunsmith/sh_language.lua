local languages = {}

// -- // -- // -- // -- // -- // -- // -- //
// DO NOT EDIT ABOVE THIS LINE
// -- // -- // -- // -- // -- // -- // -- //

languages["french"] = {
    [1] = "Si un armurier est en ville les armes coute plus chère.",
    [2] = "Un armurier est en ville !",
    [3] = "Les armes coute " .. NPCGun.Config.Multi .. "x plus chère.",
    [4] = "Aller voir l'armurier pour acheter des armes moins chère !",
    [5] = "Fermer",
    [6] = "Acheter",
    [7] = "Vous avez acheté une arme !",
    [8] = "Vous n'avez pas assez d'argent !",
}

languages["english"] = {
    [1] = "If a gun dealer is in town the weapons cost more.",
    [2] = "A gun dealer is in town !",
    [3] = "Weapons cost " .. NPCGun.Config.Multi .. "x more.",
    [4] = "Go see the gun dealer to buy weapons cheaper !",
    [5] = "Close",
    [6] = "Buy",
    [7] = "You bought a weapon !",
    [8] = "You don't have enough money !",
}

languages["spanish"] = {
    [1] = "Si un armurero está en la ciudad las armas cuestan más.",
    [2] = "¡Un armurero está en la ciudad!",
    [3] = "Las armas cuestan " .. NPCGun.Config.Multi .. "x más.",
    [4] = "¡Ve al armurero para comprar armas más baratas!",
    [5] = "Cerrar",
    [6] = "Comprar",
    [7] = "¡Has comprado un arma!",
    [8] = "¡No tienes suficiente dinero!",
}

languages["russian"] = {
    [1] = "Если в городе есть оружейный магазин, то оружие стоит дороже.",
    [2] = "Оружейный магазин в городе!",
    [3] = "Оружие стоит " .. NPCGun.Config.Multi .. "x дороже.",
    [4] = "Посетите оружейный магазин, чтобы купить оружие дешевле!",
    [5] = "Закрыть",
    [6] = "Купить",
    [7] = "Вы купили оружие!",
    [8] = "У вас недостаточно денег!",
}

// -- // -- // -- // -- // -- // -- // -- //
// DO NOT EDIT BELOW THIS LINE
// -- // -- // -- // -- // -- // -- // -- //

function NPCGun.GetTranslation(id)
    return languages[NPCGun.Config.Language][id] or "ERROR"
end