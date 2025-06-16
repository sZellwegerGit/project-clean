-- required events

-- addition
-- *on_robot_built_entity
-- *on_built_entity

-- removal
-- *on_robot_mined_entity
-- *on_player_mined_entity
-- *on_entity_died

-- update
-- *on_tick

-- const for amount of iterations

-- track all towers in a storage table
-- track current_tower_loop_iterator
-- track current_plant_loop_iterator

-- NOTES
--  LuaEntity.tree_stage_index is the trees health
--		  1 is fully healthy
--		  4 has no more leaves
--  Water should return to blue if pollution goes away

-- loop example
	-- every_tick, check all registered trees of one registered planting tower

	for tower in mod.storage.registered_towers:
		for plant in tower.owned_plants:
			if plant.tree_stage_index < 1:
				plant.order_deconstruction(tower.force)
