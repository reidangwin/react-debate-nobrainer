class Argument

  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  field :name, type: String, required: true
  has_many :events, dependent: :destroy
end
