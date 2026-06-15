
SMODS.Joker{ --Avada Kadvara
    key = "avadakadvara",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Avada Kadvara',
        ['text'] = {
            [1] = '{C:attention}Destroys {}all {C:attention}played{} cards'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 10
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
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            context.other_card.should_destroy = true
            return {
                message = "Destroyed!"
            }
        end
    end
}