require "modules.SetUp"
require "script_common.main"
if World.IsClient then
require "script_client.main"
else
require "script_server.main"
end