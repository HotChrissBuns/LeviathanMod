
SMODS.Joker{ --On the Bluff
    key = "onthebluff",
    config = {
        extra = {
            bluff = 4059,
            thirteen = 13,
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'On the Bluff',
        ['text'] = {
            [1] = 'adds{C:red} #1#{} Mult but has a {C:green}#3#in#4#{} chance to steal {C:money}$#2#{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_TDL6615_onthebluff') 
        return {vars = {card.ability.extra.bluff, card.ability.extra.thirteen, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    mult = card.ability.extra.bluff
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_98ba4c95', 1, card.ability.extra.odds, 'j_TDL6615_onthebluff', false) then
                            SMODS.calculate_effect({
                                func = function()
                                    
                                    local current_dollars = G.GAME.dollars
                                    local target_dollars = G.GAME.dollars - card.ability.extra.thirteen
                                    local dollar_value = target_dollars - current_dollars
                                    ease_dollars(dollar_value)
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(card.ability.extra.thirteen), colour = G.C.MONEY})
                                    return true
                                end}, card)
                            end
                            return true
                        end
                    }
                end
            end
        end
    }