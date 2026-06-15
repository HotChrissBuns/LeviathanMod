
SMODS.Consumable {
    key = 'passiveincome',
    set = 'Tarot',
    pos = { x = 7, y = 0 },
    config = { 
        extra = {
            cardsremovedfromdeck = 0   
        } 
    },
    loc_txt = {
        name = 'Passive income',
        text = {
            [1] = 'Gives {C:attention}Dollars{} to the amount of {C:attention}cards removed from deck{}',
            [2] = 'Currently : {C:money}$#1#{}'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        return {vars = {((G.GAME.starting_deck_size - #(G.playing_cards or {})) or 0)}}
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                
                local current_dollars = G.GAME.dollars
                local target_dollars = G.GAME.dollars + (G.GAME.starting_deck_size - #(G.playing_cards or {}))
                local dollar_value = target_dollars - current_dollars
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring((G.GAME.starting_deck_size - #(G.playing_cards or {}))).." $", colour = G.C.RED})
                ease_dollars(dollar_value, true)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}