action :add do
  file "/etc/authbind/byaddr/#{new_resource.addr}:#{new_resource.port}" do
    mode "0755"
    action :create
  end
end

action :delete do
  file "/etc/authbind/byaddr/#{new_resource.addr}:#{new_resource.port}" do
    only_if "test -f /etc/authbind/byaddr/#{new_resource.addr}:#{new_resource.port}"
    action :delete
  end
end
