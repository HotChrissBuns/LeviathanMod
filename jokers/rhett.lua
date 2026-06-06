
SMODS.Joker{ --Rhett
    key = "rhett",
    config = {
        extra = {
            hundren = 100
        }
    },
    loc_txt = {
        ['name'] = 'Rhett',
        ['text'] = {
            [1] = '{X:chips,C:white}x#1#{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 7
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
        
        return {vars = {card.ability.extra.hundren}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = card.ability.extra.hundren
            }
        end
    end
}