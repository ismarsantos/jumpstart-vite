class Machine < ApplicationRecord
  after_create_commit  { broadcast_append_to 'machines' }
  after_update_commit  { broadcast_update_to 'machines' }
  after_destroy_commit { broadcast_remove_to 'machines' }
  after_save_commit    { broadcast_update_to 'machines' }
end
