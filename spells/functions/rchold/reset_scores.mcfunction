# run end ray

execute as @e[type=armor_stand, tag=ray_cast] if score @s ray_cast_d > min_distance ray_cast_d run function spells:ray_cast/end_ray

# reset the scores

tag ehg11 remove holding
scoreboard players reset ticks rchold
scoreboard players reset hold rchold
scoreboard players reset ehg11 rchold

# kill all the rays

kill @e[type=armor_stand, tag=ray_cast]
kill @e[type=armor_stand, tag=beam]
