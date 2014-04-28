schema "1398653691" do
  entity "Timer" do
    string   :name,         :optional => false
    datetime :happened_at,  :default => false
    binary   :image
  end
end
