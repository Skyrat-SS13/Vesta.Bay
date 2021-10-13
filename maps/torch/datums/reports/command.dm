
/datum/computer_file/report/recipient/crew_transfer
	form_name = "CTA-SGF-01"
	title = "Crew Transfer Application"
	logo = "\[solcrest\]\[nteflogo\]"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/crew_transfer/generate_fields()
	..()
	var/list/xo_fields = list()
	add_field(/datum/report_field/text_label/header, "NTSS Andromeda - Office of the Executive Officer")
	add_field(/datum/report_field/people/from_manifest, "Name (XO)")
	add_field(/datum/report_field/people/from_manifest, "Name (applicant)", required = 1)
	add_field(/datum/report_field/date, "Date filed")
	add_field(/datum/report_field/time, "Time filed")
	add_field(/datum/report_field/simple_text, "Present position")
	add_field(/datum/report_field/simple_text, "Requested position")
	add_field(/datum/report_field/pencode_text, "Reason stated")
	add_field(/datum/report_field/text_label/instruction, "The following fields render the document invalid if not signed clearly.")
	add_field(/datum/report_field/signature, "Applicant signature")
	xo_fields += add_field(/datum/report_field/signature, "Executive Officer's signature")
	xo_fields += add_field(/datum/report_field/number, "Number of personnel in present/previous position")
	xo_fields += add_field(/datum/report_field/number, "Number of personnel in requested position")
	xo_fields += add_field(/datum/report_field/options/yes_no, "Approved")
	for(var/datum/report_field/field in xo_fields)
		field.set_access(access_edit = access_hop)

/datum/computer_file/report/recipient/access_modification
	form_name = "AMA-SGF-02"
	title = "Crew Access Modification Application"
	logo = "\[solcrest\]\[nteflogo\]"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/access_modification/generate_fields()
	..()
	var/list/xo_fields = list()
	add_field(/datum/report_field/text_label/header, "NTSS Andromeda - Office of the Executive Officer")
	add_field(/datum/report_field/people/from_manifest, "Name (XO)")
	add_field(/datum/report_field/people/from_manifest, "Name (applicant)", required = 1)
	add_field(/datum/report_field/date, "Date filed")
	add_field(/datum/report_field/time, "Time filed")
	add_field(/datum/report_field/simple_text, "Present position")
	add_field(/datum/report_field/simple_text, "Requested access")
	add_field(/datum/report_field/pencode_text, "Reason stated")
	add_field(/datum/report_field/simple_text, "Duration of expanded access")
	add_field(/datum/report_field/text_label/instruction, "The following fields render the document invalid if not signed clearly.")
	add_field(/datum/report_field/signature, "Applicant signature")
	xo_fields += add_field(/datum/report_field/signature, "Executive Officer's signature")
	xo_fields += add_field(/datum/report_field/number, "Number of personnel in relevant position")
	xo_fields += add_field(/datum/report_field/options/yes_no, "Approved")
	for(var/datum/report_field/field in xo_fields)
		field.set_access(access_edit = access_hop)

/datum/computer_file/report/recipient/access_modification
	form_name = "SITREP-SCG-03"
	title = "Situation Report"
	logo = "\[solcrest\]\[nteflogo\]"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/crew_transfer/generate_fields()
	..()
	var/list/xo_fields = list()
	add_field(/datum/report_field/text_label/header, "NTSS Andromeda - Office of the Executive Officer")
	add_field(/datum/report_field/people/from_manifest, "Name:")
	add_field(/datum/report_field/simple_text, "Sitrep No.")
	add_field(/datum/report_field/date, "Date filed")
	add_field(/datum/report_field/time, "Time filed")
	add_field(/datum/report_field/pencode_text, "Situation to Date")
	add_field(/datum/report_field/pencode_text, "Actions to Date")
	add_field(/datum/report_field/pencode_text, "Actions to be Completed")
	add_field(/datum/report_field/pencode_text, "Issues Outsanding")
	add_field(/datum/report_field/pencode_text, "Escalation Actions/Details Required")
	add_field(/datum/report_field/text_label/instruction, "The following fields render the document invalid if not signed clearly.")
	xo_fields += add_field(/datum/report_field/signature, "Executive Officer's Signature")
	for(var/datum/report_field/field in xo_fields)
		field.set_access(access_edit = access_hop)

/datum/computer_file/report/recipient/access_modification
	form_name = "GENCOM-SCG-COM-01"
	title = "General Transmission"
	logo = "\[solcrest\]\[nteflogo\]"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/crew_transfer/generate_fields()
	..()
	var/list/xo_fields = list()
	add_field(/datum/report_field/text_label/header, "NTSS Andromeda - Command Department")
	add_field(/datum/report_field/people/from_manifest, "Name:")
	add_field(/datum/report_field/date, "Date filed")
	add_field(/datum/report_field/time, "Time filed")
	add_field(/datum/report_field/simple_text, "Priority")
	add_field(/datum/report_field/simple_text, "Subject")
	add_field(/datum/report_field/pencode_text, "Transmission")
	add_field(/datum/report_field/text_label/instruction, "The following fields render the document invalid if not signed clearly.")
	add_field(/datum/report_field/signature, "Signature")
	for(var/datum/report_field/field in xo_fields)
		field.set_access(access_edit = access_bridge)