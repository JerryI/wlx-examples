(* Package manager *)
Uncompress["1:eJx1T8tuwjAQDBT1wo0/6Ac0vveKKAoNCJoDZ5NugsXGtrwbBf6edawKLlzG+5rxzMfJ/TZvWZbRVKBomkms5wLfBmF1NcR0qN6lL/fbfMC0j4Q18
PM80mkmcDR8TlexK0Ug7SKnAh5f9F0aRoGi8y5wVUp5Zvb0pVTQQ96KTn/qCULtLIPlvHad2kAIt0IN+Imu1uh1fdEtkOq0seoHggVUydForuJgbJsCLgSWTj7r7d/q6gMQGWfT
Lt7KLPp4ZPq3+qz0Iv6Yddcj3gGoDVPG"];

root = DirectoryName[$InputFileName] // ParentDirectory;

PacletRepositories[{
	Github -> "https://github.com/KirillBelovTest/Objects",
	Github -> "https://github.com/JerryI/Internal",
	Github -> "https://github.com/JerryI/CSocketListener" -> "dev2024",
	Github -> "https://github.com/JerryI/TCPServer",
	Github -> "https://github.com/JerryI/HTTPHandler",
	Github -> "https://github.com/JerryI/wl-wlx" 
}, "Directory"->root]

SetDirectory[$InputFileName // DirectoryName]

<<KirillBelov`CSockets`
<<KirillBelov`Objects`
<<KirillBelov`Internal`
<<KirillBelov`TCPServer`

<<KirillBelov`HTTPHandler`
<<KirillBelov`HTTPHandler`Extensions`

(* WLX scripts *)
<<JerryI`WLX`
<<JerryI`WLX`Importer`


Print["Staring HTTP server..."];

tcp = TCPServer[];
tcp["CompleteHandler", "HTTP"] = HTTPPacketQ -> HTTPPacketLength;
tcp["MessageHandler", "HTTP"] = HTTPPacketQ -> http;

page = ImportComponent["02-page-example.wlx"];

http = HTTPHandler[];
http["MessageHandler", "Index"] = AssocMatchQ[<|"Method" -> "GET"|>] -> page

addr = "127.0.0.1:8010";

SocketListen[CSocketOpen[addr], tcp@# &];

"open http://"<>addr<>"/" // Echo;
While[True, Pause[0.1]];