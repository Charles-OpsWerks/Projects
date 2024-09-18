FROM ubuntu:latest
WORKDIR /Projects
COPY . .
RUN chmod 777 -R /Projects
RUN apt-get update && \
    apt-get install -y bash ttyd
		
CMD ["ttyd", "--writable", "-p", "8080", "bash", "shift_sched.sh"]
