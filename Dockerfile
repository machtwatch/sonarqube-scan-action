FROM public.ecr.aws/s3z4b7i5/sonar-scanner-cli:11.0

LABEL version="2.1.0" \
      repository="https://github.com/machtwatch/sonarqube-scan-action" \
      homepage="https://github.com/machtwatch/sonarqube-scan-action" \
      maintainer="SonarSource" \
      com.github.actions.name="SonarQube Scan" \
      com.github.actions.description="Scan your code with SonarQube to detect Bugs, Vulnerabilities and Code Smells in up to 27 programming languages!" \
      com.github.actions.icon="check" \
      com.github.actions.color="green"

# GitHub actions should be run under ROOT
# https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners/about-github-hosted-runners#docker-container-filesystem
USER 0

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
COPY cleanup.sh /cleanup.sh
RUN chmod +x /cleanup.sh

ENTRYPOINT ["/entrypoint.sh"]
