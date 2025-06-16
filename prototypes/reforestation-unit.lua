local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require ("__space-age__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local item_effects = require("__space-age__.prototypes.item-effects")

local tree_planting_category =
{
	type = "recipe-category",
	name = "tree-planting-category"
}

local recipe = {  
	type = "recipe",
    name = "planting-trees",
    icon = "__space-age__/graphics/icons/tree-seed.png",
    category = "tree-planting-category",
    subgroup = "agriculture-processes",
    order = "a[seeds]-a[yumako-processing]",
	hidden = true,
    enabled = false,
    allow_productivity = false,
    energy_required = 4,
    ingredients = {{type = "item", name = "tree-seed", amount = 1}},
    results = {}
}

local entity = {
	type = "assembling-machine",
	name = "reforestation-unit",
	icon = "__ReforestationUnit__/graphics/reforestation-unit-icon.png",
	flags = {"placeable-neutral", "placeable-player", "player-creation"},
	minable = {mining_time = 0.2, result = "reforestation-unit"},
	fast_replaceable_group = "reforestation-unit",
	max_health = 1000,
	corpse = "agricultural-tower-remnants",
	dying_explosion = "agricultural-tower-explosion",
	open_sound = sounds.mech_large_open,
	close_sound = sounds.mech_large_close,
	heating_energy = "50kW",
	energy_usage = "175kW",
    allowed_effects = {},
	crafting_speed = 1,
    crafting_categories = {"tree-planting-category"},
    --fluid_boxes =
    --{
    --  {
    --    production_type = "input",
    --    pipe_picture = util.empty_sprite(),
    --    pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
    --    pipe_covers = pipecoverspictures(),
    --    always_draw_covers = false,
    --    enable_working_visualisations = { "input-pipe" },
    --    volume = 1000,
    --    pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {0, 1} }}
    --  }
    --},
	fixed_recipe = "planting-trees",
	working_sound =
	{
	  sound =
	  {
		filename = "__space-age__/sound/entity/biochamber/biochamber-loop.ogg",
		volume = 0.7,
		audible_distance_modifier = 0.7,
	  },
	  max_sounds_per_prototype = 4,
	  fade_in_ticks = 4,
	  fade_out_ticks = 20
	},
	resistances =
	{
	  {
		type = "fire",
		percent = 50
	  }
	},
	collision_box = {
		--{-1.2, -1.2},
		--{1.2, 1.2}
		{-2.0, -2.0},
		{2.0, 2.0}
	},
	selection_box = {
		{-2.0, -2.0},
		{2.0, 2.0}
	},
    drawing_box = {
		{-2.0, -2.0},
		{2.0, 2.0}
    },
	collision_mask = {layers={item=true, object=true, player=true, water_tile=true, elevated_rail=true, is_object=true, is_lower_object=true}},
	surface_conditions =
	{
	  {
		property = "pressure",
		min = 1000,
		max = 2000
	  }
	},
	damaged_trigger_effect = hit_effects.entity(),
	energy_source =
	{
	  type = "electric",
	  usage_priority = "secondary-input",
	  emissions_per_minute = { spores = 40 }
	},
	circuit_connector = nill,
	-- circuit_wire_max_distance = 30,
	graphics_set =
	{
	  animation =
	  {
		layers = {
		{
		  draw_as_shadow = true,
		  filename = "__ReforestationUnit__/graphics/reforestation-unit-shadow.png",
		  priority = "high",
		  width = 303,
		  height = 128,
		  frame_count = 1,
		  line_length = 1,
		  repeat_count = 1,
		  animation_speed = 0.5,
		  scale = 1.0,
		  shift = {2.8, 0.08}
		},
		{
		  priority = "high",
		  width = 128,
		  height = 335,
		  frame_count = 1,
		  animation_speed = 0.5,
		  scale = 1.0,
		  shift = {0, -2.8},
		  stripes =
		  {
			{
			  filename = "__ReforestationUnit__/graphics/reforestation-unit-blured.png",
			  width_in_frames = 1,
			  height_in_frames = 1,
			}
		  },
		},
	  },
	  recipe_not_set_tint = { primary = {r = 0.6, g = 0.6, b =  0.5, a = 1}, secondary = {r = 0.6, g =  0.6, b = 0.5, a = 1} },
	  working_visualisations = nil
	}
  },
  smoke =
	{
	  {
		name = "light-smoke",
		north_position = {0.9, 0.0},
		east_position = {-2.0, -2.0},
		frequency = 10 / 32,
		starting_vertical_speed = 0.08,
		starting_frame_deviation = 60
	  }
	}
}

local item = {
	type = "item",
	name = "reforestation-unit",
	icon = "__ReforestationUnit__/graphics/reforestation-unit-icon.png",
	subgroup = "agriculture",
	order = "b[agricultural-tower]",
	inventory_move_sound = item_sounds.mechanical_large_inventory_move,
	pick_sound = item_sounds.mechanical_large_inventory_pickup,
	drop_sound = item_sounds.mechanical_large_inventory_move,
	place_result = "reforestation-unit",
	stack_size = 20,
	default_import_location = "nauvis"
}

data:extend{
	tree_planting_category, recipe, 
	item, entity
}