
SMODS.Joker{ --High 5
    key = "high5",
    config = {
        extra = {
            five = 5
        }
    },
    loc_txt = {
        ['name'] = 'High 5',
        ['text'] = {
            [1] = '{X:blue,C:white}+#1#{} Chips every time a {C:attention}5{} is played and scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.five}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 5 then
                return {
                    chips = card.ability.extra.five
                }
            end
        end
    end
}