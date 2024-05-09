# variable "dashboard" {
#   type = any
# }

variable "dashboard" {
  type = map(object({
    name        = string
    permissions = string
    pagename    = string
    widget_markdown = map(object({
      title            = string
      row              = number
      column           = number
      width            = number
      height           = number
      markdown_content = string
    }))
  }))
}

