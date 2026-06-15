
SMODS.Joker{ --Disguised Joker
    key = "disguisedjoker",
    config = {
        extra = {
            twenty = 20
        }
    },
    loc_txt = {
        ['name'] = 'Disguised Joker',
        ['text'] = {
            [1] = 'If selected {C:attention}blind{} is a {C:attention}boss blind{} {C:red}x#1#{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
        
        return {vars = {card.ability.extra.twenty}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if G.GAME.blind.boss then
                return {
                    Xmult = card.ability.extra.twenty
                }
            end
        end
    end
}