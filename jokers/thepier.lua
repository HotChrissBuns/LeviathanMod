
SMODS.Joker{ --The Pier
    key = "thepier",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'The Pier',
        ['text'] = {
            [1] = 'If{C:attention} first hand {}of the round is {C:attention}1{} card',
            [2] = 'add a random {C:attention}seal{} to it'
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
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
        end
        if context.individual and context.cardarea == G.play  then
            if (G.GAME.current_round.hands_played == 0 and to_big(#context.scoring_hand) == to_big(1)) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        local random_seal = SMODS.poll_seal({mod = 10, guaranteed = true})
                        if random_seal then
                            scored_card:set_seal(random_seal, true)
                        end
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
    end
}