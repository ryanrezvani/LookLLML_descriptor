connection: "bq_ch_test"
include: "/**/*.view.lkml"                # include all views in the views/ folder in this project

explore: new_york_citibike {
  label: "LLM: NYC Citibike"
  description: "Measure description parameters in new_york_citibike.view file generated via LLM"
}
