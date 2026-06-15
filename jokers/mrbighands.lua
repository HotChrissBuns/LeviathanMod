
SMODS.Joker{ --Mr Big Hands
    key = "mrbighands",
    config = {
        extra = {
            hand_size_increase = '100'
        }
    },
    loc_txt = {
        ['name'] = 'Mr Big Hands',
        ['text'] = {
            [1] = 'Adds {C:attention}100{} to your {C:attention}hand size{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
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
    
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(100)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-100)
    end
}