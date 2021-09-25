//Remember, every codebase is different, you probably have better methods for these defines than the ones given here
#define TGS_EXTERNAL_CONFIGURATION
#define TGS_DEFINE_AND_SET_GLOBAL(Name, Value) var/global/##Name = ##Value
#define TGS_READ_GLOBAL(Name) global.##Name
#define TGS_WRITE_GLOBAL(Name, Value) global.##Name = ##Value
#define TGS_WORLD_ANNOUNCE(message) to_chat(world, "<span class='boldannounce'>[html_encode(##message)]</span>")
#define TGS_INFO_LOG(message) log_admin("TGS Info: [##message]")
#define TGS_WARNING_LOG(message) log_warning("TGS Warning: [##message]")
#define TGS_ERROR_LOG(message)  log_error("TGS Error: [##message]")
#define TGS_NOTIFY_ADMINS(event) log_admin("TGS Admin Message: [##event]")
#define TGS_CLIENT_COUNT GLOB.clients.len
#define TGS_PROTECT_DATUM(Path) // Leave blank if your codebase doesn't give administrators code reflection capabilities