require('pg')

class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect({ dbname: 'd93mqsh2bnoi4r', host: 'ec2-54-91-178-234.compute-1.amazonaws.com', 
        port: 5432, user: 'odlsduggbpkbyy', password: 'e9920a12e3b796174200857412ab2173890d1b1934ab4d8141ee048dd4594f76'})
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end