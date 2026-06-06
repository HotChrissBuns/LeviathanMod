
SMODS.Joker{ --Pour Child
    key = "pourchild",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Pour Child',
        ['text'] = {
            [1] = 'IF {C:common}Glass coke{} is owned, {C:tarot}no longer thirsty {} appears',
            [2] = 'when blind is selected'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["TDL6615_TDL6615_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_TDL6615_glasscoke" then 
                        return true
                    end
                end
            end)() then
                return {
                    func = function()
                        
                        for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.4,
                                func = function()
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'Spectral', key = 'c_TDL6615_nolongerthirsty'})                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        if created_consumable then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
                        end
                        return true
                    end,
                    extra = {
                        func = function()
                            local target_joker = nil
                            for i, joker in ipairs(G.jokers.cards) do
                                if joker.config.center.key == "j_TDL6615_glasscoke" and not SMODS.is_eternal(joker) and not joker.getting_sliced then
                                    target_joker = joker
                                    break
                                end
                            end
                            
                            if target_joker then
                                target_joker.getting_sliced = true
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        target_joker:shatter({G.C.RED}, nil, 1.6)
                                        return true
                                    end
                                }))
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                            end
                            return true
                        end,
                        colour = G.C.RED
                    }
                }
            end
        end
    end
}