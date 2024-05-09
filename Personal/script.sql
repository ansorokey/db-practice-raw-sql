DROP TABLE IF EXISTS monsters;
DROP TABLE IF EXISTS monster_types;
DROP TABLE IF EXISTS locales;
DROP TABLE IF EXISTS monster_locales;

CREATE TABLE monsters (
    monster_id INTEGER PRIMARY KEY AUTOINCREMENT,
    monster_name VARCHAR(50),
    monster_type VARCHAR(50)
);

CREATE TABLE monster_types (
    monster_type_id INTEGER PRIMARY KEY, 
    monster_type VARCHAR(50)
);

CREATE TABLE locales (
    locale_id INTEGER PRIMARY KEY,  
    locale_name VARCHAR(50)
);

CREATE TABLE monster_locales (
    monster_locale_id INTEGER, 
    monster_id INTEGER,
    locale_id INTEGER
);

INSERT INTO monsters (monster_name)
VALUES
    ('Great Jagras');

INSERT INTO locales (locale_name)
VALUES
    ('Ancient Forest'),
    ('Wildspire Wastes'),
    ('Coral Highlnds'),
    ('Rotten Vale'),
    ('Elder''s Recess'),
    ('Hoarfrost Reach');