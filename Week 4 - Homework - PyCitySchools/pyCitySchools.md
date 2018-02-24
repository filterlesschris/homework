

```python
import pandas as pd
```


```python
schools_df = pd.read_csv("raw_data/schools_complete.csv")
students_df = pd.read_csv("raw_data/students_complete.csv")
```


```python
students_df.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 39170 entries, 0 to 39169
    Data columns (total 7 columns):
    Student ID       39170 non-null int64
    name             39170 non-null object
    gender           39170 non-null object
    grade            39170 non-null object
    school           39170 non-null object
    reading_score    39170 non-null int64
    math_score       39170 non-null int64
    dtypes: int64(3), object(4)
    memory usage: 2.1+ MB
    


```python
schools_df.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 15 entries, 0 to 14
    Data columns (total 5 columns):
    School ID    15 non-null int64
    name         15 non-null object
    type         15 non-null object
    size         15 non-null int64
    budget       15 non-null int64
    dtypes: int64(3), object(2)
    memory usage: 680.0+ bytes
    


```python
total_schools = schools_df["name"].count()
```


```python
total_students = students_df["name"].count()
```


```python
total_budget = schools_df["budget"].sum()
```


```python
avg_math_score = students_df["math_score"].mean()
```


```python
avg_read_score = students_df["reading_score"].mean()
```


```python
#math_pass = students_df[students_df["math_score"] > 60].count()
math_pass = len(students_df.loc[students_df["math_score"] > 59]) / total_students * 100
read_pass = len(students_df.loc[students_df["reading_score"] > 59]) / total_students * 100

```


```python
overall_pass = (math_pass + read_pass) / 2
```





```python
district_summary = pd.DataFrame({"Total Schools": [total_schools],
                                 "Total Students": [total_students],
                                 "Total Budget":[total_budget],
                                 "Average Math Score":[avg_math_score], 
                                 "Average Reading Score":[avg_read_score],
                                 "% Passing Math":[math_pass],
                                 "% Passing Reading": [read_pass],
                                 "Overall Passing Rate": [overall_pass]})
district_summary = district_summary[["Total Schools",
                                     "Total Students",
                                     "Total Budget",
                                     "Average Math Score",
                                     "Average Reading Score",
                                     "% Passing Math",
                                     "% Passing Reading",
                                     "Overall Passing Rate"]]
```




```python

```


```python
district_summary.head()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Total Schools</th>
      <th>Total Students</th>
      <th>Total Budget</th>
      <th>Average Math Score</th>
      <th>Average Reading Score</th>
      <th>% Passing Math</th>
      <th>% Passing Reading</th>
      <th>Overall Passing Rate</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>15</td>
      <td>39170</td>
      <td>24649428</td>
      <td>78.985371</td>
      <td>81.87784</td>
      <td>92.445749</td>
      <td>100.0</td>
      <td>96.222875</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Re-format District Summary Table
district_summary['Total Schools'] = district_summary['Total Schools'].map("{0:,.0f}".format)
district_summary['Total Students'] = district_summary['Total Students'].map("{0:,.0f}".format)
district_summary['Total Budget'] = district_summary['Total Budget'].map("${0:,.0f}".format)
district_summary['Average Math Score'] = district_summary['Average Math Score'].map("{0:,.2f}%".format)
district_summary['Average Reading Score'] = district_summary['Average Reading Score'].map("{0:,.2f}%".format)
district_summary['% Passing Math'] = district_summary['% Passing Math'].map("{0:,.2f}%".format)
district_summary['% Passing Reading'] = district_summary['% Passing Reading'].map("{0:,.2f}%".format)
district_summary['Overall Passing Rate'] = district_summary['Overall Passing Rate'].map("{0:,.2f}%".format)
district_summary.head()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Total Schools</th>
      <th>Total Students</th>
      <th>Total Budget</th>
      <th>Average Math Score</th>
      <th>Average Reading Score</th>
      <th>% Passing Math</th>
      <th>% Passing Reading</th>
      <th>Overall Passing Rate</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>15</td>
      <td>39,170</td>
      <td>$24,649,428</td>
      <td>78.99%</td>
      <td>81.88%</td>
      <td>92.45%</td>
      <td>100.00%</td>
      <td>96.22%</td>
    </tr>
  </tbody>
</table>
</div>



schools_df.info()


```python
schools_df.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 15 entries, 0 to 14
    Data columns (total 5 columns):
    School ID    15 non-null int64
    name         15 non-null object
    type         15 non-null object
    size         15 non-null int64
    budget       15 non-null int64
    dtypes: int64(3), object(2)
    memory usage: 680.0+ bytes
    


```python
#schools_total_students = pd.DataFrame(schools_df.groupby("name")["size"].sum())
#recommend_bootcamp.reset_index(inplace=True)
#recommend_bootcamp.columns=["BootcampName", "Recommenders"]
#recommend_bootcamp.head()

#School Name
#  * School Type
#  * Total Students
#  * Total School Budget
# * Per School Budget
#  * Average Math Score
#  * Average Reading Score
#  * % Passing Math
#  * % Passing Reading
#  * Overall Passing Rate (Average of the above two)

```


```python

```


```python
school_calculations = schools_df
```


```python
school_calculations['budget_per_student'] = school_calculations['budget'] / school_calculations['size']
```


```python
school_calculations.head()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>School ID</th>
      <th>name</th>
      <th>type</th>
      <th>size</th>
      <th>budget</th>
      <th>budget_per_student</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>Huang High School</td>
      <td>District</td>
      <td>2917</td>
      <td>1910635</td>
      <td>655.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>Figueroa High School</td>
      <td>District</td>
      <td>2949</td>
      <td>1884411</td>
      <td>639.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2</td>
      <td>Shelton High School</td>
      <td>Charter</td>
      <td>1761</td>
      <td>1056600</td>
      <td>600.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>3</td>
      <td>Hernandez High School</td>
      <td>District</td>
      <td>4635</td>
      <td>3022020</td>
      <td>652.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>4</td>
      <td>Griffin High School</td>
      <td>Charter</td>
      <td>1468</td>
      <td>917500</td>
      <td>625.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
students_df.head()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Student ID</th>
      <th>name</th>
      <th>gender</th>
      <th>grade</th>
      <th>school</th>
      <th>reading_score</th>
      <th>math_score</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>Paul Bradley</td>
      <td>M</td>
      <td>9th</td>
      <td>Huang High School</td>
      <td>66</td>
      <td>79</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>Victor Smith</td>
      <td>M</td>
      <td>12th</td>
      <td>Huang High School</td>
      <td>94</td>
      <td>61</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2</td>
      <td>Kevin Rodriguez</td>
      <td>M</td>
      <td>12th</td>
      <td>Huang High School</td>
      <td>90</td>
      <td>60</td>
    </tr>
    <tr>
      <th>3</th>
      <td>3</td>
      <td>Dr. Richard Scott</td>
      <td>M</td>
      <td>12th</td>
      <td>Huang High School</td>
      <td>67</td>
      <td>58</td>
    </tr>
    <tr>
      <th>4</th>
      <td>4</td>
      <td>Bonnie Ray</td>
      <td>F</td>
      <td>9th</td>
      <td>Huang High School</td>
      <td>97</td>
      <td>84</td>
    </tr>
  </tbody>
</table>
</div>




```python
school_math_avg = pd.DataFrame(students_df.groupby('school')['math_score'].mean())
school_math_avg.reset_index(inplace=True)
```


```python
school_read_avg = pd.DataFrame(students_df.groupby('school')['reading_score'].mean())
school_read_avg.reset_index(inplace=True)
```


```python
students_tot_table = students_df
students_tot_table.head()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Student ID</th>
      <th>name</th>
      <th>gender</th>
      <th>grade</th>
      <th>school</th>
      <th>reading_score</th>
      <th>math_score</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>Paul Bradley</td>
      <td>M</td>
      <td>9th</td>
      <td>Huang High School</td>
      <td>66</td>
      <td>79</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>Victor Smith</td>
      <td>M</td>
      <td>12th</td>
      <td>Huang High School</td>
      <td>94</td>
      <td>61</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2</td>
      <td>Kevin Rodriguez</td>
      <td>M</td>
      <td>12th</td>
      <td>Huang High School</td>
      <td>90</td>
      <td>60</td>
    </tr>
    <tr>
      <th>3</th>
      <td>3</td>
      <td>Dr. Richard Scott</td>
      <td>M</td>
      <td>12th</td>
      <td>Huang High School</td>
      <td>67</td>
      <td>58</td>
    </tr>
    <tr>
      <th>4</th>
      <td>4</td>
      <td>Bonnie Ray</td>
      <td>F</td>
      <td>9th</td>
      <td>Huang High School</td>
      <td>97</td>
      <td>84</td>
    </tr>
  </tbody>
