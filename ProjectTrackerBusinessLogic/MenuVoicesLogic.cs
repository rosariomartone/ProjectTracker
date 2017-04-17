using ProjectTrackerDataAccess;
using ProjectTrackerEntities;
using System.Collections.Generic;

namespace ProjectTrackerBusinessLogic
{
    public class MenuVoicesLogic
    {
        public static List<MenuBarVoices> GetMenuVoicesByMenuId(int id)
        {
            MenuVoicesDataAccess mv = new MenuVoicesDataAccess();

            return mv.GetMenuVoicesByMenuId(id);
        }
    }
}
