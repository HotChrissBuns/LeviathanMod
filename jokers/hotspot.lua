
SMODS.Joker{ --Hotspot
    key = "hotspot",
    config = {
        extra = {
            thousand = 1000,
            five = 5,
            odds = 10,
            odds2 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Hotspot',
        ['text'] = {
            [1] = '{C:green}#3# in #4#{} to give {C:money}$#1#{}',
            [2] = '{C:green}#5# in #6#{} to lose {C:money}$#2#{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["TDL6615_TDL6615_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_TDL6615_hotspot')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_TDL6615_hotspot')
        return {vars = {card.ability.extra.thousand, card.ability.extra.five, new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_e48d811e', 1, card.ability.extra.odds, 'j_TDL6615_hotspot', false) then
                    SMODS.calculate_effect({
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars + card.ability.extra.thousand
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.thousand), colour = G.C.MONEY})
                            return true
                        end}, card)
                    end
                    if SMODS.pseudorandom_probability(card, 'group_1_59bdef1e', 1, card.ability.extra.odds2, 'j_TDL6615_hotspot', false) then
                        SMODS.calculate_effect({
                            func = function()
                                
                                local current_dollars = G.GAME.dollars
                                local target_dollars = G.GAME.dollars - card.ability.extra.five
                                local dollar_value = target_dollars - current_dollars
                                ease_dollars(dollar_value)
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(card.ability.extra.five), colour = G.C.MONEY})
                                return true
                            end}, card)
                        end
                    end
                end
            end
        }