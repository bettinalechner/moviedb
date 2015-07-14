class Actor < ActiveRecord::Base
    
    validates :first_name, presence: true, length: { minimum: 2 }
    validates :last_name, presence: true, length: { minimum: 2 }
    validates :nationality, presence: true, length: { minimum: 2 }
    validates :date_of_birth, presence: true
    
    def name
       self.first_name + ' ' + self.last_name
    end
    
    def age
        Date.today.year - self.date_of_birth.year - ((Date.today.month > self.date_of_birth.month || (Date.today.month == self.date_of_birth.month && Date.today.day >= self.date_of_birth.day)) ? 0 : 1)
    end
end
