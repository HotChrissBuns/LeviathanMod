
SMODS.Joker{ --Pooper scoop
    key = "pooperscoop",
    config = {
        extra = {
            twenty = 20
        }
    },
    loc_txt = {
        ['name'] = 'Pooper scoop',
        ['text'] = {
            [1] = 'Add {C:red}#1#{} {C:red}Mult{} if Hand contains a {C:attention}Straight flush{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
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
    pools = { ["TDL6615_TDL6615_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.twenty}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Straight Flush"]) then
                return {
                    mult = card.ability.extra.twenty
                }
            end
        end
    end
}