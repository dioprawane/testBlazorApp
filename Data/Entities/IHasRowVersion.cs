namespace GestionBudgétaire.Data.Entities
{
        // JQ : Cette interface est utilisé pour pouvoir mettre en place la concurrence d'accès Optimistic
        // sur les entités
        public interface IHasRowVersion
        {
            byte[] RowVersion { get; set; }
        }
  
}
