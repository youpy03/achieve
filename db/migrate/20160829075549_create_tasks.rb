class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :content
      t.datetime :deadline
      t.integer :charge_id, null: false
      t.boolean :done, default: false
      t.integer :status, default: 0
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end


#「作成者」   user_id integer null: false
#「タイトル」    title     string
#「内容」    content   text
#「締め切り」    deadline  datetime
#「担当者」   charge_id   integer null: false
#「完了フラグ」 done  boolean default: false
#「ステータスフラグ」status  integer default: 0