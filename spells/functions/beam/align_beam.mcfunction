# running as the armor stand beam

# set itself to face the same direction as player
execute at @s run tp @s ~ ~ ~ facing entity @e[type=armor_stand, tag=ray_cast, limit=1, sort=nearest] eyes
