local menuVisible = false --- panel kapalı
local scx, scy = guiGetScreenSize()
local px = scx/1920
local sizeX, sizeY = 400*px, 500*px
local posX, posY = scx/2-sizeX/2, scy/2-sizeY/2
local enableAlpha = false
local alpha = 0

function menuDraw()
	if enableAlpha == true then  --- eğer "alpha" değişkeni aktif edilmişse / if açıldı.
		if alpha <= 250 then --- eğer şeffaflık(alpha) 250 sayısından az ise
			alpha = alpha + 5 --- 250 sayısına ulaşana kadar, 5 ekle
		end
	elseif enableAlpha == false then --- eğer "alpha" değişkeni aktif değilse
		if alpha >= 5 then --- eğer "alpha" değişkeni 5 ten büyük ise
			alpha = alpha - 5 --- "alpha" değişkeni 5 olana kadar 5 eksilt
		end
	end -- if kapandı
	dxDrawRectangle(posX, posY, sizeX, sizeY, tocolor(0,0,0,alpha))
	if alpha <= 0 then --- eğer "alpha" değişkeni 0 ise
		removeEventHandler("onClientRender",root,menuDraw) --- Oluşturulan menüyü kapat
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
