
SMODS.Enhancement {
    key = 'crafted',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            onefive = 1.5
        }
    },
    loc_txt = {
        name = 'Crafted',
        text = {
            [1] = '{X:blue,C:white}x #1# {} Chips If Held in hand'
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
    weight = 3,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.onefive}}
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.main_scoring then
            return {
                x_chips = card.ability.extra.onefive
            }
        end
    end
}