module ApplicationHelper
  def default_meta_tags
    site = 'railsinit.org'
    title = 'Rails Initializer'
    description = 'Generate Rails applications without the command-line. This tool is a simplified interface to select the configurations you need in just a few clicks. Get started with Rails easily and efficiently!'
    {
      site: site,
      title: title,
      reverse: true,
      separator: '|',
      description: description,
      keywords: 'rails initializer, rails, ruby on rails, rails init, rails generator, rails app generator, rails initializr, ruby',
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      author: 'Phillip Musiime',
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('rails-init-logo.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: site,
        title: title,
        description: description,
        type: 'website',
        url: request.original_url,
        image: image_url('logo.png')
      },
      twitter: {
        card: 'summary',
        site: '@Phillip_Ug',
        title: title,
        description: description,
        image: image_url('logo.png')
      }
    }
  end
end
