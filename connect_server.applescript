-- Get info about host and say it by siri.
on run {input, parameters}
	set x to do shell script "echo_test.sh"
	
	say x speaking rate 240
	return input
end run

-- Open htop on host
on run {input, parameters}
	say "开始连接服务器." speaking rate 300
	tell application "Terminal"
		activate
		do script "awesome.sh"
	end tell
	
	return 1
end run

-- Open bash terminal and keep it
on run {input, parameters}
	tell application "Terminal"
		activate
		do script "keep_ssh.sh"
	end tell
end run