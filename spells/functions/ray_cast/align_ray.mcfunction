# running as the armor stand

# set itself to face the same direction as player
execute store result entity @s Rotation[0] float 1 run data get entity @p[tag=holding] Rotation[0] 1
execute store result entity @s Rotation[1] float 1 run data get entity @p[tag=holding] Rotation[1] 1

tag @s remove not_facing