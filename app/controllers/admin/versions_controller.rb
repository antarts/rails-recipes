class Admin::VersionsController < AdminController

	def index
		@versions = PaperTrail::Version.order("id DESC").page(params[:page]).per(12)
	end

	def undo
		@version = PaperTrail::Version.find(params[:version_id])
		@version.reify.save!

		redirect_to admin_versions_path
	end

end
