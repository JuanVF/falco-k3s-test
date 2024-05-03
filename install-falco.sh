# Add Falco with Helm
helm repo add falcosecurity https://falcosecurity.github.io/charts

helm repo update

sudo kubectl create namespace falco

# Please don't use this for real stuff
# This is just for testing and its sending the information to a public slack channel lol
helm install falco -n falco --set driver.kind=ebpf --set tty=true falcosecurity/falco \
--set falcosidekick.enabled=true \
--set falcosidekick.config.slack.webhookurl=$(base64 --decode <<< "<your slack webhookurl base64 encoded>") \
--set falcosidekick.config.slack.minimumpriority=notice \
--set falcosidekick.config.customfields="user:<your user>"

# ------------------- This is just for testing --------------------------
# So, the falco is checking the whole cluster
# It will send alerts to that slack channel which is a good integration!
# In this case it detects that the alpine pod just open a shell
# which in real situations it can be an attack but not necessarily
kubectl run alpine --image alpine -- sh -c "sleep infinity"

kubectl exec -it alpine -- sh -c "uptime"
