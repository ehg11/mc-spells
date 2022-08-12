# villager interactions only happen every 4 ticks -> datapack runs every tick
# use 2 scores -> one every tick and one every 4

scoreboard players add ticks rchold 1
execute if score ticks rchold matches 4.. run function spells:rchold/loop_counter