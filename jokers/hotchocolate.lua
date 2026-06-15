
SMODS.Joker{ --Hot Chocolate
    key = "hotchocolate",
    config = {
        extra = {
            onefive = 1.5,
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Hot Chocolate',
        ['text'] = {
            [1] = '{C:green}#2# in #3# {} to give {C:purple} ^#1# {} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 8
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_TDL6615_hotchocolate') 
        return {vars = {card.ability.extra.onefive, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_86d21551', 1, card.ability.extra.odds, 'j_TDL6615_hotchocolate', false) then
                    SMODS.calculate_effect({e_mult = card.ability.extra.onefive}, card)
                end
            end
        end
    end
}