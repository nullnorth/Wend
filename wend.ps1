configuration wend1 {
	Node ('localhost') {
		registry AcceptRDPConnections {
			Ensure      = "Present"
			Key         = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server"
			ValueName   = "fDenyTSConnections"
            ValueData   = "0"
        }
		registry RDPAuthLevel {
			Ensure      = "Present"
			Key         = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp"
			ValueName   = "UserAuthentication"
            ValueData   = "1"
        }
		xfirewall RDP_Firewall {
            Ensure      = "Present"
            DisplayGroup = "Remote Desktop"
            Zone        = ('Domain', 'Private', 'Public')
            InterfaceType = "Any"
            Enable      = "True"
        }
        
	}
}