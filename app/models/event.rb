class Event
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  field :body, :type => Text
  field :position, :type => Integer
  belongs_to :argument
  has_many :reaction, dependent: :destroy 
end
