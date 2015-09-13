json.array!(@invitecodes) do |invitecode|
  json.extract! invitecode, :id, :name, :ammount, :used
  json.url invitecode_url(invitecode, format: :json)
end
