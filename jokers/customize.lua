
SMODS.Joker{ --Customize
    key = "customize",
    config = {
        extra = {
            one = 1,
            oneone = 1.1
        }
    },
    loc_txt = {
        ['name'] = 'Customize',
        ['text'] = {
            [1] = '{C:red}+#1#{} Mult',
            [2] = '{C:blue}+#1#{} Chips',
            [3] = '{X:blue,C:white}x#2#{} chips',
            [4] = '{X:red,C:white}x#2#{} Mult',
            [5] = '{C:money}+#1#{} Dollar',
            [6] = '{C:attention}+#1#{} card selection',
            [7] = '{C:attention}+#1#{} discard',
            [8] = '{C:attention}+#1#{} hand',
            [9] = '{C:attention}+#1#{} hand size'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
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
        
        return {vars = {card.ability.extra.one, card.ability.extra.oneone}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.one,
                extra = {
                    mult = card.ability.extra.one,
                    extra = {
                        x_chips = card.ability.extra.oneone,
                        colour = G.C.DARK_EDITION,
                        extra = {
                            Xmult = card.ability.extra.oneone,
                            extra = {
                                
                                func = function()
                                    
                                    local current_dollars = G.GAME.dollars
                                    local target_dollars = G.GAME.dollars + card.ability.extra.one
                                    local dollar_value = target_dollars - current_dollars
                                    ease_dollars(dollar_value)
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.one), colour = G.C.MONEY})
                                    return true
                                end,
                                colour = G.C.MONEY
                            }
                        }
                    }
                }
            }
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(card.ability.extra.one)
        SMODS.change_discard_limit(card.ability.extra.one)
        G.hand:change_size(card.ability.extra.one)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.one
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.one
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(-card.ability.extra.one)
        SMODS.change_discard_limit(-card.ability.extra.one)
        G.hand:change_size(-card.ability.extra.one)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.one
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.one
    end
}