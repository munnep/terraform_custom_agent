# terraform-custom-agent

This is an example of using the a custom agent with hooks in your environment

# How to

- clone the repository
```
git clone https://github.com/munnep/terraform_custom_agent.git
```
- Make sure the hook files have the execution set
```
chown +x hooks/
```
- Create the agent
```
docker build -t custom-agent .
```
- 