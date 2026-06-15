
SMODS.Joker{ --bUsInS Min
    key = "businsmin",
    config = {
        extra = {
            consumablesheld = 0
        }
    },
    loc_txt = {
        ['name'] = 'bUsInS Min',
        ['text'] = {
            [1] = 'When {C:attention}Leaving{} the shop add the amount of {C:attention}consumables{} owned to your {C:money}money{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["TDL6615_TDL6615_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {(#(G.consumeables and G.consumeables.cards or {}) or 0)}}
    end,
    
    calculate = function(self, card, context)
        if context.ending_shop  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + #(G.consumeables and G.consumeables.cards or {})
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(#(G.consumeables and G.consumeables.cards or {})), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}