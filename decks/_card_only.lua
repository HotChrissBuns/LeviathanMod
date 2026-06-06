
SMODS.Back {
    key = '_card_only',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            remove_starting_cards_count0 = 52,
            add_starting_cards_count0 = 1
        },
    },
    loc_txt = {
        name = '1 Card only',
        text = {
            [1] = 'Start with {C:attention}1{} {C:attention}Stone{} card and a {C:common}popcorn{}'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for i=#G.deck.cards, 1, -1 do
                    G.deck.cards[i]:remove()
                end
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_popcorn' })
                    if new_joker then
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            delay = 0.3,
            func = function()
                local cards = {}
                for i = 1, 1 do
                    local _rank = pseudorandom_element(SMODS.Ranks, 'add_random_rank').card_key
                    local _suit = nil
                    local enhancement = G.P_CENTERS['m_stone']
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                if enhancement then new_card_params.enhancement = enhancement.key end
                    cards[i] = SMODS.add_card(new_card_params)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
    end
}