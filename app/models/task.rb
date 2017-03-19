class Task
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, type: String
  field :completed_at, type: DateTime
  belongs_to :project

  def completed?
    !completed_at.blank?
  end
end
