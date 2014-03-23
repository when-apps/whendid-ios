schema "1395440557" do
  entity "Timer" do
    string   :name,        :optional => false
    datetime :happened_at,  :default => false
  end
end
