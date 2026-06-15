
SMODS.Joker{ --Leviathan
    key = "leviathan",
    config = {
        extra = {
            ten = 10,
            zerofive = 0.5
        }
    },
    loc_txt = {
        ['name'] = 'Leviathan',
        ['text'] = {
            [1] = 'Adds {C:attention}#1#{} joker slots',
            [2] = '',
            [3] = 'When a card is scored{C:attention} gain{} a {C:attention}permanent{} {C:attention}x#2#{} {C:blue}Chips {}and{C:red} Mult {}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
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
        
        return {vars = {card.ability.extra.ten, card.ability.extra.zerofive}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult or 0
            context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult + card.ability.extra.zerofive
            context.other_card.ability.perma_x_chips = context.other_card.ability.perma_x_chips or 0
            context.other_card.ability.perma_x_chips = context.other_card.ability.perma_x_chips + card.ability.extra.zerofive
            return {
                extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card
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