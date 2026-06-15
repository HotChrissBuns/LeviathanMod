
SMODS.Joker{ --glass coke
    key = "glasscoke",
    config = {
        extra = {
            oneone = 1.1
        }
    },
    loc_txt = {
        ['name'] = 'glass coke',
        ['text'] = {
            [1] = '{X:mult,C:white}x#1#{} per card scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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
        
        return {vars = {card.ability.extra.oneone}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            return {
                Xmult = card.ability.extra.oneone
            }
        end
    end
}