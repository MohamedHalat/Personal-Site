%Mohamed Halat
%May 1st 2017
%Animations exercise

import GUI
setscreen ("nobuttonbar")

%%%%%    VARIABLES   %%%%%
var chars : array char of boolean
%Animations
var anim, background : int

%Mouse
var mx, my, mb : int

%Procedures
var buttonS1, buttonQ1, Yes, No, Ya, numpokemon : int
Ya := 0

%Character
var x : int := maxx div 2
var y : int := maxy div 2
var last : string := "down"
var numup, numdown, numleft, numright : int := 0

%POKEMON AND BATTLE
var pokemon1, pokemon2, pokemon3, pokemon4, pokemon5, pokemon6, chosen : int := 0
var chosenpokemon, aipoke, aihp1, aihp2, aihp3, aihp4, aihp5, aihp6 : int

var move1, move2, move3, move4 : string := ""
var damage1, damage2, damage3, damage4 : int
%AI
var randpoke, randmove, pokey : int
%YOU
var youmove1, youmove2, youmove3, youmove4 : string := ""
var youdamage1, youdamage2, youdamage3, youdamage4 : int
%Attack, HP, turn
var accuracy, critical : int
var hp, aihp, hp1, hp2, hp3, hp4, hp5, hp6 : int := 500
var drawhp, drawaihp : int
var turn : int := 1
%Animation
var aiX : int := 390
var aiY : int := 225
var yourX : int := 50
var yourY : int := 75

%Fonts
var font1 := Font.New ("MS serif:20")
var font2 := Font.New ("Agency FB:15")
var font3 := Font.New ("Agency FB:12")
var font4 := Font.New ("Agency FB:40")

%MESSAGES
var message, name : string := "Hello there! Welcome to the world of Pokémon! My name is Professor"
var message1 : string := "Maple! People call me the Pokémon professor..."
var message2 : string := "Now, can you please tell me your name?    "
var message3 : string := "So ,"
var message4 : string := "This world is inhabited with creatures known as Pokémon! For some "
var message5 : string := "people, pokémon are pets. Others use them for fights. Myself...I "
var message6 : string := "study pokémon as a profession..."
var message7 : string := "Now, you get the opportunity to experience the world of Pokémon for"
var message8 : string := "yourself. You will be given 1 Pokémon. With this Pokémon you will"
var message9 : string := "be able to battle other Pokémon. Once you beat one, you will be "
var message10 : string := "given the oppertunity to capture them. Catch only the strong ones!"
var message11 : string := "You may now start your endless adventure! Good luck!"
var message12 : string := "You now have 6 Pokémon, your ready to fight a trainer! Good luck!"
var message13 : string := "Congratulations you beat your first trainer!"
var message14 : string := "It seems you lost. Better luck next time"
var message15 : string := "You may now continue to explore..."

%skip text
var Exit : int := 0
var lastBattle : int := 0
%Backgrounds and battle images:
var box : int := Pic.FileNew ("textbox.bmp")
var Scaledbox := Pic.Scale (box, maxx + 2, maxy + 100)

var enter : int := Pic.FileNew ("enter.bmp")
var Scaledenter := Pic.Scale (enter, maxx + 2, maxy + 1)

var start : int := Pic.FileNew ("start.bmp")
var Scaledstart := Pic.Scale (start, maxx + 2, maxy + 1)

var back : int := Pic.FileNew ("back.bmp")
var Scaledback := Pic.Scale (back, maxx + 20, maxy + 10)
var back2 : int := Pic.FileNew ("back2.bmp")
var Scaledback2 := Pic.Scale (back2, maxx + 20, maxy + 10)

var battle1 : int := Pic.FileNew ("battle.jpg")
var Scaledbattle1 := Pic.Scale (battle1, maxx + 2, maxy + 1)

var rules : int := Pic.FileNew ("rules1.bmp")
var Scaledrules := Pic.Scale (rules, maxx + 2, maxy + 1)

var bar : int := Pic.FileNew ("bar.bmp")
var Scaledbar := Pic.Scale (bar, maxx + 2, maxy + 1)

var move : int := Pic.FileNew ("move.bmp")
var Scaledmove := Pic.Scale (move, 126, 50)

var Pokemon : int := Pic.FileNew ("Pokemon.bmp")
var ScaledPokemon := Pic.Scale (Pokemon, 151, 60)

var Bag : int := Pic.FileNew ("Bag.bmp")
var ScaledBag := Pic.Scale (Bag, 151, 60)

var run : int := Pic.FileNew ("Run.bmp")
var ScaledRun := Pic.Scale (run, 252, 100)

%CHARACTER:
var up : int := Pic.FileNew ("up1.bmp")
var upscale := Pic.Scale (up, 40, 40)

var down : int := Pic.FileNew ("down1.bmp")
var downscale := Pic.Scale (down, 40, 40)

var right : int := Pic.FileNew ("right1.bmp")
var rightscale := Pic.Scale (right, 40, 40)

var left : int := Pic.FileNew ("left1.bmp")
var leftscale := Pic.Scale (left, 40, 40)

var up2 : int := Pic.FileNew ("up2.bmp")
var upscale2 := Pic.Scale (up2, 40, 40)

var down2 : int := Pic.FileNew ("down2.bmp")
var downscale2 := Pic.Scale (down2, 40, 40)

var right2 : int := Pic.FileNew ("right2.bmp")
var rightscale2 := Pic.Scale (right2, 40, 40)

var left2 : int := Pic.FileNew ("left2.bmp")
var leftscale2 := Pic.Scale (left2, 40, 40)

var up3 : int := Pic.FileNew ("up3.bmp")
var upscale3 := Pic.Scale (up3, 40, 40)

var down3 : int := Pic.FileNew ("down3.bmp")
var downscale3 := Pic.Scale (down3, 40, 40)

var right3 : int := Pic.FileNew ("right3.bmp")
var rightscale3 := Pic.Scale (right3, 40, 40)

var left3 : int := Pic.FileNew ("left3.bmp")
var leftscale3 := Pic.Scale (left3, 40, 40)



%ADD POKEBALL LOCATION 500 170
%Pokemon 0-44
var pokemon : array 0 .. 44 of string
pokemon (0) := "N/A"
pokemon (1) := "Bulbasaur"
pokemon (2) := "Charmander"
pokemon (3) := "Squirtle"
pokemon (4) := "Pikachu"
pokemon (5) := "Lapras"
pokemon (6) := "Nidoqueen"
pokemon (7) := "Nidoking"
pokemon (8) := "Vulpix"
pokemon (9) := "Ninetales"
pokemon (10) := "Meowth"
pokemon (11) := "Arcanine"
pokemon (12) := "Haunter"
pokemon (13) := "Gengar"
pokemon (14) := "Kingler"
pokemon (15) := "Exeggutor"
pokemon (16) := "Gyarados"
pokemon (17) := "Vaporeon"
pokemon (18) := "Flareon"
pokemon (19) := "Jolteon"
pokemon (20) := "Snorlax"
pokemon (21) := "Dragonite"
pokemon (22) := "Mewtwo"
pokemon (23) := "Venusaur"
pokemon (24) := "Charizard"
pokemon (25) := "Blastoise"
pokemon (26) := "Totodile"
pokemon (27) := "Cyndaquil"
pokemon (28) := "Feraligatr"
pokemon (29) := "Typhlosion"
pokemon (30) := "Espeon"
pokemon (31) := "Umbreon"
pokemon (32) := "Larvitar"
pokemon (33) := "Tyranitar"
pokemon (34) := "Sceptile"
pokemon (35) := "Blaziken"
pokemon (36) := "Swampert"
pokemon (37) := "Metagross"
pokemon (38) := "Flygon"
pokemon (39) := "Rayquaza"
pokemon (40) := "Gardevoir"
pokemon (41) := "Crobat"
pokemon (42) := "Sylveon"
pokemon (43) := "Pidgeot"
pokemon (44) := "Lucario"


%POKEMON IMAGES:
var picNamesFront : array 1 .. 44 of string
var picNamesBack : array 1 .. 44 of string
var picFront : array 1 .. 44 of int
var picBack : array 1 .. 44 of int

for i : 1 .. 44
    picNamesFront (i) := "poke" + intstr (i) + ".bmp"
    picNamesBack (i) := "poke" + intstr (i) + "back.bmp"
