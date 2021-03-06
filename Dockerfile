# This file is part of REANA.
# Copyright (C) 2017, 2018 CERN.
#
# REANA is free software; you can redistribute it and/or modify it
# under the terms of the MIT License; see LICENSE file for more details.

FROM ubuntu:16.04
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install rabbitmq-server
RUN apt-get -y autoremove && apt-get -y clean
RUN service rabbitmq-server start
ADD start.sh /start.sh
RUN chmod 755 ./start.sh
EXPOSE 5672
EXPOSE 15672
CMD ["/start.sh", "test", "1234"]
