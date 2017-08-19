require 'test_helper'

class AccountTest < ActiveSupport::TestCase

  test "should not accept empty values" do
    assert_not accounts(:invalid_account_1).valid?
    assert_not accounts(:invalid_account_2).valid?
  end

  test "should insert unique phone numbers" do
    account = accounts(:valid_account_1)
    assert account.valid?
    assert account.save

    account2 = Account.new phone: account.phone,
      code: account.code
    assert_not account2.save
  end

  test "should generate account code" do
    account = accounts(:invalid_account_1)
    assert_not account.valid?

    account.generate_code
    assert account.valid?
    assert account.save
  end
end
