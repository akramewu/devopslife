Step-by-Step Guide to Install Java on macOS

Open a web browser and go to the Java SE Downloads page : https://www.oracle.com/java/technologies/javase-downloads.html

Click on the latest JDK (Java Development Kit) version to download it. For most users, the latest JDK is recommended.

After selecting the JDK version, you will need to accept the Oracle Technology Network License Agreement for Oracle Java SE.

Select the macOS installer, which should be a .dmg file, and download it.

Once the download is complete, open the .dmg file to start the installation process.
Follow the instructions in the installer to complete the installation.
Set JAVA_HOME Environment Variable (Optional but recommended):

Open Terminal.
Edit your shell profile file (~/.bash_profile, ~/.zshrc, or ~/.bashrc depending on your shell) by adding the following lines:

chmod u+w ~/.zshrc (if mac user mostly)
nano ~/.zshrc

and paste the below exports:

export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$JAVA_HOME/bin:$PATH

Press Ctrl + O to save.
Press Enter to confirm.
Press Ctrl + X to exit.

Save the file and run source ~/.bash_profile or source ~/.zshrc to apply the changes.
Verify Installation:

Open Terminal and run:

java -version

You should see the installed Java version.
