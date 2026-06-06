
SMODS.Joker{ --Pocket Aces
    key = "pocketaces",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Pocket Aces',
        ['text'] = {
            [1] = 'If an {C:attention}ace{} is scored it {C:attention}swaps{} {C:blue}Chips{} and {C:red}Mult {}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
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
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            return {
                swap = true
            }
        end
    end
}