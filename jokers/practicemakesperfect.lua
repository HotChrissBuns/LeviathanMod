
SMODS.Joker{ --Practice Makes Perfect
    key = "practicemakesperfect",
    config = {
        extra = {
            hands0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Practice Makes Perfect',
        ['text'] = {
            [1] = 'If hand is a {C:attention}straight flush{}, gain {C:attention}1 hand{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 7
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
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "Straight Flush" then
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Hands", colour = G.C.GREEN})
                        
                        G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + 1
                        return true
                    end
                }
            end
        end
    end
}