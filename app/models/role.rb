class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map do |audition|
            audition.actor
        end
    end

    def locations
        self.auditions.map do |audition|
            audition.location
        end
    end

    def lead
       have_lead =  self.auditions.find {|aud| aud.hired == true}
       have_lead || 'no lead has been hired'
    end

    def understudy
       actors = self.auditions.select {|aud| aud.hired == true}
       actors[1] || 'no understudy has been hired'
    end
end