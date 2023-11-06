local Translations = {
    error = {
        notvalid = 'Burger niet in town',
        fillallfields = 'Vul alle velden in!'
    },
    success = {
    },
    info = {
        command = 'Geef burger een kaart',
        commandid = 'ID',
        commandidtip = 'Burger geluksnummer',
        cardtype = 'Welke kaart?',
        cardtypetip = 'id_card drive_card..',
        extrainfo = 'Waar is hij/zij bevestigd?',
        extrainfotip = 'Advocaat locatie',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
