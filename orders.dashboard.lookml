- dashboard: orders
  title: Orders
  layout: newspaper
  elements:
  - title: Untitled (copy)
    name: Untitled (copy)
    model: block-square
    explore: order
    type: single_value
    fields: [order.created_month, order.revenue]
    fill_fields: [order.created_month]
    filters:
      order.created_month: 24 months
    sorts: [order.created_month desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Revenue this Month
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    comparison_label: Last Month
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '12'
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    discontinuous_nulls: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 0
    col: 0
    width: 4
    height: 5
  - title: Untitled (copy 2)
    name: Untitled (copy 2)
    model: block-square
    explore: order
    type: single_value
    fields: [order.created_month, order.count]
    fill_fields: [order.created_month]
    filters:
      order.created_month: 24 months
    sorts: [order.created_month desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Orders this Month
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    comparison_label: Last Month
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '12'
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    discontinuous_nulls: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 0
    col: 12
    width: 4
    height: 5
  - title: Most Popular Modifiers
    name: Most Popular Modifiers
    model: block-square
    explore: order
    type: looker_column
    fields: [order_line_item_modifier.name, order_line_item.count]
    sorts: [order_line_item_modifier.name]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      order_line_item.total_revenue: "#4276BE"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 13
    col: 0
    width: 7
    height: 6
  - title: Variant Orders
    name: Variant Orders
    model: block-square
    explore: order
    type: looker_column
    fields: [order_line_item.variation_name, order_line_item.count]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      order_line_item.total_revenue: "#B1399E"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 13
    col: 7
    width: 7
    height: 6
  - title: Untitled
    name: Untitled
    model: block-square
    explore: order
    type: looker_line
    fields: [order.created_month, order.avg_open]
    fill_fields: [order.created_month]
    sorts: [order.created_month desc]
    limit: 500
    row: 25
    col: 0
    width: 8
    height: 6
  - title: Most Ordered Products
    name: Most Ordered Products
    model: block-square
    explore: order
    type: looker_column
    fields: [catalog_item.name, order_line_item.count]
    sorts: [order_line_item.count desc]
    limit: 500
    column_limit: 50
    row: 31
    col: 0
    width: 10
    height: 7
  - title: Revenue
    name: Revenue
    model: block-square
    explore: order
    type: looker_area
    fields: [order.created_month, order.revenue]
    fill_fields: [order.created_month]
    filters:
      order.created_month: 24 months
    sorts: [order.created_month desc]
    limit: 500
    color_application:
      collection_id: square
      palette_id: square-categorical-0
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '12'
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      order.revenue: "#449DD1"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    discontinuous_nulls: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 0
    col: 4
    width: 8
    height: 5
  - title: Orders
    name: Orders
    model: block-square
    explore: order
    type: looker_area
    fields: [order.created_month, order.count]
    fill_fields: [order.created_month]
    filters:
      order.created_month: 24 months
    sorts: [order.created_month desc]
    limit: 500
    color_application:
      collection_id: square
      palette_id: square-categorical-0
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '12'
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      order.count: "#4276BE"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    discontinuous_nulls: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Revenue to Month
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    comparison_label: Last Month
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    row: 0
    col: 16
    width: 8
    height: 5
  - title: Historical Order Breakdown
    name: Historical Order Breakdown
    model: block-square
    explore: order
    type: looker_column
    fields: [order.state, order.count, order.created_week]
    pivots: [order.state]
    fill_fields: [order.created_week]
    sorts: [order.state, order.created_week desc]
    limit: 500
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: square
      palette_id: square-categorical-0
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    hidden_series: []
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      against - order.count: "#FBB555"
      after - order.count: "#4276BE"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    note_state: collapsed
    note_display: above
    note_text: ''
    listen: {}
    row: 5
    col: 0
    width: 24
    height: 8
  - title: Latest Open Orders
    name: Latest Open Orders
    model: block-square
    explore: order
    type: looker_grid
    fields: [order.created_date, order.id, order.revenue, order.total_discount, order.total_service_charge,
      order.total_tax]
    filters:
      order.state: OPEN
    sorts: [order.created_date desc]
    limit: 500
    column_limit: 50
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      order.revenue:
        is_active: true
        palette:
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hide_totals: false
    hide_row_totals: false
    note_state: collapsed
    note_display: above
    note_text: ''
    listen: {}
    row: 13
    col: 14
    width: 10
    height: 18
  - title: Orders vs Refunded Orders
    name: Orders vs Refunded Orders
    model: block-square
    explore: order
    type: looker_column
    fields: [order.created_week, order.count, refund.count]
    fill_fields: [order.created_week]
    sorts: [order.created_week desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: refunds, label: Refunds, expression: '0-${refund.count}',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    color_application:
      collection_id: square
      palette_id: square-categorical-0
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    hidden_series: []
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      refunds: "#FBB555"
      order.count: "#4276BE"
    series_labels:
      order.count: Orders
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    column_group_spacing_ratio: 0
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [refund.count]
    listen: {}
    row: 19
    col: 0
    width: 14
    height: 6
  - title: Orders by Location
    name: Orders by Location
    model: block-square
    explore: order
    type: looker_pie
    fields: [location.id, order_line_item.count]
    sorts: [order_line_item.count desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: square
      palette_id: square-categorical-0
      options:
        steps: 5
    series_colors:
      '6332': "#75E2E2"
      'null': "#4276BE"
    series_types: {}
    listen: {}
    row: 25
    col: 8
    width: 6
    height: 6
  - title: Product Quantity Over Time
    name: Product Quantity Over Time
    model: block-square
    explore: order
    type: looker_line
    fields: [inventory_count_history.calculated_month, inventory_count_history.total_quantity,
      catalog_item.name]
    pivots: [catalog_item.name]
    fill_fields: [inventory_count_history.calculated_month]
    sorts: [inventory_count_history.calculated_month desc, catalog_item.name]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: square
      palette_id: square-categorical-0
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    listen: {}
    row: 31
    col: 10
    width: 14
    height: 7
