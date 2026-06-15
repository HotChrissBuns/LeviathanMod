
SMODS.Joker{ --Ma Baker Pies
    key = "mabakerpies",
    config = {
        extra = {
            three = 3,
            thirtyfive = 35
        }
    },
    loc_txt = {
        ['name'] = 'Ma Baker Pies',
        ['text'] = {
            [1] = '{C:red} +#2#{} Mult when a hand is played with less than {C:attention}#1# cards{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
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
        
        return {vars = {card.ability.extra.three, card.ability.extra.thirtyfive}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big(#context.scoring_hand) <= to_big(card.ability.extra.three) then
                return {
                    mult = card.ability.extra.thirtyfive
                }
            end
        end
    end
}