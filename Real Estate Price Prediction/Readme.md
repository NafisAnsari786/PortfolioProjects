![image](https://github.com/user-attachments/assets/392535d1-f63e-4867-bf16-ee2fbd3244e9)

This data science project series walks through step by step process of how to build a real estate price prediction website. We will first build a model using sklearn and linear regression using banglore home prices dataset from kaggle.com. Second step would be to write a python flask server that uses the saved model to serve http requests. Third component is the website built in html, css and javascript that allows user to enter home square ft area, bedrooms etc and it will call python flask server to retrieve the predicted price. During model building we will cover almost all data science concepts such as data load and cleaning, outlier detection and removal, feature engineering, dimensionality reduction, gridsearchcv for hyperparameter tunning, k fold cross validation etc. 
**Technology and tools wise this project covers,**

1. Python
2. Numpy and Pandas for data cleaning
3. Matplotlib for data visualization
4. Sklearn for model building
5. Jupyter notebook, visual studio code and pycharm as IDE
6. Python flask for http server
7. HTML/CSS/Javascript for UI

# **Deploy this app to cloud (AWS EC2)**
1. Create EC2 instance using amazon console, also in security group add a rule to allow HTTP incoming traffic
2. Now connect to your instance using a command like this,
```bash
ssh -i "C:\Users\Nafis Ansari\.ssh\bhp.pem" ubuntu@ec2-16-171-7-165.eu-north-1.compute.amazonaws.com
```
3. nginx setup

    i. Install nginx on EC2 instance using these commands,
    ```bash
    sudo apt-get update
    sudo apt-get install nginx
    ```
    ii. Above will install nginx as well as run it. Check status of nginx using
   ```bash
   sudo service nginx status
   ```
   iii. Here are the commands to start/stop/restart nginx
   ```bash
   sudo service nginx start
   sudo service nginx stop
   sudo service nginx restart
   ```
   iv. Now when you load cloud url in browser you will see a message saying "welcome to nginx" This means your nginx is setup and running.
4. Now you need to copy all your code to EC2 instance. You can do this either using git or copy files using winscp. We will use winscp.
5. Once you connect to EC2 instance from winscp, you can now copy all your code files into /home/ubuntu/ folder. The full path of your root folder is now: /home/ubuntu/BHP.
6. After copying code on EC2 server now you can point nginx to load your property website by default. Follow the steps below,
   i. Create this file /etc/nginx/sites-available/bhp.conf. The file content looks like this,
   ```bash
   server {
    listen 80;
    server_name <'your server_name or IP on EC2'>;  # Your EC2 public IP address

    root /var/www/html;  # Path to your static files
    index app.html;  # Default file to load

    location / {
        try_files $uri $uri/ =404;
    }

    # Reverse Proxy for Flask backend
    location /api/ {
        proxy_pass http://127.0.0.1:5000;  # Forward to Flask app running on port 5000
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        }
     }
    ```
   ii. Create symlink for this file in /etc/nginx/sites-enabled by running this command,
   ```
   sudo ln -v -s /etc/nginx/sites-available/bhp.conf
   ```
   iii. Remove symlink for default file in /etc/nginx/sites-enabled directory,
   ```bash
   sudo unlink default
   ```
   iv. Restart nginx,
   ```bash
   sudo service nginx restart
   ```
7. Now install python packages using the requirements.txt and start flask server
```bash
sudo apt-get install python3-pip
sudo pip3 install -r /home/ubuntu/BHP/server/requirements.txt
python3 /home/ubuntu/BHP/client/server.py
```
Running the last command above will prompt that the server is running on port 5000.

8. Now just load your cloud URL in a browser (for me, it was [http://ec2-16-171-7-165.eu-north-1.compute.amazonaws.com](http://ec2-16-171-7-165.eu-north-1.compute.amazonaws.com)) and this will be a fully functional website running in a production cloud environment
