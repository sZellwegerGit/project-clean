  {
    type = "agricultural-tower",
    name = "reforestation-unit",
    icon = "__mod__/graphics/icons/reforestation-unit.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "reforestation-unit"},
    fast_replaceable_group = "reforestation-unit",
    max_health = 1000,
    corpse = "reforestation-unit-remnants",
    dying_explosion = "agricultural-tower-explosion",
    open_sound = sounds.mech_large_open,
    close_sound = sounds.mech_large_close,
    input_inventory_size = 3,
    output_inventory_size = 0,
    growth_grid_tile_size = 8,
    growth_area_radius = 4,
    random_growth_offset = 0.8,
    accepted_seeds = {"tree-seeds"}
    radius = 20,
    radius_visualisation_picture =
    {
      filename = "__core__/graphics/white-square.png",
      priority = "extra-high-no-scale",
      width = 10,
      height = 10
    },
    crane = nil,
    planting_procedure_points =
    {
      {0.0, 0.0, 0.75},
      {0.0, 0.0, 0.0},
      {0.0, 0.05, -0.05},
      {0.0353553, 0.0353553, -0.1},
      {0.05, 0.0, -0.15},
      {0.0353553, -0.0353553, -0.2},
      {0.0, -0.05, -0.25},
      {-0.0353553, -0.0353553, -0.3},
      {-0.05, 0.0, -0.35},
      {-0.0353553, 0.0353553, -0.4},
      {0.0, 0.0, -0.45},
      {0.0, 0.0, 0.0}
    },
    harvesting_procedure_points =
    {
      {0.0, 0.0, 1.0}
    },
    -- drawing_box_vertical_extension = 2.5,
    heating_energy = "50kW",
    energy_usage = "50kW",
    crane_energy_usage = "100kW",
    working_sound =
    {
      sound =
      {
        filename = "__mod__/sound/zischsound.ogg",
        volume = 0.7,
        audible_distance_modifier = 0.7,
      },
      max_sounds_per_prototype = 4,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    central_orienting_sound = nil
    central_orienting_sound_source = "hub",
    arm_extending_sound = nil
    arm_extending_sound_source = "arm_central_joint",
    grappler_orienting_sound = nil
    grappler_orienting_sound_source = "grappler-hub",
    grappler_extending_sound = nil
    grappler_extending_sound_source = "grappler-hub",
    planting_sound = nil,
    harvesting_sound = nil,
    resistances =
    {
      {
        type = "fire",
        percent = 50
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
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
    circuit_connector = circuit_connector_definitions["agricultural-tower"],
    circuit_wire_max_distance = 30,
    graphics_set =
    {
      animation =
      {
        layers =
        {
          util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base",
          {
            priority = "high",
            animation_speed = 0.25,
            frame_count = 64,
            scale = 0.5
          }),
          util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base-shadow",
          {
            priority = "high",
            frame_count = 1,
            repeat_count = 64,
            draw_as_shadow = true,
            scale = 0.5
          })
        }
      },
      recipe_not_set_tint = { primary = {r = 0.6, g = 0.6, b =  0.5, a = 1}, secondary = {r = 0.6, g =  0.6, b = 0.5, a = 1} },
      working_visualisations =
      {
        {
          always_draw = true,
          fog_mask = { rect = {{-30, -30}, {30, -2.75}}, falloff = 1 },
          animation = util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base",
          {
            frame_count = 1,
            scale = 0.5
          }),
        }
      },
      water_reflection = nil
    }
  }
