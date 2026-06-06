
SMODS.Joker{ --Oops all 1s
    key = "oopsall1s",
    config = {
        extra = {
            mod_probability0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Oops all 1s',
        ['text'] = {
            [1] = 'Halves all listed probabilities'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
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
        if context.mod_probability  then
            local numerator, denominator = context.numerator, context.denominator
            numerator = numerator / (2)
            return {
                numerator = numerator, 
                denominator = denominator
            }
        end
    end
}