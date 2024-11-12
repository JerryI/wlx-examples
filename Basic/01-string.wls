(* Package manager *)
Uncompress["1:eJx1T8tuwjAQDBT1wo0/6Ac0vveKKAoNCJoDZ5NugsXGtrwbBf6edawKLlzG+5rxzMfJ/TZvWZbRVKBomkms5wLfBmF1NcR0qN6lL/fbfMC0j4Q18
PM80mkmcDR8TlexK0Ug7SKnAh5f9F0aRoGi8y5wVUp5Zvb0pVTQQ96KTn/qCULtLIPlvHad2kAIt0IN+Imu1uh1fdEtkOq0seoHggVUydForuJgbJsCLgSWTj7r7d/q6gMQGWfT
Lt7KLPp4ZPq3+qz0Iv6Yddcj3gGoDVPG"];

root = DirectoryName[$InputFileName] // ParentDirectory;

PacletRepositories[{
	Github -> "https://github.com/JerryI/wl-wlx"
}, "Directory"->root]

<<JerryI`WLX`

expression = ProcessString["
	TodayTime := TextString[Today];

	<body>
		<h1><TodayTime/></h1>
	</body>
"];

"\n\n" // Echo;
expression // ReleaseHold // Echo;