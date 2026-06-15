SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomConsumables", 
    path = "CustomConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomBoosters", 
    path = "CustomBoosters.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomEnhancements", 
    path = "CustomEnhancements.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomSeals", 
    path = "CustomSeals.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomDecks", 
    path = "CustomDecks.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end
-- this function is used to load everything within a folder.-- Jokerforge doesnt use it because it doesnt make loading order easy
local function load_folder(path)
    local files = NFS.getDirectoryItemsInfo(mod_path .. "/" .. path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file(path .. file_name))()
        end
    end
end
-- load the jokers
if true then
    assert(SMODS.load_file("jokers/snoop.lua"))()
    assert(SMODS.load_file("jokers/notv.lua"))()
    assert(SMODS.load_file("jokers/sherlock.lua"))()
    assert(SMODS.load_file("jokers/pooperscoop.lua"))()
    assert(SMODS.load_file("jokers/glasscoke.lua"))()
    assert(SMODS.load_file("jokers/vangjoupoepenrykhom.lua"))()
    assert(SMODS.load_file("jokers/areyousix.lua"))()
    assert(SMODS.load_file("jokers/_67.lua"))()
    assert(SMODS.load_file("jokers/working9to5.lua"))()
    assert(SMODS.load_file("jokers/whitevan.lua"))()
    assert(SMODS.load_file("jokers/icecreamscoop.lua"))()
    assert(SMODS.load_file("jokers/std.lua"))()
    assert(SMODS.load_file("jokers/chrisphonecharger.lua"))()
    assert(SMODS.load_file("jokers/sundial.lua"))()
    assert(SMODS.load_file("jokers/squirtle.lua"))()
    assert(SMODS.load_file("jokers/royalrumble.lua"))()
    assert(SMODS.load_file("jokers/disguisedjoker.lua"))()
    assert(SMODS.load_file("jokers/goldchips.lua"))()
    assert(SMODS.load_file("jokers/ballandchain.lua"))()
    assert(SMODS.load_file("jokers/childrenofthesun.lua"))()
    assert(SMODS.load_file("jokers/deathstar.lua"))()
    assert(SMODS.load_file("jokers/bluemoon.lua"))()
    assert(SMODS.load_file("jokers/awholenewworld.lua"))()
    assert(SMODS.load_file("jokers/mabakerpies.lua"))()
    assert(SMODS.load_file("jokers/bathtime.lua"))()
    assert(SMODS.load_file("jokers/redhanded.lua"))()
    assert(SMODS.load_file("jokers/businsmin.lua"))()
    assert(SMODS.load_file("jokers/pablo.lua"))()
    assert(SMODS.load_file("jokers/trustmebro.lua"))()
    assert(SMODS.load_file("jokers/oopsall1s.lua"))()
    assert(SMODS.load_file("jokers/chips.lua"))()
    assert(SMODS.load_file("jokers/oumascouch.lua"))()
    assert(SMODS.load_file("jokers/hello.lua"))()
    assert(SMODS.load_file("jokers/openthedoor.lua"))()
    assert(SMODS.load_file("jokers/goodgood.lua"))()
    assert(SMODS.load_file("jokers/jasonstatham.lua"))()
    assert(SMODS.load_file("jokers/_2inthepink1inthestink.lua"))()
    assert(SMODS.load_file("jokers/customize.lua"))()
    assert(SMODS.load_file("jokers/isitbecauseofmyhands.lua"))()
    assert(SMODS.load_file("jokers/donot3putt.lua"))()
    assert(SMODS.load_file("jokers/crazycarrot.lua"))()
    assert(SMODS.load_file("jokers/monke.lua"))()
    assert(SMODS.load_file("jokers/onthespectrum.lua"))()
    assert(SMODS.load_file("jokers/madscientist.lua"))()
    assert(SMODS.load_file("jokers/monsterhouse.lua"))()
    assert(SMODS.load_file("jokers/deeznuts.lua"))()
    assert(SMODS.load_file("jokers/dodgecoin.lua"))()
    assert(SMODS.load_file("jokers/_2faced.lua"))()
    assert(SMODS.load_file("jokers/_3blindmice.lua"))()
    assert(SMODS.load_file("jokers/_4mulaone.lua"))()
    assert(SMODS.load_file("jokers/high5.lua"))()
    assert(SMODS.load_file("jokers/_6pack.lua"))()
    assert(SMODS.load_file("jokers/_7up.lua"))()
    assert(SMODS.load_file("jokers/sk8ter.lua"))()
    assert(SMODS.load_file("jokers/k9unit.lua"))()
    assert(SMODS.load_file("jokers/tennisracket.lua"))()
    assert(SMODS.load_file("jokers/jackinthebox.lua"))()
    assert(SMODS.load_file("jokers/queenbee.lua"))()
    assert(SMODS.load_file("jokers/kingcobra.lua"))()
    assert(SMODS.load_file("jokers/aceventura.lua"))()
    assert(SMODS.load_file("jokers/astro.lua"))()
    assert(SMODS.load_file("jokers/encore.lua"))()
    assert(SMODS.load_file("jokers/kachow.lua"))()
    assert(SMODS.load_file("jokers/mrmoneybags.lua"))()
    assert(SMODS.load_file("jokers/newphone.lua"))()
    assert(SMODS.load_file("jokers/golddoubleoons.lua"))()
    assert(SMODS.load_file("jokers/necromancer.lua"))()
    assert(SMODS.load_file("jokers/papita.lua"))()
    assert(SMODS.load_file("jokers/thepier.lua"))()
    assert(SMODS.load_file("jokers/waxonwaxoff.lua"))()
    assert(SMODS.load_file("jokers/palmreader.lua"))()
    assert(SMODS.load_file("jokers/medusa.lua"))()
    assert(SMODS.load_file("jokers/practicemakesperfect.lua"))()
    assert(SMODS.load_file("jokers/mancave.lua"))()
    assert(SMODS.load_file("jokers/wataka.lua"))()
    assert(SMODS.load_file("jokers/heartattack.lua"))()
    assert(SMODS.load_file("jokers/doug.lua"))()
    assert(SMODS.load_file("jokers/fightclub.lua"))()
    assert(SMODS.load_file("jokers/blooddiamond.lua"))()
    assert(SMODS.load_file("jokers/hotspot.lua"))()
    assert(SMODS.load_file("jokers/onthebluff.lua"))()
    assert(SMODS.load_file("jokers/rhett.lua"))()
    assert(SMODS.load_file("jokers/link.lua"))()
    assert(SMODS.load_file("jokers/pourchild.lua"))()
    assert(SMODS.load_file("jokers/icerinkspecial.lua"))()
    assert(SMODS.load_file("jokers/favoritechild.lua"))()
    assert(SMODS.load_file("jokers/hotchocolate.lua"))()
    assert(SMODS.load_file("jokers/cakeofcheese.lua"))()
    assert(SMODS.load_file("jokers/bangbang.lua"))()
    assert(SMODS.load_file("jokers/plagiarism.lua"))()
    assert(SMODS.load_file("jokers/copycat.lua"))()
    assert(SMODS.load_file("jokers/olivertwist.lua"))()
    assert(SMODS.load_file("jokers/sometimesmaybegoodsometimesmaybeshit.lua"))()
    assert(SMODS.load_file("jokers/clive.lua"))()
    assert(SMODS.load_file("jokers/tinfoil.lua"))()
    assert(SMODS.load_file("jokers/hologramharry.lua"))()
    assert(SMODS.load_file("jokers/polygamist.lua"))()
    assert(SMODS.load_file("jokers/ticktock.lua"))()
    assert(SMODS.load_file("jokers/pocketaces.lua"))()
    assert(SMODS.load_file("jokers/again.lua"))()
    assert(SMODS.load_file("jokers/avadakadvara.lua"))()
    assert(SMODS.load_file("jokers/wolfofwallstreet.lua"))()
    assert(SMODS.load_file("jokers/shortcut.lua"))()
    assert(SMODS.load_file("jokers/powerball.lua"))()
    assert(SMODS.load_file("jokers/escobar.lua"))()
    assert(SMODS.load_file("jokers/creeper.lua"))()
    assert(SMODS.load_file("jokers/chilcheese.lua"))()
    assert(SMODS.load_file("jokers/fourhorseman.lua"))()
    assert(SMODS.load_file("jokers/goodmythicalmorning.lua"))()
    assert(SMODS.load_file("jokers/mrbighands.lua"))()
    assert(SMODS.load_file("jokers/onemoretime.lua"))()
    assert(SMODS.load_file("jokers/thegiftthatkeepsongiving.lua"))()
    assert(SMODS.load_file("jokers/nice.lua"))()
    assert(SMODS.load_file("jokers/sumis.lua"))()
    assert(SMODS.load_file("jokers/finalboss.lua"))()
    assert(SMODS.load_file("jokers/medievalsteve.lua"))()
    assert(SMODS.load_file("jokers/thedoctor.lua"))()
    assert(SMODS.load_file("jokers/ziz.lua"))()
    assert(SMODS.load_file("jokers/behemoth.lua"))()
    assert(SMODS.load_file("jokers/leviathan.lua"))()
