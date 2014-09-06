# add github to the list of known_hosts
# see
# http://rshestakov.wordpress.com/2014/01/26/how-to-make-vagrant-and-puppet-to-clone-private-github-repo/
if [[ ! -a /home/vagrant/.ssh/known_hosts  ]]; then
	echo "Add github.com to known_hosts"
	touch /home/vagrant/.ssh/known_hosts && \
		ssh-keyscan -H github.com >> /home/vagrant/.ssh/known_hosts && \
		chmod 600 /home/vagrant/.ssh/known_hosts && \
		chown vagrant /home/vagrant/.ssh/known_hosts
fi
