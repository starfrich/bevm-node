# Docker Setup for BEVM Node

This script automates the setup process for running a BEVM node using Docker on your VPS.

## Installation

1. Download this script with wget:

    ```bash
    wget https://raw.githubusercontent.com/starfrich/bevm-node/main/script.sh
    ```

2. Make the script executable:

    ```bash
    chmod +x script.sh
    ```

3. Run the Docker installation script:

    ```bash
    sudo sh script.sh
    ```

---

**Note:** 
- When prompted, enter your desired node name. Recommended using your **EVM address**.
  ![image](https://github.com/starfrich/bevm-node/assets/119293469/2d7a889f-e836-4bfb-ba3a-283b698ab201)
- To stop node you can simply using this command:
  ```bash
    sudo docker stop CONTAINER ID
  ```
  ![image](https://github.com/starfrich/bevm-node/assets/119293469/6bac1173-56ba-4331-8c34-2554f9d46610)

## Documentation

[BEVM Docs](https://documents.bevm.io/)

## Community

- [Twitter](https://twitter.com/BTClayer2)
- [Discord](https://discord.com/invite/gRJ72RcrNK)
- [Developer TG Group](https://t.me/+gEWgmtyG_5k2MTll)
