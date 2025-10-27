local imgui = require("mimgui")
local esp_ativo = true


function esp()
  if esp_ativo then
    local myX, myY, myZ = getCharCoordinates(PLAYER_PED)
    local cx, cy = convert3DCoordsToScreen(myX, myY, myZ)
    for id = 0,400 do
      if sampIsPlayerConnected(id) then
        local result, ped = sampGetCharHandleBySampPlayerId(id)
        if result and doesCharExist(ped) then
          local ix, iy, iz = getCharCoordinates(ped)
          local sx, sy = convert3DCoordsToScreen(ix,iy,iz)
          if isPointOnScreen(ix,iy,iz, 1) then
            renderDrawLine(cx, cy, sx, sy, 1.0, 0xFFFF0000)
          end
        end
      end
    end
  end
end
function main()
  while true do
    repeat wait(0) until isSampAvailable()
    esp()
  end    
end
