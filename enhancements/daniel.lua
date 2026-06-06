
SMODS.Enhancement {
    key = 'daniel',
    pos = { x = 3, y = 0 },
    config = {
        extra = {
            onefive = 1.5,
            zerofive = 0.5,
            five = 5
        }
    },
    loc_txt = {
        name = 'Daniel',
        text = {
            [1] = '{C:red}x#2# MULT{} if {C:attention}played{}',
            [2] = '{C:red}x#1# mult{} if {C:attention}held in hand{}',
            [3] = 'money set to {C:money}$#3# {} if {C:attention}discarded{}',
            [4] = '{C:attention}1st{} joker {C:attention}destroyed{} if {C:attention}held in hand{} at{C:attention} end of round{}'
        }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 5,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.onefive, card.ability.extra.zerofive, card.ability.extra.five}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                Xmult = card.ability.extra.zerofive,
                message = "feed me im hungry"
            }
        end
        if context.cardarea == G.hand and context.main_scoring then
            return {
                Xmult = card.ability.extra.onefive,
                message = "feed me im hungry"
            }
        end
        if context.discard and context.other_card == card then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = card.ability.extra.five
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "feed me im hungry", colour = G.C.MONEY})
                    return true
                end
            }
        end
        if context.end_of_round and context.cardarea == G.hand and context.other_card == card and context.individual then
            local target_joker = nil
            for i, joker in ipairs(G.jokers.cards) do
                if not joker.ability.eternal and not joker.getting_sliced then
                    target_joker = joker
                    break
                end
            end
            
            if target_joker then
                target_joker.getting_sliced = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                        return true
                    end
                }))
            end
            return {
                message = "feed me im hungry"
            }
        end
    end
}