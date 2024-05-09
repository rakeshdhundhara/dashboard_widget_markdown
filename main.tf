resource "newrelic_one_dashboard" "example_dashboard" {
  for_each    = var.dashboard
  name        = each.value.name
  permissions = each.value.permissions

  page {
    name = each.value.pagename


    dynamic "widget_markdown" {
      for_each = each.value.widget_markdown
      iterator = widget
      content {
        title  = widget.value.title
        row    = widget.value.row
        column = widget.value.column
        height = widget.value.height
        width  = widget.value.width
        text   = widget.value.markdown_content

      }
    }
  }
}
