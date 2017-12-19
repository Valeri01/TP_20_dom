

require 'prime.rb'

class RSA
	def initialize n, e, d
		@n = n
		@e = e
		@d = d
	end

	def n
		return @n
	end

	def e
		return @e
	end

	def d
		return @d
   	end
	def new_key
		p = Prime.first 99
		q = Prime.first 99
		p = p.at(rand(1...99))
		loop do 
		    q = q.at(rand(1...99))
		    break if p != q
		end
		n = p * q
		tot = (p-1).lcm(q-1)
		e = 0;
		loop do
		    e = rand(1...tot)
		    break if e.gcd(tot) == 1
		end   
		d = 0
		inv = 0
		loop do
		    if (e * inv) % tot == 1
		       d = inv
		       break
		    end
		    inv+=1
		end
		[n,e,d]
	end

	def encrypt mess_value
		return (mess_value.chars.map {|c| c.ord ** @e % @n}).join(",")
	end

	def decrypt mess_value
	 	return (mess_value.split(",").map {|c| (c.to_i ** @d % @n).chr}).join("")
	end 
end

