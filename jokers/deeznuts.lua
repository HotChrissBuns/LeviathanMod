
SMODS.Joker{ --Deez Nuts
    key = "deeznuts",
    config = {
        extra = {
            hundred = 100
        }
    },
    loc_txt = {
        ['name'] = 'Deez Nuts',
        ['text'] = {
            [1] = '{C:blue}+#1# {}Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 4
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
        
        return {vars = {card.ability.extra.hundred}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("TDL6615_deeznuts")
                    
                    return true
                end,
            }))
            return {
                chips = card.ability.extra.hundred
            }
        end
    end
}