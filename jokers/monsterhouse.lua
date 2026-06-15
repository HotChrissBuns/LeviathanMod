
SMODS.Joker{ --Monsterhouse
    key = "monsterhouse",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Monsterhouse',
        ['text'] = {
            [1] = 'If poker hand contains a{C:attention} Full House{} , Balance {C:blue}Chips{} and {C:red}Mult{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["TDL6615_TDL6615_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Full House"]) then
                return {
                    balance = true
                }
            end
        end
    end
}