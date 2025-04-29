namespace GestionBudgétaire.Data.Services
{
    // JQ : En lien avec l'edition générique des tables, permet de cloner une entité
    // TODO : Ce n'est pas du clonage profond, seul les propriété de premier niveau sont copiées,
    // peut être à revoir, en utilisant la serialization/deserialization via JSON
    public static class EntityExtensions
    {
        public static TEntity? Clone<TEntity>(this TEntity entity)
        {
            if (entity == null) return default;

            // JQ : Crée une nouvelle instance de l'entité
            var clone = Activator.CreateInstance<TEntity>();

            // JQ :Copie les propriétés de l'entité originale dans le clone
            var properties = typeof(TEntity).GetProperties();
            foreach (var prop in properties)
            {
                if (prop.CanRead && prop.CanWrite)
                {
                    var value = prop.GetValue(entity);
                    prop.SetValue(clone, value);
                }
            }
            return clone;
        }
    }
}
