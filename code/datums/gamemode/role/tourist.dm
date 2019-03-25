/datum/role/tourist
	name = TOURIST
	id = TOURIST
	special_role = TOURIST
	required_pref = ROLE_MINOR
	wikiroute = ROLE_MINOR
	var/ticks_survived = 0
	var/threat_on_death = 50

/datum/role/tourist/Greet()
	to_chat(antag.current, "<B><span class='warning'>You are a tourist!</span></B>")
	to_chat(antag.current, "Central Command has sent you to the station as part of a trial run test the viability of Space Tourism.For the trial to be a success, it is critical that you stay alive. If you die, threat will be generated and the trial will be considered a failure)

/datum/role/tourist/OnPostSetup()
	var/mob/living/carbon/human/H = antag.current
	equip_tourist(H)


/proc/equip_tourist(var/mob/living/carbon/human/H)
	var/list/glasses = list(/obj/item/clothing/glasses/sunglasses/big, /obj/item/clothing/glasses/sunglasses/rockstar, /obj/item/clothing/glasses/regular,
	/obj/item/clothing/glasses/regular/hipster)
	var/chosen_glasses = pick(glasses)
	if(rand(30))
		H.equip_to_slot_or_del(new chosen_glasses, slot_eyes)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/messenger, slot_back)

/datum/role/tourist/ForgeObjectives()
	AppendObjective(/datum/objective/tourist/survive15)
	AppendObjective(/datum/objective/tourist/visit)

/datum/role/tourist/process()
	..()
	if(!istourist(antag.current))
		return
	var/area/A = OnStation()
	if(antag.current.stat!=DEAD && A) //Not dead or unconscious or offstation
		ticks_survived++
		if(threat_on_death != 0)
