
SMODS.Back {
    key = 'glass_house',
    pos = { x = 0, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Glass house',
        text = {
            [1] = 'All cards are {C:attention}Glass{} cards'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    v:set_ability(G.P_CENTERS['m_glass'])
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
    end
}