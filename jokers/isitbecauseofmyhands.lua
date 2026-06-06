
SMODS.Joker{ --Is it because of my hands
    key = "isitbecauseofmyhands",
    config = {
        extra = {
            four = 4
        }
    },
    loc_txt = {
        ['name'] = 'Is it because of my hands',
        ['text'] = {
            [1] = '{C:red}-#1#{} hand size',
            [2] = '{C:attention}+#1#{} hands'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 3
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
        
        return {vars = {card.ability.extra.four}}
    end,
    
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.four)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.four
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.four)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.four
    end
}