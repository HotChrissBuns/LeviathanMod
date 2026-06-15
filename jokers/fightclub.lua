
SMODS.Joker{ --Fight Club
    key = "fightclub",
    config = {
        extra = {
            c = 1.3
        }
    },
    loc_txt = {
        ['name'] = 'Fight Club',
        ['text'] = {
            [1] = 'Played cards with {C:clubs}Club{} suit give {C:mult}x#1#{} Mult when scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
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
        
        return {vars = {card.ability.extra.c}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Clubs") then
                return {
                    Xmult = card.ability.extra.c
                }
            end
        end
    end
}