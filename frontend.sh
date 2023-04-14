echo -e "\e[36minstall nginx\e[0m"
yum install nginx -y
echo -e "\e[36mremoving old content\e[0m"
rm -rf /usr/share/nginx/html/*
echo -e "\e[36mdownloading frontend content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
echo -e "\e[36mExtrating frontend content\e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
echo -e "\e[36mExtrating frontend content\e[0m"
cp configs/nginx-roboshop.conf /etc/nginx/default.d/roboshop.conf
echo -e "\e[36menable nginx\e[0m"
systemctl enable nginx
echo -e "\e[36mrestart nginx\e[0m"
systemctl restart nginx