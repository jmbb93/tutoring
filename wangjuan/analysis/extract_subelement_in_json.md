

```python
import pandas as pd
import numpy as np
```


```python
df = pd.read_json("../refs/database.json")
```


```python
df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>description</th>
      <th>group</th>
      <th>id</th>
      <th>manufacturer</th>
      <th>nutrients</th>
      <th>portions</th>
      <th>tags</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Cheese, caraway</td>
      <td>Dairy and Egg Products</td>
      <td>1008</td>
      <td></td>
      <td>[{'value': 25.18, 'units': 'g', 'description':...</td>
      <td>[{'amount': 1, 'unit': 'oz', 'grams': 28.35}]</td>
      <td>[]</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Cheese, cheddar</td>
      <td>Dairy and Egg Products</td>
      <td>1009</td>
      <td></td>
      <td>[{'value': 24.9, 'units': 'g', 'description': ...</td>
      <td>[{'amount': 1, 'unit': 'cup, diced', 'grams': ...</td>
      <td>[]</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Cheese, edam</td>
      <td>Dairy and Egg Products</td>
      <td>1018</td>
      <td></td>
      <td>[{'value': 4.22, 'units': 'g', 'description': ...</td>
      <td>[{'amount': 1, 'unit': 'oz', 'grams': 28.35}, ...</td>
      <td>[]</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Cheese, feta</td>
      <td>Dairy and Egg Products</td>
      <td>1019</td>
      <td></td>
      <td>[{'value': 5.2, 'units': 'g', 'description': '...</td>
      <td>[{'amount': 1, 'unit': 'cup, crumbled', 'grams...</td>
      <td>[]</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Cheese, mozzarella, part skim milk</td>
      <td>Dairy and Egg Products</td>
      <td>1028</td>
      <td></td>
      <td>[{'value': 3.27, 'units': 'g', 'description': ...</td>
      <td>[{'amount': 1, 'unit': 'oz', 'grams': 28.35}]</td>
      <td>[]</td>
    </tr>
  </tbody>
</table>
</div>



```python
db_list=[]
for i in range(len(db)):
    db_list.append(pd.DataFrame(db[i],index=[0]))
```


```python
print(range(len(df)))
print(df.describe())
```

    range(0, 6636)
                     id
    count   6636.000000
    mean   15733.055304
    std     8715.095274
    min     1008.000000
    25%    10170.750000
    50%    14445.000000
    75%    19188.250000
    max    93600.000000
    


```python
df_subset = pd.DataFrame(df.nutrients.iloc[1])
df_subset['id'] = df.id
```


```python
df_subset.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>description</th>
      <th>group</th>
      <th>units</th>
      <th>value</th>
      <th>id</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Protein</td>
      <td>Composition</td>
      <td>g</td>
      <td>24.90</td>
      <td>1008</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Total lipid (fat)</td>
      <td>Composition</td>
      <td>g</td>
      <td>33.14</td>
      <td>1009</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Carbohydrate, by difference</td>
      <td>Composition</td>
      <td>g</td>
      <td>1.28</td>
      <td>1018</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Ash</td>
      <td>Other</td>
      <td>g</td>
      <td>3.93</td>
      <td>1019</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Energy</td>
      <td>Energy</td>
      <td>kcal</td>
      <td>403.00</td>
      <td>1028</td>
    </tr>
  </tbody>
</table>
</div>


