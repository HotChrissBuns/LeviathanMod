
SMODS.Joker{ --Tennis Racket
    key = "tennisracket",
    config = {
        extra = {
            ten = 10
        }
    },
    loc_txt = {
        ['name'] = 'Tennis Racket',
        ['text'] = {
            [1] = 'add {C:money}$#1#{} when a 10{C:attention}{} is discarded'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["TDL6615_TDL6615_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.ten}}
    end,
    
    calculate = function(self, card, context)
        if context.discard  then
            if context.other_card:get_id() == 10 then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + card.ability.extra.ten
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.ten), colour = G.C.MONEY})
                        return true
                    end
                }
            end
        end
    end
}