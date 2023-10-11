FROM ubuntu

WORKDIR /root

RUN apt-get update
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get -qq -y install curl wget unzip zip

RUN curl -s "https://get.sdkman.io" | bash
RUN source "/root/.sdkman/bin/sdkman-init.sh"   \
                && sdk install java 21-open  \
                && sdk install maven \
                && sdk install gradle


ENV JAVA_HOME="/root/.sdkman/candidates/java/current"
ENV MAVEN_HOME="/root/.sdkman/candidates/maven/current"
ENV GRADLE_HOME="/root/.sdkman/candidates/gradle/current"
ENV PATH=$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin:$GRADLE_HOME/bin

CMD ["java", "--version"]
