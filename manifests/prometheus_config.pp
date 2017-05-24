kubectl::apply { 'prometheus-configmap':
  type => 'concat',
}

kubectl::apply_fragment { 'prometheus-config-header':
  manifests => [],
  order     => '01',
  target    => '/etc/kubernetes/apply/prometheus-configmap.yaml',
}

kubectl::apply_fragment: { 'prometheus-filename':
  manifest => "prometheus.yml: |-",
  order    => '02',
  target    => '/etc/kubernetes/apply/prometheus-configmap.yaml',
}

kubectl::apply_fragment { 'prometheus-rules':
  manifest => ''
  order    => '03',
  target    => '/etc/kubernetes/apply/prometheus-configmap.yaml',
}

kubectl::apply_fragment { 'prometheus-global':
  manifest => ''
  order    => '04'
  target    => '/etc/kubernetes/apply/prometheus-configmap.yaml',
}

kubectl::apply_fragment { 'prometheus-scrape-config':
  manifest => 'scrape_configs',
  order    => '05',
  target    => '/etc/kubernetes/apply/prometheus-configmap.yaml',
}

kubectl::apply_fragment { 'prometheus-job-etcd-exporter':
  manifest => 'job_name: etcd-exporter',
  order    => '06',
  target    => '/etc/kubernetes/apply/prometheus-configmap.yaml',
}

kubectl::apply_fragment { 'prometheus-job-etcd-k8s':
  manifest => 'job_name: etcd-k8s',
  order    => '07',
  target    => '/etc/kubernetes/apply/prometheus-configmap.yaml',
}

kubectl::apply_fragment { 'prometheus-job-events-k8s':
  manifest => 'job_name: events_k8s',
  order    => '08',
  target    => '/etc/kubernetes/apply/prometheus-configmap.yaml',
}

kubectl::apply_fragment { 'prometheus-job-overlay-k8s':
  manifest => 'job_name: overlay_k8s':
  order    => '09',
  target    => '/etc/kubernetes/apply/prometheus-configmap.yaml',
}

kubectl::apply_fragment { 'prometheus-job-kubernetes-apiservers':
  manifest => 'job_name: ',
  order    => '10',
  target    => '/etc/kubernetes/apply/prometheus-configmap.yaml',
}

kubectl::apply_fragment { 'prometheus-job-kubernetes-nodes':
  manifest => 'job'
  order    => '11',
  target    => '/etc/kubernetes/apply/prometheus-configmap.yaml',
}

kubectl::apply_fragment { 'prometheus-job-kubernetes-service-endpoints':
  manifest => ''
  order    => '12',
  target    => '/etc/kubernetes/apply/prometheus-configmap.yaml',
}

kubectl::apply_fragment { 'prometheus-job-kubernetes-node-exporter':
  manifest => '',
  order    => '13',
  target    => '/etc/kubernetes/apply/prometheus-configmap.yaml',
}

kubectl::apply_fragment { 'prometheus-job-ctm-log-exporter':
  manifest => ''
  order    => '14',
  target    => '/etc/kubernetes/apply/prometheus-configmap.yaml',
}

kubectl::apply_fragment { 'prometheus-job-kubernetes-services':
  manifest => ''
  order    => '15',
  target    => '/etc/kubernetes/apply/prometheus-configmap.yaml',
}

kubectl::apply_fragment { 'prometheus-job-kubernetes-pods':
  manifest => '',
  order    => '16',
  target    => '/etc/kubernetes/apply/prometheus-configmap.yaml',
}
