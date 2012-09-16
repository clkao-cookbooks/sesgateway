include_recipe "stunnel"

template "/etc/stunnel/ses.conf" do
  source "ses.conf.erb"
  notifies :restart, "service[stunnel4]"
end
