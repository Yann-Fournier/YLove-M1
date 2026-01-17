CREATE TABLE IF NOT EXISTS Embeddings (
    embeddings_id INTEGER PRIMARY KEY AUTOINCREMENT,
    model_version VARCHAR(100),
    categorie VARCHAR(50),
    text_initial TEXT,
    vecteur VECTOR(384)
);