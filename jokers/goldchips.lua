
SMODS.Joker{ --Gold Chips
    key = "goldchips",
    config = {
        extra = {
            currentmoney = 0
        }
    },
    loc_txt = {
        ['name'] = 'Gold Chips',
        ['text'] = {
            [1] = 'Adds your current{C:attention} Dollars {}as{C:blue} Chips {}',
            [2] = '(currently :{C:blue} #1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
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
        
        return {vars = {(G.GAME.dollars or 0)}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = G.GAME.dollars
            }
        end
    end
}