# Spatial Databases Development

### Author: Nate Currit 
### Geography Department, Texas State University

#### Prerequisites
1. Install Docker
    1. sudo snap install docker (my preferred method on my Linux system)
    2. https://hub.docker.com/editions/community/docker-ce-desktop-windows/
    3. https://hub.docker.com/editions/community/docker-ce-desktop-mac/

#### Instructions
1. Download this repository
    1. If you [git](https://git-scm.com) installed, the easiest way to download it is with the following terminal command: `git clone https://github.com/chikaj/exspda_setup.git`
    2. If you do not have [git](https://git-scm.com) (consider getting it, or...), go to https://github.com/chikaj/exspda_setup, click the `Code` button and select `Download ZIP`.
2. Build and run the software stack by doing the following:
    1. Open a terminal, navigate to the downloaded respistory, and run the following Docker command:
        1. `docker-compose up --build -d`
            * The above command could be split into 2 commands (`docker-compose build` _and_ `docker-compose up -d`). The -d flag runs the software stack in the background as a daemon
            * The above command will run the software stack that we will mainly use in the Spatial Database course: PostgreSQL with the PostGIS extension, pgAdmin4, pg_featureserv and pg_tileserv
3. Stop the software stack by doing the following:
    1. In a terminal, navigate to the downloaded repository, and run the following Docker command:
        1. `docker-compose stop`
            * The above command will stop the software stack.
            * Your user data is stored persistently, including database connection parameters, database tables, etc. 
4. The next time you want to run (and then stop) the software stack, open a terminal, navigate to the downloaded repository, and execute the following commands:
    1. `docker-compose up -d`
        * Notice that there is no _--build_ included in the above statement. This starts the software stack.
    2. `docker-compose stop`
        * This stops the software stack.
