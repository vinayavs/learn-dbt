# Base Image
FROM prefecthq/prefect:0.14.10


# Install Dependancies
WORKDIR /usr/test-dbt
RUN pip install dbt-core dbt-snowflake
RUN pip install boto3
RUN mkdir /root/.dbt
COPY ./ ./
RUN mv profiles.yml /root/.dbt/
RUN mv .aws ~

# Startup Command
CMD ["python","./dbt_run.py"]