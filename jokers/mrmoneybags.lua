
SMODS.Joker{ --Mr Money Bags
    key = "mrmoneybags",
    config = {
        extra = {
            two = 2
        }
    },
    loc_txt = {
        ['name'] = 'Mr Money Bags',
        ['text'] = {
            [1] = 'When a {C:attention}consumable{} is used , add {C:money}$#1#{} to all jokers sell values'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 6
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
        
        return {vars = {card.ability.extra.two}}
    end,
    
    calculate = function(self, card, context)
        if context.using_consumeable  then
            return {
                func = function()
                    for i, target_card in ipairs(G.jokers.cards) do
                        if target_card.set_cost then
                            target_card.ability.extra_value = (card.ability.extra_value or 0) + card.ability.extra.two
                            target_card:set_cost()
                        end
                    end
                    return true
                end,
                message = "All Jokers +"..tostring(card.ability.extra.two).." Sell Value"
            }
        end
    end
}