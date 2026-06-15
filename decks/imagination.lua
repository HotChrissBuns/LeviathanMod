
SMODS.Back {
    key = 'imagination',
    pos = { x = 4, y = 1 },
    config = {
        extra = {
            remove_starting_cards_count0 = 52,
            add_starting_cards_count0 = 4,
            add_starting_cards_count = 4,
            add_starting_cards_count2 = 4,
            add_starting_cards_count3 = 4,
            add_starting_cards_count4 = 4,
            add_starting_cards_count5 = 4,
            add_starting_cards_count6 = 4,
            add_starting_cards_count7 = 4,
            add_starting_cards_count8 = 4,
            add_starting_cards_count9 = 4,
            add_starting_cards_count10 = 4,
            add_starting_cards_count11 = 4,
            add_starting_cards_count12 = 4
        },
    },
    loc_txt = {
        name = 'Imagination',
        text = {
            [1] = 'Start with a {C:attention}preset{} deck'
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
                    local _rank = '2'
                    local _suit = 'Diamonds'
                    local enhancement = G.P_CENTERS['m_stone']
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                if enhancement then new_card_params.enhancement = enhancement.key end
                    cards[i] = SMODS.add_card(new_card_params)
                    if cards[i] then
                        cards[i]:set_seal('TDL6615_therock', true, true)
                    end
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
                    local _rank = '3'
                    local _suit = 'Spades'
                    local enhancement = G.P_CENTERS['m_TDL6615_daniel']
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
        G.E_MANAGER:add_event(Event({
            delay = 0.3,
            func = function()
                local cards = {}
                for i = 1, 4 do
                    local _rank = '4'
                    local _suit = 'Clubs'
                    local enhancement = G.P_CENTERS['m_wild']
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
        G.E_MANAGER:add_event(Event({
            delay = 0.3,
            func = function()
                local cards = {}
                for i = 1, 4 do
                    local _rank = '5'
                    local _suit = 'Hearts'
                    local enhancement = G.P_CENTERS['m_mult']
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                if enhancement then new_card_params.enhancement = enhancement.key end
                    cards[i] = SMODS.add_card(new_card_params)
                    if cards[i] then
                        cards[i]:set_seal('TDL6615_therock', true, true)
                    end
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
                    local _rank = '6'
                    local _suit = 'Diamonds'
                    local enhancement = G.P_CENTERS['m_lucky']
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                if enhancement then new_card_params.enhancement = enhancement.key end
                    cards[i] = SMODS.add_card(new_card_params)
                    if cards[i] then
                        cards[i]:set_seal('Gold', true, true)
                    end
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
                    local _suit = 'Spades'
                    local enhancement = G.P_CENTERS['m_steel']
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                if enhancement then new_card_params.enhancement = enhancement.key end
                    cards[i] = SMODS.add_card(new_card_params)
                    if cards[i] then
                        cards[i]:set_seal('Purple', true, true)
                    end
                    if cards[i] then
                        cards[i]:set_edition( "e_polychrome", true, true, true)
                    end
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
                    local _rank = '8'
                    local _suit = 'Clubs'
                    local enhancement = G.P_CENTERS['m_bonus']
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                if enhancement then new_card_params.enhancement = enhancement.key end
                    cards[i] = SMODS.add_card(new_card_params)
                    if cards[i] then
                        cards[i]:set_seal('Blue', true, true)
                    end
                    if cards[i] then
                        cards[i]:set_edition( "e_foil", true, true, true)
                    end
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
                    local _suit = 'Hearts'
                    local enhancement = G.P_CENTERS['m_TDL6615_meatloaf']
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                if enhancement then new_card_params.enhancement = enhancement.key end
                    cards[i] = SMODS.add_card(new_card_params)
                    if cards[i] then
                        cards[i]:set_seal('Red', true, true)
                    end
                    if cards[i] then
                        cards[i]:set_edition( "e_holo", true, true, true)
                    end
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
                    local _rank = '10'
                    local _suit = 'Diamonds'
                    local enhancement = G.P_CENTERS['m_TDL6615_topflite']
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                if enhancement then new_card_params.enhancement = enhancement.key end
                    cards[i] = SMODS.add_card(new_card_params)
                    if cards[i] then
                        cards[i]:set_seal('Gold', true, true)
                    end
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
                    local _rank = 'J'
                    local _suit = 'Spades'
                    local enhancement = G.P_CENTERS['m_glass']
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                if enhancement then new_card_params.enhancement = enhancement.key end
                    cards[i] = SMODS.add_card(new_card_params)
                    if cards[i] then
                        cards[i]:set_seal('Purple', true, true)
                    end
                    if cards[i] then
                        cards[i]:set_edition( "e_negative", true, true, true)
                    end
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
                    local _rank = 'Q'
                    local _suit = 'Clubs'
                    local enhancement = G.P_CENTERS['m_TDL6615_crafted']
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                if enhancement then new_card_params.enhancement = enhancement.key end
                    cards[i] = SMODS.add_card(new_card_params)
                    if cards[i] then
                        cards[i]:set_seal('Blue', true, true)
                    end
                    if cards[i] then
                        cards[i]:set_edition( "e_foil", true, true, true)
                    end
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
                    local _rank = 'K'
                    local _suit = 'Hearts'
                    local enhancement = G.P_CENTERS['m_TDL6615_overpowered']
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                if enhancement then new_card_params.enhancement = enhancement.key end
                    cards[i] = SMODS.add_card(new_card_params)
                    if cards[i] then
                        cards[i]:set_seal('Red', true, true)
                    end
                    if cards[i] then
                        cards[i]:set_edition( "e_polychrome", true, true, true)
                    end
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
                    local _rank = 'A'
                    local _suit = 'Diamonds'
                    local enhancement = G.P_CENTERS['m_gold']
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                if enhancement then new_card_params.enhancement = enhancement.key end
                    cards[i] = SMODS.add_card(new_card_params)
                    if cards[i] then
                        cards[i]:set_seal('TDL6615_cowboy', true, true)
                    end
                    if cards[i] then
                        cards[i]:set_edition( "e_holo", true, true, true)
                    end
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
    end
}