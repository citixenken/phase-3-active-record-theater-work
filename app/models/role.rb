class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        auditions.pluck(:actor)
    end

    def locations
        auditions.pluck(:location)

    end

    def lead

        # if auditions.where(hired: true).length > 0
        #     auditions.where(hired: true)[0] #first instance
        # else
        #     'no actor has been hired for this role'
        # end

        #return first instance
        auditions.where(hired: true).length > 0 ? auditions.where(hired: true)[0] : 'no actor has been hired for this role'
    end

    def understudy
        #return second instance
        auditions.where(hired: true).length > 0 ? auditions.where(hired: true)[1] : 'no actor has been hired for understudy for this role'

    end
 end
