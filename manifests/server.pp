define prometheus::server(
  String[1] $namespace = 'kube-system',
){
  include kubernetes

  $scrape_configs = Prometheus::Scrape_config <| title == $name |>
  $rules = Prometheus::Rule <| title == $name |>

  kubernetes::apply{'prometheus-server':
    manifests => [
      template('prometheus/prometheus-ns.yaml.erb'),
      template('prometheus/prometheus-config.yaml.erb'),
      template('prometheus/prometheus-rules.yaml.erb'),
      template('prometheus/prometheus-deployment.yaml.erb'),
      template('prometheus/prometheus-svc.yaml.erb'),
    ],
  }
}
