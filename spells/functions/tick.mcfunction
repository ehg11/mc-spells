#> --- wand + villager logic START ---

# if holding wand and there is no villager => spawn a villager in front
execute if entity @p[nbt={SelectedItem:{tag:{wand:1b}}}] at @p unless entity @p[tag=beam_end] unless entity @e[type=villager,tag=rcd] run summon minecraft:villager ^ ^ ^0.5 {Tags:["rcd"],Silent:1b,NoAI:1b}
# if holding wand and there is a villager => tp the villager in front
execute if entity @p[nbt={SelectedItem:{tag:{wand:1b}}}] at @p unless entity @p[tag=beam_end] if entity @e[type=villager,tag=rcd] run tp @e[type=minecraft:villager,tag=rcd,limit=1] ^ ^ ^0.5 facing entity @p
# if not holding wand but there is a villager => tp the villager down (killing w/o particles)
execute unless entity @p[nbt={SelectedItem:{tag:{wand:1b}}}] if entity @e[type=villager,tag=rcd] as @e[type=villager,tag=rcd] run tp @s ~ ~-500 ~
# if beam has ended remove villager
execute if entity @p[tag=beam_end] if entity @e[type=villager,tag=rcd] as @e[type=villager,tag=rcd] run tp @s ~ ~-500 ~

# make all rcd villagers invisible
effect give @e[tag=rcd] minecraft:invisibility 1 1 true
# make all rcd villagers non-collision
execute as @e[type=villager,tag=rcd] run team join no_collision

# --- wand + villager logic END ---


#> --- right-click and hold logic START ---

# execute if player starts holding right click, add tag
execute if score @p rchold matches 1 run tag @p add holding

# if the player has holding tag, start incrementing counters
execute if entity @p[tag=holding] run function spells:rchold/increment_holding

# reset scores when player stops holding right click / pre-emptive spell completion
execute if entity @p[tag=holding] if score @p rchold < hold rchold run function spells:rchold/reset_scores

# while holding right click - this runs
execute if score @p rchold >= hold rchold run function spells:holding

execute as @a[tag=holding] run effect give @s slowness 1 4 true

# --- right-click and hold logic END ---


#> --- ray casting logic START ---

# reset the rays direction before moving it
execute if entity @p[tag=holding] if entity @e[type=armor_stand, tag=not_facing] as @e[type=armor_stand, tag=not_facing] run function spells:ray_cast/align_ray

# keep track of the age of all armor stands and remove when too old
execute as @e[type=armor_stand, tag=ray_cast] unless entity @s[tag=not_facing] run scoreboard players add @s ray_cast_d 1
execute as @e[type=armor_stand, tag=ray_cast] unless entity @s[tag=not_facing] store result score @s ray_cast_y run data get entity @s Pos[1] 1

# end conditions ---

# distance
# execute as @e[type=armor_stand, tag=ray_cast] if score @s ray_cast_d > max_distance ray_cast_d run function spells:ray_cast/end_ray
# bottom/top of world
execute as @e[type=armor_stand, tag=ray_cast] if score @s ray_cast_y matches ..-64 run function spells:ray_cast/end_ray
execute as @e[type=armor_stand, tag=ray_cast] if score @s ray_cast_y matches 320.. run function spells:ray_cast/end_ray

# --- ray casting logic END ---


#> --- beam logic START ---

# create a beam at all the aligned rays
execute as @e[type=armor_stand, tag=ray_cast] unless entity @s[tag=not_facing] at @s run function spells:ray_cast/create_beam

# align the beams
execute as @e[type=armor_stand, tag=beam] run function spells:beam/align_beam

# if beam end tag, start cooldown
execute as @p[tag=beam_end] run scoreboard players add @s beam_cooldown 1
execute as @p[tag=beam_end] if score @s beam_cooldown >= cooldown beam_cooldown run function spells:beam/reset_cooldown

# --- beam logic END ---



