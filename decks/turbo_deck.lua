
SMODS.Back {
    key = 'turbo_deck',
    pos = { x = 0, y = 1 },
    config = {
        extra = {
            booster_slots0 = 1,
            booster_slots = 1
        },
    },
    loc_txt = {
        name = 'Turbo Deck',
        text = {
            [1] = 'When a{C:attention} booster pack {}is opened {C:attention}+1{} {C:attention}booster pack{} to the shop'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    calculate = function(self, card, context)
        if context.open_booster then
            return {
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        
                        SMODS.change_booster_limit(1)
                        return true
                    end
                }))
            }
        end
    end,
    apply = function(self, back)
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    
                    local current_booster_slots = (G.GAME.modifiers.extra_boosters or 0)
                    local target_booster_slots = 1
                    local difference = target_booster_slots - current_booster_slots
                    SMODS.change_booster_limit(difference)
                    return true
                end
            }))
        }
    end
}