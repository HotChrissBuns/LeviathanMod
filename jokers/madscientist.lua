
SMODS.Joker{ --Mad Scientist
    key = "madscientist",
    config = {
        extra = {
            one = 1,
            two = 2,
            odds = 1
        }
    },
    loc_txt = {
        ['name'] = 'Mad Scientist',
        ['text'] = {
            [1] = 'When a consumable is used {C:green}#1# in #2#{} chance of creating a{C:tarot} fool {}card'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 4
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, one, card.ability.extra.odds, 'j_TDL6615_madscientist') 
        return {vars = {card.ability.extra.one, card.ability.extra.two, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.using_consumeable  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_ce8a103e', 1, card.ability.extra.odds, 'j_TDL6615_madscientist', false) then
                    SMODS.calculate_effect({func = function()
                        
                        for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.4,
                                func = function()
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'Tarot', key = 'c_fool'})                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        if created_consumable then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                        end
                        return true
                    end}, card)
                end
            end
        end
    end
}