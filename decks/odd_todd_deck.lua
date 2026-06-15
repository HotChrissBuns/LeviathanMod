
SMODS.Back {
    key = 'odd_todd_deck',
    pos = { x = 3, y = 1 },
    config = {
        extra = {
            remove_starting_cards_count0 = 52,
            add_starting_cards_count0 = 4,
            add_starting_cards_count = 4,
            add_starting_cards_count2 = 4,
            add_starting_cards_count3 = 4
        },
    },
    loc_txt = {
        name = 'Odd Todd deck',
        text = {
            [1] = 'Start with only {C:attention}odd{} cards'
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
            delay = 0.3,
            func = function()
                local cards = {}
                for i = 1, 4 do
                    local _rank = '3'
                    local _suit = 'Spades'
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                    cards[i] = SMODS.add_card(new_card_params)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            delay = 0.3,
            func = function()
                local cards = {}
                for i = 1, 4 do
                    local _rank = '5'
                    local _suit = 'Hearts'
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                    cards[i] = SMODS.add_card(new_card_params)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            delay = 0.3,
            func = function()
                local cards = {}
                for i = 1, 4 do
                    local _rank = '7'
                    local _suit = 'Clubs'
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                    cards[i] = SMODS.add_card(new_card_params)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            delay = 0.3,
            func = function()
                local cards = {}
                for i = 1, 4 do
                    local _rank = '9'
                    local _suit = 'Diamonds'
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                    cards[i] = SMODS.add_card(new_card_params)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
    end
}