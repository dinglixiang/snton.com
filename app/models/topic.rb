class Topic < ActiveRecord::Base
  include AASM

  default_scope order: "updated_at DESC"
  aasm_column :status

  scope :published, -> { where(status: "published") }
  scope :drafted, -> { where(status: "drafted") }
  scope :banned, -> { where(status: "banned") }

  aasm do
    state :drafted, :initial => true
    state :published, :before_enter => :do_publish
    state :banned, :before_enter => :do_ban

    event :publish do
      transitions :from => [:drafted, :banned], :to => :published
    end

    event :ban do
      transitions :from => [:drafted, :published], :to => :banned
    end

  end

  private
  def do_publish
    update_status("published")
  end

  def do_ban
    update_status("banned")
  end

  def update_status(status)
    self.update_attribute(:status, status)
  end
end
