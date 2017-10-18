class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  class << self
    def markdown_method
      Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    end
  end

  before_save :assign_markdown_body

  def assign_markdown_body
    assign_attributes({
      markdown: self.class.markdown_method.render(body)
      })
  end

end
