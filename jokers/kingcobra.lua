
SMODS.Joker{ --King Cobra
    key = "kingcobra",
    config = {
        extra = {
            k = 13
        }
    },
    loc_txt = {
        ['name'] = 'King Cobra',
        ['text'] = {
            [1] = '{C:red}+#1#{} Mult when a {C:attention}King{} is scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 5
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
        
        return {vars = {card.ability.extra.k}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 13 then
                return {
                    mult = card.ability.extra.k
                }
            end
        end
    end
}