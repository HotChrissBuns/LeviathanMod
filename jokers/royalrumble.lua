
SMODS.Joker{ --Royal Rumble
    key = "royalrumble",
    config = {
        extra = {
            Thirty = 30
        }
    },
    loc_txt = {
        ['name'] = 'Royal Rumble',
        ['text'] = {
            [1] = 'When a blind is skipped gain {C:money}$#1#{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
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
        
        return {vars = {card.ability.extra.Thirty}}
    end,
    
    calculate = function(self, card, context)
        if context.skip_blind  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + card.ability.extra.Thirty
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.Thirty), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}