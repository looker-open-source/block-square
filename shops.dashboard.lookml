- dashboard: shops
  title: Shops
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Top Customers
    name: Top Customers
    model: block-square
    explore: order
    type: looker_grid
    fields: [customer.given_name, customer.family_name, order.count]
    sorts: [order.count desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    series_cell_visualizations:
      order.count:
        is_active: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 471a8295-662d-46fc-bd2d-2d0acd370c1e, options: {steps: 5}},
        bold: false, italic: false, strikethrough: false, fields: [order.count]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Location ID: location.id
    row: 3
    col: 16
    width: 8
    height: 4
  - title: Top Locations
    name: Top Locations
    model: block-square
    explore: order
    type: looker_grid
    fields: [order.count, location.id]
    sorts: [order.count desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    series_cell_visualizations:
      order.count:
        is_active: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 471a8295-662d-46fc-bd2d-2d0acd370c1e, options: {steps: 5}},
        bold: false, italic: false, strikethrough: false, fields: [order.count]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Location ID: location.id
    row: 3
    col: 0
    width: 8
    height: 4
  - title: Top Employees
    name: Top Employees
    model: block-square
    explore: order
    type: looker_grid
    fields: [order.count, employee.first_name, employee.last_name, employee_wage.title]
    sorts: [order.count desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    series_cell_visualizations:
      order.count:
        is_active: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 471a8295-662d-46fc-bd2d-2d0acd370c1e, options: {steps: 5}},
        bold: false, italic: false, strikethrough: false, fields: [order.count]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Location ID: location.id
    row: 3
    col: 8
    width: 8
    height: 4
  - title: Location count
    name: Location count
    model: block-square
    explore: order
    type: single_value
    fields: [location.count]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Locations
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen: {}
    row: 0
    col: 0
    width: 8
    height: 3
  - title: Untitled (copy)
    name: Untitled (copy)
    model: block-square
    explore: order
    type: single_value
    fields: [employee.count]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Employees
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Location ID: location.id
    row: 0
    col: 8
    width: 8
    height: 3
  - title: Customer Count
    name: Customer Count
    model: block-square
    explore: order
    type: single_value
    fields: [customer.count]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Customers
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Location ID: location.id
    row: 0
    col: 16
    width: 8
    height: 3
  - title: Shop Activity
    name: Shop Activity
    model: block-square
    explore: order
    type: looker_grid
    fields: [order.created_hour_of_day, order.created_day_of_week, order.count]
    pivots: [order.created_day_of_week]
    fill_fields: [order.created_hour_of_day, order.created_day_of_week]
    sorts: [order.count desc 0, order.created_day_of_week]
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
      order.count:
        is_active: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [order.count]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hide_totals: false
    hide_row_totals: false
    series_types: {}
    listen:
      Location ID: location.id
    row: 7
    col: 0
    width: 12
    height: 12
  - title: Popular Stores
    name: Popular Stores
    model: block-square
    explore: order
    type: looker_column
    fields: [location.id, order.count, order.revenue]
    sorts: [order.count desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: order.revenue, id: order.revenue,
            name: Revenue}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: order.count, id: order.count, name: Order️}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
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
    colors: [red]
    series_types: {}
    point_style: none
    series_colors:
      order.count: "#449DD1"
      order.revenue: "#78C0E0"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 1
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_latitude: 34.986128262717195
    map_longitude: -54.71054077148438
    map_zoom: 2
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    map_value_colors: [red]
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map: usa
    map_projection: ''
    empty_color: ''
    quantize_colors: false
    point_color: red
    point_radius: 100
    listen: {}
    row: 7
    col: 12
    width: 12
    height: 12
  - title: Orders per Customer
    name: Orders per Customer
    model: block-square
    explore: order
    type: looker_line
    fields: [order.created_month, customer.count, order.count]
    fill_fields: [order.created_month]
    sorts: [order.created_month desc]
    limit: 500
    dynamic_fields: [{table_calculation: orders_per_customer, label: Orders per Customer,
        expression: "${order.count}/${customer.count}", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
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
    legend_position: right
    series_types:
      order.count: column
      customer.count: column
    point_style: none
    series_colors:
      customer.count: "#78C0E0"
      order.count: "#4276BE"
      orders_per_customer: "#FBB555"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    listen:
      Location ID: location.id
    row: 19
    col: 0
    width: 12
    height: 7
  - title: Order Items per Customer
    name: Order Items per Customer
    model: block-square
    explore: order
    type: looker_line
    fields: [order_line_item.count, customer.count, order.created_month]
    fill_fields: [order.created_month]
    sorts: [order.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: order_items_per_customer, label: Order Items
          per Customer, expression: "${order_line_item.count}/${customer.count}",
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: right
    series_types:
      order_line_item.count: column
      customer.count: column
    point_style: none
    series_colors:
      order_line_item.count: "#4276BE"
      customer.count: "#78C0E0"
      order_items_per_customer: "#FBB555"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    listen:
      Location ID: location.id
    row: 19
    col: 12
    width: 12
    height: 7
  - title: Customer Cohorts
    name: Customer Cohorts
    model: block-square
    explore: order
    type: looker_line
    fields: [order.created_month, order.count, customer.months_cohort_age]
    pivots: [customer.months_cohort_age]
    fill_fields: [order.created_month]
    sorts: [order.created_month desc, customer.months_cohort_age]
    limit: 500
    color_application:
      collection_id: square
      custom:
        id: d00eb8f2-3547-c776-5ecc-9d77ca97a942
        label: Custom
        type: continuous
        stops:
        - color: "#4276BE"
          offset: 0
        - color: "#3EB0D5"
          offset: 50
        - color: "#b1d2e5"
          offset: 100
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
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    listen: {}
    row: 26
    col: 0
    width: 24
    height: 10
  filters:
  - name: Location ID
    title: Location ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: block-square
    explore: order
    listens_to_filters: []
    field: location.id
