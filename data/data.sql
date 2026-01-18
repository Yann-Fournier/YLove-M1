INSERT INTO Users (user_id, email, password_hash, nom, prenom, age, genre) VALUES 
    ('a52f0e58-a88c-4098-846b-5af80398ac87', 'yann.fournier@mail.com', '4d7c48af85e52e027c0d0ab08469646a3370f8357d798d6e40ba11f06521cfb9', 'Fournier', 'Yann', 21, 'M'),
    ('de7e320d-00f3-4161-a7dc-eb78ea6e92a9', 'elodie.senel@mail.com', 'e29dd7f12d51098c4725e99bcb9f82180d1a8934155962b023f807b55d34c3df', 'Senel', 'Elodie', 22, 'F');

INSERT INTO Profil_Embeddings (user_id, embeddings_id) VALUES 
    -- Hobbies Yann : ['Développement web', 'Écriture de journal', 'Saxophone', 'Boxe', 'Sudoku']
    ('a52f0e58-a88c-4098-846b-5af80398ac87', 138),
    ('a52f0e58-a88c-4098-846b-5af80398ac87', 117),
    ('a52f0e58-a88c-4098-846b-5af80398ac87', 107),
    ('a52f0e58-a88c-4098-846b-5af80398ac87', 46),
    ('a52f0e58-a88c-4098-846b-5af80398ac87', 123),
    -- Traits Yann : ['Rationnel', 'Solitaire', 'Endurant', 'Motivé']
    ('a52f0e58-a88c-4098-846b-5af80398ac87', 265),
    ('a52f0e58-a88c-4098-846b-5af80398ac87', 269),
    ('a52f0e58-a88c-4098-846b-5af80398ac87', 226),
    ('a52f0e58-a88c-4098-846b-5af80398ac87', 237),
    -- Job Yann : 'Conducteur de train'
    ('a52f0e58-a88c-4098-846b-5af80398ac87', 449),

    -- Hobbies Elodie : ['Judo', 'Bonsaï', 'Sciences']
    ('de7e320d-00f3-4161-a7dc-eb78ea6e92a9', 47),
    ('de7e320d-00f3-4161-a7dc-eb78ea6e92a9', 155),
    ('de7e320d-00f3-4161-a7dc-eb78ea6e92a9', 136),
    -- Traits Elodie : ['Indécis']
    ('de7e320d-00f3-4161-a7dc-eb78ea6e92a9', 258),
    -- Job Elodie : 'Manager'
    ('de7e320d-00f3-4161-a7dc-eb78ea6e92a9', 386);

INSERT INTO Envies (user_id, genre, Age_min, Age_max) VALUES 
    ('a52f0e58-a88c-4098-846b-5af80398ac87', 'F', 20, 25),
    ('de7e320d-00f3-4161-a7dc-eb78ea6e92a9', 'M', 25, 35);

INSERT INTO Envies_Embeddings (envies_id, embeddings_id) VALUES
    -- Hobbies rechercher Yann : ['Intelligence artificielle', 'Sculpture', 'Golf', 'Crochet']
    (1, 140),
    (1, 61),
    (1, 35),
    (1, 185),
    -- Traits rechercher Yann : ['Impulsif', 'Honnête', 'Enthousiaste', 'Motivé', 'Intolérant']
    (1, 282),
    (1, 230),
    (1, 227),
    (1, 237),
    (1, 286),
    -- Job rechercher Yann : 'Livreur'
    (1, 447),

    -- Hobbies rechercher Elodie : ['Crossfit', 'Trompette', 'Casse-têtes', 'Voyage']
    (1, 42),
    (1, 108),
    (1, 125),
    (1, 201),
    -- Traits rechercher Elodie : ['Fainéant', 'Inconstant', 'Pessimiste', 'Envieux']
    (1, 280),
    (1, 283),
    (1, 290),
    (1, 279),
    -- Job rechercher Elodie : 'Magasinier'
    (1, 456);
