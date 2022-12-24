local languages = {}

// -- // -- // -- // -- // -- // -- // -- //
// DO NOT EDIT ABOVE THIS LINE
// -- // -- // -- // -- // -- // -- // -- //

languages["french"] = {
    
}

// -- // -- // -- // -- // -- // -- // -- //
// DO NOT EDIT BELOW THIS LINE
// -- // -- // -- // -- // -- // -- // -- //

function SBooster.GetTranslation(id)
    return languages[SBooster.Config.Language][id] or "ERROR"
end