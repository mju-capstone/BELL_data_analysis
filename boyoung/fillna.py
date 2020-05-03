#!/usr/bin/env python
# coding: utf-8

# In[79]:


import pandas as pd
data14 = pd.read_csv('data14.csv', encoding='EUC-KR')
data14


# In[80]:


data14.isnull().sum()


# In[81]:


data14.groupby('풍향2').pm10.mean()


# In[82]:


data14.pm10.isnull().sum()


# In[83]:


df = pd.DataFrame(columns=['시간', '풍향', 'pm10', '풍향2'])

for i in range(0, 8649, 24):
    data = data14.iloc[i:i+24]
    a = data.pm10.isnull().sum()
    if not a == 0:
        df2 = data.fillna(data.mean())
        df = df.append(df2)
    else:
        df = df.append(data)


# In[84]:


df


# In[85]:


df.pm10.isnull().sum()


# In[86]:


df.groupby('풍향2').pm10.mean()


# In[87]:


df.to_csv('df14.csv', header=True, index=False, encoding='EUC-KR')


# In[ ]:




