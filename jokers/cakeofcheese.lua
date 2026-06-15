
SMODS.Joker{ --Cake of Cheese
    key = "cakeofcheese",
    config = {
        extra = {
            three = 3
        }
    },
    loc_txt = {
        ['name'] = 'Cake of Cheese',
        ['text'] = {
            [1] = 'When this card is {C:attention}sold{}',
            [2] = 'your {C:attention}money{} gets multiplied by {C:attention}#1#{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["TDL6615_TDL6615_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.three}}
    end,
    
    calculate = function(self, card, context)
        if context.selling_self  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars * card.ability.extra.three
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(card.ability.extra.three), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}