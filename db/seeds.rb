require_relative("../models/member.rb")
require_relative("../models/gymclass.rb")
require_relative("../models/booking.rb")

require("pry-byebug")

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
