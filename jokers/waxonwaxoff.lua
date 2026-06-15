
SMODS.Joker{ --Wax on - Wax off
    key = "waxonwaxoff",
    config = {
        extra = {
            five = 5
        }
    },
    loc_txt = {
        ['name'] = 'Wax on - Wax off',
        ['text'] = {
            [1] = 'If{C:attention} hand {}is your {C:attention}most played poker hand{} {X:red,C:white}x#1#{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 6
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
        
        return {vars = {card.ability.extra.five}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local current_played = G.GAME.hands[context.scoring_name].played or 0
                for handname, values in pairs(G.GAME.hands) do
                    if handname ~= context.scoring_name and values.played > current_played and values.visible then
                        return false
                    end
                end
                return true
            end)() then
                return {
                    Xmult = card.ability.extra.five
                }
            end
        end
    end
}