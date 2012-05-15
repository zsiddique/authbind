action :add do
  file "/etc/authbind/byport/#{new_resource.port}" do
    owner "#{new_resource.owner}"  
    group "#{new_resource.group}"
    mode "0755"
    action :create
  end
end

action :delete do
  file "/etc/authbind/byport/#{new_resource.port}" do
    only_if "test -f /etc/authbind/byport/#{new_resource.port}"
    action :delete
  end
end