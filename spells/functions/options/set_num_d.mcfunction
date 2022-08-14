# remove the tag, give the other tag, give the player the other wand

kill @e[type=item, nbt={Item:{id:"minecraft:stick", tag:{wand:1b}}}]
tag @s remove world_d
tag @s add num_d
execute as @s run function spells:give_wand