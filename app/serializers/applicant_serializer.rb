class ApplicantSerializer < ActiveModel::Serializer

  attributes :name, :email, :phone, :curriculum

  def curriculum
    if object.curriculum.attached?
      {
        url: Rails.application.routes.url_helpers.rails_blob_url(
          object.curriculum, disposition: "attachment", only_path: true
        )
      }
    end
  end
end
