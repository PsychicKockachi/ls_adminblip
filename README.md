# ls_adminblip

# Features of the Script  
Admin-Only Visibility: Blips are visible only to players with admin permissions.  
Job-Based Colors: Different jobs have different blip colors to easily distinguish player roles.  
Dynamic Updates: Player blips are updated in real-time to reflect their current position and job.  
Customizable: You can easily add more jobs or change blip colors via the configuration file.  
  
# How It Works  
Admins Only: Admins are identified by their group (e.g., admin). You can adjust the Config.AdminGroup value to match your server’s group configuration.  
Blip Colors by Job: Each player's job determines the color of their blip on the map. The colors can be modified in the Config.JobBlipColors table.  
Automatic Updates: The blip data is refreshed every 5 seconds to keep it updated with player locations and jobs.  
Resource Setup: Place this script in a folder (e.g., blip_system) inside your resources directory, and add ensure blip_system to your server configuration file.  
This script is optimized for ESX and should be straightforward to implement. Let me know if you need help with further customization!  
  
Features Explained  
Admin-Only Visibility:  

Admins are identified by their group (default: admin).  
The script uses a server callback (isAdmin) to check if the current player is an admin.  
Job-Based Blip Colors:  

Configurable in config.lua through the Config.JobBlipColors table.  
For example, police blips are blue, ambulance blips are green, etc.  
Dynamic Updates:  
  
The script updates every 5 seconds to reflect changes in player positions and job roles.  
Customizable:  
  
Add new job roles and colors by editing Config.JobBlipColors.  
Adjust the update interval by modifying the Citizen.Wait(5000) value in client.lua.  
Testing the Script  
Log in as an admin.  
Open your map (default: M key).  
Verify that:  
You see player blips  
The blip colors match the players' jobs  
Non-admin players cannot see the blips  
Let me know if you need further assistance or customizations!  
  


