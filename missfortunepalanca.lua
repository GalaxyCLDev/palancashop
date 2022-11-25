local missFortuneAction = Action() -- este es nuestro encabezado, lo primero que tenemos que escribir (a excepcin de las tablas de configuracin y des)
local itemdecompra = {  ---- item que te dara al jalar la palanca
    itemid = 4846,  --- item que eliges 
}

function missFortuneAction.onUse(player, item, fromPosition, target, toPosition, isHotkey) -- ahora podemos disear la accin en esta forma
    local DiamanteVip = player:getItemCount(itemdecompra.tokenId)
    if player:removeItem(13350, 100) then  ---este remueve dinero crystal coins
        player:addItem(itemdecompra.itemid, 1) ---- agrega el item al jugador ( si quieres que te de mas de 1 item cambia el numero "1" ala cantidad que quieras
        player:sendCancelMessage("Su compra fue exitosa.")   --- mensaje de compra exitosa
        fromPosition:sendMagicEffect(CONST_ME_HEARTS)  --- efecto sobre el jugador si la compra fue exitosa
    else
        player:sendCancelMessage("No tienes suficiente DiamantesVip.")  --- mensaje de compra fallida
        fromPosition:sendMagicEffect(CONST_ME_POFF) --- efecto sobre l jugador si la compra fue fallida
    end
    return true
end

missFortuneAction:aid(701) -- el id que va en la palanca del mapa editor ACTIONID
missFortuneAction:register() -- este es nuestro pie de pagina, tiene que ser la ultima funcion ejecutada