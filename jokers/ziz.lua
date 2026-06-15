
SMODS.Joker{ --Ziz
    key = "ziz",
    config = {
        extra = {
            ten = 10,
            one = 1
        }
    },
    loc_txt = {
        ['name'] = 'Ziz',
        ['text'] = {
            [1] = 'Adds {C:attention}#1#{} joker slots',
            [2] = '',
            [3] = 'Everytime a card is scored {C:attention}levels up{} {C:attention}played poker hand{} by {C:attention}#2#{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 11
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 50,
    rarity = "TDL6615_omnipotent",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["TDL6615_TDL6615_jokers_omni"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.ten, card.ability.extra.one}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            local target_hand = (context.scoring_name or "High Card")
            level_up_hand(card, target_hand, true, card.ability.extra.one)
            return {
                message = localize('k_level_up_ex')
            }
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.ten
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.ten
    end
}