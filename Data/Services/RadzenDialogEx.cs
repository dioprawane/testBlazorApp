using Radzen.Blazor;

namespace GestionBudgétaire.Data.Services
{
    public class RadzenDialogEx : RadzenDialog
    {
        public new void Close(dynamic result)
        {   
            base.Close(null);
        }
    }
}
