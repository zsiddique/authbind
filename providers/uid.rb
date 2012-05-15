action :add do
  file "/etc/authbind/byuid/#{new_resource.uid}" do
    mode "0755"
    action :create
  end
end

action :delete do
  file "/etc/authbind/byuid/#{new_resource.uid}" do
    only_if "test -f /etc/authbind/byport/#{new_resource.uid}"
    action :delete
  end
end
