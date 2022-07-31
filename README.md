# Fuck Deploy
Use rsync with SSH and SSHPASS to deploy project in server

## Usage

  1. `type`: Authentication Method
   - `key`: Private Key
   - `password`: Remote Server Password
  2. `username`: Remote Server Username
  3. `host`: Remote Server IP Address or Domain Name
  4. `port`: Remote Server Port, default `22`
  5. `remote_path`: Remote Server Path
  6. `local_path`: Github Runner Local Relative Path
  7. `args`: Rsync Arguments
  8. `ssh_args`: SSH Arguments
  9. `script`: Deployment Script

Environment: `prod` or `dev`

## References:

 - [Windows 10 使用 OpenSSH + Rsync/SCP 同步文件](https://naizi.moe/2020/05/03/win10-ssh-rsync-scp/)
 - [rsync实现 linux与windows备份同步](https://cloud.tencent.com/developer/article/1677927)
