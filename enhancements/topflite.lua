
SMODS.Enhancement {
    key = 'topflite',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            onetwo = 1.2
        }
    },
    loc_txt = {
        name = 'Top Flite',
        text = {
            [1] = '{X:mult,C:white}x#1#{} Mult when scored'
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
        return {vars = {card.ability.extra.onetwo}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                Xmult = card.ability.extra.onetwo
            }
        end
    end
}