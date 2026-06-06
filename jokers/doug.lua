
SMODS.Joker{ --Doug
    key = "doug",
    config = {
        extra = {
            s = 1.3
        }
    },
    loc_txt = {
        ['name'] = 'Doug',
        ['text'] = {
            [1] = 'Played cards with {C:spades}Spade{} suit give {C:mult}x#1#{} Mult when scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.s}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Spades") then
                return {
                    Xmult = card.ability.extra.s
                }
            end
        end
    end
}