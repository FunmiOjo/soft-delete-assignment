require "rails_helper"

RSpec.describe Item do
    describe 'soft_delete' do
        it 'updates deleted_at attribute of item to current time' do
            item = Item.create!(:name => 'item_1')
            now = Time.now
            item.soft_delete
            deleted_item = Item.find(item.id)
            expect(deleted_item.deleted_at).to be >= now
        end
    end
end