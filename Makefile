chrome:
	google-chrome -incognito --user-data-dir="/tmp/chrome-local-test" --host-resolver-rules="MAP iandalou.42.fr 10.14.56.55" https://iandalou.42.fr

sync:
	git add .
	git commit -m "commit"
	git push origin master

up:
	docker compose -f srcs/docker-compose.yml up --force-recreate -d

down:
	docker compose -f srcs/docker-compose.yml down --rmi all -v --remove-orphans

rebuild: down
	docker compose -f srcs/docker-compose.yml build --no-cache

list:
	docker compose -f srcs/docker-compose.yml ps -a
