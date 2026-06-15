
SMODS.Joker{ --6 pack
    key = "_6pack",
    config = {
        extra = {
            onesix = 1.6
        }
    },
    loc_txt = {
        ['name'] = '6 pack',
        ['text'] = {
            [1] = '{X:blue,C:white}x#1#{} Chips every time a {C:attention}6{} is played and scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
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
        
        return {vars = {card.ability.extra.onesix}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 6 then
                return {
                    x_chips = card.ability.extra.onesix
                }
            end
        end
    end
}