</table>
</div>




```python
#recommend_bootcamp = attended_bootcamp.replace({"Yes": 1, "No": 0})
#recommend_bootcamp = pd.DataFrame(recommend_bootcamp.groupby("BootcampName")["BootcampRecommend"].sum())
students_tot_table['math_pass'] = 0
students_tot_table['reading_pass'] = 0

students_tot_table.loc[students_tot_table['math_score'] >= 60, 'math_pass'] = 1
students_tot_table.loc[students_tot_table['reading_score'] >= 60, 'reading_pass'] = 1
students_tot_table.head()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Student ID</th>
      <th>name</th>
      <th>gender</th>
      <th>grade</th>
      <th>school</th>
      <th>reading_score</th>
      <th>math_score</th>
      <th>math_pass</th>
      <th>reading_pass</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>Paul Bradley</td>
      <td>M</td>
      <td>9th</td>
      <td>Huang High School</td>
      <td>66</td>
      <td>79</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>Victor Smith</td>
      <td>M</td>
      <td>12th</td>
      <td>Huang High School</td>
      <td>94</td>
      <td>61</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2</td>
      <td>Kevin Rodriguez</td>
      <td>M</td>
      <td>12th</td>
      <td>Huang High School</td>
      <td>90</td>
      <td>60</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>3</th>
      <td>3</td>
      <td>Dr. Richard Scott</td>
      <td>M</td>
      <td>12th</td>
      <td>Huang High School</td>
      <td>67</td>
      <td>58</td>
      <td>0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>4</th>
      <td>4</td>
      <td>Bonnie Ray</td>
      <td>F</td>
      <td>9th</td>
      <td>Huang High School</td>
      <td>97</td>
      <td>84</td>
      <td>1</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>




```python
students_avg_table_math = pd.DataFrame(students_tot_table.groupby("school")["math_score"].mean())
students_avg_table_read = pd.DataFrame(students_tot_table.groupby("school")["reading_score"].mean())
```


```python
students_tot_table_math = pd.DataFrame(students_tot_table.groupby("school")["math_pass"].sum())
students_tot_table_math.reset_index(inplace=True)
students_tot_table_math.head(15)
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>school</th>
      <th>math_pass</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Bailey High School</td>
      <td>4455</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Cabrera High School</td>
      <td>1858</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Figueroa High School</td>
      <td>2608</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Ford High School</td>
      <td>2446</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Griffin High School</td>
      <td>1468</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Hernandez High School</td>
      <td>4129</td>
    </tr>
    <tr>
      <th>6</th>
      <td>Holden High School</td>
      <td>427</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Huang High School</td>
      <td>2592</td>
    </tr>
    <tr>
      <th>8</th>
      <td>Johnson High School</td>
      <td>4246</td>
    </tr>
    <tr>
      <th>9</th>
      <td>Pena High School</td>
      <td>962</td>
    </tr>
    <tr>
      <th>10</th>
      <td>Rodriguez High School</td>
      <td>3541</td>
    </tr>
    <tr>
      <th>11</th>
      <td>Shelton High School</td>
      <td>1761</td>
    </tr>
    <tr>
      <th>12</th>
      <td>Thomas High School</td>
      <td>1635</td>
    </tr>
    <tr>
      <th>13</th>
      <td>Wilson High School</td>
      <td>2283</td>
    </tr>
    <tr>
      <th>14</th>
      <td>Wright High School</td>
      <td>1800</td>
    </tr>
  </tbody>
</table>
</div>




```python
students_tot_table_read = pd.DataFrame(students_tot_table.groupby("school")["reading_pass"].sum())
students_tot_table_read.reset_index(inplace=True)
students_tot_table_read.head(15)
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>school</th>
      <th>reading_pass</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Bailey High School</td>
      <td>4976</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Cabrera High School</td>
      <td>1858</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Figueroa High School</td>
      <td>2949</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Ford High School</td>
      <td>2739</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Griffin High School</td>
      <td>1468</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Hernandez High School</td>
      <td>4635</td>
    </tr>
    <tr>
      <th>6</th>
      <td>Holden High School</td>
      <td>427</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Huang High School</td>
      <td>2917</td>
    </tr>
    <tr>
      <th>8</th>
      <td>Johnson High School</td>
      <td>4761</td>
    </tr>
    <tr>
      <th>9</th>
      <td>Pena High School</td>
      <td>962</td>
    </tr>
    <tr>
      <th>10</th>
      <td>Rodriguez High School</td>
      <td>3999</td>
    </tr>
    <tr>
      <th>11</th>
      <td>Shelton High School</td>
      <td>1761</td>
    </tr>
    <tr>
      <th>12</th>
      <td>Thomas High School</td>
      <td>1635</td>
    </tr>
    <tr>
      <th>13</th>
      <td>Wilson High School</td>
      <td>2283</td>
    </tr>
    <tr>
      <th>14</th>
      <td>Wright High School</td>
      <td>1800</td>
    </tr>
  </tbody>
</table>
</div>




```python
#assignee_work = assignee_work.rename(columns={"Component":"Component Bug Count"})
school_calculations = school_calculations.rename(columns={"name":"school"})
school_calculations.head()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>School ID</th>
      <th>school</th>
      <th>type</th>
      <th>size</th>
      <th>budget</th>
      <th>budget_per_student</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>Huang High School</td>
      <td>District</td>
      <td>2917</td>
      <td>1910635</td>
      <td>655.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>Figueroa High School</td>
      <td>District</td>
      <td>2949</td>
      <td>1884411</td>
      <td>639.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2</td>
      <td>Shelton High School</td>
      <td>Charter</td>
      <td>1761</td>
      <td>1056600</td>
      <td>600.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>3</td>
      <td>Hernandez High School</td>
      <td>District</td>
      <td>4635</td>
      <td>3022020</td>
      <td>652.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>4</td>
      <td>Griffin High School</td>
      <td>Charter</td>
      <td>1468</td>
      <td>917500</td>
      <td>625.0</td>
    </tr>
  </tbody>
</table>
</div>




```python

```


