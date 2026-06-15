
SMODS.Joker{ --Ball and Chain
    key = "ballandchain",
    config = {
        extra = {
            zero = 0
        }
    },
    loc_txt = {
        ['name'] = 'Ball and Chain',
        ['text'] = {
            [1] = '{X:red,C:white}x#1# mult{}',
            [2] = '{C:attention}Crashes{} the game if {C:attention}sold{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
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
        
        return {vars = {card.ability.extra.zero}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.zero
            }
        end
        if context.selling_self  then
            error("Ha Ha ")
        end
    end
}