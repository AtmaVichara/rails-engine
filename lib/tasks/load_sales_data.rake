require 'csv'
OPTIONS = {headers: true, header_converters: :symbol }
namespace :load_sales_data do

  desc "TODO"
  task load_customers: :environment do
    CSV.foreach('db/data/customers.csv', OPTIONS) do |row|
      Customer.create!(id: row[:id].to_i,
                       first_name: row[:first_name],
                       last_name: row[:last_name],
                       created_at: DateTime.strptime(row[:created_at], '%Y-%m-%d %H:%M:%S'),
                       updated_at: DateTime.strptime(row[:updated_at], '%Y-%m-%d %H:%M:%S'))
     end
  end

  desc "TODO"
  task load_invoice_items: :environment do
    CSV.foreach('db/data/invoice_items.csv', OPTIONS) do |row|
      InvoiceItem.create!(id: row[:id].to_i,
                          invoice_id: row[:invoice_id].to_i,
                          item_id: row[:item_id].to_i,
                          quantity: row[:quantity].to_i,
                          unit_price: row[:unit_price].to_i,
                          created_at: DateTime.strptime(row[:created_at], '%Y-%m-%d %H:%M:%S'),
                          updated_at: DateTime.strptime(row[:updated_at], '%Y-%m-%d %H:%M:%S'))
    end
  end

  desc "TODO"
  task load_invoices: :environment do
    CSV.foreach('db/data/invoices.csv', OPTIONS) do |row|
      Invoice.create!(id: row[:id].to_i,
                      merchant_id: row[:merchant_id].to_i,
                      customer_id: row[:customer_id].to_i,
                      status: row[:status],
                      created_at: DateTime.strptime(row[:created_at], '%Y-%m-%d %H:%M:%S'),
                      updated_at: DateTime.strptime(row[:updated_at], '%Y-%m-%d %H:%M:%S'))
    end
  end

  desc "TODO"
  task load_items: :environment do
    CSV.foreach('db/data/items.csv', OPTIONS) do |row|
      Item.create!(id: row[:id].to_i,
                   name: row[:name],
                   merchant_id: row[:merchant_id].to_i,
                   description: row[:description],
                   unit_price: row[:unit_price].to_i,
                   created_at: DateTime.strptime(row[:created_at], '%Y-%m-%d %H:%M:%S'),
                   updated_at: DateTime.strptime(row[:updated_at], '%Y-%m-%d %H:%M:%S'))
    end
  end

  desc "TODO"
  task load_merchants: :environment do
    CSV.foreach('db/data/merchants.csv', OPTIONS) do |row|
      Merchant.create!(id: row[:id].to_i,
                       name: row[:name],
                       created_at: DateTime.strptime(row[:created_at], '%Y-%m-%d %H:%M:%S'),
                       updated_at: DateTime.strptime(row[:updated_at], '%Y-%m-%d %H:%M:%S'))
    end
  end

  desc "TODO"
  task load_transactions: :environment do
    CSV.foreach('db/data/transactions.csv', OPTIONS) do |row|
      Transaction.create!(id: row[:id].to_i,
                          invoice_id: row[:invoice_id].to_i,
                          result: row[:result],
                          credit_card_number: row[:credit_card_number].to_i,
                          created_at: DateTime.strptime(row[:created_at], '%Y-%m-%d %H:%M:%S'),
                          updated_at: DateTime.strptime(row[:updated_at], '%Y-%m-%d %H:%M:%S'))
    end
  end

end