# %% [markdown] 
# # Amazon Web Scraper Project   
  
# %%   
from bs4 import BeautifulSoup 
import requests as r  
import datetime   
import time     
import smtplib     
  
# %%  
# Connect to Website and pull in data   
 
URL='https://www.amazon.in/gp/product/B0CHX2WQLX/ref=s9_bw_cg_Budget_8f1_w?pf_rd_m=AT95IG9ONZD7S&pf_rd_s=merchandised-search-11&pf_rd_r=FFYP77Z0Y7RXT8SJT83H&pf_rd_t=101&pf_rd_p=46012d7b-8fec-4760-8b34-c70e8edfda2b&pf_rd_i=1389401031&th=1'

headers={"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36","Accept-Encoding":"gzip, deflate", "Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8", "DNT":"1","Connection":"close", "Upgrade-Insecure-Requests":"1"}

page=r.get(URL, headers=headers) 
 
soup1=BeautifulSoup(page.content, 'html.parser') 
print(soup1)   
  
  

# %% 
soup2=BeautifulSoup(soup1.prettify(),'html.parser') 
print(soup2)

# %%
# Here, get_text() works only if we define soup1 and soup2 seperately, and in some instances only once
title=soup2.find(id="productTitle").get_text()

price=soup2.find(class_="a-price-whole").get_text()

ratings_count=soup2.find(class_="a-size-base a-color-secondary").get_text()

print(title)
print(price) 
print(ratings_count) 

# %%
# Cleaning the data 

title=title.strip()
price=price.replace('\n','').strip()
ratings_count=ratings_count.strip()


print(title)
print(price)
print(ratings_count)
 

# %%
# Creating a timestamp for your output to track when data was collected
 
import datetime

today= datetime.date.today()

print(today)


# %%
# Create a CSV and write headers and data into the file 

import csv

headers=['Title','Price','Number of Ratings','Date']
data=[title,price,ratings_count,today]


with open('AmazonWebScraperDataset.csv','w', newline='', encoding='UTF8')as f:
    writer=csv.writer(f)
    writer.writerow(headers)
    writer.writerow(data)

# %%
import pandas as pd
df=pd.read_csv(r"C:\Users\Nafis Ansari\Desktop\Python Practice codes\Data Analyst Bootcamp\Amazon Web Scrapper\AmazonWebScraperDataset.csv")
df

# %%
# Now we will append data to the csv

with open('AmazonWebScraperDataset.csv','a+', newline='', encoding='UTF8')as f:
    writer=csv.writer(f)
    writer.writerow(data)

# %%
# Now we will combine all the above into a function for autoamting it

def check_price():
    URL='https://www.amazon.in/gp/product/B0CHX2WQLX/ref=s9_bw_cg_Budget_8f1_w?pf_rd_m=AT95IG9ONZD7S&pf_rd_s=merchandised-search-11&pf_rd_r=FFYP77Z0Y7RXT8SJT83H&pf_rd_t=101&pf_rd_p=46012d7b-8fec-4760-8b34-c70e8edfda2b&pf_rd_i=1389401031&th=1'

    headers={"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36","Accept-Encoding":"gzip, deflate", "Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8", "DNT":"1","Connection":"close", "Upgrade-Insecure-Requests":"1"}

    page=r.get(URL, headers=headers)

    soup2=BeautifulSoup(page.content, 'html.parser')
    # soup2=BeautifulSoup(soup1.prettify(),'html.parser')
    
    title=soup2.find(id="productTitle").get_text()

    price=soup2.find(class_="a-price-whole").get_text()

    ratings_count=soup2.find(class_="a-size-base a-color-secondary").get_text()

    title=title.strip()
    price=price.replace('\n','').strip()
    ratings_count=ratings_count.strip()

    import datetime

    today= datetime.date.today()
    
    with open('AmazonWebScraperDataset.csv','a+', newline='', encoding='UTF8')as f:
        writer=csv.writer(f)
        writer.writerow(data)


# %%
check_price()
time.sleep(10)

# %%
while(True):
    check_price()
    time.sleep()

# %%
import csv
import datetime
import time

def check_price():
    URL = 'https://www.amazon.in/gp/product/B0CHX2WQLX/ref=s9_bw_cg_Budget_8f1_w?pf_rd_m=AT95IG9ONZD7S&pf_rd_s=merchandised-search-11&pf_rd_r=FFYP77Z0Y7RXT8SJT83H&pf_rd_t=101&pf_rd_p=46012d7b-8fec-4760-8b34-c70e8edfda2b&pf_rd_i=1389401031&th=1'

    headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36", "Accept-Encoding": "gzip, deflate", "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8", "DNT": "1", "Connection": "close", "Upgrade-Insecure-Requests": "1"}

    page = r.get(URL, headers=headers)

    soup1 = BeautifulSoup(page.content, 'html.parser')
    soup2 = BeautifulSoup(soup1.prettify(), 'html.parser')

    title_element = soup2.find(id="productTitle")
    price_element = soup2.find(class_="a-price-whole")
    ratings_count_element = soup2.find(class_="a-size-base a-color-secondary")

    if title_element and price_element and ratings_count_element:
        title = title_element.get_text().strip()
        price = price_element.get_text().strip()
        ratings_count = ratings_count_element.get_text().strip()

        today = datetime.date.today()

        data = [title, price, ratings_count, today]

        with open('AmazonWebScraperDataset.csv', 'a+', newline='', encoding='UTF8') as f:
            writer = csv.writer(f)
            writer.writerow(data)
    else:
        print("Some elements not found. Skipping this iteration.")


while True:
    check_price()
    time.sleep(5)


# %%



