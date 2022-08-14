# remove the tag, give the other tag, give the player the other wand

kill @e[type=item, nbt={Item:{id:"minecraft:stick", tag:{wand:1b}}}]
tag @s remove num_d
tag @s add world_d
execute as @s run function spells:give_wand
