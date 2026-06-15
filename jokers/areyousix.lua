
SMODS.Joker{ --Are you six
    key = "areyousix",
    config = {
        extra = {
            six = 6
        }
    },
    loc_txt = {
        ['name'] = 'Are you six',
        ['text'] = {
            [1] = '{X:red,C:white}X #1#{} Mult if you {C:attention}#1# {}jokers'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["TDL6615_TDL6615_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.six}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big(#G.jokers.cards) == to_big(card.ability.extra.six) then
                return {
                    Xmult = card.ability.extra.six,
                    message = "Are you six?"
                }
            end
        end
    end
}