import pandas as pd

df = pd.read_csv('input.csv')
#df['date'] = pd.DatetimeIndex(df.date).normalize()
df['count'] = df.groupby('timestamp')['timestamp'].transform('count')
df = df[['host','status','byte', 'timestamp','count']]
df=df.drop_duplicates(subset=['timestamp']).sort_values(by=['count'])
print(df)
