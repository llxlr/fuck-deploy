# Fuck Deploy
Use rsync with SSH and SSHPASS to deploy project in server

## Usage
  1. `type`: login verification method
   - `port`: default `22`
   - `password`: Password
  2. `username`: server username
  3. `host`: ip address
  4. `private_key`: private key
  5. `remote_path`: server absolute path
  6. `local_path`: Github Actions' server relative path
  7. `args`: rsync args
  8. `ssh_args`: ssh args
  9. `scripts`: 
   - `path`: scripts path
   - `args`: scripts args

## References:

 - [Windows 10 使用 OpenSSH + Rsync/SCP 同步文件](https://naizi.moe/2020/05/03/win10-ssh-rsync-scp/)
 - [rsync实现 linux与windows备份同步](https://cloud.tencent.com/developer/article/1677927)
