function core.item_drop(itemstack, dropper, pos)
	local dropper_is_player = dropper and dropper:is_player()
	local p = table.copy(pos)
	local cnt = itemstack:get_count()
	if dropper_is_player then
		p.y = p.y + 1.2
	end
	local item = itemstack:take_item(cnt)
	local obj = core.add_item(p, item)
	if obj then
		if dropper_is_player then
			local dir = dropper:get_look_dir()
			local vel = dropper:get_velocity()
			dir.x = dir.x * 2.9
			dir.y = dir.y * 2.9 + 2
			dir.z = dir.z * 2.9
			obj:set_velocity(dir+vel)
			obj:get_luaentity().dropped_by = dropper:get_player_name()
		end
		return itemstack
	end
end