end
-- load the consumables
if true then
    assert(SMODS.load_file("consumables/strength.lua"))()
    assert(SMODS.load_file("consumables/thespawner.lua"))()
    assert(SMODS.load_file("consumables/mine.lua"))()
    assert(SMODS.load_file("consumables/thebackyard.lua"))()
    assert(SMODS.load_file("consumables/kraggakamma.lua"))()
    assert(SMODS.load_file("consumables/butiwontdothat.lua"))()
    assert(SMODS.load_file("consumables/thekidnapped.lua"))()
    assert(SMODS.load_file("consumables/passiveincome.lua"))()
    assert(SMODS.load_file("consumables/judgement.lua"))()
    assert(SMODS.load_file("consumables/ineffable.lua"))()
    assert(SMODS.load_file("consumables/bookofra.lua"))()
    assert(SMODS.load_file("consumables/nolongerthirsty.lua"))()
    assert(SMODS.load_file("consumables/thesummoning.lua"))()
end
-- load the enhancements
if true then
    assert(SMODS.load_file("enhancements/crafted.lua"))()
    assert(SMODS.load_file("enhancements/topflite.lua"))()
    assert(SMODS.load_file("enhancements/meatloaf.lua"))()
    assert(SMODS.load_file("enhancements/daniel.lua"))()
    assert(SMODS.load_file("enhancements/overpowered.lua"))()
