# if there is not yet a ray casting armor stand, summon one
execute unless entity @e[type=armor_stand, tag=ray_cast] at @p run summon minecraft:armor_stand ^ ^ ^1 {Tags:[ray_cast, not_facing],NoGravity:1b, Invisible:1b}

# if there is an aligned ray, move it forward
execute as @e[type=armor_stand, tag=ray_cast] unless entity @s[tag=not_facing] at @s run tp @s ^ ^ ^0.5