end for

for i : 1 .. 44
    picFront (i) := Pic.Scale (Pic.FileNew (picNamesFront (i)), 170, 170)
    picBack (i) := Pic.Scale (Pic.FileNew (picNamesBack (i)), 220, 220)
end for






%%%%%   PROCESSES   %%%%%
%Music
process music
    loop
	Music.PlayFile ("pokemon.mp3")
    end loop
end music

process music1
    loop
	Music.PlayFile ("Title screen.mp3")
    end loop
end music1

process music2
    loop
	Music.PlayFile ("battle.mp3")
    end loop
end music2






%%%%%   PROCEDURES  %%%%%
% Pokemon Movesets and Damage
procedure poke (n : int)
    if (n = 1) then
	% Bulbasaur
	move1 := "Venoshock"
	damage1 := 65
	move2 := "Energy Ball"
	damage2 := 80
	move3 := "Magical Leafs"
	damage3 := 60
	move4 := "Headbutt"
	damage4 := 70
    elsif (n = 2) then
	% Charmander
	move1 := "Dragon Claw"
	damage1 := 80
	move2 := "Rock Tomb"
	damage2 := 50
	move3 := "Fire Punch"
	damage3 := 75
	move4 := "Thunder Punch"
	damage4 := (75)
    elsif n = 3 then
	% Squirtle
	move1 := "Muddy Water"
	damage1 := 95
	move2 := "Water Pusle"
	damage2 := 60
	move3 := "Ice Punch"
	damage3 := 75
	move4 := "Bite"
	damage4 := (60)
    elsif n = 4 then
	% Pikachu
	move1 := "Thunderbolt"
	damage1 := 95
	move2 := "Dig"
	damage2 := 80
	move3 := "Extreme Speed"
	damage3 := 80
	move4 := "Iron Tail"
	damage4 := 100
    elsif n = 5 then
	% Lapras
	move1 := "Sheer Cold"
	damage1 := 200
	move2 := "Body Slam"
	damage2 := 85
	move3 := "Surf"
	damage3 := 95
	move4 := "Ice Beam"
	damage4 := 95
    elsif n = 6 then
	% Nidoqueen
	move1 := "Poison Tail"
	damage1 := 50
	move2 := "Earth Power"
	damage2 := 90
	move3 := "Body Slam"
	damage3 := 85
	move4 := "Earthquake"
	damage4 := 100
    elsif n = 7 then
	% Nidoking
	move1 := "Smack Down"
	damage1 := 50
	move2 := "Earthquake"
	damage2 := 100
	move3 := "Shadow Ball"
	damage3 := 80
	move4 := "Sludge Wave"
	damage4 := 95
    elsif n = 8 then
	% Vulpix
	move1 := "Flame Burst"
	damage1 := 70
	move2 := "Payback"
	damage2 := 50
	move3 := "Flamethrower"
	damage3 := 90
	move4 := "Extrasensory"
	damage4 := 80
    elsif n = 9 then
	% Ninetales
	move1 := "Heatwave"
	damage1 := 100
	move2 := "Extrasensory"
	damage2 := 80
	move3 := "Zen Headbutt"
	damage3 := 80
	move4 := "Flame Charge"
	damage4 := 50
    elsif n = 10 then
	% Meowth
	move1 := "Bite"
	damage1 := 60
	move2 := "Night Slash"
	damage2 := 70
	move3 := "Shadow Claw"
	damage3 := 70
	move4 := "Foul Play"
	damage4 := 95
    elsif n = 11 then
	% Arcanine
	move1 := "Thunder Fang"
	damage1 := 65
	move2 := "Fire Fang"
	damage2 := 65
	move3 := "Extreme Speed"
	damage3 := 80
	move4 := "Heat Wave"
	damage4 := 100
    elsif n = 12 then
	% Haunter
	move1 := "Shadow Punch"
	damage1 := 60
	move2 := "Sucker Punch"
	damage2 := 80
	move3 := "Payback"
	damage3 := 50
	move4 := "Fire Punch"
	damage4 := 75
    elsif n = 13 then
	% Gengar
	move1 := "Shadow Ball"
	damage1 := 80
	move2 := "Sludge Bomb"
	damage2 := 90
	move3 := "Poison Jab"
	damage3 := 80
	move4 := "Shadow Punch"
	damage4 := 60
    elsif n = 14 then
	% Kingler
	move1 := "Bubblebeam"
	damage1 := 65
	move2 := "Guillotine"
	damage2 := 90
	move3 := "Crabhammer"
	damage3 := 90
	move4 := "Chip Away"
	damage4 := 70
    elsif n = 15 then
	% Exeggutor
	move1 := "Egg Bomb"
	damage1 := 100
	move2 := "Pyshock"
	damage2 := 80
	move3 := "Stomp"
	damage3 := 65
	move4 := "Seed Bomb"
	damage4 := 80
    elsif n = 16 then
	% Gyarados
	move1 := "Bite"
	damage1 := 60
	move2 := "Ice Fangs"
	damage2 := 65
	move3 := "Hydro Pump"
	damage3 := 120
	move4 := "Dragon Tail"
	damage4 := 60
    elsif n = 17 then
	% Vaporeon
	move1 := "Muddy Water"
	damage1 := 95
	move2 := "Aurora Beam"
	damage2 := 65
	move3 := "Water Pulse"
	damage3 := 60
	move4 := "Hydro Pump"
	damage4 := 120
    elsif n = 18 then
	% Flareon
	move1 := "Fire Fang"
	damage1 := 65
	move2 := "Bite"
	damage2 := 60
	move3 := "Lava Plume"
	damage3 := 80
	move4 := "Flamethrower"
	damage4 := 95
    elsif n = 19 then
	% Jolteon
	move1 := "Thunder Fang"
	damage1 := 65
	move2 := "Thunderbolt"
	damage2 := 95
	move3 := "Dig"
	damage3 := 80
	move4 := "Strength"
	damage4 := 80
    elsif n = 20 then
	% Snorlax
	move1 := "Body Slam"
	damage1 := 85
	move2 := "Crunch"
	damage2 := 80
	move3 := "Earthquake"
	damage3 := 100
	move4 := "Bulldoze"
	damage4 := 60
    elsif n = 21 then
	% Dragonite
	move1 := "Dragon Rush"
	damage1 := 100
	move2 := "Dragon Claw"
	damage2 := 80
	move3 := "Thunderbolt"
	damage3 := 95
	move4 := "Wing Attack"
	damage4 := 60
    elsif n = 22 then
	% Mewtwo
	move1 := "Psystrick"
	damage1 := 100
	move2 := "Aura Sphere"
	damage2 := 90
	move3 := "Psychic"
	damage3 := 90
	move4 := "Psycho Cut"
	damage4 := 70
    elsif n = 23 then
	% Venusaur
	move1 := "Razor Leafs"
	damage1 := 55
	move2 := "Sludge Bomb"
	damage2 := 95
	move3 := "Seed Bomb"
	damage3 := 80
	move4 := "Solar Beam"
	damage4 := 120
    elsif n = 25 then
	% Blastoise
	move1 := "Aqua Tail"
	damage1 := 90
	move2 := "Ice Beam"
	damage2 := 95
	move3 := "Scald"
	damage3 := 80
	move4 := "Rock Tomb"
	damage4 := 50
    elsif n = 24 then
	% Charizard
	move1 := "Flamethrower"
	damage1 := 95
	move2 := "Wing Attack"
	damage2 := 60
	move3 := "Heat Wave"
	damage3 := 100
	move4 := "Flame Charge"
	damage4 := 50
    elsif n = 26 then
	% Totodile
	move1 := "Water Gun"
	damage1 := 40
	move2 := "Bite"
	damage2 := 60
	move3 := "Chip Away"
	damage3 := 70
	move4 := "Waterfall"
	damage4 := 80
    elsif n = 27 then
	% Cyndaquil
	move1 := "Swift"
	damage1 := 60
	move2 := "Flame Wheel"
	damage2 := 60
	move3 := "Crush Claw"
	damage3 := 75
	move4 := "Flame Burst"
	damage4 := 70
    elsif n = 28 then
	% Feraligatr
	move1 := "Ice Fang"
	damage1 := 65
	move2 := "Crunch"
	damage2 := 80
	move3 := "Ice Beam"
	damage3 := 95
	move4 := "Hydro Pump"
	damage4 := 120
    elsif n = 29 then
	% Typhlosion
	move1 := "Lava Plume"
	damage1 := 80
	move2 := "Flamethrower"
	damage2 := 95
	move3 := "Flame Charge"
	damage3 := 50
	move4 := "Fire Punch"
	damage4 := 75
    elsif n = 30 then
	% Espeon
	move1 := "Psybeam"
	damage1 := 65
	move2 := "Psychic"
	damage2 := 90
	move3 := "Zen Headbutt"
	damage3 := 80
	move4 := "Bite"
	damage4 := 60
    elsif n = 31 then
	% Umbreon
	move1 := "Shadow Ball"
	damage1 := 80
	move2 := "Dark Pulse"
	damage2 := 80
	move3 := "Foul Play"
	damage3 := 95
	move4 := "Faint Attack"
	damage4 := 60
    elsif n = 32 then
	% Larvitar
	move1 := "Rock Slide"
	damage1 := 75
	move2 := "Brick Break"
	damage2 := 75
	move3 := "Bulldoze"
	damage3 := 60
	move4 := "Ancient Power"
	damage4 := 60
    elsif n = 33 then
	% Tyranitar
	move1 := "Rock Slide"
	damage1 := 75
	move2 := "Dark Pulse"
	damage2 := 80
	move3 := "Earthquake"
	damage3 := 100
	move4 := "Crunch"
	damage4 := 80
    elsif n = 34 then
	% Sceptile
	move1 := "Leaf Blade"
	damage1 := 90
	move2 := "X-Scissor"
	damage2 := 80
	move3 := "Dragon Claw"
	damage3 := 80
	move4 := "Crush Claw"
	damage4 := 75
    elsif n = 35 then
	% Blaziken
	move1 := "Fire Punch"
	damage1 := 75
	move2 := "Blaze Kick"
	damage2 := 85
	move3 := "Sky Uppercut"
	damage3 := 85
	move4 := "Brick Break"
	damage4 := 75
    elsif n = 36 then
	% Swampert
	move1 := "Mud Bomb"
	damage1 := 65
	move2 := "Muddy Water"
	damage2 := 95
	move3 := "Earthquake"
	damage3 := 100
	move4 := "Surf"
	damage4 := 95
    elsif n = 37 then
	% Metagross
	move1 := "Meteor Mash"
	damage1 := 100
	move2 := "Psychic"
	damage2 := 90
	move3 := "Metal Claw"
	damage3 := 50
	move4 := "Flash Canon"
	damage4 := 80
    elsif n = 38 then
	% Flygon
	move1 := "Dragon Breath"
	damage1 := 60
	move2 := "Dragon Claw"
	damage2 := 80
	move3 := "Dragon Tail"
	damage3 := 60
	move4 := "Earthquake"
	damage4 := 100
    elsif n = 39 then
	% Rayquaza
	move1 := "Dragon Pulse"
	damage1 := 90
	move2 := "Extreme Speed"
	damage2 := 80
	move3 := "Ice Beam"
	damage3 := 95
	move4 := "Thunderbolt"
	damage4 := 95
    elsif n = 40 then
	% Gardevoir
	move1 := "Magical Leafs"
	damage1 := 60
	move2 := "Psychic"
	damage2 := 90
	move3 := "Ice Punch"
	damage3 := 75
	move4 := "Zen Headbutt"
	damage4 := 80
    elsif n = 41 then
	%Crobat
	move1 := "Poison Fang"
	damage1 := 50
	move2 := "Fly"
	damage2 := 90
	move3 := "Steel Wing"
	damage3 := 70
	move4 := "Sludge Bomb"
	damage4 := 90
    elsif n = 42 then
	%Sylveon
	move1 := "Moonblast"
	damage1 := 95
	move2 := "Dazzling Gleam"
	damage2 := 80
	move3 := "Psyshock"
	damage3 := 80
	move4 := "Shadow Ball"
	damage4 := 80
    elsif n = 43 then
	%Pidgeot
	move1 := "Wing Attack"
	damage1 := 60
	move2 := "Air Slash"
	damage2 := 75
	move3 := "Steel Wing"
	damage3 := 70
	move4 := "Fly"
	damage4 := 90
    elsif n = 44 then
	%Lucario
	move1 := "Extreme Speed"
	damage1 := 80
	move2 := "Aura Sphere"
	damage2 := 80
	move3 := "Shadow Ball"
	damage3 := 80
	move4 := "Force Palm"
	damage4 := 60
    end if
