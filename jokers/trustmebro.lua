
SMODS.Joker{ --Trust Me bro
    key = "trustmebro",
    config = {
        extra = {
            source_rank_type = 'face_cards',
            source_ranks = '{}',
            target_rank = '"2"'
        }
    },
    loc_txt = {
        ['name'] = 'Trust Me bro',
        ['text'] = {
            [1] = 'All {C:attention}Face cards{} are considered{C:attention} 2s{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
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

    if next(SMODS.find_card("j_TDL6615_trustmebro")) then
        if original_id >= 11 and original_id <= 13 then return 14 end
    end
    return original_id
end
