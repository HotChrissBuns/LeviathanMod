
SMODS.Joker{ --Papita
    key = "papita",
    config = {
        extra = {
            dollars0_min = NaN,
            dollars0_max = 10
        }
    },
    loc_txt = {
        ['name'] = 'Papita',
        ['text'] = {
            [1] = 'Gives random {C:attention}Dollars{} at end of round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 6
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
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + pseudorandom('RANGE:1|10', 1, 10)
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(pseudorandom('RANGE:1|10', 1, 10)), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}