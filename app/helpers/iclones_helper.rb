module IclonesHelper
  def choose_new_or_edit
      if action_name == 'new' || action_name == 'create' || action_name == 'confirm'
        confirm_iclones_path
      elsif action_name == 'edit'
        iclone_path
      end
    end
end
