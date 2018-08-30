class History < ApplicationRecord
  enum status: { started: 0, finished: 1 }
end
