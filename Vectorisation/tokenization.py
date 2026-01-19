
import pandas as pd
import numpy as np

# 1) Jeu de données SYNTHÉTIQUE (démo)
data = [
    {"ID":1, "NOM":"Martin", "PRENOM":"Léa", "SEXE":"F", "AGE":25, "VILLE":"Paris", "HOBBY":"cinéma; yoga; lecture", "CARACTERE":"calme; curieuse"},
    {"ID":2, "NOM":"Durand", "PRENOM":"Lucas", "SEXE":"M", "AGE":28, "VILLE":"Lyon", "HOBBY":"football; jeux vidéo; cuisine", "CARACTERE":"sociable; énergique"},
    {"ID":3, "NOM":"Bernard", "PRENOM":"Emma", "SEXE":"F", "AGE":24, "VILLE":"Marseille", "HOBBY":"randonnée; photographie", "CARACTERE":"aventureuse; empathique"},
    {"ID":4, "NOM":"Petit", "PRENOM":"Noé", "SEXE":"M", "AGE":31, "VILLE":"Paris", "HOBBY":"lecture; cuisine; théâtre", "CARACTERE":"réfléchi; calme"},
    {"ID":5, "NOM":"Roux", "PRENOM":"Zoé", "SEXE":"F", "AGE":29, "VILLE":"Lille", "HOBBY":"yoga; danse; cinéma", "CARACTERE":"sociable; optimiste"},
]

df = pd.DataFrame(data)

# 2) Avant : données brutes
avant = df.copy()

# 3) Vectorisation
# 3.a AGE min-max
age = df["AGE"].astype(float)
age_min, age_max = age.min(), age.max()
age_scaled = (age - age_min) / (age_max - age_min)

# 3.b SEXE one-hot
sexe_onehot = pd.get_dummies(df["SEXE"], prefix="SEXE")

# 3.c VILLE one-hot (démo)
ville_onehot = pd.get_dummies(df["VILLE"], prefix="VILLE")

# 3.d HOBBY & CARACTERE -> bag-of-words binaire
def split_tokens(s):
    if pd.isna(s) or s.strip()=="":
        return []
    return [t.strip().lower() for t in s.replace(",",";").split(";") if t.strip()]

hobby_tokens = df["HOBBY"].apply(split_tokens)
caract_tokens = df["CARACTERE"].apply(split_tokens)

vocab_hobby = sorted(set([tok for toks in hobby_tokens for tok in toks]))
vocab_caract = sorted(set([tok for toks in caract_tokens for tok in toks]))

H = np.zeros((len(df), len(vocab_hobby)), dtype=int)
C = np.zeros((len(df), len(vocab_caract)), dtype=int)
for i, toks in enumerate(hobby_tokens):
    for tok in toks:
        H[i, vocab_hobby.index(tok)] = 1
for i, toks in enumerate(caract_tokens):
    for tok in toks:
        C[i, vocab_caract.index(tok)] = 1

hobby_df = pd.DataFrame(H, columns=[f"HOBBY_{t}" for t in vocab_hobby])
caract_df = pd.DataFrame(C, columns=[f"CARACT_{t}" for t in vocab_caract])

# 4) Concaténer
X = pd.concat([
    age_scaled.rename("AGE_scaled"),
    sexe_onehot,
    ville_onehot,
    hobby_df,
    caract_df
], axis=1)

# 5) Pondération et similarité cosine
weights = pd.Series(1.0, index=X.columns)
for col in X.columns:
    if col.startswith("HOBBY_"):
        weights[col] = 1.5
    if col.startswith("CARACT_"):
        weights[col] = 1.5
    if col.startswith("VILLE_"):
        weights[col] = 0.8
    if col.startswith("SEXE_"):
        weights[col] = 0.7
    if col == "AGE_scaled":
        weights[col] = 1.0

Xw = X * weights

def cosine_sim(a, b):
    a = np.asarray(a, dtype=float)
    b = np.asarray(b, dtype=float)
    na = np.linalg.norm(a)
    nb = np.linalg.norm(b)
    if na==0 or nb==0:
        return 0.0
    return float(np.dot(a, b) / (na * nb))

S = np.zeros((len(df), len(df)))
for i in range(len(df)):
    for j in range(len(df)):
        S[i, j] = cosine_sim(Xw.iloc[i].values, Xw.iloc[j].values)
sim_df = pd.DataFrame(S, index=df["ID"], columns=df["ID"]).round(3)

# 6) Exemple de recommandations pour ID=1
user_id = 1
user_index = df.index[df["ID"]==user_id][0]
scores_sorted = sim_df.iloc[user_index].sort_values(ascending=False)
scores_sorted = scores_sorted[scores_sorted.index != user_id]
recommend_top3 = scores_sorted.head(3)

print("Vectorisation OK. Colonnes:", list(X.columns))
print("Top-3 pour ID=1:\n", recommend_top3)