```python
#merged_df = pd.merge(bootcamp_name, recommend_bootcamp, on="BootcampName")
merged_df = pd.merge(students_tot_table_math, students_tot_table_read, on="school")
merged_df.head()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>school</th>
      <th>math_pass</th>
      <th>reading_pass</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Bailey High School</td>
      <td>4455</td>
      <td>4976</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Cabrera High School</td>
      <td>1858</td>
      <td>1858</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Figueroa High School</td>
      <td>2608</td>
      <td>2949</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Ford High School</td>
      <td>2446</td>
      <td>2739</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Griffin High School</td>
      <td>1468</td>
      <td>1468</td>
    </tr>
  </tbody>
</table>
</div>




```python
merged_df = pd.merge(merged_df, school_calculations, on="school")
merged_df = pd.merge(merged_df, school_math_avg, on="school")
merged_df = pd.merge(merged_df, school_read_avg, on="school")
merged_df.head(15)
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>school</th>
      <th>math_pass</th>
      <th>reading_pass</th>
      <th>School ID</th>
      <th>type</th>
      <th>size</th>
      <th>budget</th>
      <th>budget_per_student</th>
      <th>math_score</th>
      <th>reading_score</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Bailey High School</td>
      <td>4455</td>
      <td>4976</td>
      <td>7</td>
      <td>District</td>
      <td>4976</td>
      <td>3124928</td>
      <td>628.0</td>
      <td>77.048432</td>
      <td>81.033963</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Cabrera High School</td>
      <td>1858</td>
      <td>1858</td>
      <td>6</td>
      <td>Charter</td>
      <td>1858</td>
      <td>1081356</td>
      <td>582.0</td>
      <td>83.061895</td>
      <td>83.975780</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Figueroa High School</td>
      <td>2608</td>
      <td>2949</td>
      <td>1</td>
      <td>District</td>
      <td>2949</td>
      <td>1884411</td>
      <td>639.0</td>
      <td>76.711767</td>
      <td>81.158020</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Ford High School</td>
      <td>2446</td>
      <td>2739</td>
      <td>13</td>
      <td>District</td>
      <td>2739</td>
      <td>1763916</td>
      <td>644.0</td>
      <td>77.102592</td>
      <td>80.746258</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Griffin High School</td>
      <td>1468</td>
      <td>1468</td>
      <td>4</td>
      <td>Charter</td>
      <td>1468</td>
      <td>917500</td>
      <td>625.0</td>
      <td>83.351499</td>
      <td>83.816757</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Hernandez High School</td>
      <td>4129</td>
      <td>4635</td>
      <td>3</td>
      <td>District</td>
      <td>4635</td>
      <td>3022020</td>
      <td>652.0</td>
      <td>77.289752</td>
      <td>80.934412</td>
    </tr>
    <tr>
      <th>6</th>
      <td>Holden High School</td>
      <td>427</td>
      <td>427</td>
      <td>8</td>
      <td>Charter</td>
      <td>427</td>
      <td>248087</td>
      <td>581.0</td>
      <td>83.803279</td>
      <td>83.814988</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Huang High School</td>
      <td>2592</td>
      <td>2917</td>
      <td>0</td>
      <td>District</td>
      <td>2917</td>
      <td>1910635</td>
      <td>655.0</td>
      <td>76.629414</td>
      <td>81.182722</td>
    </tr>
    <tr>
      <th>8</th>
      <td>Johnson High School</td>
      <td>4246</td>
      <td>4761</td>
      <td>12</td>
      <td>District</td>
      <td>4761</td>
      <td>3094650</td>
      <td>650.0</td>
      <td>77.072464</td>
      <td>80.966394</td>
    </tr>
    <tr>
      <th>9</th>
      <td>Pena High School</td>
      <td>962</td>
      <td>962</td>
      <td>9</td>
      <td>Charter</td>
      <td>962</td>
      <td>585858</td>
      <td>609.0</td>
      <td>83.839917</td>
      <td>84.044699</td>
    </tr>
    <tr>
      <th>10</th>
      <td>Rodriguez High School</td>
      <td>3541</td>
      <td>3999</td>
      <td>11</td>
      <td>District</td>
      <td>3999</td>
      <td>2547363</td>
      <td>637.0</td>
      <td>76.842711</td>
      <td>80.744686</td>
    </tr>
    <tr>
      <th>11</th>
      <td>Shelton High School</td>
      <td>1761</td>
      <td>1761</td>
      <td>2</td>
      <td>Charter</td>
      <td>1761</td>
      <td>1056600</td>
      <td>600.0</td>
      <td>83.359455</td>
      <td>83.725724</td>
    </tr>
    <tr>
      <th>12</th>
      <td>Thomas High School</td>
      <td>1635</td>
      <td>1635</td>
      <td>14</td>
      <td>Charter</td>
      <td>1635</td>
      <td>1043130</td>
      <td>638.0</td>
      <td>83.418349</td>
      <td>83.848930</td>
    </tr>
    <tr>
      <th>13</th>
      <td>Wilson High School</td>
      <td>2283</td>
      <td>2283</td>
      <td>5</td>
      <td>Charter</td>
      <td>2283</td>
      <td>1319574</td>
      <td>578.0</td>
      <td>83.274201</td>
      <td>83.989488</td>
    </tr>
    <tr>
      <th>14</th>
      <td>Wright High School</td>
      <td>1800</td>
      <td>1800</td>
      <td>10</td>
      <td>Charter</td>
      <td>1800</td>
      <td>1049400</td>
      <td>583.0</td>
      <td>83.682222</td>
      <td>83.955000</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Create a new column that finds the average amount pledged to a project
