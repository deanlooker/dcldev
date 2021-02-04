- dashboard: test_lexi
  title: test dash
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: New Tile
    name: New Tile
    model: dean_sme
    explore: order_items
    type: looker_grid
    fields: [orders.count, users.age]
    filters:
      users.age: "[15, 25]"
    sorts: [orders.count desc]
    limit: 500
    query_timezone: UTC
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 12
    height: 8
