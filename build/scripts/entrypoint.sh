set -e
    
sudo init-docker.sh

# Prepare user home with default files on first start.
if [ ! -f ~/.init_done ]; then
cp -rT /etc/skel ~
touch ~/.init_done
fi

# install and start code-server
curl -fsSL https://code-server.dev/install.sh | sh -s -- --method=standalone --prefix=/tmp/code-server --version 4.19.1

/init/scripts/sync-settings.sh

# Run the custom scripts
for f in /init/custom-init/*.sh; do
  bash "$f" || break
done

/tmp/code-server/bin/code-server --auth none --port 13337 >/tmp/code-server.log 2>&1 &