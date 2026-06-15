
SMODS.Joker{ --Do not 3 putt
    key = "donot3putt",
    config = {
        extra = {
            five = 5,
            zerofive = 0.5
        }
    },
    loc_txt = {
        ['name'] = 'Do not 3 putt',
        ['text'] = {
            [1] = '{X:blue,C:white}x#1#{} Chips',
            [2] = 'if hand contains three of a kind {X:red,C:white}x #2#{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
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
        
        return {vars = {card.ability.extra.five, card.ability.extra.zerofive}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Three of a Kind"]) then
                return {
                    Xmult = card.ability.extra.zerofive
                }
            else
                return {
                    x_chips = card.ability.extra.five
                }
            end
        end
    end
}