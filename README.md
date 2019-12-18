# data_download

This docker image downloads data appropriate for webnucleo projects.  You first need to have installed [docker](https://runnable.com/docker/getting-started/) and be able to run it. You can verify that docker is properly installed, for example, by running the Hello, World image in an appropriate shell.  To do so, type:

**docker run hello-world**

Now you can pull the data downloader.  Type:

**docker pull webnucleo/data_download**

Once installed, you can run the image.  First, choose the directory you will download the data to and find its absolute path.   On a linux type system, you can change to an appropriate directory and type

**pwd**

For example, I am on my Mac Desktop, so I find the result is */Users/bradleymeyer/Desktop*.  I will download the data to a directory *data_pub* off my Desktop (you will use the answer to *pwd* instead of */Users/bradleymeyer/Desktop* in your case).  To do so, I type (all on a single line)

**docker run -it -v /Users/bradleymeyer/Desktop/data_pub:/data_directory -e VAR=data webnucleo/data_download**

The downloaded data are in the directory *data_pub*.  The variable *VAR* tells the image which data to download.  Current possible values of *VAR* are *data*, *multi_zone_data*, *neutrino_data*, and *weak_data*.  These are used in Webnucleo codes. For example, I can get the neutrino data by typing (on a single line)

**docker run -it -v /Users/bradleymeyer/Desktop/data_pub:/data_directory -e VAR="neutrino_data" webnucleo/data_download**

To clean up all the data, I type

**docker run -it -e VAR=clean_data webnucleo/data_download**

and then

**rm -fr data_pub**

There are a number of possible different versions of the basic Webnucleo data (*VAR=data*), as described at this blog [post](https://sourceforge.net/u/mbradle/blog/2018/12/downloading-various-webnucleo-network-xml-files/).  To choose among these, add the appropriate environment variable to your docker run.  For example, to get the full version of V2.0 and leave the version name, I can type (on a single line):

**docker run -it -v /Users/bradleymeyer/Desktop/data_pub:/data_directory -e VAR=data -e WN_DATA_VERSION="V2.0" -e WN_DATA_FULL=1 -e WN_DATA_LEAVE_VERSION_NAME=1 webnucleo/data_download**



