/datum/job/clown
	title = JOB_NAME_CLOWN
	flag = CLOWN
	department_head = list(JOB_NAME_HEADOFPERSONNEL)
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of personnel"
	selection_color = "#dddddd"

	outfit = /datum/outfit/job/clown

	access = list(ACCESS_THEATRE)
	minimal_access = list(ACCESS_THEATRE)
	paycheck = PAYCHECK_MINIMAL
	paycheck_department = ACCOUNT_SRV

	display_order = JOB_DISPLAY_ORDER_CLOWN
	departments = DEPARTMENT_BITFLAG_SERVICE
	rpg_title = "Jester"

	species_outfits = list(
		SPECIES_PLASMAMAN = /datum/outfit/plasmaman/honk
	)

/datum/job/clown/after_spawn(mob/living/carbon/human/H, mob/M)
	. = ..()
	H.apply_pref_name("clown", M.client)

/datum/outfit/job/clown
	name = JOB_NAME_CLOWN
	jobtype = /datum/job/clown

	id = /obj/item/card/id/job/clown
	belt = /obj/item/pda/clown
	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/rank/civilian/clown
	shoes = /obj/item/clothing/shoes/clown_shoes
	mask = /obj/item/clothing/mask/gas/clown_hat
	l_pocket = /obj/item/bikehorn
	backpack_contents = list(
		/obj/item/stamp/clown = 1,
		/obj/item/reagent_containers/spray/waterflower = 1,
		/obj/item/reagent_containers/food/snacks/grown/banana = 1,
		/obj/item/instrument/bikehorn = 1,
		)

	implants = list(/obj/item/implant/sad_trombone)

	backpack = /obj/item/storage/backpack/clown
	satchel = /obj/item/storage/backpack/clown
	duffelbag = /obj/item/storage/backpack/duffelbag/clown //strangely has a duffel

	box = /obj/item/storage/box/hug/survival

	chameleon_extras = /obj/item/stamp/clown

/datum/outfit/job/clown/pre_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_BANANIUM_SHIPMENTS))
		backpack_contents[/obj/item/stack/sheet/mineral/bananium/five] = 1

/datum/outfit/job/clown/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	H.fully_replace_character_name(H.real_name, pick(GLOB.clown_names)) //rename the mob AFTER they're equipped so their ID gets updated properly.
	H.dna.add_mutation(CLOWNMUT)
	ADD_TRAIT(H, TRAIT_NAIVE, JOB_TRAIT)
