
SMODS.Joker{ --Good Mythical Morning
    key = "goodmythicalmorning",
    config = {
        extra = {
            ten = 10
        }
    },
    loc_txt = {
        ['name'] = 'Good Mythical Morning',
        ['text'] = {
            [1] = 'If both {C:rare}Rhett{} and {C:rare}Link{} are owned',
            [2] = '{C:purple}^#1#mult{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["TDL6615_TDL6615_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.ten}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_TDL6615_rhett" then 
                        return true
                    end
                end
            end)() and (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_TDL6615_link" then 
                        return true
                    end
                end
            end)()) then
                return {
                    e_mult = card.ability.extra.ten
                }
            end
        end
    end
}