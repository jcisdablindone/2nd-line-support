def sensu_down_event
  {
    "key"     => "monitoring-01.mon-v/process-cron",
    "event"   => sensu_down_event_payload.to_json
  }
end


def sensu_up_event
  {
    "key"     => "monitoring-01.mon-v/process-cron",
    "event"   => sensu_up_event_payload.to_json
  }
end

def sensu_down_event_payload
  {
    "id"=>"04fa2315-f6cb-42c1-adab-45450e707259",
    "client"=>
    {
      "name"=>"monitoring-01.mon-v",
      "address"=>"['10.0.2.15']",
      "metric_prefix"=>"mon-v.monitoring-01",
      "subscriptions"=>["monitoring.server", "all"],
      "version"=>"0.13.1",
      "timestamp"=>1425649200
    },
    "check"=>
    {
      "handlers"=>["level-2-support"],
      "command"=>"/etc/sensu/community/plugins/processes/check-procs.rb -p cron -C 1",
      "interval"=>10,
      "occurrences"=>1,
      "subscribers"=>["all"],
      "name"=>"process-cron",
      "issued"=>1425649206,
      "executed"=>1425649206,
      "duration"=>0.097,
      "output"=>"CheckProcs CRITICAL: Found 0 matching processes; cmd /cron/\n",
      "status"=>2,
      "history"=>
      ["0", "0", "0", "0", "0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","2"]
    },
    "occurrences"=>1,
    "action"=>"create"
  }
end


def sensu_up_event_payload
  {
    "id" => "708ac62c-2250-4e74-9113-21b563f5d0cb",
    "client" =>
    {
      "name" => "monitoring-01.mon-v",
      "address" => "['10.0.2.15']",
      "metric_prefix" => "mon-v.monitoring-01",
      "subscriptions" => ["monitoring.server","all"],
      "version" => "0.13.1",
      "timestamp" => 1425650247
    },
    "check" =>
    {
      "handlers" => ["level-2-support"],
      "command" => "/etc/sensu/community/plugins/processes/check-procs.rb -p cron -C 1",
      "interval" => 10,
      "occurrences" => 1,
      "subscribers" => ["all"],
      "name" => "process-cron",
      "issued" => 1425650266,
      "executed" => 1425650266,
      "duration" => 0.197,
      "output" => "CheckProcs OK: Found 1 matching processes; cmd /cron/\n",
      "status" => 0,
      "history" => ["2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","0"]
    },
    "occurrences" => 58,
    "action" => "resolve"
  }
end