end

-- load the seals
if true then
    assert(SMODS.load_file("seals/therock.lua"))()
    assert(SMODS.load_file("seals/cowboy.lua"))()
end

-- load the decks
if true then
    assert(SMODS.load_file("decks/glass_house.lua"))()
    assert(SMODS.load_file("decks/_card_only.lua"))()
    assert(SMODS.load_file("decks/thirsty_deck.lua"))()
    assert(SMODS.load_file("decks/lucky.lua"))()
    assert(SMODS.load_file("decks/sumis.lua"))()
    assert(SMODS.load_file("decks/lets_go_shopping.lua"))()
    assert(SMODS.load_file("decks/lets_talk_about_that.lua"))()
    assert(SMODS.load_file("decks/under_the_stairs.lua"))()
    assert(SMODS.load_file("decks/golden_skips.lua"))()
    assert(SMODS.load_file("decks/the_four_horseman.lua"))()
    assert(SMODS.load_file("decks/turbo_deck.lua"))()
    assert(SMODS.load_file("decks/random_randy.lua"))()
    assert(SMODS.load_file("decks/no_going_back_now.lua"))()
    assert(SMODS.load_file("decks/odd_todd_deck.lua"))()
    assert(SMODS.load_file("decks/imagination.lua"))()
    assert(SMODS.load_file("decks/omnipotent_deck.lua"))()
end



assert(SMODS.load_file("rarities.lua"))()


