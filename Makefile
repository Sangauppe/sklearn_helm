# Variables
HELM = /usr/local/bin/helm3
NAMESPACE = default
CHART_NAME = sklearn
CHART_PACKAGE = sklearn-inference-chart-0.1.0.tgz
VALUES_FILE = values.yaml

# Targets and Rules
testrun:
	/usr/local/bin/helm3 install sklearn /home/sangauppe/docker/infhelm/kserve-model-chart/sklearn-inference-chart-0.1.0.tgz
deploy:
	@$(HELM) install $(CHART_NAME) $(CHART_PACKAGE) --namespace $(NAMESPACE) --values $(VALUES_FILE)

upgrade:
	@$(HELM) upgrade $(CHART_NAME) $(CHART_PACKAGE) --namespace $(NAMESPACE) --values $(VALUES_FILE)

undeploy:
	@$(HELM) uninstall $(CHART_NAME) --namespace $(NAMESPACE)

.PHONY: testrun deploy upgrade undeploy
