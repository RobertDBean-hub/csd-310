import mysql.connector
from mysql.connector import errorcode

config = {
    "user": "root",
    "password": "XboxLive01!!",
    "host": "127.0.0.1",
    "database": "movies",
    "raise_on_warnings": True,
}

def show_films(cursor, title):
    query = """
    SELECT film_name AS 'Film Name', film_director AS Director, genre_name AS 'Genre Name ID', studio_name AS 'Studio Name'
    FROM film
    INNER JOIN genre ON film.genre_id = genre.genre_id
    INNER JOIN studio ON film.studio_id = studio.studio_id
    ORDER BY FIELD(film_name, 'Gladiator', 'Alien', 'Get Out', 'Event Horizon')
    """
    cursor.execute(query)
    films = cursor.fetchall()

    print("\n-- {} --".format(title))
    for film in films:
        print("Film Name: {}\nDirector: {}\nGenre Name ID: {}\nStudio Name: {}\n".format(film[0], film[1], film[2], film[3]))

def insert_film(cursor, db):
    insert_query = """
    INSERT INTO film (film_name, film_releaseDate, film_runtime, film_director, studio_id, genre_id)
    VALUES ('Event Horizon', '1997', 96, 'Paul W.S. Anderson', 
            (SELECT studio_id FROM studio WHERE studio_name = 'Universal Pictures'), 
            (SELECT genre_id FROM genre WHERE genre_name = 'SciFi'))
    """
    cursor.execute(insert_query)
    db.commit()

def update_film(cursor, db):
    update_query = """
    UPDATE film
    SET genre_id = (SELECT genre_id FROM genre WHERE genre_name = 'Horror')
    WHERE film_name = 'Alien'
    """
    cursor.execute(update_query)
    db.commit()

def delete_film(cursor, db):
    delete_query = "DELETE FROM film WHERE film_name = 'Gladiator'"
    cursor.execute(delete_query)
    db.commit()

try:
    db = mysql.connector.connect(**config)
    cursor = db.cursor()

    print("\n Database user {} connected to MySQL on host {} with database {}"
          .format(config["user"], config["host"], config["database"]))

    input("\n\n Press any key to continue...")

    show_films(cursor, "DISPLAYING FILMS")

    insert_film(cursor, db)
    show_films(cursor, "DISPLAYING FILMS AFTER INSERT")

    update_film(cursor, db)
    show_films(cursor, "DISPLAYING FILMS AFTER UPDATE- Changed Alien to Horror")

    delete_film(cursor, db)
    show_films(cursor, "DISPLAYING FILMS AFTER DELETE")

except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print(" The supplied username or password are invalid")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print(" The specified database does not exist")
    else:
        print(err)

finally:
    db.close()