#hosted_in_us["average_donation"] = hosted_in_us['pledged']/hosted_in_us['backers_count']
#hosted_in_us.head()
merged_df["% Passing Math"] = merged_df['math_pass']/merged_df['size'] * 100
merged_df["% Passing Reading"] = merged_df['reading_pass']/merged_df['size'] * 100
merged_df["% Overall Passing Rate"] = (merged_df['% Passing Reading']+merged_df['% Passing Math']) / 2
merged_df = merged_df.rename(columns={"math_score":"Average Math Score"})
merged_df = merged_df.rename(columns={"reading_score":"Average Reading Score"})
merged_df = merged_df.rename(columns={"type":"School Type"})
merged_df = merged_df.rename(columns={"size":"Total Students"})
merged_df = merged_df.rename(columns={"budget":"Total School Budget"})
merged_df = merged_df.rename(columns={"budget_per_student":"Per Student Budget"})
merged_df = merged_df.rename(columns={"school":"School"})
merged_df.head(15)
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>School</th>
      <th>math_pass</th>
      <th>reading_pass</th>
      <th>School ID</th>
      <th>School Type</th>
      <th>Total Students</th>
      <th>Total School Budget</th>
      <th>Per Student Budget</th>
      <th>Average Math Score</th>
      <th>Average Reading Score</th>
      <th>% Passing Math</th>
      <th>% Passing Reading</th>
      <th>% Overall Passing Rate</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Bailey High School</td>
      <td>4455</td>
      <td>4976</td>
      <td>7</td>
      <td>District</td>
      <td>4976</td>
      <td>3124928</td>
      <td>628.0</td>
      <td>77.048432</td>
      <td>81.033963</td>
      <td>89.529743</td>
      <td>100.0</td>
      <td>94.764871</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Cabrera High School</td>
      <td>1858</td>
      <td>1858</td>
      <td>6</td>
      <td>Charter</td>
      <td>1858</td>
      <td>1081356</td>
      <td>582.0</td>
      <td>83.061895</td>
      <td>83.975780</td>
      <td>100.000000</td>
      <td>100.0</td>
      <td>100.000000</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Figueroa High School</td>
      <td>2608</td>
      <td>2949</td>
      <td>1</td>
      <td>District</td>
      <td>2949</td>
      <td>1884411</td>
      <td>639.0</td>
      <td>76.711767</td>
      <td>81.158020</td>
      <td>88.436758</td>
      <td>100.0</td>
      <td>94.218379</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Ford High School</td>
      <td>2446</td>
      <td>2739</td>
      <td>13</td>
      <td>District</td>
      <td>2739</td>
      <td>1763916</td>
      <td>644.0</td>
      <td>77.102592</td>
      <td>80.746258</td>
      <td>89.302665</td>
      <td>100.0</td>
      <td>94.651333</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Griffin High School</td>
      <td>1468</td>
      <td>1468</td>
      <td>4</td>
      <td>Charter</td>
      <td>1468</td>
      <td>917500</td>
      <td>625.0</td>
      <td>83.351499</td>
      <td>83.816757</td>
      <td>100.000000</td>
      <td>100.0</td>
      <td>100.000000</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Hernandez High School</td>
      <td>4129</td>
      <td>4635</td>
      <td>3</td>
      <td>District</td>
      <td>4635</td>
      <td>3022020</td>
      <td>652.0</td>
      <td>77.289752</td>
      <td>80.934412</td>
      <td>89.083064</td>
      <td>100.0</td>
      <td>94.541532</td>
    </tr>
    <tr>
      <th>6</th>
      <td>Holden High School</td>
      <td>427</td>
      <td>427</td>
      <td>8</td>
      <td>Charter</td>
      <td>427</td>
      <td>248087</td>
      <td>581.0</td>
      <td>83.803279</td>
      <td>83.814988</td>
      <td>100.000000</td>
      <td>100.0</td>
      <td>100.000000</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Huang High School</td>
      <td>2592</td>
      <td>2917</td>
      <td>0</td>
      <td>District</td>
      <td>2917</td>
      <td>1910635</td>
      <td>655.0</td>
      <td>76.629414</td>
      <td>81.182722</td>
      <td>88.858416</td>
      <td>100.0</td>
      <td>94.429208</td>
    </tr>
    <tr>
      <th>8</th>
      <td>Johnson High School</td>
      <td>4246</td>
      <td>4761</td>
      <td>12</td>
      <td>District</td>
      <td>4761</td>
      <td>3094650</td>
      <td>650.0</td>
      <td>77.072464</td>
      <td>80.966394</td>
      <td>89.182945</td>
      <td>100.0</td>
      <td>94.591472</td>
    </tr>
    <tr>
      <th>9</th>
      <td>Pena High School</td>
      <td>962</td>
      <td>962</td>
      <td>9</td>
      <td>Charter</td>
      <td>962</td>
      <td>585858</td>
      <td>609.0</td>
      <td>83.839917</td>
      <td>84.044699</td>
      <td>100.000000</td>
      <td>100.0</td>
      <td>100.000000</td>
    </tr>
    <tr>
      <th>10</th>
      <td>Rodriguez High School</td>
      <td>3541</td>
      <td>3999</td>
      <td>11</td>
      <td>District</td>
      <td>3999</td>
      <td>2547363</td>
      <td>637.0</td>
      <td>76.842711</td>
      <td>80.744686</td>
      <td>88.547137</td>
      <td>100.0</td>
      <td>94.273568</td>
    </tr>
    <tr>
      <th>11</th>
      <td>Shelton High School</td>
      <td>1761</td>
      <td>1761</td>
      <td>2</td>
      <td>Charter</td>
      <td>1761</td>
      <td>1056600</td>
      <td>600.0</td>
      <td>83.359455</td>
      <td>83.725724</td>
      <td>100.000000</td>
      <td>100.0</td>
      <td>100.000000</td>
    </tr>
    <tr>
      <th>12</th>
      <td>Thomas High School</td>
      <td>1635</td>
      <td>1635</td>
      <td>14</td>
      <td>Charter</td>
      <td>1635</td>
      <td>1043130</td>
      <td>638.0</td>
      <td>83.418349</td>
      <td>83.848930</td>
      <td>100.000000</td>
      <td>100.0</td>
      <td>100.000000</td>
    </tr>
    <tr>
      <th>13</th>
      <td>Wilson High School</td>
      <td>2283</td>
      <td>2283</td>
      <td>5</td>
      <td>Charter</td>
      <td>2283</td>
      <td>1319574</td>
      <td>578.0</td>
      <td>83.274201</td>
      <td>83.989488</td>
      <td>100.000000</td>
      <td>100.0</td>
      <td>100.000000</td>
    </tr>
    <tr>
      <th>14</th>
      <td>Wright High School</td>
      <td>1800</td>
      <td>1800</td>
      <td>10</td>
      <td>Charter</td>
      <td>1800</td>
      <td>1049400</td>
      <td>583.0</td>
      <td>83.682222</td>
      <td>83.955000</td>
      <td>100.000000</td>
      <td>100.0</td>
      <td>100.000000</td>
    </tr>
  </tbody>
</table>
</div>




```python
schools_spending = merged_df
schools_size = merged_df
schools_type = merged_df
```


