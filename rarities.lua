SMODS.Rarity {
    key = "omnipotent",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('003a29'),
    loc_txt = {
        name = "Omnipotent"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}