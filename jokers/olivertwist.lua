
SMODS.Joker{ --Oliver Twist
    key = "olivertwist",
    config = {
        extra = {
            one = 1
        }
    },
    loc_txt = {
        ['name'] = 'Oliver Twist',
        ['text'] = {
            [1] = '{C:attention}Selling{} this joker will give you  {C:attention}#1#{} more Joker {C:attention}slot{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.one}}
    end,
    
    calculate = function(self, card, context)
        if context.selling_self  then
            return {
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.one).." Joker Slot", colour = G.C.DARK_EDITION})
                    G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.one
                    return true
                end
            }
        end
    end
}