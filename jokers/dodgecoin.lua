
SMODS.Joker{ --Dodge Coin
    key = "dodgecoin",
    config = {
        extra = {
            five = 5
        }
    },
    loc_txt = {
        ['name'] = 'Dodge Coin',
        ['text'] = {
            [1] = 'When re-rolling in the shop gain {C:money}$#1#{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 4
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
        
        return {vars = {card.ability.extra.five}}
    end,
    
    calculate = function(self, card, context)
        if context.reroll_shop  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + card.ability.extra.five
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.five), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}