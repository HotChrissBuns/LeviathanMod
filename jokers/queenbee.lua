
SMODS.Joker{ --Queen Bee
    key = "queenbee",
    config = {
        extra = {
            q = 12
        }
    },
    loc_txt = {
        ['name'] = 'Queen Bee',
        ['text'] = {
            [1] = '{C:blue}+#1#{} Chips when a {C:attention}Queen{} is scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 5
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.q}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 12 then
                return {
                    chips = card.ability.extra.q
                }
            end
        end
    end
}