FROM centos:7
ADD . /opt/wallboard
WORKDIR /opt/wallboard
RUN yum install ruby -y
RUN gem install bundler
RUN bundle install
RUN gem install haml
ENTRYPOINT rackup -o 0.0.0.0
EXPOSE 9292


