-- Decompiled using luadec 2.1 UNICODE by sztupy (http://winmo.sztupy.hu) and viruscamp 
-- Command line was: spopup.lub 

SPUI_IDS = {SPU_CHAT = 0, SPU_FLOATING = 1, SPU_FLOATING_CHAT = 2}
popuptbl = {
[1] = {uitype = SPUI_IDS.SPU_CHAT, textcolor = 16763904, 
Description = {"���a�ϾA�Χ�ù�����ȧ𫰾ԱM��PVP�W�h�C", "�����ޯ�P�D�㪺��O�N�|�վ�A�έ����\\��P�ϥΡC"}}, 
[2] = {uitype = SPUI_IDS.SPU_FLOATING_CHAT, textcolor = 16763904, 
Description = {"���a�ϾA�Χ�ù�����ȧ𫰾ԱM��PVP�W�h�C", "�����ޯ�P�D�㪺��O�N�|�վ�A�έ����\\��P�ϥΡC"}}, 
[7] = {uitype = SPUI_IDS.SPU_FLOATING_CHAT, textcolor = 16763904, 
Description = {"�w�i�J�ͪ���`�h�C", "�T��ϥ��������ʨt�ޯ�ιD��C", "�T��ϥΤ@�������ʬ����ޯ�C"}}}
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


