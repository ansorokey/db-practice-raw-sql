#!/usr/bin/env python3
# Copyright 2021 BHG [bw.org]
# as of 2021-04-07 bw

import sqlite3
# import mysql.connector as mysql


def main():
    # usually we insert a db filename here
    # what is currently passed opens an in memory database
    db = sqlite3.connect(":memory:")
    # db = msql.connect(host="localhost", user="", password="")

    # the cursor is the object that queries the database
    # returns rows of results as tuples
    cur = db.cursor()


    cur.execute("SELECT sqlite_version()")

    # returns a tuple of rows, we select the first one
    version = cur.fetchone()[0]
    print(f"SQLite version {version}")

    cur.close()
    db.close()


if __name__ == "__main__":
    main()
