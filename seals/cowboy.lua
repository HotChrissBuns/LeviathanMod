
SMODS.Seal {
    key = 'cowboy',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            twenty = 20
        }
    },
    badge_colour = HEX('000000'),
    loc_txt = {
        name = 'Cowboy',
        label = 'Cowboy',
        text = {
            [1] = 'if hand played is a',
            [2] = 'flush five give',
            [3] = '{C:money}$#1#{}'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.seal.extra.twenty}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + card.ability.seal.extra.twenty
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.seal.extra.twenty), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}