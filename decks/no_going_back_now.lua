
SMODS.Back {
    key = 'no_going_back_now',
    pos = { x = 2, y = 1 },
    config = {
    },
    loc_txt = {
        name = 'No going back now',
        text = {
            [1] = '{C:attention}One random Joker, Its Eternal, One Joker slot{}'
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
                    local new_joker = SMODS.add_card({ set = 'Joker' })
                    if new_joker then
                        new_joker:add_sticker('eternal', true)
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
        G.GAME.starting_params.joker_slots = 1
    end
}