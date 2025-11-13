// Inherit the parent event
event_inherited();

max_ticks = 10
generator_tick =  3

randomize()
tick_to_angle = ds_list_create()
ds_list_add(tick_to_angle, [max_ticks, irandom_range(0, 360)])

new_tick_to_angle = ds_list_create()

slices = 1
