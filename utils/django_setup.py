import sys
import os
import django
sys.path.append('/Users/offg/develop/al/atamaplus')
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'restapi.conf.settings.test')
_ = django.setup()
