class Death < ApplicationRecord
  belongs_to :user

  def when
    created_at
  end
end
