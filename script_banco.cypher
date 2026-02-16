// --- 1. CRIAÇÃO DE CONSTRAINTS (GARANTIR IDs ÚNICOS) ---
CREATE CONSTRAINT user_id_unique IF NOT EXISTS FOR (u:User) REQUIRE u.id IS UNIQUE;
CREATE CONSTRAINT movie_id_unique IF NOT EXISTS FOR (m:Movie) REQUIRE m.id IS UNIQUE;

// --- 2. CRIAÇÃO DE GÊNEROS ---
CREATE (g1:Genre {name: 'Sci-Fi'}),
       (g2:Genre {name: 'Drama'}),
       (g3:Genre {name: 'Ação'}),
       (g4:Genre {name: 'Terror'});

// --- 3. CRIAÇÃO DE ATORES E DIRETORES ---
CREATE (d1:Director {name: 'Christopher Nolan'}),
       (d2:Director {name: 'Lana Wachowski'}),
       (d3:Director {name: 'Quentin Tarantino'}),
       (a1:Actor {name: 'Leonardo DiCaprio'}),
       (a2:Actor {name: 'Keanu Reeves'}),
       (a3:Actor {name: 'Brad Pitt'});

// --- 4. CRIAÇÃO DE FILMES E RELACIONAMENTOS (DIRETOR, ATOR, GÊNERO) ---
CREATE (m1:Movie {id: 'M1', title: 'Inception'})
CREATE (d1)-[:DIRECTED]->(m1)
CREATE (a1)-[:ACTED_IN]->(m1)
CREATE (m1)-[:BELONGS_TO]->(g1);

CREATE (m2:Movie {id: 'M2', title: 'Interstellar'})
CREATE (d1)-[:DIRECTED]->(m2)
CREATE (m2)-[:BELONGS_TO]->(g1);

CREATE (m3:Movie {id: 'M3', title: 'The Matrix'})
CREATE (d2)-[:DIRECTED]->(m3)
CREATE (a2)-[:ACTED_IN]->(m3)
CREATE (m3)-[:BELONGS_TO]->(g1);

CREATE (m4:Movie {id: 'M4', title: 'Fight Club'})
CREATE (a3)-[:ACTED_IN]->(m4)
CREATE (m4)-[:BELONGS_TO]->(g2);

CREATE (m5:Movie {id: 'M5', title: 'Pulp Fiction'})
CREATE (d3)-[:DIRECTED]->(m5)
CREATE (m5)-[:BELONGS_TO]->(g3);

CREATE (m6:Movie {id: 'M6', title: 'John Wick'})
CREATE (a2)-[:ACTED_IN]->(m6)
CREATE (m6)-[:BELONGS_TO]->(g3);

CREATE (m7:Movie {id: 'M7', title: 'Stranger Things', type: 'Serie'})
CREATE (m7)-[:BELONGS_TO]->(g1);

CREATE (m8:Movie {id: 'M8', title: 'The Dark Knight'})
CREATE (d1)-[:DIRECTED]->(m8)
CREATE (m8)-[:BELONGS_TO]->(g3);

CREATE (m9:Movie {id: 'M9', title: 'The Irishman'})
CREATE (m9)-[:BELONGS_TO]->(g2);

CREATE (m10:Movie {id: 'M10', title: 'Parasite'})
CREATE (m10)-[:BELONGS_TO]->(g2);

// --- 5. CRIAÇÃO DE USUÁRIOS E AVALIAÇÕES (WATCHED COM RATING) ---
CREATE (u1:User {id: 'U1', name: 'Alice'}), (u2:User {id: 'U2', name: 'Bruno'}),
       (u3:User {id: 'U3', name: 'Carla'}), (u4:User {id: 'U4', name: 'Diego'}),
       (u5:User {id: 'U5', name: 'Elena'}), (u6:User {id: 'U6', name: 'Fabio'}),
       (u7:User {id: 'U7', name: 'Gisele'}), (u8:User {id: 'U8', name: 'Hugo'}),
       (u9:User {id: 'U9', name: 'Iara'}), (u10:User {id: 'U10', name: 'Joao'});

// Conectando usuários aos filmes com Notas (Rating)
MATCH (u:User {id: 'U1'}), (m:Movie {id: 'M1'}) CREATE (u)-[:WATCHED {rating: 5}]->(m);
MATCH (u:User {id: 'U2'}), (m:Movie {id: 'M3'}) CREATE (u)-[:WATCHED {rating: 4}]->(m);
MATCH (u:User {id: 'U3'}), (m:Movie {id: 'M2'}) CREATE (u)-[:WATCHED {rating: 5}]->(m);
MATCH (u:User {id: 'U4'}), (m:Movie {id: 'M5'}) CREATE (u)-[:WATCHED {rating: 3}]->(m);
MATCH (u:User {id: 'U5'}), (m:Movie {id: 'M10'}) CREATE (u)-[:WATCHED {rating: 5}]->(m);
MATCH (u:User {id: 'U6'}), (m:Movie {id: 'M8'}) CREATE (u)-[:WATCHED {rating: 5}]->(m);
MATCH (u:User {id: 'U7'}), (m:Movie {id: 'M4'}) CREATE (u)-[:WATCHED {rating: 4}]->(m);
MATCH (u:User {id: 'U8'}), (m:Movie {id: 'M6'}) CREATE (u)-[:WATCHED {rating: 4}]->(m);
MATCH (u:User {id: 'U9'}), (m:Movie {id: 'M7'}) CREATE (u)-[:WATCHED {rating: 2}]->(m);
MATCH (u:User {id: 'U10'}), (m:Movie {id: 'M9'}) CREATE (u)-[:WATCHED {rating: 5}]->(m);