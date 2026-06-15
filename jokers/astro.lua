
SMODS.Joker{ --Astro
    key = "astro",
    config = {
        extra = {
            planetcardsused = 0
        }
    },
    loc_txt = {
        ['name'] = 'Astro',
        ['text'] = {
            [1] = 'Adds the amount of {C:planet}planet{} cards you have used to{X:red,C:white} xmult {} (currently : {C:red}#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 6
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
        
        return {vars = {((G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.planet or 0) or 0)}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.planet or 0)
            }
        end
    end
}