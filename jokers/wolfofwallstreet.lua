
SMODS.Joker{ --Wolf of Wall street
    key = "wolfofwallstreet",
    config = {
        extra = {
            alljokerssellvalue = 0
        }
    },
    loc_txt = {
        ['name'] = 'Wolf of Wall street',
        ['text'] = {
            [1] = 'When the {C:attention}shop{} is {C:attention}exited{} , add the combined amount of all jokers',
            [2] = '{C:attention}sell value{} to your money.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 10
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
        
    return {vars = {(function() local total = 0; for _, joker in ipairs(G.jokers and (G.jokers and G.jokers.cards or {}) or {}) do total = total + joker.sell_cost end; return total end)()}}
    end,
    
    calculate = function(self, card, context)
        if context.ending_shop  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                local target_dollars = G.GAME.dollars + (function() local total = 0; for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do total = total + joker.sell_cost end; return total end)()
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring((function() local total = 0; for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do total = total + joker.sell_cost end; return total end)()), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}