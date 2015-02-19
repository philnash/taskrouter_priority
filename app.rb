require "json"

post "/call" do
  task_attributes = {}
  task_attributes[:status] = "Gold" if params["To"] == ENV["PRIORITY_NUMBER"]
  message = "Thanks for calling Phil's Company support line." \
            "One of our agents will speak with you soon."
  response = Twilio::TwiML::Response.new do |t|
    t.Say message, voice: "alice", language: "en-GB"
    t.Enqueue workflowSid: ENV["TWILIO_WORKFLOW_SID"] do |e|
      e.TaskAttributes task_attributes.to_json
    end
  end
  response.to_xml
end

post "/assignment" do
  content_type "application/json"
  {
    instruction: "dequeue",
    post_work_activity_sid: ENV["TWILIO_IDLE_SID"]
  }.to_json
end
