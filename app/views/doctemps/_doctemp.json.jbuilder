json.extract! doctemp, :id, :dateofsigning, :placeofsigning, :nameofprincipal, :nationalityofprincipal, :businessofprincipal, :addressofprincipal, :nameofagent, :nationalityofagent, :businessofagent, :addressofagent, :nameofagencyoroffice, :transaction, :acts, :created_at, :updated_at
json.url doctemp_url(doctemp, format: :json)
