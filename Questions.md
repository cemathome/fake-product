# Docker Requirements
## Questions to think about
- How would you test this application?
We can run it on local machine.
```sh
docker-compose up -d
```
Then we can try to reach http://localhost:8080/ on the browser on the same local computer.

We can also check the connection to the network with the shell
```sh
docker exec -it fp-app sh
ping fp-postgres -c 1
apk add postgresql-client
psql -h fp-postgres -U postgres
```

- How would you deploy this application
By default, deployment listens to the `0.0.0.0:8080` address. Therefore, we can deploy it on a vm, and the public IP of the vm can be set to DNS records. If we still have another application, it also listens to port `8080`, they will conflict.
If we use Docker-Compose Config to set a specific IP instead of `0.0.0.0`, we can use multiple containers with the same port. However, hardcoded IP management will cause problems at the end.

I prefer to deploy on K8s instead of using Docker Compose on the prod.

- How would you manage configurations for secrets (ie. the DB password)
There is a feature called `docker secret` but external secret management app would be better, like Vault.

# Terraform Requirements
## Questions to think about
- What type of security concerns do you have around the VPC?
We can set NACL and security groups while enabling access over internet.

- What questions do you have about the 2 users that have full admin access?
If they are developers, we should restrict them to full access on related resources, like EC2 and S3 of "fake product"
If they are sys-admins, they should have everything :)

- What security precautions would you take for system users vs. human users?
They are not so different according to IAM rules.
"human users" should have Web Console access, "system users" should have some system level permissions, like "roles/iam.serviceAccountUser" role in GCP.

