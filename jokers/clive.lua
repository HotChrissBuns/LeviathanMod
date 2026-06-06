
SMODS.Joker{ --Clive
    key = "clive",
    config = {
        extra = {
            source_rank_type = 'all',
            source_ranks = '{}',
            target_rank = '"A"'
        }
    },
    loc_txt = {
        ['name'] = 'Clive',
        ['text'] = {
            [1] = 'All cards are considered {C:attention}Aces{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 8
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
    end,
    
    add_to_deck = function(self, card, from_debuff)
        -- Combine ranks effect enabled
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        -- Combine ranks effect disabled
    end
}


local card_get_id_ref = Card.get_id
function Card:get_id()
    local original_id = card_get_id_ref(self)
    if not original_id then return original_id end

    if next(SMODS.find_card("j_TDL6615_clive")) then
        return 14
    end
    return original_id
end
