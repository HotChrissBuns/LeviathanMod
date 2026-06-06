
SMODS.Booster {
    key = 'leviathans_bufoons',
    loc_txt = {
        name = "Leviathans Bufoons",
        text = {
            [1] = 'Choose {C:attention}1{} of {C:attention}4 {}Leviathan Mod Jokers'
        },
        group_name = "TDL6615_boosters"
    },
    config = { extra = 4, choose = 1 },
    cost = 10,
    weight = 1.4,
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "TDL6615_TDL6615_jokers",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "TDL6615_leviathans_bufoons"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("006233"))
        ease_background_colour({ new_colour = HEX('006233'), special_colour = HEX("b2e004"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
        end,
    }
    
    
    SMODS.Booster {
        key = 'leviathans_mega_bufoons',
        loc_txt = {
            name = "Leviathans  Mega Bufoons",
            text = {
                [1] = 'Choose{C:attention} 2{} of {C:attention}5 {}Leviathan Mod Jokers'
            },
            group_name = "TDL6615_boosters"
        },
        config = { extra = 5, choose = 2 },
        cost = 10,
        atlas = "CustomBoosters",
        pos = { x = 1, y = 0 },
        discovered = true,
        loc_vars = function(self, info_queue, card)
            local cfg = (card and card.ability) or self.config
            return {
                vars = { cfg.choose, cfg.extra }
            }
        end,
        create_card = function(self, card, i)
            return {
                set = "TDL6615_TDL6615_jokers",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "TDL6615_leviathans_mega_bufoons"
            }
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, HEX("006233"))
            ease_background_colour({ new_colour = HEX('006233'), special_colour = HEX("b2e004"), contrast = 2 })
        end,
        particles = function(self)
            -- No particles for joker packs
            end,
        }
        