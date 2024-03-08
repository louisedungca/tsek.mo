# [tsek.mo](https://tsekmo.onrender.com)

Check all your to-dos with this simple [task management Rails app](https://tsekmo.onrender.com).

### Key Features:
1. **Group Tasks Per Category**: Organize your goals my creating categories that suit your tasks.  
2. **Manage Tasks Effortlessly**: Easily add, edit, and delete tasks with simple actions.
3. **View Tasks Due Today**: Have a view of your priorities for the day with the separate list of today's to-dos.

### Ruby version: ruby-3.3.0

### Dependencies
This app relies on **Rails 7**, **Tailwind CSS**, and **PostgreSQL**. 
It also uses extra gems for tasks like authentication(Devise), testing(Minitest), and more. Check the Gemfile and Gemfile.lock for the full list of gems and their versions.

### Configuration
1. Clone the repository to your local machine using the following command:

```bash
git clone git@github.com:louisedungca/tsek.mo.git
```
2. Once you have cloned the repository, navigate to the project directory and install the required dependencies using Bundler:

```bash
cd tsekmo
bundle install
```

3. Configure the database settings in the config/database.yml file according to your local database setup. Ensure that PostgreSQL is installed and running on your machine.

4. Run the database migrations to set up the database schema:

```bash
bin/rails db:create
bin/rails db:migrate
```

5. Once the configuration is complete, start the Rails server using bin/dev to run the application locally:

```bash
bin/dev
```

The application should now be accessible at http://localhost:3000 in your web browser.
