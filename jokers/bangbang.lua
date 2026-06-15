
SMODS.Joker{ --Bang Bang
    key = "bangbang",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Bang Bang',
        ['text'] = {
            [1] = 'When a {C:attention}Straight Flush{} is scored',
            [2] = 'Create a random {C:edition}Negative{} {C:rare}Rare{} {C:attention}joker{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
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
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "Straight Flush" then
                local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'Rare' })
                        if joker_card then
                            joker_card:set_edition("e_negative", true)
                            
                        end
                        
                        return true
                    end
                }))
                return {
                    message = created_joker and localize('k_plus_joker') or nil
                }
            end
        end
    end
}