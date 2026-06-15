
SMODS.Joker{ --Sundial
    key = "sundial",
    config = {
        extra = {
            currenthours = 0
        }
    },
    loc_txt = {
        ['name'] = 'Sundial',
        ['text'] = {
            [1] = 'Adds the current{C:attention} hour {}as{C:red} Mult {}',
            [2] = '(currently : {C:red}#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 1
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
        
        return {vars = {os.date("*t", os.time()).hour}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = os.date("*t", os.time()).hour
            }
        end
    end
}