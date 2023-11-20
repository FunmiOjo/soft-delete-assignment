require "rails_helper"

RSpec.describe Item do
    describe 'soft_delete' do
        it 'updates deleted_at attribute of item to current time' do
            item = Item.create!(:name => 'item_1')
            now = Time.current
            item.soft_delete
            deleted_item = Item.unscoped.find(item.id)
            expect(deleted_item.deleted_at).to be >= now
        end
    end

    describe 'restore' do
        it 'updates deleted_at attribute to nil' do
            item = Item.create!(:name => 'item_2')
            item.soft_delete
            item.restore
            restored_item = Item.find(item.id)
            expect(restored_item.deleted_at).to eq(nil)
        end
    end

    describe 'default scope' do
        it 'excludes soft deleted items from queries' do
            item = Item.create!(:name => 'item_3')
            item.soft_delete
            deleted_item = Item.where(:id => item.id).first
            expect(deleted_item).to eq(nil)
        end
    end
end