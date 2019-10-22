class CreateFaqsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :faqs do |t|
      t.string :question
      t.string :answer
      t.belongs_to :event
    end
  end
end
