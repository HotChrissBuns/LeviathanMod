
SMODS.Back {
    key = 'the_four_horseman',
    pos = { x = 9, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'The Four Horseman',
        text = {
            [1] = 'Start with the {C:legendary}Four Horseman{}'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_TDL6615_fourhorseman' })
                    if new_joker then
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
    end
}