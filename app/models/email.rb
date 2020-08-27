class Email < ApplicationRecord

    def read?
        marks_as_read?
    end

end
