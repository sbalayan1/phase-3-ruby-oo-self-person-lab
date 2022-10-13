# your code goes here
class Person
    attr_reader :name, :happiness, :hygiene
    attr_accessor :bank_account

    def initialize name
        @name = name
        @bank_account = 25
        @happiness = 8
        @hygiene = 8
    end

    # def happiness
    #     @happiness #represents the instance variable happiness
    #     #happiness #implicit receiver syntax that calls self.happiness. this calls the happiness method over and over again and creates an infinite loop
    # end

    def happiness=(value)

        # self.happiness = 0 #explicit receiver syntax calls the happiness setter method over and over again, regardless of what's passed as val
        
        #happiness = 50 here ruby views the implicit receiver as a variable assignment. Thus if you print happiness, you will get 50 because the variable happiness is 50. That being said, ruby will still attempt to apply self to the puts happiness. This results in the call and print of the happiness getter method. If you put a print in the happiness method, you'll see this method print both 50 and 8.


        #thus we need to reference the instance variable here in this setter method
        @happiness = if value > 10
                        10
                    elsif value < 0
                        0
                    else 
                        value
                    end
    end

    def hygiene=(value)
        @hygiene = if value > 10
            10
        elsif value < 0
            0
        else 
            value
        end
    end


    def happy?
        happiness > 7 ? true : false
    end

    def clean?
        hygiene > 7 ? true : false
    end

    def get_paid amt
        self.bank_account += amt
        "all about the benjamins"
    end

    def take_bath
        self.hygiene += 4
        '♪ Rub-a-dub just relaxing in the tub ♫'
    end

    def work_out
        self.hygiene -= 3
        self.happiness += 2
        '♪ another one bites the dust ♫'
    end

    def call_friend person
        self.happiness += 3
        person.happiness += 3
        "Hi #{person.name}! It's #{name}. How are you?"
    end

    def start_conversation person, topic
        if topic == 'politics'
            [self, person].each {|p| p.happiness -= 2}
            "blah blah partisan blah lobbyist"
        elsif topic == 'weather'
            [self, person].each {|p| p.happiness += 1}
            "blah blah sun blah rain"
        else
            "blah blah blah blah blah"
        end
    end
end