tag @p add beam_end

execute if entity @p[tag=beam_end] if entity @e[type=villager,tag=rcd] as @e[type=villager,tag=rcd] run tp @s ~ ~-500 ~

execute at @e[tag=beam] run summon tnt ~ ~ ~ {NoGravity:1b,Fuse:0}

kill @e[type=armor_stand, tag=ray_cast]
kill @e[type=armor_stand, tag=beam]

