class Client

  def self.test
    client_id = settings.client_id
    institution = settings.institution
    p_key = settings.p_key
    call_path = "info/test"
    request = ""
    time_now = Time.now.to_i
    v_str = Digest::SHA256.hexdigest("#{client_id}|#{time_now}|#{p_key}|#{request}")
    post_data = {
      "clientID": client_id,
      "ts": time_now,
      "verify": v_str,
      "type": "json"
    }
    url = "https://#{institution}.medhub.com/functions/api/#{call_path}"
    response = HTTParty.post(url, body: post_data)
    response.body
  end
end