end poke


%Quits game
procedure stopgame
    %buttons
    GUI.Show (Yes)
    GUI.Show (No)
    GUI.Disable (buttonQ1)
    GUI.Disable (buttonS1)


    if Ya = 1 then
	Ya := 0
	cls
	put "Quiting..."
	delay (1000)
	quit
    end if
end stopgame


%Your Pokemon
procedure choosepokemon
    if chosen = 1 then
	hp1 := hp
    elsif chosen = 2 then
	hp2 := hp
    elsif chosen = 3 then
	hp3 := hp
    elsif chosen = 4 then
	hp4 := hp
    elsif chosen = 5 then
	hp5 := hp
    elsif chosen = 6 then
	hp6 := hp
    end if
    loop
	Font.Draw ("1. ", 330, 105, font3, black)
	Font.Draw (pokemon (pokemon1), 330 + length ("1. ") * 4, 105, font3, black)

	Font.Draw ("2. ", 330, 85, font3, black)
	Font.Draw (pokemon (pokemon2), 330 + length ("1. ") * 4, 85, font3, black)


	Font.Draw ("3. ", 390, 105, font3, black)
	Font.Draw (pokemon (pokemon3), 390 + length ("1. ") * 4, 105, font3, black)

	Font.Draw ("4. ", 390, 85, font3, black)
	Font.Draw (pokemon (pokemon4), 390 + length ("1. ") * 4, 85, font3, black)


	Font.Draw ("5. ", 450, 105, font3, black)
	Font.Draw (pokemon (pokemon5), 450 + length ("1. ") * 4, 105, font3, black)

	Font.Draw ("6. ", 450, 85, font3, black)
	Font.Draw (pokemon (pokemon6), 450 + length ("1. ") * 4, 85, font3, black)


	View.Update
	Font.Draw ("Choose a number", 510, 110, font3, black)
	View.Update
	setscreen ("nooffscreenonly")
	locatexy (510, 95)
	get chosen
	setscreen ("offscreenonly")

	if hp <= 0 then
	    Pic.Draw (Scaledrules, 0, 0, picCopy)
	    Font.Draw (Str.Upper (name), 40, 70, font2, red)

	    Font.Draw ("POKEMON FAINTED! YOU LOST!", 40, 50, font2, red)
	    delay (5000)

	    View.Update
	    Exit := 1
	end if


	View.Update
	if chosen = 1 then
	    chosenpokemon := pokemon1
	    hp := hp1
	    Exit := 1
	elsif chosen = 2 and pokemon2 not= 0 then
	    chosenpokemon := pokemon2
	    hp := hp2
	    Exit := 1
	elsif chosen = 3 and pokemon3 not= 0 then
	    chosenpokemon := pokemon3
	    hp := hp3
	    Exit := 1
	elsif chosen = 4 and pokemon4 not= 0 then
	    chosenpokemon := pokemon4
	    hp := hp4
	    Exit := 1
	elsif chosen = 5 and pokemon5 not= 0 then
	    chosenpokemon := pokemon5
	    hp := hp5
	    Exit := 1
	elsif chosen = 6 and pokemon6 not= 0 then
	    chosenpokemon := pokemon6
	    hp := hp6
	    Exit := 1
	end if

	if hp <= 0 then
	    Pic.Draw (Scaledrules, 0, 0, picCopy)
	    Font.Draw (Str.Upper (name), 40, 70, font2, red)

	    Font.Draw ("YOUR POKEMON FAINTED! YOU LOST!", 40, 50, font2, red)
	    delay (5000)

	    View.Update
	    Exit := 1
	end if

	poke (chosenpokemon)
	youmove1 := move1
	youdamage1 := damage1

	youmove2 := move2
	youdamage2 := damage2

	youmove3 := move3
	youdamage3 := damage3

	youmove4 := move4
	youdamage4 := damage4

	if Exit = 1 then
	    if hp <= 0 then
		exit
	    else
		Exit := 0
		exit
	    end if
	end if
    end loop
