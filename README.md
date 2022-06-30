 # Run ElasticSearch local with ssl]

 ```bash
   chmod +x ./certgen.sh   
   # generate ssl keys save in folder ./elkcerts
   bash ./certgen.sh "<mycertpassword>"

    # install ssl keys ubuntu or macos   
   chmod +x ./install_ubuntu.sh
   sudo bash ./install_ubuntu.sh

   # install ssl keys ubuntu or macos   
   chmod +x ./install_centos.sh
   sudo bash ./install_centos.sh

   # Run docker compose
   docker compose up -d

 ```