
SMODS.Joker{ --6 7
    key = "_67",
    config = {
        extra = {
            six = 6,
            seven = 7
        }
    },
    loc_txt = {
        ['name'] = '6 7',
        ['text'] = {
            [1] = 'Each played {C:attention}6{} or {C:attention}7{} gives',
            [2] = '{C:blue}+#1#{} Chips and {C:red}+#2#{} Mult when scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.six, card.ability.extra.seven}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 6 or context.other_card:get_id() == 7) then
                return {
                    chips = card.ability.extra.six,
                    extra = {
                        mult = card.ability.extra.seven
                    }
                }
            end
        end
    end
}