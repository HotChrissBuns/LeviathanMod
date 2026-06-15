
SMODS.Joker{ --Final Boss
    key = "finalboss",
    config = {
        extra = {
            totaldollarsspentontheshop = 0
        }
    },
    loc_txt = {
        ['name'] = 'Final Boss',
        ['text'] = {
            [1] = 'Adds your total money spent in the shop (all runs) to {X:red,C:white}X Mult{}',
            [2] = '( currently : {C:red}#1#{} )'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 11
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["TDL6615_TDL6615_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {(G.PROFILES[G.SETTINGS.profile].career_stats.c_shop_dollars_spent or 0)}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = (G.PROFILES[G.SETTINGS.profile].career_stats.c_shop_dollars_spent or 0)
            }
        end
    end
}