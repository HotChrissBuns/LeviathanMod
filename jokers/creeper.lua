
SMODS.Joker{ --Creeper
    key = "creeper",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Creeper',
        ['text'] = {
            [1] = '{C:attention}Destroys joker {}to the {C:attention}left{} and {C:attention}right{} when sold , {C:attention}bypasses eternal{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
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
    
    calculate = function(self, card, context)
        if context.selling_self  then
            return {
                func = function()
                    local my_pos = nil
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i] == card then
                            my_pos = i
                            break
                        end
                    end
                    local target_joker = nil
                    if my_pos and my_pos > 1 then
                        local joker = G.jokers.cards[my_pos - 1]
                        if true and not joker.getting_sliced then
                            target_joker = joker
                        end
                    end
                    
                    if target_joker then
                        if target_joker.ability.eternal then
                            target_joker.ability.eternal = nil
                        end
                        target_joker.getting_sliced = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                target_joker:explode({G.C.RED}, nil, 1.6)
                                return true
                            end
                        }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                    end
                    return true
                end,
                extra = {
                    func = function()
                        local my_pos = nil
                        for i = 1, #G.jokers.cards do
                            if G.jokers.cards[i] == card then
                                my_pos = i
                                break
                            end
                        end
                        local target_joker = nil
                        if my_pos and my_pos < #G.jokers.cards then
                            local joker = G.jokers.cards[my_pos + 1]
                            if true and not joker.getting_sliced then
                                target_joker = joker
                            end
                        end
                        
                        if target_joker then
                            if target_joker.ability.eternal then
                                target_joker.ability.eternal = nil
                            end
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:explode({G.C.RED}, nil, 1.6)
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
}