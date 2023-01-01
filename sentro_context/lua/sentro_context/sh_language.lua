local languages = {}

// -- // -- // -- // -- // -- // -- // -- //
// DO NOT EDIT ABOVE THIS LINE
// -- // -- // -- // -- // -- // -- // -- //

languages["french"] = {
    ["close"] = "Fermer",
    ["continue"] = "Continuer",
    ["number_only"] = "Nombre Uniquement",
    ["dropmoney"] = "Combien voulez-vous déposer ?"
}

// -- // -- // -- // -- // -- // -- // -- //
// DO NOT EDIT BELOW THIS LINE
// -- // -- // -- // -- // -- // -- // -- //

function SentroContext.GetTranslation(id)
    return languages[SentroContext.Config.Language][id] or "ERROR"
end