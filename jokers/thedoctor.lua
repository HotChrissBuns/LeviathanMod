
SMODS.Joker{ --The Doctor
    key = "thedoctor",
    config = {
        extra = {
            reroll_amount = '10000'
        }
    },
    loc_txt = {
        ['name'] = 'The Doctor',
        ['text'] = {
            [1] = 'First {C:attention}10 000{} rerolls in shop are free'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 11
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 30,
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
        SMODS.change_free_rerolls(10000)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_free_rerolls(-(10000))
    end
}