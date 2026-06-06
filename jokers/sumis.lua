
SMODS.Joker{ --S.U.M.I.S
    key = "sumis",
    config = {
        extra = {
            twenty = 20,
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'S.U.M.I.S',
        ['text'] = {
            [1] = 'Gives {C:purple}^#1#{}',
            [2] = '{C:green} #2# in #3# {}chance of waking up',
            [3] = 'if Blind is selected.',
            [4] = 'Waking up destroys one random joker'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["TDL6615_TDL6615_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_TDL6615_sumis') 
        return {vars = {card.ability.extra.twenty, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                e_mult = card.ability.extra.twenty,
                message = "Wataka"
            }
        end
        if context.setting_blind  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_6d283c87', 1, card.ability.extra.odds, 'j_TDL6615_sumis', false) then
                    SMODS.calculate_effect({func = function()
                        local destructable_jokers = {}
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker ~= card and not SMODS.is_eternal(joker) and not joker.getting_sliced then
                                table.insert(destructable_jokers, joker)
                            end
                        end
                        local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:explode({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Shh Uncle Mickey Is Sleeping!", colour = G.C.RED})
                        end
                        return true
                    end}, card)
                end
            end
        end
    end
}