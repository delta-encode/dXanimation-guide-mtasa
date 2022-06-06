local menuVisible = false
local x, y = guiGetScreenSize()
local px = x/1920
local sx, sy = 400*px, 500*px
local psx, psy = x/2-sx/2, y/2-sy/2
local enableAlpha = false
local alpha = 0

function menuDraw()
	if enableAlpha == true then
		if alpha <= 250 then
			alpha = alpha + 5
		end
	elseif enableAlpha == false then
		if alpha >= 5 then
			alpha = alpha - 5
		end
	end
	dxDrawRectangle(psx, psy, sx, sy, tocolor(0,0,0,alpha))
	if alpha <= 0 then
		removeEventHandler("onClientRender",root,menuDraw)
	end
end

function menuOpen()
	if menuVisible then
		showCursor(false)
		showChat(true)
		enableAlpha = false
	else
		addEventHandler("onClientRender",root,menuDraw)
		showCursor(true)
		showChat(false)
		enableAlpha = true
	end
menuVisible = not menuVisible
end
bindKey("f1","down",menuOpen)
