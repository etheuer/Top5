class List < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
	acts_as_taggable # Alias for acts_as_taggable_on :tags
	acts_as_taggable_on :tags


	has_attached_file :image, styles: { medium: "300x300>" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	has_many :list_items, :dependent => :destroy
	accepts_nested_attributes_for 	:list_items,
									reject_if: lambda { |a| a[:title].blank? },
									allow_destroy: true
						
	validates :title, :description, presence: true

end