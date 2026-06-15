
SMODS.Joker{ --Necromancer
    key = "necromancer",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Necromancer',
        ['text'] = {
            [1] = 'If a {C:attention}Face card{} is {C:attention}discarded{} , It gets turned {C:edition}negative{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
        if context.discard  then
            if context.other_card:is_face() then
                return {
                    func = function()
                        context.other_card:set_edition("e_negative", true)
                    end,
                    message = "Card Modified!"
                }
            end
        end
    end
}