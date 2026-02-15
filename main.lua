SMODS.Booster {
	key = "Food_Pack",
	kind = 'Food',
	cost = 4,
	config = { extra = 2, choose = 1 },
	loc_vars = function(self, info_queue, card)
		local cfg = (card and card.ability) or self.config
		return {
			vars = { cfg.choose, cfg.extra },
			key = self.key:sub(1, -3), -- This uses the description key of the booster without the number at the end. Remove this if your booster doesn't have artwork variants like vanilla
		}
	end,
	create_card = function(self, card, i)
		return { set = "Food", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "MorePacks_food"}
	end
}

--Shamelessly stolen food pool code from Minty
if not SMODS.ObjectType.Food then
    SMODS.ObjectType({
        key = "Food",
        default = "j_popcorn",
        cards = {
            ["j_gros_michel"] = true,
            ["j_egg"] = true,
            ["j_ice_cream"] = true,
            ["j_cavendish"] = true,
            ["j_turtle_bean"] = true,
            ["j_diet_cola"] = true,
            ["j_popcorn"] = true,
            ["j_ramen"] = true,
            ["j_selzer"] = true,
        },
        inject = function(self)
            SMODS.ObjectType.inject(self)
        end,
    })
end