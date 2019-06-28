

```python
import pandas as pd
import numpy as np
```


```python
df = pd.read_json("../refs/database.json")
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
df.iloc[1,].nutrients
```




    [{'value': 24.9,
      'units': 'g',
      'description': 'Protein',
      'group': 'Composition'},
     {'value': 33.14,
      'units': 'g',
      'description': 'Total lipid (fat)',
      'group': 'Composition'},
     {'value': 1.28,
      'units': 'g',
      'description': 'Carbohydrate, by difference',
      'group': 'Composition'},
     {'value': 3.93, 'units': 'g', 'description': 'Ash', 'group': 'Other'},
     {'value': 403.0, 'units': 'kcal', 'description': 'Energy', 'group': 'Energy'},
     {'value': 0.24, 'units': 'g', 'description': 'Sucrose', 'group': 'Sugars'},
     {'value': 0.23, 'units': 'g', 'description': 'Lactose', 'group': 'Sugars'},
     {'value': 0.15, 'units': 'g', 'description': 'Maltose', 'group': 'Sugars'},
     {'value': 0.0,
      'units': 'g',
      'description': 'Alcohol, ethyl',
      'group': 'Other'},
     {'value': 36.75,
      'units': 'g',
      'description': 'Water',
      'group': 'Composition'},
     {'value': 0.0, 'units': 'mg', 'description': 'Caffeine', 'group': 'Other'},
     {'value': 0.0, 'units': 'mg', 'description': 'Theobromine', 'group': 'Other'},
     {'value': 1684.0, 'units': 'kJ', 'description': 'Energy', 'group': 'Energy'},
     {'value': 0.52,
      'units': 'g',
      'description': 'Sugars, total',
      'group': 'Composition'},
     {'value': 0.0,
      'units': 'g',
      'description': 'Fiber, total dietary',
      'group': 'Composition'},
     {'value': 721.0,
      'units': 'mg',
      'description': 'Calcium, Ca',
      'group': 'Elements'},
     {'value': 0.68,
      'units': 'mg',
      'description': 'Iron, Fe',
      'group': 'Elements'},
     {'value': 28.0,
      'units': 'mg',
      'description': 'Magnesium, Mg',
      'group': 'Elements'},
     {'value': 512.0,
      'units': 'mg',
      'description': 'Phosphorus, P',
      'group': 'Elements'},
     {'value': 98.0,
      'units': 'mg',
      'description': 'Potassium, K',
      'group': 'Elements'},
     {'value': 621.0,
      'units': 'mg',
      'description': 'Sodium, Na',
      'group': 'Elements'},
     {'value': 3.11,
      'units': 'mg',
      'description': 'Zinc, Zn',
      'group': 'Elements'},
     {'value': 0.031,
      'units': 'mg',
      'description': 'Copper, Cu',
      'group': 'Elements'},
     {'value': 34.9,
      'units': 'mcg',
      'description': 'Fluoride, F',
      'group': 'Elements'},
     {'value': 0.01,
      'units': 'mg',
      'description': 'Manganese, Mn',
      'group': 'Elements'},
     {'value': 13.9,
      'units': 'mcg',
      'description': 'Selenium, Se',
      'group': 'Elements'},
     {'value': 1002.0,
      'units': 'IU',
      'description': 'Vitamin A, IU',
      'group': 'Vitamins'},
     {'value': 258.0,
      'units': 'mcg',
      'description': 'Retinol',
      'group': 'Vitamins'},
     {'value': 265.0,
      'units': 'mcg_RAE',
      'description': 'Vitamin A, RAE',
      'group': 'Vitamins'},
     {'value': 85.0,
      'units': 'mcg',
      'description': 'Carotene, beta',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mcg',
      'description': 'Carotene, alpha',
      'group': 'Vitamins'},
     {'value': 0.29,
      'units': 'mg',
      'description': 'Vitamin E (alpha-tocopherol)',
      'group': 'Vitamins'},
     {'value': 24.0,
      'units': 'IU',
      'description': 'Vitamin D',
      'group': 'Vitamins'},
     {'value': 0.6000000000000001,
      'units': 'mcg',
      'description': 'Vitamin D3 (cholecalciferol)',
      'group': 'Vitamins'},
     {'value': 0.6000000000000001,
      'units': 'mcg',
      'description': 'Vitamin D (D2 + D3)',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mcg',
      'description': 'Cryptoxanthin, beta',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mcg',
      'description': 'Lycopene',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mcg',
      'description': 'Lutein + zeaxanthin',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mg',
      'description': 'Tocopherol, gamma',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mg',
      'description': 'Tocopherol, delta',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mg',
      'description': 'Vitamin C, total ascorbic acid',
      'group': 'Vitamins'},
     {'value': 0.027,
      'units': 'mg',
      'description': 'Thiamin',
      'group': 'Vitamins'},
     {'value': 0.375,
      'units': 'mg',
      'description': 'Riboflavin',
      'group': 'Vitamins'},
     {'value': 0.08, 'units': 'mg', 'description': 'Niacin', 'group': 'Vitamins'},
     {'value': 0.41300000000000003,
      'units': 'mg',
      'description': 'Pantothenic acid',
      'group': 'Vitamins'},
     {'value': 0.074,
      'units': 'mg',
      'description': 'Vitamin B-6',
      'group': 'Vitamins'},
     {'value': 18.0,
      'units': 'mcg',
      'description': 'Folate, total',
      'group': 'Vitamins'},
     {'value': 0.8300000000000001,
      'units': 'mcg',
      'description': 'Vitamin B-12',
      'group': 'Vitamins'},
     {'value': 16.5,
      'units': 'mg',
      'description': 'Choline, total',
      'group': 'Vitamins'},
     {'value': 2.8,
      'units': 'mcg',
      'description': 'Vitamin K (phylloquinone)',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mcg',
      'description': 'Folic acid',
      'group': 'Vitamins'},
     {'value': 18.0,
      'units': 'mcg',
      'description': 'Folate, food',
      'group': 'Vitamins'},
     {'value': 18.0,
      'units': 'mcg_DFE',
      'description': 'Folate, DFE',
      'group': 'Vitamins'},
     {'value': 0.7000000000000001,
      'units': 'mg',
      'description': 'Betaine',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mg',
      'description': 'Vitamin E, added',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mcg',
      'description': 'Vitamin B-12, added',
      'group': 'Vitamins'},
     {'value': 105.0,
      'units': 'mg',
      'description': 'Cholesterol',
      'group': 'Other'},
     {'value': 21.092,
      'units': 'g',
      'description': 'Fatty acids, total saturated',
      'group': 'Other'},
     {'value': 9.391,
      'units': 'g',
      'description': 'Fatty acids, total monounsaturated',
      'group': 'Other'},
     {'value': 0.9420000000000001,
      'units': 'g',
      'description': 'Fatty acids, total polyunsaturated',
      'group': 'Other'},
     {'value': 0.0,
      'units': 'mcg',
      'description': 'Dihydrophylloquinone',
      'group': 'Vitamins'},
     {'value': 0.32,
      'units': 'g',
      'description': 'Tryptophan',
      'group': 'Amino Acids'},
     {'value': 0.886,
      'units': 'g',
      'description': 'Threonine',
      'group': 'Amino Acids'},
     {'value': 1.546,
      'units': 'g',
      'description': 'Isoleucine',
      'group': 'Amino Acids'},
     {'value': 2.385,
      'units': 'g',
      'description': 'Leucine',
      'group': 'Amino Acids'},
     {'value': 2.072,
      'units': 'g',
      'description': 'Lysine',
      'group': 'Amino Acids'},
     {'value': 0.652,
      'units': 'g',
      'description': 'Methionine',
      'group': 'Amino Acids'},
     {'value': 0.125,
      'units': 'g',
      'description': 'Cystine',
      'group': 'Amino Acids'},
     {'value': 1.311,
      'units': 'g',
      'description': 'Phenylalanine',
      'group': 'Amino Acids'},
     {'value': 1.202,
      'units': 'g',
      'description': 'Tyrosine',
      'group': 'Amino Acids'},
     {'value': 1.663,
      'units': 'g',
      'description': 'Valine',
      'group': 'Amino Acids'},
     {'value': 0.9410000000000001,
      'units': 'g',
      'description': 'Arginine',
      'group': 'Amino Acids'},
     {'value': 0.874,
      'units': 'g',
      'description': 'Histidine',
      'group': 'Amino Acids'},
     {'value': 0.7030000000000001,
      'units': 'g',
      'description': 'Alanine',
      'group': 'Amino Acids'},
     {'value': 1.6,
      'units': 'g',
      'description': 'Aspartic acid',
      'group': 'Amino Acids'},
     {'value': 6.092,
      'units': 'g',
      'description': 'Glutamic acid',
      'group': 'Amino Acids'},
     {'value': 0.429,
      'units': 'g',
      'description': 'Glycine',
      'group': 'Amino Acids'},
     {'value': 2.806,
      'units': 'g',
      'description': 'Proline',
      'group': 'Amino Acids'},
     {'value': 1.456,
      'units': 'g',
      'description': 'Serine',
      'group': 'Amino Acids'},
     {'value': 24.9,
      'units': 'g',
      'description': 'Protein',
      'group': 'Composition'},
     {'value': 33.14,
      'units': 'g',
      'description': 'Total lipid (fat)',
      'group': 'Composition'},
     {'value': 1.28,
      'units': 'g',
      'description': 'Carbohydrate, by difference',
      'group': 'Composition'},
     {'value': 3.93, 'units': 'g', 'description': 'Ash', 'group': 'Other'},
     {'value': 403.0, 'units': 'kcal', 'description': 'Energy', 'group': 'Energy'},
     {'value': 0.24, 'units': 'g', 'description': 'Sucrose', 'group': 'Sugars'},
     {'value': 0.23, 'units': 'g', 'description': 'Lactose', 'group': 'Sugars'},
     {'value': 0.15, 'units': 'g', 'description': 'Maltose', 'group': 'Sugars'},
     {'value': 0.0,
      'units': 'g',
      'description': 'Alcohol, ethyl',
      'group': 'Other'},
     {'value': 36.75,
      'units': 'g',
      'description': 'Water',
      'group': 'Composition'},
     {'value': 0.0, 'units': 'mg', 'description': 'Caffeine', 'group': 'Other'},
     {'value': 0.0, 'units': 'mg', 'description': 'Theobromine', 'group': 'Other'},
     {'value': 1684.0, 'units': 'kJ', 'description': 'Energy', 'group': 'Energy'},
     {'value': 0.52,
      'units': 'g',
      'description': 'Sugars, total',
      'group': 'Composition'},
     {'value': 0.0,
      'units': 'g',
      'description': 'Fiber, total dietary',
      'group': 'Composition'},
     {'value': 721.0,
      'units': 'mg',
      'description': 'Calcium, Ca',
      'group': 'Elements'},
     {'value': 0.68,
      'units': 'mg',
      'description': 'Iron, Fe',
      'group': 'Elements'},
     {'value': 28.0,
      'units': 'mg',
      'description': 'Magnesium, Mg',
      'group': 'Elements'},
     {'value': 512.0,
      'units': 'mg',
      'description': 'Phosphorus, P',
      'group': 'Elements'},
     {'value': 98.0,
      'units': 'mg',
      'description': 'Potassium, K',
      'group': 'Elements'},
     {'value': 621.0,
      'units': 'mg',
      'description': 'Sodium, Na',
      'group': 'Elements'},
     {'value': 3.11,
      'units': 'mg',
      'description': 'Zinc, Zn',
      'group': 'Elements'},
     {'value': 0.031,
      'units': 'mg',
      'description': 'Copper, Cu',
      'group': 'Elements'},
     {'value': 34.9,
      'units': 'mcg',
      'description': 'Fluoride, F',
      'group': 'Elements'},
     {'value': 0.01,
      'units': 'mg',
      'description': 'Manganese, Mn',
      'group': 'Elements'},
     {'value': 13.9,
      'units': 'mcg',
      'description': 'Selenium, Se',
      'group': 'Elements'},
     {'value': 1002.0,
      'units': 'IU',
      'description': 'Vitamin A, IU',
      'group': 'Vitamins'},
     {'value': 258.0,
      'units': 'mcg',
      'description': 'Retinol',
      'group': 'Vitamins'},
     {'value': 265.0,
      'units': 'mcg_RAE',
      'description': 'Vitamin A, RAE',
      'group': 'Vitamins'},
     {'value': 85.0,
      'units': 'mcg',
      'description': 'Carotene, beta',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mcg',
      'description': 'Carotene, alpha',
      'group': 'Vitamins'},
     {'value': 0.29,
      'units': 'mg',
      'description': 'Vitamin E (alpha-tocopherol)',
      'group': 'Vitamins'},
     {'value': 24.0,
      'units': 'IU',
      'description': 'Vitamin D',
      'group': 'Vitamins'},
     {'value': 0.6000000000000001,
      'units': 'mcg',
      'description': 'Vitamin D3 (cholecalciferol)',
      'group': 'Vitamins'},
     {'value': 0.6000000000000001,
      'units': 'mcg',
      'description': 'Vitamin D (D2 + D3)',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mcg',
      'description': 'Cryptoxanthin, beta',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mcg',
      'description': 'Lycopene',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mcg',
      'description': 'Lutein + zeaxanthin',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mg',
      'description': 'Tocopherol, gamma',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mg',
      'description': 'Tocopherol, delta',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mg',
      'description': 'Vitamin C, total ascorbic acid',
      'group': 'Vitamins'},
     {'value': 0.027,
      'units': 'mg',
      'description': 'Thiamin',
      'group': 'Vitamins'},
     {'value': 0.375,
      'units': 'mg',
      'description': 'Riboflavin',
      'group': 'Vitamins'},
     {'value': 0.08, 'units': 'mg', 'description': 'Niacin', 'group': 'Vitamins'},
     {'value': 0.41300000000000003,
      'units': 'mg',
      'description': 'Pantothenic acid',
      'group': 'Vitamins'},
     {'value': 0.074,
      'units': 'mg',
      'description': 'Vitamin B-6',
      'group': 'Vitamins'},
     {'value': 18.0,
      'units': 'mcg',
      'description': 'Folate, total',
      'group': 'Vitamins'},
     {'value': 0.8300000000000001,
      'units': 'mcg',
      'description': 'Vitamin B-12',
      'group': 'Vitamins'},
     {'value': 16.5,
      'units': 'mg',
      'description': 'Choline, total',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mcg',
      'description': 'Dihydrophylloquinone',
      'group': 'Vitamins'},
     {'value': 2.8,
      'units': 'mcg',
      'description': 'Vitamin K (phylloquinone)',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mcg',
      'description': 'Folic acid',
      'group': 'Vitamins'},
     {'value': 18.0,
      'units': 'mcg',
      'description': 'Folate, food',
      'group': 'Vitamins'},
     {'value': 18.0,
      'units': 'mcg_DFE',
      'description': 'Folate, DFE',
      'group': 'Vitamins'},
     {'value': 0.7000000000000001,
      'units': 'mg',
      'description': 'Betaine',
      'group': 'Vitamins'},
     {'value': 0.32,
      'units': 'g',
      'description': 'Tryptophan',
      'group': 'Amino Acids'},
     {'value': 0.886,
      'units': 'g',
      'description': 'Threonine',
      'group': 'Amino Acids'},
     {'value': 1.546,
      'units': 'g',
      'description': 'Isoleucine',
      'group': 'Amino Acids'},
     {'value': 2.385,
      'units': 'g',
      'description': 'Leucine',
      'group': 'Amino Acids'},
     {'value': 2.072,
      'units': 'g',
      'description': 'Lysine',
      'group': 'Amino Acids'},
     {'value': 0.652,
      'units': 'g',
      'description': 'Methionine',
      'group': 'Amino Acids'},
     {'value': 0.125,
      'units': 'g',
      'description': 'Cystine',
      'group': 'Amino Acids'},
     {'value': 1.311,
      'units': 'g',
      'description': 'Phenylalanine',
      'group': 'Amino Acids'},
     {'value': 1.202,
      'units': 'g',
      'description': 'Tyrosine',
      'group': 'Amino Acids'},
     {'value': 1.663,
      'units': 'g',
      'description': 'Valine',
      'group': 'Amino Acids'},
     {'value': 0.9410000000000001,
      'units': 'g',
      'description': 'Arginine',
      'group': 'Amino Acids'},
     {'value': 0.874,
      'units': 'g',
      'description': 'Histidine',
      'group': 'Amino Acids'},
     {'value': 0.7030000000000001,
      'units': 'g',
      'description': 'Alanine',
      'group': 'Amino Acids'},
     {'value': 1.6,
      'units': 'g',
      'description': 'Aspartic acid',
      'group': 'Amino Acids'},
     {'value': 6.092,
      'units': 'g',
      'description': 'Glutamic acid',
      'group': 'Amino Acids'},
     {'value': 0.429,
      'units': 'g',
      'description': 'Glycine',
      'group': 'Amino Acids'},
     {'value': 2.806,
      'units': 'g',
      'description': 'Proline',
      'group': 'Amino Acids'},
     {'value': 1.456,
      'units': 'g',
      'description': 'Serine',
      'group': 'Amino Acids'},
     {'value': 0.0,
      'units': 'mg',
      'description': 'Vitamin E, added',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mcg',
      'description': 'Vitamin B-12, added',
      'group': 'Vitamins'},
     {'value': 105.0,
      'units': 'mg',
      'description': 'Cholesterol',
      'group': 'Other'},
     {'value': 21.092,
      'units': 'g',
      'description': 'Fatty acids, total saturated',
      'group': 'Other'},
     {'value': 9.391,
      'units': 'g',
      'description': 'Fatty acids, total monounsaturated',
      'group': 'Other'},
     {'value': 0.9420000000000001,
      'units': 'g',
      'description': 'Fatty acids, total polyunsaturated',
      'group': 'Other'},
     {'value': 24.9,
      'units': 'g',
      'description': 'Protein',
      'group': 'Composition'},
     {'value': 33.14,
      'units': 'g',
      'description': 'Total lipid (fat)',
      'group': 'Composition'},
     {'value': 1.28,
      'units': 'g',
      'description': 'Carbohydrate, by difference',
      'group': 'Composition'},
     {'value': 3.93, 'units': 'g', 'description': 'Ash', 'group': 'Other'},
     {'value': 403.0, 'units': 'kcal', 'description': 'Energy', 'group': 'Energy'},
     {'value': 0.24, 'units': 'g', 'description': 'Sucrose', 'group': 'Sugars'},
     {'value': 0.23, 'units': 'g', 'description': 'Lactose', 'group': 'Sugars'},
     {'value': 0.15, 'units': 'g', 'description': 'Maltose', 'group': 'Sugars'},
     {'value': 0.0,
      'units': 'g',
      'description': 'Alcohol, ethyl',
      'group': 'Other'},
     {'value': 36.75,
      'units': 'g',
      'description': 'Water',
      'group': 'Composition'},
     {'value': 0.0, 'units': 'mg', 'description': 'Caffeine', 'group': 'Other'},
     {'value': 0.0, 'units': 'mg', 'description': 'Theobromine', 'group': 'Other'},
     {'value': 1684.0, 'units': 'kJ', 'description': 'Energy', 'group': 'Energy'},
     {'value': 0.52,
      'units': 'g',
      'description': 'Sugars, total',
      'group': 'Composition'},
     {'value': 0.0,
      'units': 'g',
      'description': 'Fiber, total dietary',
      'group': 'Composition'},
     {'value': 721.0,
      'units': 'mg',
      'description': 'Calcium, Ca',
      'group': 'Elements'},
     {'value': 0.68,
      'units': 'mg',
      'description': 'Iron, Fe',
      'group': 'Elements'},
     {'value': 28.0,
      'units': 'mg',
      'description': 'Magnesium, Mg',
      'group': 'Elements'},
     {'value': 512.0,
      'units': 'mg',
      'description': 'Phosphorus, P',
      'group': 'Elements'},
     {'value': 98.0,
      'units': 'mg',
      'description': 'Potassium, K',
      'group': 'Elements'},
     {'value': 621.0,
      'units': 'mg',
      'description': 'Sodium, Na',
      'group': 'Elements'},
     {'value': 3.11,
      'units': 'mg',
      'description': 'Zinc, Zn',
      'group': 'Elements'},
     {'value': 0.031,
      'units': 'mg',
      'description': 'Copper, Cu',
      'group': 'Elements'},
     {'value': 34.9,
      'units': 'mcg',
      'description': 'Fluoride, F',
      'group': 'Elements'},
     {'value': 0.01,
      'units': 'mg',
      'description': 'Manganese, Mn',
      'group': 'Elements'},
     {'value': 13.9,
      'units': 'mcg',
      'description': 'Selenium, Se',
      'group': 'Elements'},
     {'value': 1002.0,
      'units': 'IU',
      'description': 'Vitamin A, IU',
      'group': 'Vitamins'},
     {'value': 258.0,
      'units': 'mcg',
      'description': 'Retinol',
      'group': 'Vitamins'},
     {'value': 265.0,
      'units': 'mcg_RAE',
      'description': 'Vitamin A, RAE',
      'group': 'Vitamins'},
     {'value': 85.0,
      'units': 'mcg',
      'description': 'Carotene, beta',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mcg',
      'description': 'Carotene, alpha',
      'group': 'Vitamins'},
     {'value': 0.29,
      'units': 'mg',
      'description': 'Vitamin E (alpha-tocopherol)',
      'group': 'Vitamins'},
     {'value': 24.0,
      'units': 'IU',
      'description': 'Vitamin D',
      'group': 'Vitamins'},
     {'value': 0.6000000000000001,
      'units': 'mcg',
      'description': 'Vitamin D3 (cholecalciferol)',
      'group': 'Vitamins'},
     {'value': 0.6000000000000001,
      'units': 'mcg',
      'description': 'Vitamin D (D2 + D3)',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mcg',
      'description': 'Cryptoxanthin, beta',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mcg',
      'description': 'Lycopene',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mcg',
      'description': 'Lutein + zeaxanthin',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mg',
      'description': 'Tocopherol, gamma',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mg',
      'description': 'Tocopherol, delta',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mg',
      'description': 'Vitamin C, total ascorbic acid',
      'group': 'Vitamins'},
     {'value': 0.027,
      'units': 'mg',
      'description': 'Thiamin',
      'group': 'Vitamins'},
     {'value': 0.375,
      'units': 'mg',
      'description': 'Riboflavin',
      'group': 'Vitamins'},
     {'value': 0.08, 'units': 'mg', 'description': 'Niacin', 'group': 'Vitamins'},
     {'value': 0.41300000000000003,
      'units': 'mg',
      'description': 'Pantothenic acid',
      'group': 'Vitamins'},
     {'value': 0.074,
      'units': 'mg',
      'description': 'Vitamin B-6',
      'group': 'Vitamins'},
     {'value': 18.0,
      'units': 'mcg',
      'description': 'Folate, total',
      'group': 'Vitamins'},
     {'value': 0.8300000000000001,
      'units': 'mcg',
      'description': 'Vitamin B-12',
      'group': 'Vitamins'},
     {'value': 16.5,
      'units': 'mg',
      'description': 'Choline, total',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mcg',
      'description': 'Dihydrophylloquinone',
      'group': 'Vitamins'},
     {'value': 2.8,
      'units': 'mcg',
      'description': 'Vitamin K (phylloquinone)',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mcg',
      'description': 'Folic acid',
      'group': 'Vitamins'},
     {'value': 18.0,
      'units': 'mcg',
      'description': 'Folate, food',
      'group': 'Vitamins'},
     {'value': 18.0,
      'units': 'mcg_DFE',
      'description': 'Folate, DFE',
      'group': 'Vitamins'},
     {'value': 0.7000000000000001,
      'units': 'mg',
      'description': 'Betaine',
      'group': 'Vitamins'},
     {'value': 0.32,
      'units': 'g',
      'description': 'Tryptophan',
      'group': 'Amino Acids'},
     {'value': 0.886,
      'units': 'g',
      'description': 'Threonine',
      'group': 'Amino Acids'},
     {'value': 1.546,
      'units': 'g',
      'description': 'Isoleucine',
      'group': 'Amino Acids'},
     {'value': 2.385,
      'units': 'g',
      'description': 'Leucine',
      'group': 'Amino Acids'},
     {'value': 2.072,
      'units': 'g',
      'description': 'Lysine',
      'group': 'Amino Acids'},
     {'value': 0.652,
      'units': 'g',
      'description': 'Methionine',
      'group': 'Amino Acids'},
     {'value': 0.125,
      'units': 'g',
      'description': 'Cystine',
      'group': 'Amino Acids'},
     {'value': 1.311,
      'units': 'g',
      'description': 'Phenylalanine',
      'group': 'Amino Acids'},
     {'value': 1.202,
      'units': 'g',
      'description': 'Tyrosine',
      'group': 'Amino Acids'},
     {'value': 1.663,
      'units': 'g',
      'description': 'Valine',
      'group': 'Amino Acids'},
     {'value': 0.9410000000000001,
      'units': 'g',
      'description': 'Arginine',
      'group': 'Amino Acids'},
     {'value': 0.874,
      'units': 'g',
      'description': 'Histidine',
      'group': 'Amino Acids'},
     {'value': 0.7030000000000001,
      'units': 'g',
      'description': 'Alanine',
      'group': 'Amino Acids'},
     {'value': 1.6,
      'units': 'g',
      'description': 'Aspartic acid',
      'group': 'Amino Acids'},
     {'value': 6.092,
      'units': 'g',
      'description': 'Glutamic acid',
      'group': 'Amino Acids'},
     {'value': 0.429,
      'units': 'g',
      'description': 'Glycine',
      'group': 'Amino Acids'},
     {'value': 2.806,
      'units': 'g',
      'description': 'Proline',
      'group': 'Amino Acids'},
     {'value': 1.456,
      'units': 'g',
      'description': 'Serine',
      'group': 'Amino Acids'},
     {'value': 0.0,
      'units': 'mg',
      'description': 'Vitamin E, added',
      'group': 'Vitamins'},
     {'value': 0.0,
      'units': 'mcg',
      'description': 'Vitamin B-12, added',
      'group': 'Vitamins'},
     {'value': 105.0,
      'units': 'mg',
      'description': 'Cholesterol',
      'group': 'Other'},
     {'value': 21.092,
      'units': 'g',
      'description': 'Fatty acids, total saturated',
      'group': 'Other'},
     {'value': 9.391,
      'units': 'g',
      'description': 'Fatty acids, total monounsaturated',
      'group': 'Other'},
     {'value': 0.9420000000000001,
      'units': 'g',
      'description': 'Fatty acids, total polyunsaturated',
      'group': 'Other'}]



