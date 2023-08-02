module ApplicationHelper
  def default_meta_tags
    site = 'www.railsinit.org'
    title = 'Rails Initializer'
    description = 'Create a new Rails app from your browser! Select your configurations in just a few clicks, and launch your Rails journey with ease and speed. Get building now!'
    image_height = 630
    image_width = 1200
    {
      site: site,
      title: title,
      reverse: true,
      separator: '|',
      description: description,
      keywords: 'rails initializer, rails, ruby on rails, rails init, rails generator, rails app generator, rails initializr, ruby',
      canonical: site,
      noindex: !Rails.env.production?,
      index: true,
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
        image: {
          _: image_url('logo.png'),
          alt: 'rails initilaizer logo',
          type: 'image/png',
          width: image_width,
          height: image_height,
        }
      },
      twitter: {
        card: 'summary_large_image',
        site: '@Phillip_Ug',
        creator: '@Phillip_Ug',
        title: title,
        description: description,
        image: {
          _: image_url('logo.png'),
          height: image_height,
          width: image_width
        }
      }
    }
  end
end
