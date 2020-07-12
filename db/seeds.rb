require_relative("../models/member.rb")
require_relative("../models/gymclass.rb")
require_relative("../models/booking.rb")

require("pry-byebug")

member1 = Member.new({
    "first_name" => "Jessica"
    "last_name" => "Smith"
    "dob" => "02/11/1978"
    "email" => "jesssmith@gmail.com"
})
member1.save()

member2 = Member.new({
    "first_name" => "Emma"
    "last_name" => "Gray"
    "dob" => "18/02/1982"
    "email" => "emmagray@gmail.com"
})
member2.save()

member3 = Member.new({
    "first_name" => "Louis"
    "last_name" => "Evans"
    "dob" => "24/07/1990"
    "email" => "louisevans@gmail.com"
})
member3.save()

member4 = Member.new({
    "first_name" => "Robert"
    "last_name" => "Short"
    "dob" => "10/10/1995"
    "email" => "robertshort@gmail.com"
})
member4.save()