end choosepokemon

%Draw background for battle screen
procedure draw
    Pic.Draw (Scaledbattle1, 0, 12, picMerge)
    Pic.Draw (picBack (chosenpokemon), yourX, yourY, picMerge)

    Pic.Draw (Scaledbar, 0, 0, picMerge)
    Font.Draw (pokemon (chosenpokemon), 400, 210, font2, black)
    Font.Draw (pokemon (aipoke), 20, 380, font2, black)

    mousewhere (mx, my, mb)
    if hp < 0 then
	hp := 0
    elsif aihp < 0 then
	aihp := 0
    end if
    drawfillbox (506, 199, 506 + round (hp / 5), 193, 48)
    drawfillbox (126, 371, 126 + round (aihp / 5), 366, 48)

    Pic.Draw (Scaledmove, 30, 20, picMerge)
    Pic.Draw (Scaledmove, 30, 70, picMerge)
    Pic.Draw (Scaledmove, 160, 20, picMerge)
    Pic.Draw (Scaledmove, 160, 70, picMerge)

    Pic.Draw (ScaledPokemon, 320, 10, picMerge)
    Pic.Draw (ScaledBag, 480, 10, picMerge)

    Font.Draw (youmove1, 45, 95, font3, black)
    Font.Draw (youmove2, 175, 95, font3, black)
    Font.Draw (youmove3, 45, 45, font3, black)
    Font.Draw (youmove4, 175, 45, font3, black)

    Pic.Draw (picFront (aipoke), aiX, aiY, picMerge)
    View.Update
end draw

