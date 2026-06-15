
SMODS.Joker{ --2 - Faced
    key = "_2faced",
    config = {
        extra = {
            onetwo = 1.2
        }
    },
    loc_txt = {
        ['name'] = '2 - Faced',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult every time a {C:attention}2{} is played and scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
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
        
        return {vars = {card.ability.extra.onetwo}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 2 then
                return {
                    Xmult = card.ability.extra.onetwo
                }
            end
        end
    end
}