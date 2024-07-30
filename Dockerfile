FROM mcr.microsoft.com/dotnet/sdk:8.0

WORKDIR /app

RUN apt-get update && \
    apt-get install -y zsh && \
    wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh && \
    echo | sh install.sh && chsh -s $(which zsh)

RUN wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install -y dotnet-sdk-8.0

RUN useradd -r -u 1000 -d /app dotnet

# Install dotnet-ef

#RUN dotnet tool install --global dotnet-ef
#ENV PATH="$PATH:/root/.dotnet/tools"

CMD [ "zsh" ]
