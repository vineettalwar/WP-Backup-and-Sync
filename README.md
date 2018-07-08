# WP-Backup-and-Sync
The purpose of the script is to perform automated backups and sync to s3.
This repository consists code used in the talk at WordCamp Poznan, 2018
https://2018.poznan.wordcamp.org/session/wordpress-backups-disaster-management-and-recovery/


## About

*  This script is useful, when you need to take automated backups of all the WordPress installations on a server.
*  It can be n number of installations, considering their respected document root exists in one root directory.

# NOTE:

* Be sure of the file permissions and user roles, for the backups directory.
* You may need to adjust the script according to your folder structure. 
* You need to set the name of your s3 bucket.


## What can I do with it ?

* Take Database dump of single installations - use singlebackup.sh 
* Take Database dump of multiple installations -  use multibackup.sh
* Take Multibackups and sync the dumps to S3 multibackup.sh
* Automate the backups by attaching it to a cron job

## Dependency
* You need WP-CLI installed
* Web: https://wp-cli.org
* You can only update WordPress installations.

## Assumptions:
* You have installed WP-CLI using the instructions from https://wp-cli.org
* Your WP-CLI is installed in /usr/local/bin/
* In case you are running WP-CLI locally from a directory, make sure to change the path before wp in the script
* Make sure to replace document root from `/var/www/*` with what ever document root of your all the WordPress websites are.
* In case you keep your WordPress installations one or two level down change the path accordingly.
* For instance, `/var/www/html/*/htdocs;`
* You have already created an s3 bucket. 


## Installation:
* Logon to your server via ssh
* upload the script on your home directory.
* change file permissions to be executable by your user group atleast `chmod g+x backupandsync.sh`

## Configuring AWS S3 CLI
* Assuming you have already installed AWS CLI package. 
* If you are running amazon ec2 server, it must be already installed.
* aws cli need to be configured
`aws configure`
* More documentation regarding configuring aws cli can be found at https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html

## Use cases

###  Manual Execution:

* Run `~/backupandsync.sh`
* Be sure to test before attaching it to a cron job

### Using Cronjob

* Lets say you wanna udpate everything via a cronjob, which executes every night at 1am.
* `crontab -e` and Add following job.
`0 1 * * *  ~/backupandsync.sh`

* You can use https://crontab.guru/ to learn more about cron schedule expressions.