```python
merged_df = merged_df[["School",
                       "School Type", 
                       "Total Students",
                       "Total School Budget",
                       "Per Student Budget", 
                       "Average Math Score",
                       "Average Reading Score",
                       "% Passing Math",
                       "% Passing Reading",
                       "% Overall Passing Rate"]]

merged_df['Total Students'] = merged_df['Total Students'].map("{0:,.0f}".format)
merged_df['Total School Budget'] = merged_df['Total School Budget'].map("${0:,.0f}".format)
merged_df['Per Student Budget'] = merged_df['Per Student Budget'].map("${0:,.0f}".format)
merged_df['Average Math Score'] = merged_df['Average Math Score'].map("{0:,.2f}%".format)
merged_df['Average Reading Score'] = merged_df['Average Reading Score'].map("{0:,.2f}%".format)
merged_df['% Passing Math'] = merged_df['% Passing Math'].map("{0:,.2f}%".format)
merged_df['% Passing Reading'] = merged_df['% Passing Reading'].map("{0:,.2f}%".format)
merged_df['% Overall Passing Rate'] = merged_df['% Overall Passing Rate'].map("{0:,.2f}%".format)

merged_df.head(15)
```

    C:\Users\cbenzen\AppData\Local\Continuum\Anaconda3\lib\site-packages\ipykernel_launcher.py:12: SettingWithCopyWarning: 
    A value is trying to be set on a copy of a slice from a DataFrame.
    Try using .loc[row_indexer,col_indexer] = value instead
    
    See the caveats in the documentation: http://pandas.pydata.org/pandas-docs/stable/indexing.html#indexing-view-versus-copy
      if sys.path[0] == '':
    C:\Users\cbenzen\AppData\Local\Continuum\Anaconda3\lib\site-packages\ipykernel_launcher.py:13: SettingWithCopyWarning: 
    A value is trying to be set on a copy of a slice from a DataFrame.
    Try using .loc[row_indexer,col_indexer] = value instead
    
    See the caveats in the documentation: http://pandas.pydata.org/pandas-docs/stable/indexing.html#indexing-view-versus-copy
      del sys.path[0]
    C:\Users\cbenzen\AppData\Local\Continuum\Anaconda3\lib\site-packages\ipykernel_launcher.py:14: SettingWithCopyWarning: 
    A value is trying to be set on a copy of a slice from a DataFrame.
    Try using .loc[row_indexer,col_indexer] = value instead
    
    See the caveats in the documentation: http://pandas.pydata.org/pandas-docs/stable/indexing.html#indexing-view-versus-copy
      
    C:\Users\cbenzen\AppData\Local\Continuum\Anaconda3\lib\site-packages\ipykernel_launcher.py:15: SettingWithCopyWarning: 
    A value is trying to be set on a copy of a slice from a DataFrame.
    Try using .loc[row_indexer,col_indexer] = value instead
    
    See the caveats in the documentation: http://pandas.pydata.org/pandas-docs/stable/indexing.html#indexing-view-versus-copy
      from ipykernel import kernelapp as app
    C:\Users\cbenzen\AppData\Local\Continuum\Anaconda3\lib\site-packages\ipykernel_launcher.py:16: SettingWithCopyWarning: 
    A value is trying to be set on a copy of a slice from a DataFrame.
    Try using .loc[row_indexer,col_indexer] = value instead
    
    See the caveats in the documentation: http://pandas.pydata.org/pandas-docs/stable/indexing.html#indexing-view-versus-copy
      app.launch_new_instance()
    C:\Users\cbenzen\AppData\Local\Continuum\Anaconda3\lib\site-packages\ipykernel_launcher.py:17: SettingWithCopyWarning: 
    A value is trying to be set on a copy of a slice from a DataFrame.
    Try using .loc[row_indexer,col_indexer] = value instead
    
    See the caveats in the documentation: http://pandas.pydata.org/pandas-docs/stable/indexing.html#indexing-view-versus-copy
    C:\Users\cbenzen\AppData\Local\Continuum\Anaconda3\lib\site-packages\ipykernel_launcher.py:18: SettingWithCopyWarning: 
    A value is trying to be set on a copy of a slice from a DataFrame.
    Try using .loc[row_indexer,col_indexer] = value instead
    
    See the caveats in the documentation: http://pandas.pydata.org/pandas-docs/stable/indexing.html#indexing-view-versus-copy
    C:\Users\cbenzen\AppData\Local\Continuum\Anaconda3\lib\site-packages\ipykernel_launcher.py:19: SettingWithCopyWarning: 
    A value is trying to be set on a copy of a slice from a DataFrame.
    Try using .loc[row_indexer,col_indexer] = value instead
    
    See the caveats in the documentation: http://pandas.pydata.org/pandas-docs/stable/indexing.html#indexing-view-versus-copy
    




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>School</th>
      <th>School Type</th>
      <th>Total Students</th>
      <th>Total School Budget</th>
      <th>Per Student Budget</th>
      <th>Average Math Score</th>
      <th>Average Reading Score</th>
      <th>% Passing Math</th>
      <th>% Passing Reading</th>
      <th>% Overall Passing Rate</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Bailey High School</td>
      <td>District</td>
      <td>4,976</td>
      <td>$3,124,928</td>
      <td>$628</td>
      <td>77.05%</td>
      <td>81.03%</td>
      <td>89.53%</td>
      <td>100.00%</td>
      <td>94.76%</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Cabrera High School</td>
      <td>Charter</td>
      <td>1,858</td>
      <td>$1,081,356</td>
      <td>$582</td>
      <td>83.06%</td>
      <td>83.98%</td>
      <td>100.00%</td>
      <td>100.00%</td>
      <td>100.00%</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Figueroa High School</td>
      <td>District</td>
      <td>2,949</td>
      <td>$1,884,411</td>
      <td>$639</td>
      <td>76.71%</td>
      <td>81.16%</td>
      <td>88.44%</td>
      <td>100.00%</td>
      <td>94.22%</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Ford High School</td>
      <td>District</td>
      <td>2,739</td>
      <td>$1,763,916</td>
      <td>$644</td>
      <td>77.10%</td>
      <td>80.75%</td>
      <td>89.30%</td>
      <td>100.00%</td>
      <td>94.65%</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Griffin High School</td>
      <td>Charter</td>
      <td>1,468</td>
      <td>$917,500</td>
      <td>$625</td>
      <td>83.35%</td>
      <td>83.82%</td>
      <td>100.00%</td>
      <td>100.00%</td>
      <td>100.00%</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Hernandez High School</td>
      <td>District</td>
      <td>4,635</td>
      <td>$3,022,020</td>
      <td>$652</td>
      <td>77.29%</td>
      <td>80.93%</td>
      <td>89.08%</td>
      <td>100.00%</td>
      <td>94.54%</td>
    </tr>
    <tr>
      <th>6</th>
      <td>Holden High School</td>
      <td>Charter</td>
      <td>427</td>
      <td>$248,087</td>
      <td>$581</td>
      <td>83.80%</td>
      <td>83.81%</td>
      <td>100.00%</td>
      <td>100.00%</td>
      <td>100.00%</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Huang High School</td>
      <td>District</td>
      <td>2,917</td>
      <td>$1,910,635</td>
      <td>$655</td>
      <td>76.63%</td>
      <td>81.18%</td>
      <td>88.86%</td>
      <td>100.00%</td>
      <td>94.43%</td>
    </tr>
    <tr>
      <th>8</th>
      <td>Johnson High School</td>
      <td>District</td>
      <td>4,761</td>
      <td>$3,094,650</td>
      <td>$650</td>
      <td>77.07%</td>
      <td>80.97%</td>
      <td>89.18%</td>
      <td>100.00%</td>
      <td>94.59%</td>
    </tr>
    <tr>
      <th>9</th>
      <td>Pena High School</td>
      <td>Charter</td>
      <td>962</td>
      <td>$585,858</td>
      <td>$609</td>
      <td>83.84%</td>
      <td>84.04%</td>
      <td>100.00%</td>
      <td>100.00%</td>
      <td>100.00%</td>
    </tr>
    <tr>
      <th>10</th>
      <td>Rodriguez High School</td>
      <td>District</td>
      <td>3,999</td>
      <td>$2,547,363</td>
      <td>$637</td>
      <td>76.84%</td>
      <td>80.74%</td>
      <td>88.55%</td>
      <td>100.00%</td>
      <td>94.27%</td>
    </tr>
    <tr>
      <th>11</th>
      <td>Shelton High School</td>
      <td>Charter</td>
      <td>1,761</td>
      <td>$1,056,600</td>
      <td>$600</td>
      <td>83.36%</td>
      <td>83.73%</td>
      <td>100.00%</td>
      <td>100.00%</td>
      <td>100.00%</td>
    </tr>
    <tr>
      <th>12</th>
      <td>Thomas High School</td>
      <td>Charter</td>
      <td>1,635</td>
      <td>$1,043,130</td>
      <td>$638</td>
      <td>83.42%</td>
      <td>83.85%</td>
      <td>100.00%</td>
      <td>100.00%</td>
      <td>100.00%</td>
    </tr>
    <tr>
      <th>13</th>
      <td>Wilson High School</td>
      <td>Charter</td>
      <td>2,283</td>
      <td>$1,319,574</td>
      <td>$578</td>
      <td>83.27%</td>
      <td>83.99%</td>
      <td>100.00%</td>
      <td>100.00%</td>
      <td>100.00%</td>
    </tr>
    <tr>
      <th>14</th>
      <td>Wright High School</td>
      <td>Charter</td>
      <td>1,800</td>
      <td>$1,049,400</td>
      <td>$583</td>
      <td>83.68%</td>
      <td>83.95%</td>
      <td>100.00%</td>
      <td>100.00%</td>
      <td>100.00%</td>
    </tr>
  </tbody>
