
SMODS.Consumable {
    key = 'ineffable',
    set = 'Spectral',
    pos = { x = 9, y = 0 },
    config = { 
        extra = {
            dollars0 = 5   
        } 
    },
    loc_txt = {
        name = 'Ineffable',
        text = {
            [1] = 'gain {C:attention}+3{} Random {C:attention}Vouchers{}',
            [2] = '{C:red}Halves{} your {C:attention}money {}'
        }
    },
    cost = 5,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        local voucher_key = pseudorandom_element(G.P_CENTER_POOLS.Voucher, "3cc2d63d").key
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
        local voucher_key = pseudorandom_element(G.P_CENTER_POOLS.Voucher, "1da03e72").key
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
        local voucher_key = pseudorandom_element(G.P_CENTER_POOLS.Voucher, "82dc5b6d").key
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
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                
                local current_dollars = G.GAME.dollars
                local target_dollars = G.GAME.dollars / 5
                local dollar_value = target_dollars - current_dollars
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "/"..tostring(5).." $", colour = G.C.RED})
                ease_dollars(dollar_value, true)
                return true
            end
        }))
        delay(0.6)
        return {
            message = nil,
            extra = {
                message = nil,
                colour = G.C.RED,
                extra = {
                    message = nil,
                    colour = G.C.RED
                }
            }
        }
    end,
    can_use = function(self, card)
        return true
    end
}