#!/bin/bash
set -e

until (echo > /dev/tcp/${DB_HOST:-db}/${DB_PORT:-5432}) >/dev/null 2>&1; do
  echo "Waiting for PostgreSQL..."
  sleep 2
done


# Configure database from environment
cat > config/database.yml <<EOF
production:
  adapter: postgresql
  host: ${DB_HOST:-db}
  port: ${DB_PORT:-5432}
  database: ${DB_NAME:-foreman}
  username: ${DB_USER:-foreman}
  password: ${DB_PASSWORD:-foreman}
  pool: 5
EOF

# Run migrations on first start
if [ ! -f /tmp/.db_migrated ]; then
  bundle exec rake db:migrate
  bundle exec rake db:seed
  touch /tmp/.db_migrated
fi

exec "$@"
