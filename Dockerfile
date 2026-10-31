FROM python:3.12-slim

WORKDIR /app

RUN useradd --system --create-home --shell /usr/sbin/nologin app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .
RUN chown -R app:app /app

USER app

EXPOSE 8003

CMD ["gunicorn", "--bind", "0.0.0.0:8003", "app:app"]
