print "figgycity50 CASH dev-0.5"
--the user know it cash, lets load cash.

tArgs = {...}

startDir = shell.dir()
configLocation = "/.cash/cash.conf"

--all cash vars initialized, let's read from cash.conf.

--lol nothing in this version

--everything initialized, let's have FUN!

function colorText(color)
if term.isColor() then
term.setTextColor(color)
end
end

local function findFile(path)
 return shell.resolveProgram(path)
end


function splitString(strTo)
local fields = {}
strTo:gsub("([^ ]+)", function(c) table.insert(fields, c) end)
return fields
end

cmdHistory = {}

while true do
if os.computerLabel() then
 lbl = os.computerLabel()
else
 lbl = os.computerID()
end
colorText(colors.yellow)
write("root@")
colorText(colors.green)
write(lbl)
colorText(colors.red)
write(" /"..shell.dir())
colorText(colors.blue)
write(" $ ")
local command = read(nil, cmdHistory)
table.insert(cmdHistory, command)
term.setTextColor(colors.white)
if command == "exit" then
 break
else if command == "" then
 printError("Are you crazy? Type something in!")
else
 cmdTbl = splitString(command)
 local path = findFile(cmdTbl[1])
 if path then
  shell.run("/"..path, unpack(cmdTbl, 2))
 else
  printError("Unknown command: "..command)
 end
end
end
end