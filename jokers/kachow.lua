
SMODS.Joker{ --Ka - Chow
    key = "kachow",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Ka - Chow',
        ['text'] = {
            [1] = 'When a {C:attention}blind{} is{C:attention} skipped{} , create a {C:attention}random voucher{}'
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
    
    calculate = function(self, card, context)
        if context.skip_blind  then
            local voucher_key = pseudorandom_element(G.P_CENTER_POOLS.Voucher, "20db9b7b").key
            local voucher_card = SMODS.create_card{area = G.play, key = voucher_key}
            voucher_card:start_materialize()
            voucher_card.cost = 0
            G.play:emplace(voucher_card)
            delay(0.8)
            voucher_card:redeem()
            
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.5,
                func = function()
                    voucher_card:start_dissolve()                
                    return true
                end
            }))
            return {
                message = nil
            }
        end
    end
}