CREATE TABLE IF NOT EXISTS Embeddings (
    embeddings_id INTEGER PRIMARY KEY AUTOINCREMENT,
    model_version VARCHAR(100),
    categorie VARCHAR(50),
    text_initial TEXT,
    vecteur VECTOR(384)
);

CREATE TABLE IF NOT EXISTS Users (
    user_id GUID PRIMARY KEY,
    email VARCHAR(100),
    password_hash VARCHAR(255),
    nom VARCHAR(100),
    prenom VARCHAR(100),
    age INTEGER,
    genre VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Profil_Embeddings (
    profil_embeddings_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id GUID,
    embeddings_id INTEGER,
    -- score_similarite FLOAT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (embeddings_id) REFERENCES Embeddings(embeddings_id)
);

CREATE TABLE IF NOT EXISTS Envies (
    envies_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id GUID,
    genre VARCHAR(50),
    Age_min INTEGER,
    Age_max INTEGER,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE IF NOT EXISTS Envies_Embeddings (
    envies_embeddings_id INTEGER PRIMARY KEY AUTOINCREMENT,
    envies_id INTEGER,
    embeddings_id INTEGER,
    FOREIGN KEY (envies_id) REFERENCES Envies(envies_id),
    FOREIGN KEY (embeddings_id) REFERENCES Embeddings(embeddings_id)
);