
SMODS.Joker{ --Shortcut
    key = "shortcut",
    config = {
        extra = {
            reduction_value = '3'
        }
    },
    loc_txt = {
        ['name'] = 'Shortcut',
        ['text'] = {
            [1] = '{C:attention}Flushes{} and {C:attention}Straights{} can be made with {C:attention}2{} cards'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["TDL6615_TDL6615_jokers"] = true },
    
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
        -- Flush/Straight requirements reduced by 3
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        -- Flush/Straight requirements restored
    end
}


local smods_four_fingers_ref = SMODS.four_fingers
function SMODS.four_fingers()
    if next(SMODS.find_card("j_TDL6615_shortcut")) then
        return 2
    end
    return smods_four_fingers_ref()
end