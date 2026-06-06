
SMODS.Joker{ --Escobar
    key = "escobar",
    config = {
        extra = {
            one = 1
        }
    },
    loc_txt = {
        ['name'] = 'Escobar',
        ['text'] = {
            [1] = 'Adds {C:attention}#1#{}{C:attention} Consumable{} slot',
            [2] = 'creates{C:attention} 3 consumables{} if {C:attention}Pablo{} is owned'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 9
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
        
        return {vars = {card.ability.extra.one}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_TDL6615_pablo" then 
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
                                    SMODS.add_card({ set = 'Tarot', })                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        if created_consumable then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                        end
                        return true
                    end,
                    extra = {
                        func = function()
                            
                            for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'after',
                                    delay = 0.4,
                                    func = function()
                                        play_sound('timpani')
                                        SMODS.add_card({ set = 'Planet', })                            
                                        card:juice_up(0.3, 0.5)
                                        return true
                                    end
                                }))
                            end
                            delay(0.6)
                            
                            if created_consumable then
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet})
                            end
                            return true
                        end,
                        colour = G.C.SECONDARY_SET.Planet,
                        extra = {
                            func = function()
                                
                                for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                                    G.E_MANAGER:add_event(Event({
                                        trigger = 'after',
                                        delay = 0.4,
                                        func = function()
                                            play_sound('timpani')
                                            SMODS.add_card({ set = 'Spectral', soulable = true, })                            
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
                            colour = G.C.SECONDARY_SET.Spectral
                        }
                    }
                }
            end
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({func = function()
            G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.one
            return true
        end }))
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({func = function()
            G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.one
            return true
        end }))
    end
}