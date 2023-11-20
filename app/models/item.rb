class Item < ApplicationRecord
    default_scope { where(:deleted_at => nil) }

    def soft_delete
        self.update!(:deleted_at => Time.current)
    end

    def restore
        self.update!(:deleted_at => nil)
    end
end
