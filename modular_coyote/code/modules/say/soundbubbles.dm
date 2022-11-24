	// Author Gremling
// by request of the overlord FennyKong, I have granted his wish by designing a method to allow users to have a sound play when typing, or finished typing.
#define NO_SOUND		1
#define PLAY_STARTING	2
//#define PLAY_TYPING		3
#define PLAY_FINISHED	3

GLOBAL_LIST_INIT(play_methods, list("No Sound",
									"Play sound when you begin typing",
//									"Loop sound while you type",
									"Play sound after you type"))

GLOBAL_LIST_INIT(typing_indicator_sounds, list(
		"Default"	= 'modular_coyote/sound/typing/default.ogg',
		"FB Messenger"	= 'modular_coyote/sound/typing/facebookMessenger.ogg',
		"Deep"	= 'modular_coyote/sound/typing/deepspeak.ogg',
		"Soft"	= 'modular_coyote/sound/typing/softspeak.ogg',
		"Light"	= 'modular_coyote/sound/typing/lightspeak.ogg',
		"Jackal" = 'modular_coyote/sound/typing/arfs1sounds/anubis1.ogg',
		"Bat Chitter" = 'modular_coyote/sound/typing/arfs1sounds/bat1.ogg',
		"Bear" = 'modular_coyote/sound/typing/arfs1sounds/bear1.ogg',
		"Beaver" = 'modular_coyote/sound/typing/arfs1sounds/beaver1.ogg',
		"Jackal" = 'modular_coyote/sound/typing/arfs1sounds/anubis1.ogg',
		"Horrible Bird Kyaa" = 'modular_coyote/sound/typing/arfs1sounds/bird1.ogg',
		"Horrible Bird Call 2" = 'modular_coyote/sound/typing/arfs1sounds/bird2.ogg',
		"Boar" = 'modular_coyote/sound/typing/arfs1sounds/boar1.ogg',
		"Goat" = 'modular_coyote/sound/typing/arfs1sounds/capra1.ogg',
		"Corgi (Cody)" = 'modular_coyote/sound/typing/arfs1sounds/corgi1.ogg',
		"Corgi" = 'modular_coyote/sound/typing/arfs1sounds/corgi2.ogg',
		"Cougar" = 'modular_coyote/sound/typing/arfs1sounds/cougar1.ogg',
		"Cow" = 'modular_coyote/sound/typing/arfs1sounds/cow1.ogg',
		"Coyote Howl" = 'modular_coyote/sound/typing/arfs1sounds/coyote1.ogg',
		"Coyote" = 'modular_coyote/sound/typing/arfs1sounds/coyote2.ogg',
		"Crocodile" = 'modular_coyote/sound/typing/arfs1sounds/croc1.ogg',
		"Deer" = 'modular_coyote/sound/typing/arfs1sounds/deer1.ogg',
		"Drider" = 'modular_coyote/sound/typing/arfs1sounds/drider1.ogg',
		"Eevee" = 'modular_coyote/sound/typing/arfs1sounds/eevee1.ogg',
		"Elephant" = 'modular_coyote/sound/typing/arfs1sounds/elephant1.ogg',
		"Fennec Bark" = 'modular_coyote/sound/typing/arfs1sounds/fennec1.ogg',
		"Fennec Squeak" = 'modular_coyote/sound/typing/arfs1sounds/fennec2.ogg',
		"Fox Bark" = 'modular_coyote/sound/typing/arfs1sounds/fox1.ogg',
		"Husky Bark-bark" = 'modular_coyote/sound/typing/arfs1sounds/husky1.ogg',
		"Husky Howl" = 'modular_coyote/sound/typing/arfs1sounds/husky2.ogg',
		"Hyena Laugh" = 'modular_coyote/sound/typing/arfs1sounds/hyena1.ogg',
		"Lizard?" = 'modular_coyote/sound/typing/arfs1sounds/lizard1.ogg',
		"Lynx Growl" = 'modular_coyote/sound/typing/arfs1sounds/lynx1.ogg',
		"Orca" = 'modular_coyote/sound/typing/arfs1sounds/orca1.ogg',
		"Panda" = 'modular_coyote/sound/typing/arfs1sounds/panda1.ogg',
		"Pig Grunt" = 'modular_coyote/sound/typing/arfs1sounds/pig1.ogg',
		"Porcupine" = 'modular_coyote/sound/typing/arfs1sounds/porcupine1.ogg',
		"Possum Hiss" = 'modular_coyote/sound/typing/arfs1sounds/possum1.ogg',
		"Miserable Bark" = 'modular_coyote/sound/typing/arfs1sounds/pug1.ogg',
		"Rabbit Squeal" = 'modular_coyote/sound/typing/arfs1sounds/rabbit1.ogg',
		"Raccoon Chitter" = 'modular_coyote/sound/typing/arfs1sounds/raccoon1.ogg',
		"Red Panda Chitter" = 'modular_coyote/sound/typing/arfs1sounds/redpanda1.ogg',
		"Dial Up" = 'modular_coyote/sound/typing/arfs1sounds/robot1.ogg',
		"Yappy Dog" = 'modular_coyote/sound/typing/arfs1sounds/shihtzu1.ogg',
		"Cat Mrowl" = 'modular_coyote/sound/typing/arfs1sounds/siamese1.ogg',
		"Skunk Chitter" = 'modular_coyote/sound/typing/arfs1sounds/skunk1.ogg',
		"Big Cat Chuff" = 'modular_coyote/sound/typing/arfs1sounds/tiger1.ogg',
		"Vulture" = 'modular_coyote/sound/typing/arfs1sounds/vulture1.ogg',
		"Wolf Howl" = 'modular_coyote/sound/typing/arfs1sounds/wolf1.ogg'
				))