</table>
</div>




```python

```


```python
# Sort out any projects that made no money at all
#reduced_kickstarter_df = reduced_kickstarter_df.loc[(reduced_kickstarter_df["pledged"] > 0)]
#reduced_kickstarter_df.head()
merged_df = merged_df.sort_values(["% Overall Passing Rate"], ascending=True)
merged_df.head(5)
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>School</th>
      <th>School Type</th>
      <th>Total Students</th>
      <th>Total School Budget</th>
      <th>Per Student Budget</th>
      <th>Average Math Score</th>
      <th>Average Reading Score</th>
      <th>% Passing Math</th>
      <th>% Passing Reading</th>
      <th>% Overall Passing Rate</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1</th>
      <td>Cabrera High School</td>
      <td>Charter</td>
      <td>1,858</td>
      <td>$1,081,356</td>
      <td>$582</td>
      <td>83.06%</td>
      <td>83.98%</td>
      <td>100.00%</td>
      <td>100.00%</td>
      <td>100.00%</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Griffin High School</td>
      <td>Charter</td>
      <td>1,468</td>
      <td>$917,500</td>
      <td>$625</td>
      <td>83.35%</td>
      <td>83.82%</td>
      <td>100.00%</td>
      <td>100.00%</td>
      <td>100.00%</td>
    </tr>
    <tr>
      <th>6</th>
      <td>Holden High School</td>
      <td>Charter</td>
      <td>427</td>
      <td>$248,087</td>
      <td>$581</td>
      <td>83.80%</td>
      <td>83.81%</td>
      <td>100.00%</td>
      <td>100.00%</td>
      <td>100.00%</td>
    </tr>
    <tr>
      <th>9</th>
      <td>Pena High School</td>
      <td>Charter</td>
      <td>962</td>
      <td>$585,858</td>
      <td>$609</td>
      <td>83.84%</td>
      <td>84.04%</td>
      <td>100.00%</td>
      <td>100.00%</td>
      <td>100.00%</td>
    </tr>
    <tr>
      <th>11</th>
      <td>Shelton High School</td>
      <td>Charter</td>
      <td>1,761</td>
      <td>$1,056,600</td>
      <td>$600</td>
      <td>83.36%</td>
      <td>83.73%</td>
      <td>100.00%</td>
      <td>100.00%</td>
      <td>100.00%</td>
    </tr>
  </tbody>
</table>
</div>




```python
merged_df = merged_df.sort_values(["% Overall Passing Rate"], ascending=False)
merged_df.head(5)
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>School</th>
      <th>School Type</th>
      <th>Total Students</th>
      <th>Total School Budget</th>
      <th>Per Student Budget</th>
      <th>Average Math Score</th>
      <th>Average Reading Score</th>
      <th>% Passing Math</th>
      <th>% Passing Reading</th>
      <th>% Overall Passing Rate</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Bailey High School</td>
      <td>District</td>
      <td>4,976</td>
      <td>$3,124,928</td>
      <td>$628</td>
      <td>77.05%</td>
      <td>81.03%</td>
      <td>89.53%</td>
      <td>100.00%</td>
      <td>94.76%</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Ford High School</td>
      <td>District</td>
      <td>2,739</td>
      <td>$1,763,916</td>
      <td>$644</td>
      <td>77.10%</td>
      <td>80.75%</td>
      <td>89.30%</td>
      <td>100.00%</td>
      <td>94.65%</td>
    </tr>
    <tr>
      <th>8</th>
      <td>Johnson High School</td>
      <td>District</td>
      <td>4,761</td>
      <td>$3,094,650</td>
      <td>$650</td>
      <td>77.07%</td>
      <td>80.97%</td>
      <td>89.18%</td>
      <td>100.00%</td>
      <td>94.59%</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Hernandez High School</td>
      <td>District</td>
      <td>4,635</td>
      <td>$3,022,020</td>
      <td>$652</td>
      <td>77.29%</td>
      <td>80.93%</td>
      <td>89.08%</td>
      <td>100.00%</td>
      <td>94.54%</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Huang High School</td>
      <td>District</td>
      <td>2,917</td>
      <td>$1,910,635</td>
      <td>$655</td>
      <td>76.63%</td>
      <td>81.18%</td>
      <td>88.86%</td>
      <td>100.00%</td>
      <td>94.43%</td>
    </tr>
  </tbody>
</table>
</div>




```python

```


```python
students_grades = students_df
students_grades.columns
```




    Index(['Student ID', 'name', 'gender', 'grade', 'school', 'reading_score',
           'math_score', 'math_pass', 'reading_pass'],
          dtype='object')




```python
## Extract rows for only those who attended a bootcamp
#attended_bootcamp = reduced_coders_pd.loc[reduced_coders_pd["AttendedBootcamp"] == "Yes"]
#reduced_kickstarter_df = df.loc[:,["name", "goal", "pledged", "state", "country", "staff_pick","backers_count", "spotlight"]]
students_grades_9th = students_grades.loc[students_grades['grade'] == "9th"]
students_grades_10th = students_grades.loc[students_grades['grade'] == "10th"]
students_grades_11th = students_grades.loc[students_grades['grade'] == "11th"]
students_grades_12th = students_grades.loc[students_grades['grade'] == "12th"]
```


```python
#Math score time
school_math_avg_grades_9th = pd.DataFrame(students_grades_9th.groupby('school')['math_score'].mean())
school_math_avg_grades_10th = pd.DataFrame(students_grades_10th.groupby('school')['math_score'].mean())
school_math_avg_grades_11th = pd.DataFrame(students_grades_11th.groupby('school')['math_score'].mean())
school_math_avg_grades_12th = pd.DataFrame(students_grades_12th.groupby('school')['math_score'].mean())
school_math_avg_grades_9th.reset_index(inplace=True)
school_math_avg_grades_10th.reset_index(inplace=True)
school_math_avg_grades_11th.reset_index(inplace=True)
school_math_avg_grades_12th.reset_index(inplace=True)
#Reading score time
school_reading_avg_grades_9th = pd.DataFrame(students_grades_9th.groupby('school')['reading_score'].mean())
school_reading_avg_grades_10th = pd.DataFrame(students_grades_10th.groupby('school')['reading_score'].mean())
school_reading_avg_grades_11th = pd.DataFrame(students_grades_11th.groupby('school')['reading_score'].mean())
school_reading_avg_grades_12th = pd.DataFrame(students_grades_12th.groupby('school')['reading_score'].mean())
school_reading_avg_grades_9th.reset_index(inplace=True)
school_reading_avg_grades_10th.reset_index(inplace=True)
school_reading_avg_grades_11th.reset_index(inplace=True)
school_reading_avg_grades_12th.reset_index(inplace=True)
```


```python
#rename the columns to the respective grades
#starting with math
school_math_avg_grades_9th = school_math_avg_grades_9th.rename(columns={"math_score":"9th"})
school_math_avg_grades_10th = school_math_avg_grades_10th.rename(columns={"math_score":"10th"})
school_math_avg_grades_11th = school_math_avg_grades_11th.rename(columns={"math_score":"11th"})
school_math_avg_grades_12th = school_math_avg_grades_12th.rename(columns={"math_score":"12th"})
#reading time
school_reading_avg_grades_9th = school_reading_avg_grades_9th.rename(columns={"reading_score":"9th"})
school_reading_avg_grades_10th = school_reading_avg_grades_10th.rename(columns={"reading_score":"10th"})
school_reading_avg_grades_11th = school_reading_avg_grades_11th.rename(columns={"reading_score":"11th"})
school_reading_avg_grades_12th = school_reading_avg_grades_12th.rename(columns={"reading_score":"12th"})
```