%Boss Battle
procedure boss
    if chosen = 1 then
	hp1 := hp
    elsif chosen = 2 then
	hp2 := hp
    elsif chosen = 3 then
	hp3 := hp
    elsif chosen = 4 then
	hp4 := hp
    elsif chosen = 5 then
	hp5 := hp
    elsif chosen = 6 then
	hp6 := hp
    end if



    %AUDIO AND DISPLAY
    fork music2

    %Animation
    for decreasing count : maxx .. 0
	drawline (maxx div 2, maxy div 2, count, 0, black)
	delay (1)
	View.Update
    end for

    for count : 0 .. maxy
	drawline (maxx div 2, maxy div 2, 0, count, black)
	delay (1)
	View.Update
    end for

    for count : 0 .. maxx
	drawline (maxx div 2, maxy div 2, count, maxy, black)
	delay (1)
	View.Update
    end for

    for decreasing count : maxy .. 0
	drawline (maxx div 2, maxy div 2, maxx, count, black)
	delay (1)
	View.Update
    end for

    %Your Pokemon and moves
    poke (chosenpokemon)
    youmove1 := move1
    youdamage1 := damage1

    youmove2 := move2
    youdamage2 := damage2

    youmove3 := move3
    youdamage3 := damage3

    youmove4 := move4
    youdamage4 := damage4

    draw
    %Battle Start
    loop
	if aihp <= 0 and aipoke = 5 then
	    aiX := 1000
	    aiY := 1000
	    draw
	    View.Update
	    delay (1000)
	    aipoke := 22
	    aihp := 500
	    aiX := 390
	    aiY := 225
	    draw
	    Font.Draw ("Trainer sent out ", 330, 105, font3, black)
	    Font.Draw (pokemon (aipoke), 410, 105, font3, black)

	    View.Update
	    delay (2000)
	elsif aihp <= 0 and aipoke = 22 then
	    aiX := 1000
	    aiY := 1000
	    draw
	    View.Update
	    delay (1000)
	    aipoke := 16
	    aihp := 500
	    aiX := 390
	    aiY := 225
	    draw
	    Font.Draw ("Trainer sent out ", 330, 105, font3, black)
	    Font.Draw (pokemon (aipoke), 410, 105, font3, black)

	    View.Update
	    delay (2000)
	elsif aihp <= 0 and aipoke = 16 then
	    aiX := 1000
	    aiY := 1000
	    draw
	    View.Update
	    delay (1000)
	    aipoke := 37
	    aihp := 500
	    aiX := 390
	    aiY := 225
	    draw
	    Font.Draw ("Trainer sent out ", 330, 105, font3, black)
	    Font.Draw (pokemon (aipoke), 410, 105, font3, black)

	    View.Update
	    delay (2000)
	elsif aihp <= 0 and aipoke = 37 then
	    aiX := 1000
	    aiY := 1000
	    draw
	    View.Update
	    delay (1000)
	    aipoke := 20
	    aihp := 500
	    aiX := 390
	    aiY := 225
	    draw
	    Font.Draw ("Trainer sent out ", 330, 105, font3, black)
	    Font.Draw (pokemon (aipoke), 410, 105, font3, black)

	    View.Update
	    delay (2000)
	elsif aihp <= 0 and aipoke = 20 then
	    aiX := 1000
	    aiY := 1000
	    draw
	    View.Update
	    delay (1000)
	    aipoke := 21
	    aihp := 500
	    aiX := 390
	    aiY := 225
	    draw
	    Font.Draw ("Trainer sent out ", 330, 105, font3, black)
	    Font.Draw (pokemon (aipoke), 410, 105, font3, black)

	    View.Update
	    delay (2000)
	elsif aihp <= 0 and aipoke = 21 then
	    Pic.Draw (Scaledrules, 0, 0, picCopy)
	    View.Update

	    %text 1st line
	    locatexy (40, 70)
	    for count : 1 .. length (message13)
		delay (50)
		put message13 (count) ..
		View.Update
	    end for

	    %text 2nd line
	    locatexy (40, 50)
	    for count : 1 .. length (message15)
		delay (50)
		put message15 (count) ..
		View.Update

	    end for
	    delay (3000)
	    exit
	end if



	if chosen = 1 then
	    hp1 := hp
	elsif chosen = 2 then
	    hp2 := hp
	elsif chosen = 3 then
	    hp3 := hp
	elsif chosen = 4 then
	    hp4 := hp
	elsif chosen = 5 then
	    hp5 := hp
	elsif chosen = 6 then
	    hp6 := hp
	end if
	mousewhere (mx, my, mb)
	draw
	View.Update

	if hp <= 0 then

	    loop
		mousewhere (mx, my, mb)
		% Pokemon box
		if mx > 320 and mx < 470 and my < 70 and my > 10 and mb = 1 then


		    Font.Draw (name, 330, 105, font3, black)
		    Font.Draw (" decided to switch Pokemon", 330 + length (name) * 7, 105, font3, black)
		    View.Update
		    delay (1000)
		    draw

		    loop
			View.Update
			choosepokemon
			if chosen = 1 and hp1 <= 0 then
			    choosepokemon
			elsif chosen = 2 and hp2 <= 0 then
			    choosepokemon
			elsif chosen = 3 and hp3 <= 0 then
			    choosepokemon
			elsif chosen = 4 and hp4 <= 0 then
			    choosepokemon
			elsif chosen = 5 and hp5 <= 0 then
			    choosepokemon
			elsif chosen = 6 and hp6 <= 0 then
			    choosepokemon
			else
			    exit

			end if
		    end loop
		    draw

		    Font.Draw (pokemon (chosenpokemon), 330, 105, font3, black)
		    Font.Draw (" was sent out", 330 + length (pokemon (chosenpokemon)) * 7, 105, font3, black)
		    View.Update
		    delay (1000)
		    exit
		end if
		View.Update
	    end loop
	end if
	View.Update
	loop
	    if chosen = 1 and hp1 <= 0 then
		choosepokemon
	    elsif chosen = 2 and hp2 <= 0 then
		choosepokemon
	    elsif chosen = 3 and hp3 <= 0 then
		choosepokemon
	    elsif chosen = 4 and hp4 <= 0 then
		choosepokemon
	    elsif chosen = 5 and hp5 <= 0 then
		choosepokemon
	    elsif chosen = 6 and hp6 <= 0 then
		choosepokemon
	    else
		exit

	    end if
	end loop

	% Adding images
	draw
	View.Update

	%Add buttons to the code of each attack and damage calculations
	if turn = 1 then
	    % move box 1
	    if mx > 30 and mx < 155 and my > 71 and my < 120 and mb = 1 then

		% procedure for move 1
		for count : 1 .. 81

		    draw
		    Font.Draw (pokemon (chosenpokemon), 330, 105, font3, black)
		    Font.Draw (" used:", 330 + length (pokemon (chosenpokemon)) * 7, 105, font3, black)
		    Font.Draw (youmove1, 330, 85, font3, black)
		    View.Update
		    delay (15)


		    if count < 26 then
			yourX := yourX + 1
			yourY := yourY + 1
		    elsif count > 25 and count < 51 then
			yourX := yourX - 1
			yourY := yourY - 1
		    elsif count > 50 and count < 66 then
			aiX := 1000
			aiY := 1000
		    elsif count > 65 and count < 80 then
			aiX := 390
			aiY := 225
		    end if

		end for

		aihp := aihp - youdamage1
		turn := 2
		% move box 2
	    elsif mx > 160 and mx < 280 and my < 120 and my > 71 and mb = 1 then
		% procedure for move 2
		for count : 1 .. 81
		    draw
		    Font.Draw (pokemon (chosenpokemon), 330, 105, font3, black)
		    Font.Draw (" used:", 330 + length (pokemon (chosenpokemon)) * 7, 105, font3, black)
		    Font.Draw (youmove2, 330, 85, font3, black)
		    View.Update
		    delay (15)
		    if count < 26 then
			yourX := yourX + 1
			yourY := yourY + 1
		    elsif count > 25 and count < 51 then
			yourX := yourX - 1
			yourY := yourY - 1
		    elsif count > 50 and count < 66 then
			aiX := 1000
			aiY := 1000
		    elsif count > 65 and count < 80 then
			aiX := 390
			aiY := 225
		    end if
		end for
		aihp := aihp - youdamage2
		turn := 2

		%move box 3
	    elsif mx > 30 and mx < 155 and my < 70 and my > 21 and mb = 1 then
		% procedure for move 3
		for count : 1 .. 81
		    draw
		    Font.Draw (pokemon (chosenpokemon), 330, 105, font3, black)
		    Font.Draw (" used:", 330 + length (pokemon (chosenpokemon)) * 7, 105, font3, black)
		    Font.Draw (youmove3, 330, 85, font3, black)
		    View.Update
		    delay (15)
		    if count < 26 then
			yourX := yourX + 1
			yourY := yourY + 1
		    elsif count > 25 and count < 51 then
			yourX := yourX - 1
			yourY := yourY - 1
		    elsif count > 50 and count < 66 then
			aiX := 1000
			aiY := 1000
		    elsif count > 65 and count < 80 then
			aiX := 390
			aiY := 225
		    end if
		end for
		aihp := aihp - youdamage3
		turn := 2

		%move box 4
	    elsif mx > 162 and mx < 280 and my < 70 and my > 21 and mb = 1 then
		% procedure for move 4
		for count : 1 .. 81
		    draw
		    Font.Draw (pokemon (chosenpokemon), 330, 105, font3, black)
		    Font.Draw (" used:", 330 + length (pokemon (chosenpokemon)) * 7, 105, font3, black)
		    Font.Draw (youmove4, 330, 85, font3, black)
		    View.Update
		    delay (15)
		    if count < 26 then
			yourX := yourX + 1
			yourY := yourY + 1
		    elsif count > 25 and count < 51 then
			yourX := yourX - 1
			yourY := yourY - 1
		    elsif count > 50 and count < 66 then
			aiX := 1000
			aiY := 1000
		    elsif count > 65 and count < 80 then
			aiX := 390
			aiY := 225
		    end if
		end for

		aihp := aihp - youdamage4
		turn := 2

		% Pokemon box
	    elsif mx > 320 and mx < 470 and my < 70 and my > 10 and mb = 1 then

		if chosen = 1 then
		    hp1 := hp
		elsif chosen = 2 then
		    hp2 := hp
		elsif chosen = 3 then
		    hp3 := hp
		elsif chosen = 4 then
		    hp4 := hp
		elsif chosen = 5 then
		    hp5 := hp
		elsif chosen = 6 then
		    hp6 := hp
		end if

		choosepokemon
		poke (chosenpokemon)
		youmove1 := move1
		youdamage1 := damage1

		youmove2 := move2
		youdamage2 := damage2

		youmove3 := move3
		youdamage3 := damage3

		youmove4 := move4
		youdamage4 := damage4

	    end if



	    View.Update

	    %AI
	elsif turn = 2 then
	    randint (randmove, 1, 4)
	    poke (aipoke)

	    if randmove = 1 then
		for count : 1 .. 81
		    draw
		    Font.Draw (pokemon (aipoke), 330, 105, font3, black)
		    Font.Draw (" used:", 330 + length (pokemon (chosenpokemon)) * 7, 105, font3, black)
		    Font.Draw (move1, 330, 85, font3, black)
		    View.Update
		    delay (15)
		    if count < 26 then
			aiX := aiX - 1
			aiY := aiY - 1
		    elsif count > 25 and count < 51 then
			aiX := aiX + 1
			aiY := aiY + 1
		    elsif count > 50 and count < 66 then
			yourX := 1000
			yourY := 1000
		    elsif count > 65 and count < 80 then
			yourX := 50
			yourY := 75
		    end if
		end for
		hp := hp - damage1
		turn := 1
	    elsif randmove = 2 then
		for count : 1 .. 81
		    draw
		    Font.Draw (pokemon (aipoke), 330, 105, font3, black)
		    Font.Draw (" used:", 330 + length (pokemon (chosenpokemon)) * 7, 105, font3, black)
		    Font.Draw (move2, 330, 85, font3, black)
		    View.Update
		    delay (15)
		    if count < 26 then
			aiX := aiX - 1
			aiY := aiY - 1
		    elsif count > 25 and count < 51 then
			aiX := aiX + 1
			aiY := aiY + 1
		    elsif count > 50 and count < 66 then
			yourX := 1000
			yourY := 1000
		    elsif count > 65 and count < 80 then
			yourX := 50
			yourY := 75
		    end if
		end for
		hp := hp - damage2
		turn := 1

	    elsif randmove = 3 then
		for count : 1 .. 81
		    draw
		    Font.Draw (pokemon (aipoke), 330, 105, font3, black)
		    Font.Draw (" used:", 330 + length (pokemon (chosenpokemon)) * 7, 105, font3, black)
		    Font.Draw (move3, 330, 85, font3, black)
		    View.Update
		    delay (15)
		    if count < 26 then
			aiX := aiX - 1
			aiY := aiY - 1
		    elsif count > 25 and count < 51 then
			aiX := aiX + 1
			aiY := aiY + 1
		    elsif count > 50 and count < 66 then
			yourX := 1000
			yourY := 1000
		    elsif count > 65 and count < 80 then
			yourX := 50
			yourY := 75
		    end if
		end for
		hp := hp - damage3
		turn := 1

	    elsif randmove = 4 then
		for count : 1 .. 81
		    draw
		    Font.Draw (pokemon (aipoke), 330, 105, font3, black)
		    Font.Draw (" used:", 330 + length (pokemon (chosenpokemon)) * 7, 105, font3, black)
		    Font.Draw (move4, 330, 85, font3, black)
		    View.Update
		    delay (15)
		    if count < 26 then
			aiX := aiX - 1
			aiY := aiY - 1
		    elsif count > 25 and count < 51 then
			aiX := aiX + 1
			aiY := aiY + 1
		    elsif count > 50 and count < 66 then
			yourX := 1000
			yourY := 1000
		    elsif count > 65 and count < 80 then
			yourX := 50
			yourY := 75
		    end if
		end for
		hp := hp - youdamage4
		turn := 2
		hp := hp - damage4
		turn := 1

	    end if
	end if

	View.Update
	delay (100)

    end loop
end boss



