require_relative("../models/member.rb")
require_relative("../models/gymclass.rb")
require_relative("../models/booking.rb")
require("pry-byebug")

Booking.delete_all()
Member.delete_all()
GymClass.delete_all()

member1 = Member.new({
    "first_name" => "Jessica",
    "last_name" => "Smith",
    "dob" => "1978-11-12",
    "email" => "jesssmith@gmail.com",
    "number" => "07863738838",
    "date_joined" => "2020-07-12",
    "membership_type" => "Premium"
})

member2 = Member.new({
    "first_name" => "Emma",
    "last_name" => "Gray",
    "dob" => "1982-02-18",
    "email" => "emmagray@gmail.com",
    "number" => "07898282828",
    "date_joined" => "2020-07-13",
    "membership_type" => "Standard"
})

member3 = Member.new({
    "first_name" => "Louis",
    "last_name" => "Evans",
    "dob" => "1990-07-24",
    "email" => "louisevans@gmail.com",
    "number" => "07812323343",
    "date_joined" => "2020-07-11",
    "membership_type" => "Premium"
})

member4 = Member.new({
    "first_name" => "Robert",
    "last_name" => "Short",
    "dob" => "1995-10-10",
    "email" => "robertshort@gmail.com",
    "number" => "07123228826",
    "date_joined" => "2020-07-10",
    "membership_type" => "Standard"
})

member1.save()
member2.save()
member3.save()
member4.save()

gymclass1 = GymClass.new({
    "name" => "Yoga",
    "duration" => "60",
    "instructor" => "Adam Parker"
})

gymclass2 = GymClass.new({
    "name" => "Kettlebells",
    "duration" => "30",
    "instructor" => "Ruth Longstone"
})

gymclass3 = GymClass.new({
    "name" => "Spin",
    "duration" => "30",
    "instructor" => "Emily Whitehall"
})

gymclass4 = GymClass.new({
    "name" => "Pilates",
    "duration" => "45",
    "instructor" => "Aaron Marsh"
})

gymclass5 = GymClass.new({
    "name" => "Absolute Abs",
    "duration" => "45",
    "instructor" => "Mark Stone"
})

gymclass1.save()
gymclass2.save()
gymclass3.save()
gymclass4.save()
gymclass5.save()



booking1 = Booking.new({
    "gymclass_id" => gymclass3.id,
    "member_id" => member1.id
})

booking2 = Booking.new({
    "gymclass_id" => gymclass5.id,
    "member_id" => member4.id
})

booking3 = Booking.new({
    "gymclass_id" => gymclass1.id,
    "member_id" => member2.id
})

booking4 = Booking.new({
    "gymclass_id" => gymclass2.id,
    "member_id" => member3.id
})

booking5 = Booking.new({
    "gymclass_id" => gymclass5.id,
    "member_id" => member2.id
})

booking6 = Booking.new({
    "gymclass_id" => gymclass4.id,
    "member_id" => member1.id
})

booking1.save()
booking2.save()
booking3.save()
booking4.save()
booking5.save()
booking6.save()

# member1.first_name = "Jane"
# member1.update()

# gymclass2.duration = '35'
# gymclass2.update()

binding.pry
nil