-- load boosters
assert(SMODS.load_file("boosters.lua"))()
--load sounds
assert(SMODS.load_file("sounds.lua"))()
SMODS.ObjectType({
    key = "TDL6615_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "TDL6615_TDL6615_jokers",
    cards = {
        ["j_TDL6615_snoop"] = true,
        ["j_TDL6615_notv"] = true,
        ["j_TDL6615_sherlock"] = true,
        ["j_TDL6615_pooperscoop"] = true,
        ["j_TDL6615_glasscoke"] = true,
        ["j_TDL6615_vangjoupoepenrykhom"] = true,
        ["j_TDL6615_areyousix"] = true,
        ["j_TDL6615_whitevan"] = true,
        ["j_TDL6615_icecreamscoop"] = true,
        ["j_TDL6615_std"] = true,
        ["j_TDL6615_chrisphonecharger"] = true,
        ["j_TDL6615_sundial"] = true,
        ["j_TDL6615_squirtle"] = true,
        ["j_TDL6615_royalrumble"] = true,
        ["j_TDL6615_disguisedjoker"] = true,
        ["j_TDL6615_goldchips"] = true,
        ["j_TDL6615_ballandchain"] = true,
        ["j_TDL6615_childrenofthesun"] = true,
        ["j_TDL6615_deathstar"] = true,
        ["j_TDL6615_bluemoon"] = true,
        ["j_TDL6615_awholenewworld"] = true,
        ["j_TDL6615_mabakerpies"] = true,
        ["j_TDL6615_bathtime"] = true,
        ["j_TDL6615_redhanded"] = true,
        ["j_TDL6615_businsmin"] = true,
        ["j_TDL6615_pablo"] = true,
        ["j_TDL6615_trustmebro"] = true,
        ["j_TDL6615_oopsall1s"] = true,
        ["j_TDL6615_chips"] = true,
        ["j_TDL6615_oumascouch"] = true,
        ["j_TDL6615_hello"] = true,
        ["j_TDL6615_openthedoor"] = true,
        ["j_TDL6615_goodgood"] = true,
        ["j_TDL6615_jasonstatham"] = true,
        ["j_TDL6615__2inthepink1inthestink"] = true,
        ["j_TDL6615_customize"] = true,
        ["j_TDL6615_isitbecauseofmyhands"] = true,
        ["j_TDL6615_donot3putt"] = true,
        ["j_TDL6615_crazycarrot"] = true,
        ["j_TDL6615_monke"] = true,
        ["j_TDL6615_onthespectrum"] = true,
        ["j_TDL6615_madscientist"] = true,
        ["j_TDL6615_monsterhouse"] = true,
        ["j_TDL6615_deeznuts"] = true,
        ["j_TDL6615_dodgecoin"] = true,
        ["j_TDL6615__2faced"] = true,
        ["j_TDL6615__3blindmice"] = true,
        ["j_TDL6615__4mulaone"] = true,
        ["j_TDL6615_high5"] = true,
        ["j_TDL6615__6pack"] = true,
        ["j_TDL6615__7up"] = true,
        ["j_TDL6615_sk8ter"] = true,
        ["j_TDL6615_k9unit"] = true,
        ["j_TDL6615_tennisracket"] = true,
        ["j_TDL6615_jackinthebox"] = true,
        ["j_TDL6615_queenbee"] = true,
        ["j_TDL6615_kingcobra"] = true,
        ["j_TDL6615_aceventura"] = true,
        ["j_TDL6615_astro"] = true,
        ["j_TDL6615_encore"] = true,
        ["j_TDL6615_kachow"] = true,
        ["j_TDL6615_mrmoneybags"] = true,
        ["j_TDL6615_newphone"] = true,
        ["j_TDL6615_golddoubleoons"] = true,
        ["j_TDL6615_necromancer"] = true,
        ["j_TDL6615_papita"] = true,
        ["j_TDL6615_thepier"] = true,
        ["j_TDL6615_waxonwaxoff"] = true,
        ["j_TDL6615_palmreader"] = true,
        ["j_TDL6615_medusa"] = true,
        ["j_TDL6615_practicemakesperfect"] = true,
        ["j_TDL6615_mancave"] = true,
        ["j_TDL6615_wataka"] = true,
        ["j_TDL6615_hotspot"] = true,
        ["j_TDL6615_onthebluff"] = true,
        ["j_TDL6615_rhett"] = true,
        ["j_TDL6615_link"] = true,
        ["j_TDL6615_pourchild"] = true,
        ["j_TDL6615_icerinkspecial"] = true,
        ["j_TDL6615_favoritechild"] = true,
        ["j_TDL6615_hotchocolate"] = true,
        ["j_TDL6615_cakeofcheese"] = true,
        ["j_TDL6615_bangbang"] = true,
        ["j_TDL6615_plagiarism"] = true,
        ["j_TDL6615_copycat"] = true,
        ["j_TDL6615_olivertwist"] = true,
        ["j_TDL6615_sometimesmaybegoodsometimesmaybeshit"] = true,
        ["j_TDL6615_clive"] = true,
        ["j_TDL6615_tinfoil"] = true,
        ["j_TDL6615_hologramharry"] = true,
        ["j_TDL6615_polygamist"] = true,
        ["j_TDL6615_ticktock"] = true,
        ["j_TDL6615_pocketaces"] = true,
        ["j_TDL6615_again"] = true,
        ["j_TDL6615_avadakadvara"] = true,
        ["j_TDL6615_wolfofwallstreet"] = true,
        ["j_TDL6615_shortcut"] = true,
        ["j_TDL6615_powerball"] = true,
        ["j_TDL6615_escobar"] = true,
        ["j_TDL6615_creeper"] = true,
        ["j_TDL6615_chilcheese"] = true,
        ["j_TDL6615_fourhorseman"] = true,
        ["j_TDL6615_goodmythicalmorning"] = true,
        ["j_TDL6615_mrbighands"] = true,
        ["j_TDL6615_onemoretime"] = true,
        ["j_TDL6615_thegiftthatkeepsongiving"] = true,
        ["j_TDL6615_nice"] = true,
        ["j_TDL6615_sumis"] = true,
        ["j_TDL6615_finalboss"] = true,
        ["j_TDL6615_medievalsteve"] = true,
        ["j_TDL6615_thedoctor"] = true
    },
})

SMODS.ObjectType({
    key = "TDL6615_TDL6615_jokers_omni",
    cards = {
        ["j_TDL6615_ziz"] = true,
        ["j_TDL6615_behemoth"] = true,
        ["j_TDL6615_leviathan"] = true
    },
})


SMODS.current_mod.optional_features = function()
    return {
        cardareas = {},
        post_trigger = true 
    }
end