//lmfao at lizard ~TK420634

/datum/looping_sound/typing_indicator
	mid_sounds = list('modular_coyote/sound/typing/default.ogg')
	mid_length = 30
	volume = 10

/datum/looping_sound/typing_indicator/start(atom/add_thing)
	output_atoms = get_hearers_in_view(7,usr)
	output_atoms -= usr

	return ..()


/datum/preferences
	var/list/features_speech = list("typing_indicator_sound" = 'modular_coyote/sound/typing/default.ogg', "typing_indicator_sound_play" = "No Sound")
/* // Disabled for now
/mob
	var/datum/looping_sound/typing_indicator/typing_sound

/mob/Initialize()
	typing_sound = new(list(src), FALSE)
	return ..()

/mob/Destroy()
	QDEL_NULL(typing_sound)
	return ..()
*/
/mob/proc/get_typing_indicator_sound()
	if(client)
		var/client/C = client
		return GLOB.typing_indicator_sounds[C.prefs.features["typing_indicator_sound"]]
	return 'modular_coyote/sound/typing/default.ogg'

/mob/proc/get_typing_indicator_pref()
	if(client)
		var/client/C = client
		return C.prefs.features["typing_indicator_sound_play"]
	return NO_SOUND


/mob/display_typing_indicator(timeout_override = TYPING_INDICATOR_TIMEOUT, state_override = generate_typing_indicator(), force = FALSE)
	if(((!typing_indicator_enabled || (stat != CONSCIOUS)) && !force) || typing_indicator_current)
		return

	if(get_typing_indicator_pref() == GLOB.play_methods[PLAY_STARTING])
		playsound(get_turf(src), get_typing_indicator_sound(), 15, FALSE)

// Disabling this unfortunately for now as I think this is causing too much perf hit on things.
/*	if(get_typing_indicator_pref() == GLOB.play_methods[PLAY_TYPING])
		if(typing_sound)
			typing_sound.mid_sounds = list(GLOB.typing_indicator_sounds[client.prefs.features["typing_indicator_sound"]])
			typing_sound.start()
*/
	return ..()


/mob/clear_typing_indicator()
//	if(typing_sound)
//		typing_sound.stop()
	
	if(stat != CONSCIOUS)
		return ..()
	
	if(get_typing_indicator_pref() == GLOB.play_methods[PLAY_FINISHED])
		playsound(get_turf(src), get_typing_indicator_sound(), 15, FALSE)

	return ..()

// Moved this to preferences_savefile.dm as we're having issues with overriding the function I think.
// My speculation is that us trying to open the save file multiple times with multiple users is causing a memory overflow on the server end and refusing to open it
// Though surely it would alteast warn us?? IDK. There's no way to debug this live. That's atleast what I think is happening, as it's strange that it works locally, but not server side.

/*
/datum/preferences/load_character(slot)
	. = ..()
	if(!(. == 1))
		return . // There's an error!!

	var/savefile/S = new /savefile(path)
	S.cd = "/character[slot]"

	S["typing_indicator_sound"]			>> features_speech["typing_indicator_sound"]
	S["typing_indicator_sound_play"]	>> features_speech["typing_indicator_sound_play"]

	features_speech["typing_indicator_sound"]				= sanitize_inlist(features_speech["typing_indicator_sound"], GLOB.typing_indicator_sounds, "Default")
	features_speech["typing_indicator_sound_play"]			= sanitize_inlist(features_speech["typing_indicator_sound_play"], GLOB.play_methods, "No Sound")

	return 1


/datum/preferences/save_character()
	. = ..()

	if(!(. == TRUE))
		return . // erroooooooooooorrrrrrrrrrr

	var/savefile/S = new /savefile(path)
	if(!S)
		return 0

	S.cd = "/character[default_slot]"

	//Character
	WRITE_FILE(S["typing_indicator_sound"]				, features_speech["typing_indicator_sound"])
	WRITE_FILE(S["typing_indicator_sound_play"]			, features_speech["typing_indicator_sound_play"])

	return 1
*/

/datum/preferences/process_link(mob/user, list/href_list)
	switch(href_list["task"])
		if("input")
			switch(href_list["preference"])
				if("typing_indicator_sound")
					var/new_sound
					new_sound = input(user, "Choose your typing sound:", "Character Pogerenfe") as null|anything in GLOB.typing_indicator_sounds
					if(new_sound)
						features_speech["typing_indicator_sound"] = new_sound

				if("typing_indicator_sound_play")

					var/new_input = input(user, "Choose your typing sound behaviour", "You stink c:") as null|anything in GLOB.play_methods
					if(new_input)
						features_speech["typing_indicator_sound_play"] = new_input
	..()

/datum/preferences/copy_to(mob/living/carbon/human/character, icon_updates = 1, roundstart_checks = TRUE, initial_spawn = FALSE)
	features += features_speech
	..()
