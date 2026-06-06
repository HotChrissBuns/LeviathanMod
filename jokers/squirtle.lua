
SMODS.Joker{ --Squirtle
    key = "squirtle",
    config = {
        extra = {
            twentyfive = 25
        }
    },
    loc_txt = {
        ['name'] = 'Squirtle',
        ['text'] = {
            [1] = 'Brings the vibe and {C:red}+#1#{} Mult if hand is a{C:attention} pair{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 1
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.twentyfive}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "Pair" then
                return {
                    mult = card.ability.extra.twentyfive
                }
            end
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("TDL6615_sax")
                    
                    return true
                end,
            }))
        end
    end
}