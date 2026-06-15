
SMODS.Joker{ --Nice
    key = "nice",
    config = {
        extra = {
            six = 6,
            nine = 9
        }
    },
    loc_txt = {
        ['name'] = 'Nice',
        ['text'] = {
            [1] = '{C:purple}^#1#{} Mult {C:purple}^#2#{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 11
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 69,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["TDL6615_TDL6615_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.six, card.ability.extra.nine}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                e_mult = card.ability.extra.six,
                extra = {
                    e_chips = card.ability.extra.nine,
                    colour = G.C.DARK_EDITION
                }
            }
        end
    end
}