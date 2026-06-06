
SMODS.Joker{ --Encore
    key = "encore",
    config = {
        extra = {
            two = 2
        }
    },
    loc_txt = {
        ['name'] = 'Encore',
        ['text'] = {
            [1] = '{C:attention}Retriggers{} the {C:attention}last{} played card{C:attention} #1#{} additional times'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 5
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
        if context.repetition and context.cardarea == G.play  then
            if context.other_card == context.scoring_hand[#context.scoring_hand] then
                return {
                    repetitions = card.ability.extra.two,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}