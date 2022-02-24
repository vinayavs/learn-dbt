import datetime
import shutil
from prefect import Flow
from prefect.tasks.dbt import DbtShellTask
from prefect.schedules import IntervalSchedule


def build_flow(schedule=None):
    with Flow(name="learn-dbt", schedule=schedule) as flow:
        task = DbtShellTask(
            profile_name='learn-dbt',
            environment='dev',
            dbt_kwargs={
        'type': 'snowflake',
        'account': 'nr96745.ap-south-1.aws',

        # User/password auth
        'user': 'vinssitsol',
        'password': 'Applmgr@11',
        'role': 'ACCOUNTADMIN',
        'database': 'analytics',
        'warehouse': 'transform_wh',
        'schema': 'dbt',
        'threads': 1,
        'client_session_keep_alive': False
            },
            overwrite_profiles=True,
            profiles_dir=r"/home/vagrant/.dbt/"
        )(command='dbt run --models example.my_first_dbt_model')
    return flow

schedule = IntervalSchedule(
    start_date=datetime.datetime.now() + datetime.timedelta(seconds=5),
    interval=datetime.timedelta(seconds=10)
)

flow = build_flow()
# flow.visualize()
flow.run()