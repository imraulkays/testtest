yum_package 'mariadb-server' do
  action	:install
end

systemd_unit 'mariadb' do
  action	[:enable, :start]
end

template '/tmp/secure.sql' do
  source	'secure.sql.erb'
end

execute 'run secure' do
  command	'mysql < /tmp/secure.sql'
end

file '/tmp/secure.sql' do
  action	:delete
end
