class FootPrint < ApplicationRecord
    belongs_to :book, optional: true
end
