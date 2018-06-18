/var/create_mob_html = null
/datum/admins/proc/create_mob(mob/user)
	if (!create_mob_html)
		var/mobjs = null
		mobjs = jointext(typesof(/mob), ";")
		create_mob_html = file2text('html/create_object.html')
		create_mob_html = replacetext(create_mob_html, "null /* object types */", "\"[mobjs]\"")

	user << browse(replacetext(create_mob_html, "/* ref src */", "\ref[src]"), "window=create_mob;size=425x475")

/proc/randomize_human(mob/living/carbon/human/H)
	H.gender = "MALE"
	H.real_name = "John Doughs"
	H.name = "John Doughs"
	H.underwear = random_underwear(H.gender)
	H.skin_tone = random_skin_tone()
	H.hair_style = random_hair_style(H.gender)
	H.facial_hair_style = random_facial_hair_style(H.gender)
	H.hair_color = "Black"
	H.facial_hair_color = "Black"
	H.eye_color = random_eye_color()
	H.dna.blood_type = random_blood_type()
	H.update_body()
	H.update_hair()
	H.update_body_parts()
