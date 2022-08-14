# intro message
tellraw @a ["",{"text":"Magical Spells","color":"red"},{"text":" -- ","color":"white"},{"text":"WIP","color":"red"}]

# scoreboards
scoreboard objectives add ray_cast_d dummy
scoreboard players set max_distance ray_cast_d 100
scoreboard players set min_distance ray_cast_d 10
scoreboard objectives add ray_cast_y dummy
scoreboard objectives add beam_cooldown dummy
scoreboard players set cooldown beam_cooldown 100
scoreboard objectives add rchold minecraft.custom:talked_to_villager

# reset scoreboards
scoreboard players reset @a rchold
scoreboard players reset hold rchold
scoreboard players reset ticks rchold
scoreboard players reset @a beam_cooldown

# teams
team add no_collision
team modify no_collision collisionRule never
team modify no_collision seeFriendlyInvisibles false
execute as @a run team join no_collision

# create the bossbar
bossbar add spells:power "Beam Power"
bossbar add spells:cooldown "Beam Cooldown"
bossbar set spells:power players @a
bossbar set spells:cooldown players @a
bossbar set speels:power color white
bossbar set spells:cooldown color blue

# reset tags
tag @a remove beam_end
tag @a remove world_d
tag @a add num_d

