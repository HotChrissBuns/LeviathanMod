
SMODS.Joker{ --Gold Doubleoons
    key = "golddoubleoons",
    config = {
        extra = {
            _2sindeck = 0
        }
    },
    loc_txt = {
        ['name'] = 'Gold Doubleoons',
        ['text'] = {
            [1] = 'At the {C:attention}end{} of the round gain {C:money}$1{} per {C:attention}2{} in your deck'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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
    
    loc_vars = function(self, info_queue, card)
        
    return {vars = {(function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 2 then count = count + 1 end end; return count end)()}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                local target_dollars = G.GAME.dollars + (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 2 then count = count + 1 end end; return count end)()
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 2 then count = count + 1 end end; return count end)()), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}