%Battle
procedure battle
    %random pokemon enemy
    randint (aipoke, 1, 44)

    if chosen = 1 then
	hp1 := hp
    elsif chosen = 2 then
	hp2 := hp
    elsif chosen = 3 then
	hp3 := hp
    elsif chosen = 4 then
	hp4 := hp
    elsif chosen = 5 then
	hp5 := hp
    elsif chosen = 6 then
	hp6 := hp
    end if



    %AUDIO AND DISPLAY
    fork music2

    %Animation
    for decreasing count : maxx .. 0
	drawline (maxx div 2, maxy div 2, count, 0, black)
	delay (1)
	View.Update
    end for

    for count : 0 .. maxy
	drawline (maxx div 2, maxy div 2, 0, count, black)
	delay (1)
	View.Update
    end for

    for count : 0 .. maxx
	drawline (maxx div 2, maxy div 2, count, maxy, black)
	delay (1)
	View.Update
    end for

    for decreasing count : maxy .. 0
	drawline (maxx div 2, maxy div 2, maxx, count, black)
	delay (1)
	View.Update
    end for

    %Your Pokemon and moves
    poke (chosenpokemon)
    youmove1 := move1
    youdamage1 := damage1

    youmove2 := move2
    youdamage2 := damage2

    youmove3 := move3
    youdamage3 := damage3

    youmove4 := move4
    youdamage4 := damage4

    draw
    %Battle Start
    loop
	if chosen = 1 then
	    hp1 := hp
	elsif chosen = 2 then
	    hp2 := hp
	elsif chosen = 3 then
	    hp3 := hp
	elsif chosen = 4 then
	    hp4 := hp
	elsif chosen = 5 then
	    hp5 := hp
	elsif chosen = 6 then
	    hp6 := hp
	end if
	mousewhere (mx, my, mb)
	draw
	View.Update
	%Capturing the ai pokemon, running or changing pokemon
	if aihp <= 0 then
	    aiX := 1000
	    aiY := 1000
	    draw
	    View.Update

	    loop
		mousewhere (mx, my, mb)

		Pic.Draw (ScaledRun, 30, 20, picMerge)
		View.Update
		%Run
		if mx > 30 and mx < 282 and my > 21 and my < 121 and mb = 1 then
		    Exit := 1
		    Font.Draw (name, 330, 105, font3, black)
		    Font.Draw (" decided to make a run for it!", 330 + length (name) * 7, 105, font3, black)
		    View.Update
		    delay (1000)
		    exit

		    % Bag Button
		elsif mx > 480 and my > 10 and mx < 630 and my < 70 and mb = 1 then
		    if numpokemon = 2 then
			numpokemon := 3
			pokemon2 := aipoke
		    elsif numpokemon = 3 then
			numpokemon := 4

			pokemon3 := aipoke
		    elsif numpokemon = 4 then
			numpokemon := 5

			pokemon4 := aipoke
		    elsif numpokemon = 5 then
			numpokemon := 6

			pokemon5 := aipoke
		    elsif numpokemon = 6 then
			numpokemon := 0

			pokemon6 := aipoke

		    end if

		    Font.Draw (pokemon (aipoke), 330, 105, font3, black)
		    Font.Draw (" was caught!", 330 + length (pokemon (aipoke)) * 7, 105, font3, black)
		    View.Update
		    delay (1000)
		    exit
		end if
	    end loop
	    delay (1000)
	    exit
	elsif hp <= 0 then

	    loop
		mousewhere (mx, my, mb)

		Pic.Draw (ScaledRun, 30, 20, picMerge)
		if mx > 30 and mx < 282 and my > 21 and my < 121 and mb = 1 then
		    Exit := 1
		    Font.Draw (name, 330, 105, font3, black)
		    Font.Draw (" decided to make a run for it!", 330 + length (name) * 7, 105, font3, black)
		    View.Update
		    delay (1000)
		    exit
		    % Pokemon box
		elsif mx > 320 and mx < 470 and my < 70 and my > 10 and mb = 1 then


		    Font.Draw (name, 330, 105, font3, black)
		    Font.Draw (" decided to switch Pokemon", 330 + length (name) * 7, 105, font3, black)
		    View.Update
		    delay (1000)
		    draw
		    Pic.Draw (ScaledRun, 30, 20, picMerge)

		    loop
			View.Update
			choosepokemon
			if chosen = 1 and hp1 <= 0 then
			    choosepokemon
			elsif chosen = 2 and hp2 <= 0 then
			    choosepokemon
			elsif chosen = 3 and hp3 <= 0 then
			    choosepokemon
			elsif chosen = 4 and hp4 <= 0 then
			    choosepokemon
			elsif chosen = 5 and hp5 <= 0 then
			    choosepokemon
			elsif chosen = 6 and hp6 <= 0 then
			    choosepokemon
			else
			    exit

			end if
		    end loop
		    draw

		    Font.Draw (pokemon (chosenpokemon), 330, 105, font3, black)
		    Font.Draw (" was sent out", 330 + length (pokemon (chosenpokemon)) * 7, 105, font3, black)
		    View.Update
		    delay (1000)
		    exit
		end if
		View.Update
	    end loop
	end if
	View.Update
	loop
	    if chosen = 1 and hp1 <= 0 then
		choosepokemon
	    elsif chosen = 2 and hp2 <= 0 then
		choosepokemon
	    elsif chosen = 3 and hp3 <= 0 then
		choosepokemon
	    elsif chosen = 4 and hp4 <= 0 then
		choosepokemon
	    elsif chosen = 5 and hp5 <= 0 then
		choosepokemon
	    elsif chosen = 6 and hp6 <= 0 then
		choosepokemon
	    else
		exit

	    end if
	    mousewhere (mx, my, mb)

	    Pic.Draw (ScaledRun, 30, 20, picMerge)
	    if mx > 30 and mx < 282 and my > 21 and my < 121 and mb = 1 then
		Exit := 1
		Font.Draw (name, 330, 105, font3, black)
		Font.Draw (" decided to make a run for it!", 330 + length (name) * 7, 105, font3, black)
		View.Update
		delay (1000)
		exit
	    end if
	end loop
	exit when Exit = 1
	exit when aihp = 0
	% Adding images
	draw
	View.Update

	%Add buttons to the code of each attack and damage calculations
	if turn = 1 then
	    % move box 1
	    if mx > 30 and mx < 155 and my > 71 and my < 120 and mb = 1 then

		% procedure for move 1
		for count : 1 .. 81

		    draw
		    Font.Draw (pokemon (chosenpokemon), 330, 105, font3, black)
		    Font.Draw (" used:", 330 + length (pokemon (chosenpokemon)) * 7, 105, font3, black)
		    Font.Draw (youmove1, 330, 85, font3, black)
		    View.Update
		    delay (15)


		    if count < 26 then
			yourX := yourX + 1
			yourY := yourY + 1
		    elsif count > 25 and count < 51 then
			yourX := yourX - 1
			yourY := yourY - 1
		    elsif count > 50 and count < 66 then
			aiX := 1000
			aiY := 1000
		    elsif count > 65 and count < 80 then
			aiX := 390
			aiY := 225
		    end if

		end for

		aihp := aihp - youdamage1
		turn := 2
		% move box 2
	    elsif mx > 160 and mx < 280 and my < 120 and my > 71 and mb = 1 then
		% procedure for move 2
		for count : 1 .. 81
		    draw
		    Font.Draw (pokemon (chosenpokemon), 330, 105, font3, black)
		    Font.Draw (" used:", 330 + length (pokemon (chosenpokemon)) * 7, 105, font3, black)
		    Font.Draw (youmove2, 330, 85, font3, black)
		    View.Update
		    delay (15)
		    if count < 26 then
			yourX := yourX + 1
			yourY := yourY + 1
		    elsif count > 25 and count < 51 then
			yourX := yourX - 1
			yourY := yourY - 1
		    elsif count > 50 and count < 66 then
			aiX := 1000
			aiY := 1000
		    elsif count > 65 and count < 80 then
			aiX := 390
			aiY := 225
		    end if
		end for
		aihp := aihp - youdamage2
		turn := 2

		%move box 3
	    elsif mx > 30 and mx < 155 and my < 70 and my > 21 and mb = 1 then
		% procedure for move 3
		for count : 1 .. 81
		    draw
		    Font.Draw (pokemon (chosenpokemon), 330, 105, font3, black)
		    Font.Draw (" used:", 330 + length (pokemon (chosenpokemon)) * 7, 105, font3, black)
		    Font.Draw (youmove3, 330, 85, font3, black)
		    View.Update
		    delay (15)
		    if count < 26 then
			yourX := yourX + 1
			yourY := yourY + 1
		    elsif count > 25 and count < 51 then
			yourX := yourX - 1
			yourY := yourY - 1
		    elsif count > 50 and count < 66 then
			aiX := 1000
			aiY := 1000
		    elsif count > 65 and count < 80 then
			aiX := 390
			aiY := 225
		    end if
		end for
		aihp := aihp - youdamage3
		turn := 2

		%move box 4
	    elsif mx > 162 and mx < 280 and my < 70 and my > 21 and mb = 1 then
		% procedure for move 4
		for count : 1 .. 81
		    draw
		    Font.Draw (pokemon (chosenpokemon), 330, 105, font3, black)
		    Font.Draw (" used:", 330 + length (pokemon (chosenpokemon)) * 7, 105, font3, black)
		    Font.Draw (youmove4, 330, 85, font3, black)
		    View.Update
		    delay (15)
		    if count < 26 then
			yourX := yourX + 1
			yourY := yourY + 1
		    elsif count > 25 and count < 51 then
			yourX := yourX - 1
			yourY := yourY - 1
		    elsif count > 50 and count < 66 then
			aiX := 1000
			aiY := 1000
		    elsif count > 65 and count < 80 then
			aiX := 390
			aiY := 225
		    end if
		end for

		aihp := aihp - youdamage4
		turn := 2

		% Pokemon box
	    elsif mx > 320 and mx < 470 and my < 70 and my > 10 and mb = 1 then

		if chosen = 1 then
		    hp1 := hp
		elsif chosen = 2 then
		    hp2 := hp
		elsif chosen = 3 then
		    hp3 := hp
		elsif chosen = 4 then
		    hp4 := hp
		elsif chosen = 5 then
		    hp5 := hp
		elsif chosen = 6 then
		    hp6 := hp
		end if

		choosepokemon
		poke (chosenpokemon)
		youmove1 := move1
		youdamage1 := damage1

		youmove2 := move2
		youdamage2 := damage2

		youmove3 := move3
		youdamage3 := damage3

		youmove4 := move4
		youdamage4 := damage4

	    end if



	    View.Update

	    %AI
	elsif turn = 2 then
	    randint (randmove, 1, 4)
	    poke (aipoke)

	    if randmove = 1 then
		for count : 1 .. 81
		    draw
		    Font.Draw (pokemon (aipoke), 330, 105, font3, black)
		    Font.Draw (" used:", 330 + length (pokemon (chosenpokemon)) * 7, 105, font3, black)
		    Font.Draw (move1, 330, 85, font3, black)
		    View.Update
		    delay (15)
		    if count < 26 then
			aiX := aiX - 1
			aiY := aiY - 1
		    elsif count > 25 and count < 51 then
			aiX := aiX + 1
			aiY := aiY + 1
		    elsif count > 50 and count < 66 then
			yourX := 1000
			yourY := 1000
		    elsif count > 65 and count < 80 then
			yourX := 50
			yourY := 75
		    end if
		end for
		hp := hp - damage1
		turn := 1
	    elsif randmove = 2 then
		for count : 1 .. 81
		    draw
		    Font.Draw (pokemon (aipoke), 330, 105, font3, black)
		    Font.Draw (" used:", 330 + length (pokemon (chosenpokemon)) * 7, 105, font3, black)
		    Font.Draw (move2, 330, 85, font3, black)
		    View.Update
		    delay (15)
		    if count < 26 then
			aiX := aiX - 1
			aiY := aiY - 1
		    elsif count > 25 and count < 51 then
			aiX := aiX + 1
			aiY := aiY + 1
		    elsif count > 50 and count < 66 then
			yourX := 1000
			yourY := 1000
		    elsif count > 65 and count < 80 then
			yourX := 50
			yourY := 75
		    end if
		end for
		hp := hp - damage2
		turn := 1

	    elsif randmove = 3 then
		for count : 1 .. 81
		    draw
		    Font.Draw (pokemon (aipoke), 330, 105, font3, black)
		    Font.Draw (" used:", 330 + length (pokemon (chosenpokemon)) * 7, 105, font3, black)
		    Font.Draw (move3, 330, 85, font3, black)
		    View.Update
		    delay (15)
		    if count < 26 then
			aiX := aiX - 1
			aiY := aiY - 1
		    elsif count > 25 and count < 51 then
			aiX := aiX + 1
			aiY := aiY + 1
		    elsif count > 50 and count < 66 then
			yourX := 1000
			yourY := 1000
		    elsif count > 65 and count < 80 then
			yourX := 50
			yourY := 75
		    end if
		end for
		hp := hp - damage3
		turn := 1

	    elsif randmove = 4 then
		for count : 1 .. 81
		    draw
		    Font.Draw (pokemon (aipoke), 330, 105, font3, black)
		    Font.Draw (" used:", 330 + length (pokemon (chosenpokemon)) * 7, 105, font3, black)
		    Font.Draw (move4, 330, 85, font3, black)
		    View.Update
		    delay (15)
		    if count < 26 then
			aiX := aiX - 1
			aiY := aiY - 1
		    elsif count > 25 and count < 51 then
			aiX := aiX + 1
			aiY := aiY + 1
		    elsif count > 50 and count < 66 then
			yourX := 1000
			yourY := 1000
		    elsif count > 65 and count < 80 then
			yourX := 50
			yourY := 75
		    end if
		end for
		hp := hp - youdamage4
		turn := 2
		hp := hp - damage4
		turn := 1

	    end if
	end if

	View.Update
	delay (100)

    end loop
