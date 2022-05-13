node(){
    stage('Ansible Pull Code'){
        sh '''url=git@github.com:nagarjuna79/harman.git
              checkout=main
              directory=/var/projects/ansible-git
              logfile=/var/log/ansible.log
              ssh_file=/root/.ssh/id_rsa
              sudo ansible-pull -o -C ${checkout} -d ${directory} -i localhost:${directory}/inventory -U ${url} --accept-host-key'''
        }
    stage('Push Index file to S3'){
        sh '''cd /var/projects/ansible-git
              aws s3 cp index.html s3://webapp-bucket12345/indexfiles/'''
    }
    stage('Git clone Terraform Code'){
        sh '''sudo rm -rf harman
              sudo git clone -b terraform-scripts git@github.com:nagarjuna79/harman.git
              ls

        '''
        }
    stage('terraform steps'){
        sh '''cd harman/
              sudo terraform init
              sudo terraform validate
              sudo terraform plan
              sudo terraform apply -auto-approve'''
    }
    stage('git push state files'){
        sh '''ls
              cd harman
              sudo git init
              sudo git add *
              sudo git status
              sudo git commit -am.
              sudo git push origin terraform-scripts -f'''
        
    }
}
