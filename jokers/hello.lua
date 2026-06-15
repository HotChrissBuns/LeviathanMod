
SMODS.Joker{ --Hello
    key = "hello",
    config = {
        extra = {
            one = 1
        }
    },
    loc_txt = {
        ['name'] = 'Hello',
        ['text'] = {
            [1] = 'Gives you {C:red}+#1# mult{} and a {C:dark_edition}negative{} {C:uncommon}Hello{} if hand is a {C:attention}high card{}.',
            [2] = 'When {C:attention}sold{} another {C:green}Hello{} gets {C:red}destroyed{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = 2,
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
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "High Card" then
                local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_TDL6615_hello' })
                        if joker_card then
                            joker_card:set_edition("e_negative", true)
                            
                        end
                        
                        return true
                    end
                }))
                return {
                    mult = card.ability.extra.one,
                    extra = {
                        message = created_joker and localize('k_plus_joker') or nil,
                        colour = G.C.BLUE
                    }
                }
            end
        end
        if context.selling_self  then
            return {
                func = function()
                    local target_joker = nil
                    for i, joker in ipairs(G.jokers.cards) do
                        if joker.config.center.key == "j_TDL6615_hello" and not joker.getting_sliced then
                            target_joker = joker
                            break
                        end
                    end
                    
                    if target_joker then
                        if target_joker.ability.eternal then
                            target_joker.ability.eternal = nil
                        end
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
                end
            }
        end
    end
}