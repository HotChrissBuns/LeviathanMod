
SMODS.Enhancement {
    key = 'meatloaf',
    pos = { x = 2, y = 0 },
    config = {
        extra = {
            oneone = 1.1
        }
    },
    loc_txt = {
        name = 'Meat loaf',
        text = {
            [1] = '{C:blue}^#1#{} Chips',
            [2] = 'I would do anything for love',
            [3] = '(only works on {C:hearts}Heart{} cards)'
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
    weight = 4.5,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.oneone}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play and card:is_suit("Hearts") then
            return {
                e_chips = card.ability.extra.oneone
            }
        end
    end
}