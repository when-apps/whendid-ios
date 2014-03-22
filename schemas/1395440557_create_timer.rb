schema "1395440557" do
  entity "Timer" do
    string   :name,        :optional => false
    datetime :happenedAt,  :default => false
  end
end
