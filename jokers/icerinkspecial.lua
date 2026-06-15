
SMODS.Joker{ --Ice rink special
    key = "icerinkspecial",
    config = {
        extra = {
            two = 2,
            odds = 2
        }
    },
    loc_txt = {
        ['name'] = 'Ice rink special',
        ['text'] = {
            [1] = '{C:legendary}^#1#{} Mult When a {C:attention}2{} and {C:attention}Jack{} are scored in the same hand',
            [2] = 'When a card is sold {C:green}#2# in #3#{} to produce an STD'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["TDL6615_TDL6615_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_TDL6615_icerinkspecial') 
        return {vars = {card.ability.extra.two, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == 2 then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == J then
                        count = count + 1
                    end
                end
                return count >= 1
            end)()) then
                return {
                    e_chips = card.ability.extra.two
                }
            end
        end
        if context.selling_card  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_d8f3bdda', 1, card.ability.extra.odds, 'j_TDL6615_icerinkspecial', false) then
                    SMODS.calculate_effect({func = function()
                        
                        local created_joker = false
                        if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                            created_joker = true
                            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_TDL6615_std' })
                                    if joker_card then
                                        
                                        
                                    end
                                    G.GAME.joker_buffer = 0
                                    return true
                                end
                            }))
                        end
                        if created_joker then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                        end
                        return true
                    end}, card)
                end
            end
        end
    end
}