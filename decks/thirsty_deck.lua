
SMODS.Back {
    key = 'thirsty_deck',
    pos = { x = 2, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Thirsty Deck',
        text = {
            [1] = 'Start with a {C:rare}pour child{} and a {C:common}glass coke{}'
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
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_TDL6615_glasscoke' })
                    if new_joker then
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_TDL6615_pourchild' })
                    if new_joker then
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
    end
}