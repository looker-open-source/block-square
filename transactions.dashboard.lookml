- dashboard: transactions
  title: Transactions
  layout: newspaper
  elements:
  - title: Transaction Activity
    name: Transaction Activity
    model: block-square
    explore: order
    type: looker_grid
    fields: [transaction.created_day_of_week, transaction.created_hour_of_day, transaction.count,
      tender.revenue]
    pivots: [transaction.created_day_of_week]
    fill_fields: [transaction.created_day_of_week, transaction.created_hour_of_day]
    sorts: [transaction.count desc 0, transaction.created_day_of_week]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    series_cell_visualizations:
      transaction.count:
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
        strikethrough: false, fields: [transaction.count]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: [tender.revenue]
    listen: {}
    row: 11
    col: 0
    width: 16
    height: 12
  - title: Total Revenue
    name: Total Revenue
    model: block-square
    explore: order
    type: single_value
    fields: [order.revenue, order.net_sales, order.total_discount, order_return_line_item.total_return_amount]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Total Revenue
    value_format: ''
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Number of Refunds
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    series_cell_visualizations:
      refund.count:
        is_active: true
        palette:
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      refund.refunded_amount:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    series_types: {}
    listen: {}
    row: 0
    col: 0
    width: 6
    height: 5
  - title: Today's Sales Summary
    name: Today's Sales Summary
    model: block-square
    explore: order
    type: looker_column
    fields: [tender.revenue, transaction.created_hour_of_day]
    fill_fields: [transaction.created_hour_of_day]
    filters:
      transaction.created_date: today
    sorts: [tender.revenue desc]
    limit: 500
    row: 5
    col: 0
    width: 24
    height: 6
  - title: Discount & Return Total
    name: Discount & Return Total
    model: block-square
    explore: order
    type: single_value
    fields: [order.revenue, order.net_sales, order.total_discount, order_return_line_item.total_return_amount]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: discount_return_total, label: Discount &
          Return Total, expression: "${order.total_discount} + ${order_return_line_item.total_return_amount}",
        value_format: !!null '', value_format_name: decimal_2, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Discount & Return Total
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: [order.revenue, order.net_sales]
    listen: {}
    row: 0
    col: 6
    width: 6
    height: 5
  - title: Total Sales
    name: Total Sales
    model: block-square
    explore: order
    type: single_value
    fields: [order.revenue, order.net_sales, order.total_discount, order_return_line_item.total_return_amount,
      tender.total_processing_fee, order.total_sales]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Total Sales
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: [order.revenue, order.total_discount, order_return_line_item.total_return_amount,
      tender.total_processing_fee, order.net_sales]
    listen: {}
    row: 0
    col: 18
    width: 6
    height: 5
  - title: Total Tax
    name: Total Tax
    model: block-square
    explore: order
    type: single_value
    fields: [order.revenue, order.net_sales, order.total_discount, order_return_line_item.total_return_amount,
      tender.total_processing_fee, order.total_sales, order.total_tax]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Total Taxes
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: [order.revenue, order.total_discount, order_return_line_item.total_return_amount,
      tender.total_processing_fee, order.net_sales, order.total_sales]
    listen: {}
    row: 0
    col: 12
    width: 6
    height: 5
  - title: Tender Type by Month
    name: Tender Type by Month
    model: block-square
    explore: order
    type: looker_column
    fields: [tender.revenue, tender.type, order.created_month]
    pivots: [tender.type]
    fill_fields: [order.created_month]
    filters:
      order.created_date: 1 years
    sorts: [tender.type, order.created_month desc]
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
    hide_legend: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 11
    col: 16
    width: 8
    height: 6
  - title: Tender Breakdown (All Time)
    name: Tender Breakdown (All Time)
    model: block-square
    explore: order
    type: looker_pie
    fields: [tender.revenue, tender.type]
    filters:
      order.created_date: 1 years
    sorts: [tender.type]
    limit: 500
    query_timezone: America/Los_Angeles
    value_labels: legend
    label_type: labPer
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
    hide_legend: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 17
    col: 16
    width: 8
    height: 6
  - title: Revenue & Refunds
    name: Revenue & Refunds
    model: block-square
    explore: order
    type: looker_column
    fields: [refund.refunded_amount, order.revenue, order.created_month]
    fill_fields: [order.created_month]
    filters:
      order.created_date: 1 years
    sorts: [order.created_month desc]
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      refund.refunded_amount: "#FBB555"
      order.revenue: "#449DD1"
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 23
    col: 0
    width: 24
    height: 11
