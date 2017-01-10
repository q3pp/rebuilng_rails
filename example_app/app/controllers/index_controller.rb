class IndexController < Szszfr::Controller
  def text
    "HI MY LITTLE FRIEND"
  end

  def template
    render 'hello', name: Szszfr::RandomUser.name
  end

  def file_model
    record = FileModel.find(1)
    render 'record', object: record
  end

  def all_records
    records = FileModel.all
    render 'records', object: records
  end
end
