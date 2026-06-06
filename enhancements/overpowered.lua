
SMODS.Enhancement {
    key = 'overpowered',
    pos = { x = 4, y = 0 },
    config = {
        extra = {
            onefive = 1.5
        }
    },
    loc_txt = {
        name = 'Overpowered',
        text = {
            [1] = '{C:purple}^#1#{} Mult when scored'
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
    weight = 0.25,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.onefive}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                e_mult = card.ability.extra.onefive
            }
        end
    end
}