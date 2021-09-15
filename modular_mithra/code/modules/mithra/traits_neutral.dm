/*
		All neutral traits go here. They are automagically sorted based off their cost, but seperating em this way is easier to search through.
*/

/datum/trait/glowing_eyes
	name = "Glowing Eyes"
	desc = "Your eyes glow in the dark."	//MY VISION IS AUGMENTED

	apply(var/datum/species/S,var/mob/living/carbon/human/H)
		..(S,H)
		for(var/obj/item/organ/external/head/O in H.organs)
			O.glowing_eyes = TRUE

/datum/trait/cold_blooded
	name = "Ectothermy"
	desc = "You have diminished means of internal thermoregulation, forcing you to rely on external heat to stay alive."
	var_changes = list("body_temperature" = 285, "cold_discomfort_level" = 292)
	excludes = list(/datum/trait/hot_blooded)

/datum/trait/hot_blooded
	name = "Hot-blooded"
	desc = "Your body is capable of more vigourous endothermoregulation, causing your average body temperature to be higher than normal."
	var_changes = list("body_temperature" = 313, "heat_discomfort_level" = 320)
	excludes = list(/datum/trait/cold_blooded)

/datum/trait/nitrogen_breath
	name = "Nitrogenous Spirometry"
	desc = "Your metabolic processes causes you to exhale nitrogen rather than carbon dioxide."
	var_changes = list("exhale_type" = "nitrogen")

/datum/trait/fast_meta
	name = "Faster Metabolism"
	desc = "Your metabolism rate is absurdly high, causing you to get hungry and process chemicals at roughly twice the normal rate."
	var_changes = list("hunger_factor" = DEFAULT_HUNGER_FACTOR * 2.5, "metabolism_mod" = 2.5)
	excludes = list(/datum/trait/slow_meta)

/datum/trait/slow_meta
	name = "Slower Metabolism"
	desc = "Your metabolism rate is absurdly low, causing you to get hungry and process chemicals at half the normal rate."
	var_changes = list("hunger_factor" = DEFAULT_HUNGER_FACTOR * 0.5, "metabolism_mod" = 0.5)
	excludes = list(/datum/trait/fast_meta)

/datum/trait/carnivore
	name = "Carnivore"
	desc = "For one reason or another, you're only capable of eating meat. Vegetables won't kill you, but they won't help you either."
	var_changes = list(reagent_tag = IS_CARNIVORE)

/datum/trait/herbivore
	name = "Herbivore"
	desc = "You're only able to eat plants. Eating meat and other animal protein will poison you."
	var_changes = list(reagent_tag = IS_HERBIVORE)

/datum/trait/melee_attack
	name = "Rending Claws"
	desc = "You have claws. You use them in unarmed combat."
	var_changes = list("unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp))

	apply(var/datum/species/S,var/mob/living/carbon/human/H)
		..(S,H)
		for(var/u_type in S.unarmed_types)
			S.unarmed_attacks += new u_type()
/datum/trait/venom
	name = "Venomous"
	desc = "You've various methods of injecting venom when in unarmed combat."
	var_changes = list("unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/venom))
	excludes = list(/datum/trait/melee_attack)

	apply(var/datum/species/S,var/mob/living/carbon/human/H)
		..(S,H)
		for(var/u_type in S.unarmed_types)
			S.unarmed_attacks += new u_type()

/datum/trait/mussel
	name = "Muscular Hypertrophy"
	desc = "You have higher muscle mass than normal, giving you greater strength."
	var_changes = list("strength" = STR_HIGH)
	excludes = list(/datum/trait/minor_brute_resist,/datum/trait/noodlyarms)

/datum/trait/noodlyarms
	name = "Muscular Atrophy"
	desc = "You have less muscle mass than normal, giving you inferior strength."
	var_changes = list("strength" = STR_LOW)
	excludes = list(/datum/trait/mussel)
/datum/trait/minor_brute_resist
	name = "Thick Skin"
	desc = "Your skin is thicker than normal, making you slightly more resistant to physical damage."
	var_changes = list("brute_mod" = 0.85)
	excludes = list(/datum/trait/mussel,/datum/trait/minor_burn_resist,/datum/trait/toxin_resist,/datum/trait/oxy_resist)

/datum/trait/minor_burn_resist
	name = "Insulated Skin"
	desc = "You skin is somehow insulated, making you slightly more resistant to burns."
	var_changes = list("burn_mod" = 0.85)
	excludes = list(/datum/trait/minor_brute_resist,/datum/trait/toxin_resist,/datum/trait/oxy_resist)

/datum/trait/toxin_resist
	name = "Iron Liver"
	desc = "Your metabolism processes toxins more efficiently, making you slightly more resistant to poisonings."
	var_changes = list("toxins_mod" = 0.85)
	excludes = list(/datum/trait/minor_brute_resist,/datum/trait/minor_brute_resist,/datum/trait/oxy_resist)

/datum/trait/oxy_resist
	name = "Haemoglobin Melior"
	desc = "You can last a bit longer while aphyxiating due to higher blood-oxygen saturation."
	var_changes = list("oxy_mod" = 0.75)
	excludes = list(/datum/trait/minor_brute_resist,/datum/trait/toxin_resist,/datum/trait/minor_burn_resist)

/datum/trait/nonconductive
	name = "Resistive Skin"
	desc = "Your skin has a higher electrical resistivity than normal, making you less conductive."
	var_changes = list("siemens_coefficient" = 0.75)
	excludes = list(/datum/trait/minor_brute_resist,/datum/trait/minor_burn_resist)

/datum/trait/darksight_plus
	name = "Tapeta Lucida Majoris"
	desc = "Your eyes have a retroreflective layer within their strucuture, allowing you to see much better in the dark."
	var_changes = list("darksight_range" = 6, "darksight_tint" = DARKTINT_GOOD)
	excludes = list(/datum/trait/photoresistant)
/datum/trait/darksight_plus/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	var/obj/item/organ/internal/eyes/I = H.internal_organs_by_name[S.vision_organ]
	if(istype(I))
		I.darksight_range = 6
		I.darksight_tint = DARKTINT_GOOD

/datum/trait/photoresistant
	name = "Phototransductive Praesidium"
	desc = "Your eyes are slightly more resillient against bright lights."
	cost = 1
	var_changes = list("flash_mod" = 0.85)
	excludes = list(/datum/trait/darksight_plus)

/datum/trait/hemophilia
	name = "Hemophilia"
	desc = "Your body doesn't quite stop bleeding once it starts. You need immediate treatment for anything, even minor wounds, or it might turn out real bad for you."
	var_changes = list("blood_volume" = 105)

/datum/trait/hollow
	name = "Glass Bones"
	desc = "Your limbs are just more fragile than usual for whatever reason, making them easier to break."

/datum/trait/hollow/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	for(var/obj/item/organ/external/O in H.organs)
		O.min_broken_damage *= 0.5

/datum/trait/endurance_low
	name = "Fragile"
	desc = "Your body is much, much more fragile than the average joe."
	var_changes = list("total_health" = 65)

	apply(var/datum/species/S,var/mob/living/carbon/human/H)
		..(S,H)
		H.setMaxHealth(S.total_health)

/datum/trait/speed_slow
	name = "Sluggish"
	desc = "You move slower than the average person."
	var_changes = list("slowdown" = 1.5)
