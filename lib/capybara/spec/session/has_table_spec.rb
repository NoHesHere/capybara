# frozen_string_literal: true

Capybara::SpecHelper.spec '#has_table?' do
  before do
    @session.visit('/tables')
  end

  it 'should be true if the table is on the page' do
    expect(@session).to have_table('Villain')
    expect(@session).to have_table('villain_table')
    expect(@session).to have_table(:villain_table)
  end

  it 'should be false if the table is not on the page' do
    expect(@session).not_to have_table('Monkey')
  end

  it 'should find row by header and cell values' do
    expect(@session.find(:table, 'Vertical')).to have_selector(:table_row, 'First Name' => 'Thomas', 'Last Name' => 'Walpole')
    expect(@session.find(:table, 'Vertical')).to have_selector(:table_row, 'Last Name' => 'Walpole')
    expect(@session.find(:table, 'Vertical')).not_to have_selector(:table_row, 'First Name' => 'Walpole')
  end

  it 'should find row by cell values' do
    expect(@session.find(:table, 'Vertical')).to have_selector(:table_row, %w[Thomas Walpole])
    expect(@session.find(:table, 'Vertical')).not_to have_selector(:table_row, %w[Walpole Thomas])
    expect(@session.find(:table, 'Vertical')).not_to have_selector(:table_row, %w[Other])
  end
end

Capybara::SpecHelper.spec '#has_no_table?' do
  before do
    @session.visit('/tables')
  end

  it 'should be false if the table is on the page' do
    expect(@session).not_to have_no_table('Villain')
    expect(@session).not_to have_no_table('villain_table')
  end

  it 'should be true if the table is not on the page' do
    expect(@session).to have_no_table('Monkey')
  end
end
