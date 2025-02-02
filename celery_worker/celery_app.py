import os
from celery import Celery
import dotenv
dotenv.load_dotenv()

# Use your public Redis URL
REDIS_URL = os.getenv("REDIS_URL")

# Initialize Celery
app = Celery("celery_worker", broker=REDIS_URL, backend=REDIS_URL)