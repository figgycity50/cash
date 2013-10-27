print "figgycity50 CASH dev-0.5"
--the user know it cash, lets load cash.

tArgs = {...}

startDir = shell.dir()
configLocation = "/.cash/cash.conf"

dir = startDir
if tArgs[0] == "--homeDir" then
	homeDir = tArgs[1]
else
	homeDir = startDir
end
dir = homeDir

--all cash vars initialized, let's read from cash.conf.

--lol nothing in this version

--everything initialized, let's have FUN!

local function findFile(path)
  if fs.exists(dir..path) then
    return true, dir..path
  elseif fs.exists("/rom/programs/"..path) then
    return true, "/rom/programs/"..path
  else
    for a,p in pairs(shell.aliases()) do --# is this even a real, and/or iterable function? o.O
      if a == path then
        return true, p
      end
    end
  end
  return false
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
  if term.isColor() then
   term.setTextColor(colors.yellow)
  end
  write("root@")
  if term.isColor() then
   term.setTextColor(colors.green)
  end
  write(lbl)
  if term.isColor() then
   term.setTextColor(colors.red)
  end
  write(" /"..dir)
  if term.isColor() then
   term.setTextColor(colors.blue)
  end
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
    local exists, path = findFile(cmdTbl[1])
    if exists then
      shell.run(path, unpack(cmdTbl, 2))
    else
      printError("Unknown command: "..command)
    end
  end
end
end