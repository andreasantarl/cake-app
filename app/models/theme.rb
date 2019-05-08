class Theme < ActiveHash::Base
  self.data = [
    {:id => '1', :name => 'birthday'},
    {:id => '2', :name => 'wedding'},
    {:id => '3', :name => 'just because'},
    {:id => '4', :name => 'graduation'}
  ]
end
