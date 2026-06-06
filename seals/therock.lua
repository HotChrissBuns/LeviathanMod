
SMODS.Seal {
    key = 'therock',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            sixtwo = 6.2
        }
    },
    badge_colour = HEX('EE82EE'),
    loc_txt = {
        name = 'the rock',
        label = 'the rock',
        text = {
            [1] = 'When Card is scored add {C:red}#1#{} Mult'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    sound = { sound = "voice8", per = 1.2, vol = 0.4 },
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.seal.extra.sixtwo}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                mult = card.ability.seal.extra.sixtwo
            }
        end
    end
}