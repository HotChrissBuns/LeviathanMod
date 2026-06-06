
SMODS.Joker{ --Chips
    key = "chips",
    config = {
        extra = {
            chips0_min = NaN,
            chips0_max = 100
        }
    },
    loc_txt = {
        ['name'] = 'Chips',
        ['text'] = {
            [1] = '{C:attention}Random{} {C:blue}Chips{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = pseudorandom('RANGE:1|100', 1, 100)
            }
        end
    end
}