end battle

%Start of the game
procedure startgame


    %%%%%%   INSTRUCTIONS   %%%%%
    Pic.Draw (Scaledrules, 0, 0, picCopy)
    Font.Draw ("PRESS TAB TO SKIP", 455, 25, font2, black)

    for count : 1 .. 100
	delay (25)
	Input.KeyDown (chars)
	if chars (KEY_TAB) then
	    Exit := 1
	    exit
	end if
    end for

    if Exit = 1 then
	Pic.Draw (Scaledrules, 0, 0, picCopy)

	%2nd text 1st line and get name
	locatexy (40, 70)
	for count : 1 .. length (message2)
	    delay (50)
	    put message2 (count) ..
	    if count = length (message2) then
		get name
	    end if
	end for

    else
	Pic.Draw (Scaledrules, 0, 0, picCopy)

	%1st text 1st line
	locatexy (40, 70)
	for count : 1 .. length (message)

	    delay (50)
	    put message (count) ..

	end for
	%1st text 2nd line
	locatexy (40, 50)
	for count : 1 .. length (message1)
	    delay (50)
	    put message1 (count) ..
	end for

	%Clear screen for new text
	delay (1000)
	cls
	Pic.Draw (Scaledrules, 0, 0, picCopy)

	%2nd text 1st line and get name
	locatexy (40, 70)
	for count : 1 .. length (message2)
	    delay (50)
	    put message2 (count) ..
	    if count = length (message2) then
		get name
	    end if
	end for

	%Clear screen for new text
	cls
	Pic.Draw (Scaledrules, 0, 0, picCopy)

	%3rd text 1st line
	locatexy (40, 70)
	for count : 1 .. length (message3)

	    delay (50)
	    if count = 4 then
		for i : 1 .. length (name)
		    delay (50)
		    put name (i) ..
		end for
	    end if
	    put message3 (count) ..
	    if count = length (message3) then
	    end if
	end for

	%3rd text 2nd line
	locatexy (40, 50)
	for count : 1 .. length (message4)

	    delay (50)
	    put message4 (count) ..
	    if count = length (message4) then
	    end if
	end for

	%3rd text 3rd line
	locatexy (40, 40)
	for count : 1 .. length (message5)

	    delay (50)

	    put message5 (count) ..
	    if count = length (message5) then
	    end if
	end for

	%3rd text 4th line
	locatexy (40, 30)
	for count : 1 .. length (message6)

	    delay (50)

	    put message6 (count) ..
	    if count = length (message6) then
	    end if
	end for

	%Clear screen for new text
	delay (1000)
	cls
	Pic.Draw (Scaledrules, 0, 0, picCopy)

	%4th text 1st line
	locatexy (40, 70)
	for count : 1 .. length (message7)

	    delay (50)

	    put message7 (count) ..
	    if count = length (message7) then
	    end if
	end for

	%4th text 2nd line
	locatexy (40, 50)
	for count : 1 .. length (message8)

	    delay (50)

	    put message8 (count) ..
	    if count = length (message8) then
	    end if

	end for

	%4th text 3rd line
	locatexy (40, 40)
	for count : 1 .. length (message9)

	    delay (50)

	    put message9 (count) ..
	    if count = length (message9) then
	    end if

	end for

	%4th text 4th line
	locatexy (40, 30)
	for count : 1 .. length (message10)

	    delay (50)

	    put message10 (count) ..
	    if count = length (message10) then
	    end if
	    Input.KeyDown (chars)

	end for

	%Clear screen for new text
	delay (1000)
	cls
	Pic.Draw (Scaledrules, 0, 0, picCopy)

	%5th text 1st line
	locatexy (40, 70)
	for count : 1 .. length (message11)
	    delay (50)
	    put message11 (count) ..
	end for
    end if

    %Loading
    Font.Draw ("LOADING", 30, 20, font4, blue)
    delay (500)
    Font.Draw ("LOADING.", 30, 20, font4, blue)
    delay (500)
    Font.Draw ("LOADING..", 30, 20, font4, blue)
    delay (500)
    Font.Draw ("LOADING...", 30, 20, font4, blue)
    delay (500)
    %Audio and Display
    fork music
    View.Set ("offscreenonly")
    GUI.Enable (buttonS1)
    GUI.Enable (buttonQ1)




    %%%%%   WALKING    %%%%%
    loop
	%Trainer battle
	if pokemon6 not= 0 and lastBattle = 0 then
	    Pic.Draw (Scaledrules, 0, 0, picCopy)
	    View.Update

	    %text 1st line
	    locatexy (40, 70)
	    for count : 1 .. length (message12)
		delay (50)
		put message12 (count) ..
		View.Update

	    end for
	    %Variables
	    aihp := 500
	    aipoke := 5
	    lastBattle := 1
	    delay (2000)
	    boss
	    View.Update

	    %text 1st line
	    locatexy (40, 70)
	    for count : 1 .. length (message14)
		delay (50)
		put message14 (count) ..
		View.Update
	    end for


	    %text 2nd line
	    locatexy (40, 50)
	    for count : 1 .. length (message15)
		delay (50)
		put message15 (count) ..
		View.Update
	    end for
	    delay (3000)

	    %Battle variables reset
	    turn := 1
	    aihp := 500
	    aiX := 390
	    aiY := 225
	    yourX := 50
	    yourY := 75
	    hp1 := 500
	    hp2 := 500
	    hp3 := 500
	    hp4 := 500
	    hp5 := 500
	    hp6 := 500
	    hp := 500

	    Exit := 0

	    Pic.Draw (background, -1, -1, picMerge)
	    Input.KeyDown (chars)

	    %Up
	    if chars (KEY_UP_ARROW) then
		y := y + 1
		numup := numup + 1

		%animation
		if numup >= 60 then
		    numup := 0
		end if
		if numup >= 45 then
		    Pic.Draw (upscale2, x, y, picMerge)
		elsif numup >= 30 then
		    Pic.Draw (upscale, x, y, picMerge)
		elsif numup >= 15 then
		    Pic.Draw (upscale3, x, y, picMerge)
		elsif numup <= 15 then
		    Pic.Draw (upscale, x, y, picMerge)
		end if

		View.Update
		last := "up"


		%Down
	    elsif chars (KEY_DOWN_ARROW) then
		numdown := numdown + 1

		y := y - 1

		%animation
		if numdown >= 60 then
		    numdown := 0
		end if
		if numdown >= 45 then
		    Pic.Draw (downscale2, x, y, picMerge)
		elsif numdown >= 30 then
		    Pic.Draw (downscale, x, y, picMerge)
		elsif numdown >= 15 then
		    Pic.Draw (downscale3, x, y, picMerge)
		elsif numdown <= 15 then
		    Pic.Draw (downscale, x, y, picMerge)
		end if

		View.Update
		last := "down"


		%Right
	    elsif chars (KEY_RIGHT_ARROW) then
		numright := numright + 1

		x := x + 1

		%animation
		if numright >= 60 then
		    numright := 0
		end if
		if numright >= 45 then
		    Pic.Draw (rightscale2, x, y, picMerge)
		elsif numright >= 30 then
		    Pic.Draw (rightscale, x, y, picMerge)
		elsif numright >= 15 then
		    Pic.Draw (rightscale3, x, y, picMerge)
		elsif numright <= 15 then
		    Pic.Draw (rightscale, x, y, picMerge)
		end if

		View.Update
		last := "right"

		%Left
	    elsif chars (KEY_LEFT_ARROW) then
		numleft := numleft + 1

		x := x - 1

		%animation
		if numleft >= 60 then
		    numleft := 0
		end if
		if numleft >= 45 then
		    Pic.Draw (leftscale2, x, y, picMerge)
		elsif numleft >= 30 then
		    Pic.Draw (leftscale, x, y, picMerge)
		elsif numleft >= 15 then
		    Pic.Draw (leftscale3, x, y, picMerge)
		elsif numleft <= 15 then
		    Pic.Draw (leftscale, x, y, picMerge)
		end if

		View.Update
		last := "left"


		%Display character when theirs no movement
	    else
		if last = "up" then
		    Pic.Draw (upscale, x, y, picMerge)
		    View.Update

		elsif last = "down" then
		    Pic.Draw (downscale, x, y, picMerge)
		    View.Update

		elsif last = "left" then
		    Pic.Draw (leftscale, x, y, picMerge)
		    View.Update

		elsif last = "right" then
		    Pic.Draw (rightscale, x, y, picMerge)
		    View.Update
		end if
	    end if

	    delay (8)
	    View.Update

	    %Random pokemon encounters
	    randint (pokey, 1, 10)
	    if pokey = 1 then
		battle
		fork music
	    end if


	    %Cant leave screen
	    if x > maxx and background = Scaledback then
		x := x - (maxx + 20)
		background := Scaledback2

	    elsif x < 106 and background = Scaledback then
		x := x + 1

	    elsif x < -40 and background = Scaledback2 then
		x := maxx
		background := Scaledback

	    elsif x > 550 - 40 and background = Scaledback2 then
		x := x - 1
	    end if

	    if (y - 20) > maxy then
		y := y - (maxy + 40)

	    elsif y < -40 then
		y := y + maxy + 20
	    end if
	end loop
    end startgame



    %START SCREEN
    procedure game
	buttonQ1 := GUI.CreateButton (100, 30, 60, "Quit", stopgame)
	GUI.Hide (buttonQ1)

	cls
	Pic.Draw (Scaledstart, -1, -1, picMerge)

	GUI.Show (buttonS1)
	GUI.Show (buttonQ1)
    end game



    %YES & NO (USED WITH QUIT)
    procedure yesgame
	Ya := 1
	stopgame
	GUI.Hide (Yes)
	GUI.Hide (No)
    end yesgame

    procedure nogame
	GUI.Hide (Yes)
	GUI.Hide (No)
	Pic.Draw (Scaledstart, -1, -1, picMerge)


	GUI.Show (buttonQ1)
	GUI.Enable (buttonQ1)
	GUI.Enable (buttonS1)
    end nogame






    %%%%%       GAME START       %%%%%

    %Buttons
    Yes := GUI.CreateButton (440, 40, 50, "Yes", yesgame)
    No := GUI.CreateButton (515, 40, 50, "No", nogame)

    buttonS1 := GUI.CreateButton (30, 30, 60, "Play", startgame)
    buttonQ1 := GUI.CreateButton (50, 30, 60, "Quit", stopgame)

    %Hide
    GUI.Hide (Yes)
    GUI.Hide (No)
    GUI.Hide (buttonS1)
    GUI.Hide (buttonQ1)


    %Give player random pokemon
    randint (pokemon1, 1, 44)
    chosenpokemon := pokemon1
    numpokemon := 2
    chosen := 1
    %Display and audio
    anim := 0
    Pic.Draw (Scaledenter, -1, -1, picMerge)
    background := Scaledback
    fork music1

    %ENTER SCREEN
    loop

	Input.KeyDown (chars)
	anim := anim + 1

	if anim > 175 then
	    Pic.Draw (Scaledenter, -1, -1, picMerge)
	    anim := 0

	elsif anim > 75 then
	    drawfillbox (20, 20, 600, 80, black)
	end if

	Font.Draw ("BY MOHAMED AND SAM", 455, 25, font2, yellow)

	if chars (KEY_ENTER) then
	    cls
	    game
	    exit
	end if

	delay (5)
    end loop



    loop
	exit when GUI.ProcessEvent
    end loop
