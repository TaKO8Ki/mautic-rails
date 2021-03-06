module Mautic
  class Segment < Model

    #セグメントでのfindの挙動が他と違うので、オーバーライド
    def find(connection, segment)
      segment = @connection.request :get, %(api/segments/#{segment})
      return segment
    end

    def add_contact(connection: nil, segment: nil, contact: nil)
      connection.request :post, %(api/segments/#{segment}/contact/#{contact}/add)
    end

    def remove_contact(connection: nil, segment: nil, contact: nil)
      connection.request :post, %(api/segments/#{segment}/contact/#{contact}/remove)
    end

  end
end