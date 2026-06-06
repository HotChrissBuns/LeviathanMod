
SMODS.Joker{ --Behemoth
    key = "behemoth",
    config = {
        extra = {
            ten = 10,
            five = 5
        }
    },
    loc_txt = {
        ['name'] = 'Behemoth',
        ['text'] = {
            [1] = 'Adds {C:attention}#1#{} joker slots',
            [2] = '',
            [3] = '{C:attention}Retriggers{} each Scored card{C:attention} #2#{} times'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 10
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
        
        return {vars = {card.ability.extra.ten, card.ability.extra.five}}
    end,
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            return {
                repetitions = card.ability.extra.five,
                message = localize('k_again_ex')
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