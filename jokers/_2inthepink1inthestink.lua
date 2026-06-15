
SMODS.Joker{ --2 in the pink 1 in the stink
    key = "_2inthepink1inthestink",
    config = {
        extra = {
            two = 2,
            one = 1
        }
    },
    loc_txt = {
        ['name'] = '2 in the pink 1 in the stink',
        ['text'] = {
            [1] = '{C:attention}#1#{} extra hands and {C:attention}#2#{} extra discard'
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
        
        return {vars = {card.ability.extra.two, card.ability.extra.one}}
    end,
    
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.two
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.one
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.two
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.one
    end
}