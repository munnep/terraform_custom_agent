# terraform-custom-agent

This is an example of using the a custom agent with hooks in your environment

# How to

- clone the repository
```
git clone https://github.com/munnep/terraform_custom_agent.git
```
- Go into the directory
```
cd terraform_custom_agent/
```
- Make sure the hook files have the execution set
```
chmod +x hooks/
```
- Create the agent
```
docker build -t custom-agent .
```
- make sure the agent is being used
```
replicatedctl app-config set custom_agent_image_tag --value "custom-agent:latest"
```
- Restart TFE application to make this changes permanent
```
replicatedctl app stop
replicatedctl app start
```

