project_name=myna

builder-build :
	docker build -f builder.Dockerfile -t $(project_name)-builder:latest .

builder-run :
	docker run \
		--rm \
		-it \
		-v "$(PWD):/home/app" \
		$(project_name)-builder:latest
