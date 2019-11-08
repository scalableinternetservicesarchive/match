class Game < ApplicationRecord
    def self.STATUS_PROPOSED
        0
    end
    def self.STATUS_COMPLETED
        1
    end
    def self.STATUS_IN_PROGRESS
        2
    end
    def self.STATUS_CANCELLED
        -1
    end
end
