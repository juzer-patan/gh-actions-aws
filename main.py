import datetime

def main():
    db_host = os.getenv('STAGING_DB_HOST', 'Hello')
    db_username = os.getenv('STAGING_DB_USERNAME', 'World')
    print(f"Host : {db_host}, Username: {db_username}")
    print(f"Current date and time: {datetime.datetime.now()}")

if __name__ == "__main__":
    main()
