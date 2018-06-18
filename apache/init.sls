#installs apache and sets it to run on startup

{% from "apache/map.sls" import apache with context %}

install_apache:
  pkg.installed:
    - name: {{ apache.pkg }}

start_apache:
  service.running:
    - name: {{ apache.pkg }}
    - enable: True
    - require:
      - pkg: install_apache