本身一个样本有多个 json 元素。


```python
df_subset = df[['id','nutrients']]
```


```python
pd.DataFrame(df_subset.iloc[1,].nutrients).head()
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
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Protein</td>
      <td>Composition</td>
      <td>g</td>
      <td>24.90</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Total lipid (fat)</td>
      <td>Composition</td>
      <td>g</td>
      <td>33.14</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Carbohydrate, by difference</td>
      <td>Composition</td>
      <td>g</td>
      <td>1.28</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Ash</td>
      <td>Other</td>
      <td>g</td>
      <td>3.93</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Energy</td>
      <td>Energy</td>
      <td>kcal</td>
      <td>403.00</td>
    </tr>
  </tbody>
</table>
</div>



可以发现一个样本里面每个元素都是一样格式，可以转换到一个 `DataFrame`，因此我们先把他们全部 `unnest` 出来，合并成一个长表，然后再进行 `json` -> `DataFrame`。


```python
obj_unest = df_subset.set_index('id').nutrients.apply(pd.DataFrame)
df_unnest = pd.DataFrame(obj_unest)
```


```python
nrows = len(df_unnest.index)
```


```python
df_combined = pd.DataFrame()
for i in range(0,nrows):
    u = df_unnest.iloc[i,0]
    df_combined = df_combined.append(u)
```


```python
print(df_combined.head())
print(len(df_combined.index))
```

                       description        group units   value
    0                      Protein  Composition     g   25.18
    1            Total lipid (fat)  Composition     g   29.20
    2  Carbohydrate, by difference  Composition     g    3.06
    3                          Ash        Other     g    3.28
    4                       Energy       Energy  kcal  376.00
    389355
    

我试了下这个 for 循环好慢啊。
