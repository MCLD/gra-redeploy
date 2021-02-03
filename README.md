# Re-deploying The Great Reading Adventure

:warning: **This project is no longer under active development, please consider using Docker if you are frequently redeploying The Great Reading Adventure.** :warning:

These are some quick hacks to help facilitate redeploying the [Great Reading Adventure](https://github.com/MCLD/greatreadingadventure) software. During use of the software, administrators utilizing the Control Room can upload files to the site (images) and customize files saved on the site (resources and CSS). These files might be accidentally overwritten upon deployment unless care is taken. This project contains scripts to help automate the deployment process to ensure those files are not lost.

The expected use of this process is for developers who are making code and database enhancements actively while reading programs are running. **It's a much better idea to just deploy the latest release if that is possible. If you are not actively making changes to the source code, the [deployment instructions in the manual](http://manual.greatreadingadventure.com/en/latest/#install-docs) are the best approach to follow.**

Obviously, you want to do this during lower-activity hours or use a [blue-green deployment strategy](https://kevinareed.com/2015/11/07/how-to-deploy-anything-in-iis-with-zero-downtime-on-a-single-server/) to minimize or eliminate downtime.

# Configuration

Of course you'll want to change the paths in these scripts. You can use [UNC paths](https://en.wikipedia.org/wiki/Path_(computing)#Uniform_Naming_Convention) if you are building and deploying to different servers.

# Steps to re-deploy the GRA

1. Back up current database
2. Back up current production site code
3. Open `Great Reading Adventure.sln` in Visual Studio
4. Right-click on the `GRA.Database` project and select `Schema Compare`
5. Leave the `GRA.Database` project selected on the left and select the production database on the right
6. Click the gear in the toolbar, expand `Application-scoped` and deselect `Database Roles` and `Users`
7. Click `Compare`
8. If there are differences, click the script icon (to the right of the `Update` button) to generate a migration script and save it
9. Right-click on the `SRP` project and run publish to a local directory: `c:\deployments\gra\`
10. Open PowerShell
11. Run: [`preserve-and-prep.ps1`](https://github.com/MCLD/gra-redeploy/blob/master/deploy-gra.ps1)
12. (Optional) verify files are as they should be for deployment - see the paths in the `preserve-and-prep.ps1` script for more deatils
13. Did you really back up the database and files in the first two steps? If not, this is your last chance. Do it!
14. Run: [`deploy-gra.ps1`](https://github.com/MCLD/gra-redeploy/blob/master/deploy-gra.ps1) :shipit:
15. Run: SQL migration script if one was generated above - remember to ensure you are in `SQLCMD` mode (in SSMS it's in the `Query` menu)
16. Smoke test: log into the Control Room, see programs and badges list successfully
17. Smoke test: log in as Patron

# License

The scripts and information in this repository are distributed under [The MIT License](https://github.com/MCLD/gra-redeploy/blob/master/LICENSE).
