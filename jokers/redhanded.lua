
SMODS.Joker{ --Red handed
    key = "redhanded",
    config = {
        extra = {
            basediscardsperround = 0,
            basehandsperround = 0
        }
    },
    loc_txt = {
        ['name'] = 'Red handed',
        ['text'] = {
            [1] = 'Swaps {C:attention}Discards{} and {C:attention}Hands{}',
            [2] = '{C:inactive}(Maybe){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
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
        
        return {vars = {(G.GAME.round_resets.discards or 0), (G.GAME.round_resets.hands or 0)}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(G.GAME.round_resets.discards).." Hands", colour = G.C.GREEN})
                    
                    G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + G.GAME.round_resets.discards
                    return true
                end,
                extra = {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(G.GAME.round_resets.hands).." Discards", colour = G.C.GREEN})
                        
                        G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + G.GAME.round_resets.hands
                        return true
                    end,
                    colour = G.C.GREEN,
                    extra = {
                        
                        func = function()
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(G.GAME.round_resets.hands).." Hands", colour = G.C.RED})
                            G.GAME.current_round.hands_left = G.GAME.current_round.hands_left - G.GAME.round_resets.hands
                            return true
                        end,
                        colour = G.C.GREEN,
                        extra = {
                            
                            func = function()
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(G.GAME.round_resets.discards).." Discards", colour = G.C.RED})
                                G.GAME.current_round.discards_left = G.GAME.current_round.discards_left - G.GAME.round_resets.discards
                                return true
                            end,
                            colour = G.C.GREEN
                        }
                    }
                }
            }
        end
    end
}