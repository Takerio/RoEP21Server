-- Decompiled using luadec 2.1 UNICODE by sztupy (http://winmo.sztupy.hu) and viruscamp 
-- Command line was: spopup.lub 

SPUI_IDS = {SPU_CHAT = 0, SPU_FLOATING = 1, SPU_FLOATING_CHAT = 2}
popuptbl = {
[1] = {uitype = SPUI_IDS.SPU_CHAT, textcolor = 16763904, 
Description = {"此地區適用希羅斯里亞攻城戰專用PVP規則。", "部分技能與道具的能力將會調整，或限制其功\能與使用。"}}, 
[2] = {uitype = SPUI_IDS.SPU_FLOATING_CHAT, textcolor = 16763904, 
Description = {"此地區適用希羅斯里亞攻城戰專用PVP規則。", "部分技能與道具的能力將會調整，或限制其功\能與使用。"}}, 
[7] = {uitype = SPUI_IDS.SPU_FLOATING_CHAT, textcolor = 16763904, 
Description = {"已進入生物圈深層。", "禁止使用瞬間移動系技能及道具。", "禁止使用一部分移動相關技能。"}}}
main = function()
  for ppID,PPDESC in pairs(popuptbl) do
    result, msg = AddMsg(ppID, PPDESC.uitype, PPDESC.textcolor), ppID
    if not result then
      return false, msg
    end
    for k,v in pairs(PPDESC.Description) do
      result, msg = AddDesc(ppID, v), ppID
      if not result then
        return false, msg
      end
    end
  end
  return true, "good"
end


