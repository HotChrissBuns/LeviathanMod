
SMODS.Joker{ --Favorite Child
    key = "favoritechild",
    config = {
        extra = {
            one = 1
        }
    },
    loc_txt = {
        ['name'] = 'Favorite Child',
        ['text'] = {
            [1] = 'When another {C:attention}joker{} is {C:attention}triggered{} , gain {C:money}$#1#{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 8
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.one}}
    end,
    
    calculate = function(self, card, context)
        if context.post_trigger  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + card.ability.extra.one
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.one), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}