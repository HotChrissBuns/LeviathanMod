
SMODS.Back {
    key = 'golden_skips',
    pos = { x = 8, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Golden Skips',
        text = {
            [1] = 'When a blind is {C:attention}skipped{} gain {C:attention}+1{} {C:attention}Negative joker{} in the shop'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    calculate = function(self, card, context)
        if context.skip_blind then
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local tag = Tag("tag_negative")
                            if tag.name == "Orbital Tag" then
                                local _poker_hands = {}
                                for k, v in pairs(G.GAME.hands) do
                                    if v.visible then
                                        _poker_hands[#_poker_hands + 1] = k
                                    end
                                end
                                tag.ability.orbital_hand = pseudorandom_element(_poker_hands, "jokerforge_orbital")
                            end
                            tag:set_ability()
                            add_tag(tag)
                            play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                            return true
                        end
                    }))
                    return true
                end,
                message = "Created Tag!"
            }
        end
    end,
    
}