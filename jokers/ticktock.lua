
SMODS.Joker{ --Tick Tock
    key = "ticktock",
    config = {
        extra = {
            currentseconds = 0
        }
    },
    loc_txt = {
        ['name'] = 'Tick Tock',
        ['text'] = {
            [1] = 'Adds the amount of {C:attention}seconds{} to {X:blue,C:white} xchips {} (currently : {C:blue}#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {os.date("*t", os.time()).sec}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = os.date("*t", os.time()).sec
            }
        end
    end
}