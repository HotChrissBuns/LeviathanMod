
SMODS.Joker{ --Polygamist
    key = "polygamist",
    config = {
        extra = {
            onefive = 1.5,
            repetitions0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Polygamist',
        ['text'] = {
            [1] = 'Each {C:edition}Polychrome{} card gets {C:attention}retriggered{} and produces an extra {C:red}x#1# Mult{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 9
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
        
        return {vars = {card.ability.extra.onefive}}
    end,
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if context.other_card.edition and context.other_card.edition.key == "polychrome" then
                return {
                    repetitions = 1,
                    message = localize('k_again_ex'),
                    extra = {
                        Xmult = card.ability.extra.onefive
                    }
                }
            end
        end
    end
}