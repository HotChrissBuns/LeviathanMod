
SMODS.Joker{ --Bathtime
    key = "bathtime",
    config = {
        extra = {
            eighty = 80
        }
    },
    loc_txt = {
        ['name'] = 'Bathtime',
        ['text'] = {
            [1] = 'If hand contains a flush {C:blue}+#1#{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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
        
        return {vars = {card.ability.extra.eighty}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Flush"]) then
                return {
                    chips = card.ability.extra.eighty
                }
            end
        end
    end
}