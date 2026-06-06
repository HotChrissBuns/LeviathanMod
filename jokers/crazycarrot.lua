
SMODS.Joker{ --Crazy Carrot
    key = "crazycarrot",
    config = {
        extra = {
            one = 1
        }
    },
    loc_txt = {
        ['name'] = 'Crazy Carrot',
        ['text'] = {
            [1] = 'Every played card permanently gains {C:red}+#1#{} Mult when scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["TDL6615_TDL6615_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.one}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
            context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + card.ability.extra.one
            return {
                extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card
            }
        end
    end
}