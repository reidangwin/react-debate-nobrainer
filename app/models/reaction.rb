class Reaction
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  field :body, :type => Text
  field :position, :type => Integer
  belongs_to :event
  belongs_to :user
end
