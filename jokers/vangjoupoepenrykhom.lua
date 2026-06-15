
SMODS.Joker{ --Vang jou poep en ryk hom
    key = "vangjoupoepenrykhom",
    config = {
        extra = {
            one = 1,
            odds = 2
        }
    },
    loc_txt = {
        ['name'] = 'Vang jou poep en ryk hom',
        ['text'] = {
            [1] = 'When a blind is skipped',
            [2] = '{C:green}#2# in #3#{} chance to gain {C:attention}#1#{} consumable slot',
            [3] = 'and {C:green}#2# in #3#{} chance to lose{C:attention} #1#{}',
            [4] = 'consumable slot'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 0
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_TDL6615_vangjoupoepenrykhom')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_TDL6615_vangjoupoepenrykhom')
        return {vars = {card.ability.extra.one, new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,
    
    calculate = function(self, card, context)
        if context.skip_blind  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_a40b6793', 1, card.ability.extra.odds, 'j_TDL6615_vangjoupoepenrykhom', false) then
                    SMODS.calculate_effect({func = function()
                        G.E_MANAGER:add_event(Event({func = function()
                            G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.one
                            return true
                        end }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.one).." Consumable Slot", colour = G.C.GREEN})
                        return true
                    end}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_1_0e30a499', 1, card.ability.extra.odds, 'j_TDL6615_vangjoupoepenrykhom', false) then
                    SMODS.calculate_effect({func = function()
                        G.E_MANAGER:add_event(Event({func = function()
                            G.consumeables.config.card_limit = math.max(0, G.consumeables.config.card_limit - card.ability.extra.one)
                            return true
                        end }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(card.ability.extra.one).." Consumable Slot", colour = G.C.RED})
                        return true
                    end}, card)
                end
            end
        end
    end
}