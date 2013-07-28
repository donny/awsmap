require 'nokogiri'
require 'open-uri'

AWS_STATUS_URL = 'http://status.aws.amazon.com'
UP_STATUS_MSG = 'Service is operating normally.'
 
SCHEDULER.every '10m' do
  doc = Nokogiri::HTML(open(AWS_STATUS_URL))

  # The order needs to match with the markers in awsmap.coffee.
  ec2_na = ['Amazon Elastic Compute Cloud (N. California)',
            'Amazon Elastic Compute Cloud (N. Virginia)',
            'Amazon Elastic Compute Cloud (Oregon)']
  ec2_sa = ['Amazon Elastic Compute Cloud (Sao Paulo)']
  ec2_eu = ['Amazon Elastic Compute Cloud (Ireland)']
  ec2_ap = ['Amazon Elastic Compute Cloud (Singapore)',
            'Amazon Elastic Compute Cloud (Sydney)',
            'Amazon Elastic Compute Cloud (Tokyo)']

  aws_blocks = {'NA_block' => ec2_na,
                'SA_block' => ec2_sa,
                'EU_block' => ec2_eu,
                'AP_block' => ec2_ap}

  data_points = []
  data_counter = 0

  aws_blocks.each do |block_name,blocks|
    blocks.each do |block|
      xpath = "//*[@id='#{block_name}']/table/tbody/tr/td[text()='#{block}']/parent::tr/td[3]"

      if (!is_site_up(doc, xpath))
        data_points.push(data_counter)
      end

      data_counter += 1
    end
  end

  send_event('awsmap', {:down_sites => data_points})
end

def is_site_up(doc, xpath)
    xpath_results = doc.xpath(xpath)
    return false if (xpath_results.length != 1)
    return xpath_results[0].content == UP_STATUS_MSG
end
