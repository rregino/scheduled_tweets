# class you use in your requests that you can use to assign things
# user, timezone, what account they're on
class Current < ActiveSupport::CurrentAttributes
  attribute :user
end