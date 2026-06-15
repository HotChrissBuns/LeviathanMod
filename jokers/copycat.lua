
SMODS.Joker{ --Copy Cat
    key = "copycat",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Copy Cat',
        ['text'] = {
            [1] = 'Copies ability of the right most {C:attention}Joker{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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
    
    calculate = function(self, card, context)
        
        local target_joker = G.jokers.cards[#G.jokers.cards]

    	-- don't copy itself
    	if target_joker == card then
            target_joker = nil
    	end
        
        local ret = SMODS.blueprint_effect(card, target_joker, context)
        if ret then
            SMODS.calculate_effect(ret, card)
        end
    end
}