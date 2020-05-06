=begin
	Populates database with initial data

	Edited 4/15/2020 by Juhee Park: populate all tables with some data	
=end

=begin
	Landlord: name, email, password, phone, website, office
=end
landlords = [
	["OSU Rentals", "contact@osurentals.com", "osuRentals4lyfe", "614-111-1111", "www.osurentals.com", "1111 Osurental St, Columbus, Ohio 43210"],
	["Prime Properties", "contact@primeproperties.com", "primeProperties4lyfe", "614-222-2222", "www.primeproperties.com", "2222 Prime St, Columbus, Ohio 43210"],
	["Homes For Students", "contact@.homes4students.com", "homes4students4lyfe", "614-333-3333", "www.homes4students.com", "3333 Homes St, Columbus, Ohio 43210"]
]	

landlords.each do |name, email, pass, phone, web, off|
	@lord = Landlord.new(name: name, email: email, password: pass, phone: phone, website: web, office: off)
	puts("Error saving Landlord") if !(@lord.save)
end


=begin
	Property: address, total_bedrooms, total_bathrooms, pet_friendly, landlords_id
=end
property_list = [
	["1111 W Norwich Avenue", 4, 2, false, 1],
	["1112 W Norwich Avenue", 3, 3, true, 1],
	["1113 W Norwich Avenue", 4, 2, false, 1],
	["2221 W Norwich Avenue", 1, 1, true, 2],
	["2222 W Norwich Avenue", 3, 2, false, 2],
	["3331 W Norwich Avenue", 5, 3, true, 3]
]

property_list.each do |add, bed, bath, pet, ll|
	@prop = Property.new(address:add, total_bedrooms:bed, total_bathrooms:bath, pet_friendly: pet, landlord_id:ll)
	puts("Error saving Property") if !(@prop.save)
end

=begin
	Student: fname, lname, email, password, phone, dob
=end
student_list = [
	["Jas", "Bawa", "bawa.19@osu.edu", "ruby4lyfe", "614-111-1234", DateTime.new(2000, 3, 4)],
	["Ern Chi", "Khoo", "khoo.20@osu.edu", "rails4lyfe", "614-222-1234", DateTime.new(1997, 12, 14)],
	["Daniel", "Lim", "lim.1185@osu.edu", "bethel4lyfe", "614-333-1234", DateTime.new(1999, 7, 31)],
	["Ron", "Xu", "xu.3304@osu.edu", "cse4lyfe", "614-444-1234", DateTime.new(2001, 5, 2)],
	["Juhee", "Park", "park.2609@osu.edu", "web4lyfe", "614-555-1234", DateTime.new(1998, 10, 4)]
]

student_list.each do |fn, ln, email, pass, phone, dob|
	@stu = Student.new(fname:fn, lname:ln, email:email, password:pass, phone:phone, dob:dob)
	puts("Error saving Student") if !(@stu.save)
end

=begin
	Review: review, stars, properties_id, students_id
=end
review_list = [
	["Great place", 5, 1, 1],
	["Horrible place",1, 1, 2],
	["Decent place", 4, 2, 4],
	["Eh place", 3, 3, 1],
	["Would give 0 star if I could", 1, 3, 5],
	["Close to campus", 4, 3, 3]
]

review_list.each do |rev, stars, pid, sid|
	@rev = Review.new(review:rev, stars:stars, property_id:pid, student_id:sid)

	puts("Error saving Review") if !(@rev.save)
end

=begin
	Sublet_post: housemates_num, monthly_rent, water_flag, gas_flag, electric_flag
	internet_flag, other_util_flag, start_date, end_date, bedroom_num, furnished_flag
	parking_flag, house_rules, taken, description, property_id, student_id
=end

posts = [
	[3, 450, true, true, true, true, false, DateTime.new(2020, 5, 1), DateTime.new(2020, 7, 31), 1, true, true, "", false, "recently renovated and super close to campus!", 1, 5],
	[2, 300, true, true, true, true, false, DateTime.new(2020, 4, 1), DateTime.new(2020, 7, 31), 1, true, true, "", true, "", 2, 2],
	[3, 550, false, true, true, true, false, DateTime.new(2020, 5, 1), DateTime.new(2020, 8, 7), 1, true, false, "", false, "", 3, 3],
	[0, 600, false, false, false, false, false, DateTime.new(2020, 5, 1), DateTime.new(2020, 7, 31), 1, true, true, "", false, "", 4, 1],
	[3, 350, false, true, true, false, false, DateTime.new(2020, 4, 30), DateTime.new(2020, 8, 10), 2, false, true, "", true, "", 6, 4],
	[3, 350, false, true, true, false, false, DateTime.new(2020, 4, 30), DateTime.new(2020, 8, 31), 2, false, true, "", false, "", 6, 4],
	[2, 350, false, true, true, false, false, DateTime.new(2020, 6, 30), DateTime.new(2020, 9, 22), 2, false, true, "", false, "", 5, 2],
	
]

posts.each do |hnum, rent, water, gas, electric, internet, other, start, last, bed, furn, park, rules, taken, desc, pid, sid|
	@post = SubletPost.new(housemates_num:hnum, monthly_rent:rent, water_flag:water, gas_flag:gas, electric_flag:electric, 
		internet_flag:internet, other_util_flag:other, start_date:start, end_date:last, bedroom_num:bed, furnished_flag:furn, 
		parking_flag:park, house_rules:rules, taken:taken, description:desc, property_id:pid, student_id:sid)

	puts("Error saving SubletPost") if !(@post.save)
end