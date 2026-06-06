
SMODS.Joker{ --Icecream scoop
    key = "icecreamscoop",
    config = {
        extra = {
            two = 2
        }
    },
    loc_txt = {
        ['name'] = 'Icecream scoop',
        ['text'] = {
            [1] = 'Gives{C:attention} #1#{} extra card selection'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
        
        return {vars = {card.ability.extra.two}}
    end,
    
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(card.ability.extra.two)
        SMODS.change_discard_limit(card.ability.extra.two)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(-card.ability.extra.two)
        SMODS.change_discard_limit(-card.ability.extra.two)
    end
}