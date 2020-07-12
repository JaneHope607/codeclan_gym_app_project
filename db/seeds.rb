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
    "dob" => "02/11/1978",
    "email" => "jesssmith@gmail.com"
})

member2 = Member.new({
    "first_name" => "Emma",
    "last_name" => "Gray",
    "dob" => "18/02/1982",
    "email" => "emmagray@gmail.com"
})

member3 = Member.new({
    "first_name" => "Louis",
    "last_name" => "Evans",
    "dob" => "24/07/1990",
    "email" => "louisevans@gmail.com"
})

member4 = Member.new({
    "first_name" => "Robert",
    "last_name" => "Short",
    "dob" => "10/10/1995",
    "email" => "robertshort@gmail.com"
})

member1.save()
member2.save()
member3.save()
member4.save()

gymclass1 = GymClass.new({
    "name" => "Yoga",
    "duration" => "60",
    "instructor" => "Adam Parker",
    "capacity" => "15"
})

gymclass2 = GymClass.new({
    "name" => "Kettlebells",
    "duration" => "30",
    "instructor" => "Ruth Longstone",
    "capacity" => "25"
})

gymclass3 = GymClass.new({
    "name" => "Spin",
    "duration" => "30",
    "instructor" => "Emily Whitehall",
    "capacity" => "20"
})

gymclass4 = GymClass.new({
    "name" => "Pilates",
    "duration" => "45",
    "instructor" => "Aaron Marsh",
    "capacity" => "10"
})

gymclass5 = GymClass.new({
    "name" => "Absolute Abs",
    "duration" => "45",
    "instructor" => "Mark Stone",
    "capacity" => "15"
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
    "member_id" => member4.id
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