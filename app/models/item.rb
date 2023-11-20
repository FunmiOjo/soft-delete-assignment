class Item < ApplicationRecord
    def soft_delete
        self.update!(:deleted_at => Time.current)
    end

    def restore
        self.update!(:deleted_at => nil)
    end
end
