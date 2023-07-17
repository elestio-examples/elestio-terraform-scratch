# Elestio Terraform From-Scratch Example

Rename `secrets.tfvars.example` to `secrets.tfvars` and fill the values with yours.

#### Apply the Terraform configuration

1. Download and install the Elestio provider defined in the configuration :

   ```bash
   terraform init
   ```

2. Ensure the configuration is syntactically valid and internally consistent:

   ```bash
   terraform validate
   ```

3. Apply the configuration :

   ```bash
   terraform apply -var-file="secrets.tfvars"
   ```

   Deployment time varies by service, provider, datacenter and server type.

4. Voila, you have created a Project and PostgreSQL Service using Terraform !

   You can visit the [Elestio web dashboard](https://dash.elest.io/) to see these ressources.

#### Update the configuration

1. Change the `firewall_enabled` value to false in `main.tf` and run the following command :

   ```bash
   terraform apply -var-file="secrets.tfvars"
   ```

   This will update the configuration and destroy the firewall.

2. Revert the change in `main.tf` and run the following command :

   ```bash
   terraform apply -var-file="secrets.tfvars"
   ```

   This will update the configuration and create the firewall again.

Some changes (ex: `datacenter`) require the creation of new resources and the destruction of old resources.
Terraform will show you the resources to be created and destroyed before prompting you to confirm.
You can loose data if you destroy a resource, so be careful.

#### (Optional) Access to the database

Let's try to connect to the database to see if everything worked well

First, you need to [install psql. ](https://www.timescale.com/blog/how-to-install-psql-on-mac-ubuntu-debian-windows/)

After that, run this command :

```bash
eval "$(terraform output -raw pg_service_psql_command)"
```

-> **Note:** The command to leave psql terminal is `\q`

#### Clean up

Run the following command to destroy all the resources you created:

```bash
terraform destroy -var-file="secrets.tfvars"
```

This command destroys all the resources specified in your Terraform state. `terraform destroy` doesn't destroy resources running elsewhere that aren't managed by the current Terraform project.

Now you've created and destroyed an entire Elestio deployment!

Visit the [Elestio Dashboard](https://dash.elest.io/) to verify the resources have been destroyed to avoid unexpected charges.
