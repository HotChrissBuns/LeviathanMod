
SMODS.Joker{ --Sherlock
    key = "sherlock",
    config = {
        extra = {
            eighteen = 18
        }
    },
    loc_txt = {
        ['name'] = 'Sherlock',
        ['text'] = {
            [1] = 'Add {C:red}#1# Mult{} if hand contains a {C:attention}four of a kind{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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
        
        return {vars = {card.ability.extra.eighteen}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Four of a Kind"]) then
                return {
                    mult = card.ability.extra.eighteen
                }
            end
        end
    end
}