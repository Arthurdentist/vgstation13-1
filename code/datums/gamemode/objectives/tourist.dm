/datum/objective/tourist/survive15
	explanation_text = "Stay alive on the station for fifteen minutes."
	name = "Survive (as a Tourist)"

/datum/objective/tourist/survive15/IsFulfilled()
	if (..())
		return TRUE
	var/datum/role/tourist/C = owner.GetRole(TOURIST)
	return C.ticks_survived > 450

/datum/objective/tourist/visit
	explanation_text = "Visit 30 rooms by entering them."
	name = "Visit"

/datum/objective/tourist/visit/IsFulfilled()
	if (..())
		return TRUE
	var/datum/role/tourist/C = owner.GetRole(TOURIST)
	return C.areas_visited.len > 30