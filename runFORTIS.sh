conda activate fortis
source .env
if psql -lqt | cut -d \| -f 1 | grep -qw "FORTIS"; then
  continue
else
  createdb FORTIS
fi
python manage.py db upgrade
python manage.py runserver
