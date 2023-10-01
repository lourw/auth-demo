# frozen_string_literal: true

require 'application_system_test_case'

class TodosTest < ApplicationSystemTestCase
  setup do
    @todo = todos(:one)
  end

  test 'visiting the index' do
    visit todos_url
    assert_selector 'h1', text: 'Todos'
  end

  test 'should create todos' do
    visit todos_url
    click_on 'New todos'

    fill_in 'Create date', with: @todo.create_date
    fill_in 'Description', with: @todo.description
    fill_in 'Due date', with: @todo.due_date
    check 'Is complete' if @todo.is_complete
    click_on 'Create Todo'

    assert_text 'Todo was successfully created'
    click_on 'Back'
  end

  test 'should update Todo' do
    visit todo_url(@todo)
    click_on 'Edit this todos', match: :first

    fill_in 'Create date', with: @todo.create_date
    fill_in 'Description', with: @todo.description
    fill_in 'Due date', with: @todo.due_date
    check 'Is complete' if @todo.is_complete
    click_on 'Update Todo'

    assert_text 'Todo was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Todo' do
    visit todo_url(@todo)
    click_on 'Destroy this todos', match: :first

    assert_text 'Todo was successfully destroyed'
  end
end
