require_relative 'RSA.rb'
require 'rspec'


 RSpec.describe RSA do
	rsa = RSA.new(100,300,200)
    it "should return the right n" do
        expect(rsa.n).to eq 100
    end
    it "should return the right e" do
        expect(rsa.e).to eq 300
    end
    it "should return the right d" do
        expect(rsa.d).to eq 200
    end
     context "shoud encrypt and decrypt correctly" do
	test = RSA.new(0,0,0)
	key = test.new_key
	rsa_random = RSA.new(key[0], key[1], key[2])

	it " word " do 
		expect(rsa_random.decrypt (rsa_random.encrypt ("come"))).to eq "come"
	end
	it " sentence " do 
		expect(rsa_random.decrypt rsa_random.encrypt "Hey you are sexy!").to eq "Hey you are sexy!"
	end
	it " text " do 
		expect(rsa_random.decrypt rsa_random.encrypt "Computer programming (often shortened to programming) is a process that leads from an original formulation of a computing problem to executable computer programs. Programming involves activities such as analysis, developing understanding, generating algorithms, verification of requirements of algorithms including their correctness and resources consumption, and implementation (commonly referred to as coding[1][2]) of algorithms in a target programming language. Source code is written in one or more programming languages. ").to eq "Computer programming (often shortened to programming) is a process that leads from an original formulation of a computing problem to executable computer programs. Programming involves activities such as analysis, developing understanding, generating algorithms, verification of requirements of algorithms including their correctness and resources consumption, and implementation (commonly referred to as coding[1][2]) of algorithms in a target programming language. Source code is written in one or more programming languages. "
	end
    end
    context "invalid operations" do
      	it "word " do 
		expect(rsa.decrypt rsa.encrypt "Hello!").not_to eql "Bye!"
      end
	it "sentence " do 
		expect(rsa.decrypt rsa.encrypt "Ruby is a beautiful language!").not_to eql "Ruby is a awful language!"
      end
	it "text " do 
		expect(rsa.decrypt rsa.encrypt "Ruby is a dynamic, reflective, object-oriented, general-purpose programming language. It was designed and developed in the mid-1990s by Yukihiro Matz Matsumoto in Japan.

According to its creator, Ruby was influenced by Perl, Smalltalk, Eiffel, Ada, and Lisp.[12] It supports multiple programming paradigms, including functional, object-oriented, and imperative. It also has a dynamic type system and automatic memory management.").not_to eql "Ruby is NOT a dynamic, reflective, object-oriented, general-purpose programming language. ITTT was designed and developed in the mid-1990s by Yukihiro Matz Matsumoto ONNN Japan.

According to its creator, Ruby was influenced by Perl, Smalltalk, Eiffel, Ada, and Lisp.[12] ITTT supports multiple programming paradigms, including functional, object-oriented, and imperative. It also has a dynamic type system ANDDDDD automatic memory management."
      end
    end
end