```python
#time to merge
#starting with the math tables
merged_math_df = pd.merge(school_math_avg_grades_9th, school_math_avg_grades_10th, on="school")
merged_math_df = pd.merge(merged_math_df, school_math_avg_grades_11th, on="school")
merged_math_df = pd.merge(merged_math_df, school_math_avg_grades_12th, on="school")
merged_math_df = merged_math_df.round(2)
#reading time
merged_reading_df = pd.merge(school_reading_avg_grades_9th, school_reading_avg_grades_10th, on="school")
merged_reading_df = pd.merge(merged_reading_df, school_reading_avg_grades_11th, on="school")
merged_reading_df = pd.merge(merged_reading_df, school_reading_avg_grades_12th, on="school")
merged_reading_df = merged_reading_df.round(2)
merged_reading_df.head(15)
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>school</th>
      <th>9th</th>
      <th>10th</th>
      <th>11th</th>
      <th>12th</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Bailey High School</td>
      <td>81.30</td>
      <td>80.91</td>
      <td>80.95</td>
      <td>80.91</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Cabrera High School</td>
      <td>83.68</td>
      <td>84.25</td>
      <td>83.79</td>
      <td>84.29</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Figueroa High School</td>
      <td>81.20</td>
      <td>81.41</td>
      <td>80.64</td>
      <td>81.38</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Ford High School</td>
      <td>80.63</td>
      <td>81.26</td>
      <td>80.40</td>
      <td>80.66</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Griffin High School</td>
      <td>83.37</td>
      <td>83.71</td>
      <td>84.29</td>
      <td>84.01</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Hernandez High School</td>
      <td>80.87</td>
      <td>80.66</td>
      <td>81.40</td>
      <td>80.86</td>
    </tr>
    <tr>
      <th>6</th>
      <td>Holden High School</td>
      <td>83.68</td>
      <td>83.32</td>
      <td>83.82</td>
      <td>84.70</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Huang High School</td>
      <td>81.29</td>
      <td>81.51</td>
      <td>81.42</td>
      <td>80.31</td>
    </tr>
    <tr>
      <th>8</th>
      <td>Johnson High School</td>
      <td>81.26</td>
      <td>80.77</td>
      <td>80.62</td>
      <td>81.23</td>
    </tr>
    <tr>
      <th>9</th>
      <td>Pena High School</td>
      <td>83.81</td>
      <td>83.61</td>
      <td>84.34</td>
      <td>84.59</td>
    </tr>
    <tr>
      <th>10</th>
      <td>Rodriguez High School</td>
      <td>80.99</td>
      <td>80.63</td>
      <td>80.86</td>
      <td>80.38</td>
    </tr>
    <tr>
      <th>11</th>
      <td>Shelton High School</td>
      <td>84.12</td>
      <td>83.44</td>
      <td>84.37</td>
      <td>82.78</td>
    </tr>
    <tr>
      <th>12</th>
      <td>Thomas High School</td>
      <td>83.73</td>
      <td>84.25</td>
      <td>83.59</td>
      <td>83.83</td>
    </tr>
    <tr>
      <th>13</th>
      <td>Wilson High School</td>
      <td>83.94</td>
      <td>84.02</td>
      <td>83.76</td>
      <td>84.32</td>
    </tr>
    <tr>
      <th>14</th>
      <td>Wright High School</td>
      <td>83.83</td>
      <td>83.81</td>
      <td>84.16</td>
      <td>84.07</td>
    </tr>
  </tbody>
</table>
</div>




```python
merged_math_df.head(15)
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>school</th>
      <th>9th</th>
      <th>10th</th>
      <th>11th</th>
      <th>12th</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Bailey High School</td>
      <td>77.08</td>
      <td>77.00</td>
      <td>77.52</td>
      <td>76.49</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Cabrera High School</td>
      <td>83.09</td>
      <td>83.15</td>
      <td>82.77</td>
      <td>83.28</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Figueroa High School</td>
      <td>76.40</td>
      <td>76.54</td>
      <td>76.88</td>
      <td>77.15</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Ford High School</td>
      <td>77.36</td>
      <td>77.67</td>
      <td>76.92</td>
      <td>76.18</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Griffin High School</td>
      <td>82.04</td>
      <td>84.23</td>
      <td>83.84</td>
      <td>83.36</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Hernandez High School</td>
      <td>77.44</td>
      <td>77.34</td>
      <td>77.14</td>
      <td>77.19</td>
    </tr>
    <tr>
      <th>6</th>
      <td>Holden High School</td>
      <td>83.79</td>
      <td>83.43</td>
      <td>85.00</td>
      <td>82.86</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Huang High School</td>
      <td>77.03</td>
      <td>75.91</td>
      <td>76.45</td>
      <td>77.23</td>
    </tr>
    <tr>
      <th>8</th>
      <td>Johnson High School</td>
      <td>77.19</td>
      <td>76.69</td>
      <td>77.49</td>
      <td>76.86</td>
    </tr>
    <tr>
      <th>9</th>
      <td>Pena High School</td>
      <td>83.63</td>
      <td>83.37</td>
      <td>84.33</td>
      <td>84.12</td>
    </tr>
    <tr>
      <th>10</th>
      <td>Rodriguez High School</td>
      <td>76.86</td>
      <td>76.61</td>
      <td>76.40</td>
      <td>77.69</td>
    </tr>
    <tr>
      <th>11</th>
      <td>Shelton High School</td>
      <td>83.42</td>
      <td>82.92</td>
      <td>83.38</td>
      <td>83.78</td>
    </tr>
    <tr>
      <th>12</th>
      <td>Thomas High School</td>
      <td>83.59</td>
      <td>83.09</td>
      <td>83.50</td>
      <td>83.50</td>
    </tr>
    <tr>
      <th>13</th>
      <td>Wilson High School</td>
      <td>83.09</td>
      <td>83.72</td>
      <td>83.20</td>
      <td>83.04</td>
    </tr>
    <tr>
      <th>14</th>
      <td>Wright High School</td>
      <td>83.26</td>
      <td>84.01</td>
      <td>83.84</td>
      <td>83.64</td>
    </tr>
  </tbody>
</table>
</div>




```python
bins = [0,585,615,645,675]
group_names = ["<$585","$585-615","$615-645","$645-675"]
```


```python
schools_spending["Per Student Budget"] = pd.to_numeric(schools_spending["Per Student Budget"])
pd.cut(schools_spending["Per Student Budget"], bins, labels=group_names)
```




    0     $615-645
    1        <$585
    2     $615-645
    3     $615-645
    4     $615-645
    5     $645-675
    6        <$585
    7     $645-675
    8     $645-675
    9     $585-615
    10    $615-645
    11    $585-615
    12    $615-645
    13       <$585
    14       <$585
    Name: Per Student Budget, dtype: category
    Categories (4, object): [$585-615 < $615-645 < $645-675 < <$585]




```python
schools_spending["Spending Ranges (Per Student)"] = pd.cut(schools_spending["Per Student Budget"], bins, labels=group_names)
```


