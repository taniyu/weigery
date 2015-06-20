class RenameSdpColumnToSbp < ActiveRecord::Migration
  def change
    rename_column :physicals, :sdp, :sbp
  end
end
