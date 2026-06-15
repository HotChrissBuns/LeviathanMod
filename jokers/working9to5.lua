
SMODS.Joker{ --Working 9 to 5
    key = "working9to5",
    config = {
        extra = {
            nine = 9,
            five = 5
        }
    },
    loc_txt = {
        ['name'] = 'Working 9 to 5',
        ['text'] = {
            [1] = 'Each played {C:attention}9{} or {C:attention}5{} gives',
            [2] = '{C:blue}+#1#{} Chips and {C:red}+#2#{} Mult when scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
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
        
        return {vars = {card.ability.extra.nine, card.ability.extra.five}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 9 or context.other_card:get_id() == 5) then
                return {
                    chips = card.ability.extra.nine,
                    extra = {
                        mult = card.ability.extra.five
                    }
                }
            end
        end
    end
}