```python
schools_spending = schools_spending[["Spending Ranges (Per Student)",
                       "Average Math Score",
                       "Average Reading Score",
                       "% Passing Math",
                       "% Passing Reading",
                       "% Overall Passing Rate"]]
```


```python
schools_spending = schools_spending.groupby("Spending Ranges (Per Student)")
```


```python
schools_spending.mean()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Average Math Score</th>
      <th>Average Reading Score</th>
      <th>% Passing Math</th>
      <th>% Passing Reading</th>
      <th>% Overall Passing Rate</th>
    </tr>
    <tr>
      <th>Spending Ranges (Per Student)</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>$585-615</th>
      <td>83.599686</td>
      <td>83.885211</td>
      <td>100.000000</td>
      <td>100.0</td>
      <td>100.000000</td>
    </tr>
    <tr>
      <th>$615-645</th>
      <td>79.079225</td>
      <td>81.891436</td>
      <td>92.636050</td>
      <td>100.0</td>
      <td>96.318025</td>
    </tr>
    <tr>
      <th>$645-675</th>
      <td>76.997210</td>
      <td>81.027843</td>
      <td>89.041475</td>
      <td>100.0</td>
      <td>94.520737</td>
    </tr>
    <tr>
      <th>&lt;$585</th>
      <td>83.455399</td>
      <td>83.933814</td>
      <td>100.000000</td>
      <td>100.0</td>
      <td>100.000000</td>
    </tr>
  </tbody>
</table>
</div>




```python
bins = [0,1000,2000,5000]
group_names = ["Small (<1000)","Medium (1000 - 2000)","Large(2000 - 5000)"]
```


```python

```


```python
schools_size["Total Students"] = pd.to_numeric(schools_size["Total Students"])
pd.cut(schools_size["Total Students"], bins, labels=group_names)
schools_size["Total Students"] = pd.cut(schools_size["Total Students"], bins, labels=group_names)
schools_size = schools_size[["Total Students",
                       "Average Math Score",
                       "Average Reading Score",
                       "% Passing Math",
                       "% Passing Reading",
                       "% Overall Passing Rate"]]
schools_size = schools_size.groupby("Total Students")
schools_size.mean()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Average Math Score</th>
      <th>Average Reading Score</th>
      <th>% Passing Math</th>
      <th>% Passing Reading</th>
      <th>% Overall Passing Rate</th>
    </tr>
    <tr>
      <th>Total Students</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Large(2000 - 5000)</th>
      <td>77.746417</td>
      <td>81.344493</td>
      <td>90.367591</td>
      <td>100.0</td>
      <td>95.183795</td>
    </tr>
    <tr>
      <th>Medium (1000 - 2000)</th>
      <td>83.374684</td>
      <td>83.864438</td>
      <td>100.000000</td>
      <td>100.0</td>
      <td>100.000000</td>
    </tr>
    <tr>
      <th>Small (&lt;1000)</th>
      <td>83.821598</td>
      <td>83.929843</td>
      <td>100.000000</td>
      <td>100.0</td>
      <td>100.000000</td>
    </tr>
  </tbody>
</table>
</div>




```python
schools_type.columns
```




    Index(['School', 'math_pass', 'reading_pass', 'School ID', 'School Type',
           'Total Students', 'Total School Budget', 'Per Student Budget',
           'Average Math Score', 'Average Reading Score', '% Passing Math',
           '% Passing Reading', '% Overall Passing Rate',
           'Spending Ranges (Per Student)'],
          dtype='object')




```python
schools_type.loc[schools_type["School Type"] == "Charter", "School Type"] = 5
schools_type.loc[schools_type["School Type"] == "District", "School Type"] = 25
schools_type.head()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>School</th>
      <th>math_pass</th>
      <th>reading_pass</th>
      <th>School ID</th>
      <th>School Type</th>
      <th>Total Students</th>
      <th>Total School Budget</th>
      <th>Per Student Budget</th>
      <th>Average Math Score</th>
      <th>Average Reading Score</th>
      <th>% Passing Math</th>
      <th>% Passing Reading</th>
      <th>% Overall Passing Rate</th>
      <th>Spending Ranges (Per Student)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Bailey High School</td>
      <td>4455</td>
      <td>4976</td>
      <td>7</td>
      <td>25</td>
      <td>Large(2000 - 5000)</td>
      <td>3124928</td>
      <td>628.0</td>
      <td>77.048432</td>
      <td>81.033963</td>
      <td>89.529743</td>
      <td>100.0</td>
      <td>94.764871</td>
      <td>$615-645</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Cabrera High School</td>
      <td>1858</td>
      <td>1858</td>
      <td>6</td>
      <td>5</td>
      <td>Medium (1000 - 2000)</td>
      <td>1081356</td>
      <td>582.0</td>
      <td>83.061895</td>
      <td>83.975780</td>
      <td>100.000000</td>
      <td>100.0</td>
      <td>100.000000</td>
      <td>&lt;$585</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Figueroa High School</td>
      <td>2608</td>
      <td>2949</td>
      <td>1</td>
      <td>25</td>
      <td>Large(2000 - 5000)</td>
      <td>1884411</td>
      <td>639.0</td>
      <td>76.711767</td>
      <td>81.158020</td>
      <td>88.436758</td>
      <td>100.0</td>
      <td>94.218379</td>
      <td>$615-645</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Ford High School</td>
      <td>2446</td>
      <td>2739</td>
      <td>13</td>
      <td>25</td>
      <td>Large(2000 - 5000)</td>
      <td>1763916</td>
      <td>644.0</td>
      <td>77.102592</td>
      <td>80.746258</td>
      <td>89.302665</td>
      <td>100.0</td>
      <td>94.651333</td>
      <td>$615-645</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Griffin High School</td>
      <td>1468</td>
      <td>1468</td>
      <td>4</td>
      <td>5</td>
      <td>Medium (1000 - 2000)</td>
      <td>917500</td>
      <td>625.0</td>
      <td>83.351499</td>
      <td>83.816757</td>
      <td>100.000000</td>
      <td>100.0</td>
      <td>100.000000</td>
      <td>$615-645</td>
    </tr>
  </tbody>
</table>
</div>




```python
bins = [0,10,50]
group_names = ["Charter","District"]
pd.cut(schools_type["School Type"], bins, labels=group_names)
schools_type["School Type"] = pd.cut(schools_type["School Type"], bins, labels=group_names)
schools_type = schools_type[["School Type",
                       "Average Math Score",
                       "Average Reading Score",
                       "% Passing Math",
                       "% Passing Reading",
                       "% Overall Passing Rate"]]
schools_type = schools_type.groupby("School Type")
schools_type.mean()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Average Math Score</th>
      <th>Average Reading Score</th>
      <th>% Passing Math</th>
      <th>% Passing Reading</th>
      <th>% Overall Passing Rate</th>
    </tr>
    <tr>
      <th>School Type</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Charter</th>
      <td>83.473852</td>
      <td>83.896421</td>
      <td>100.000000</td>
      <td>100.0</td>
      <td>100.000000</td>
    </tr>
    <tr>
      <th>District</th>
      <td>76.956733</td>
      <td>80.966636</td>
      <td>88.991533</td>
      <td>100.0</td>
      <td>94.495766</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Observations include:
#    Trend (1): Spending per student doesn't seem to affect performance. 
#    Trend (2): Smaller schools outperform larger schools.
#    Trend (3): Charter schools outperform district schools.
    
```
