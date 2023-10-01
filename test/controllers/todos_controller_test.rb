# frozen_string_literal: true

require 'test_helper'

class TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo = todos(:one)
  end

  test 'should get index' do
    get todos_url
    assert_response :success
  end

  test 'should get new' do
    get new_todo_url
    assert_response :success
  end

  test 'should create todos' do
    assert_difference('Todo.count') do
      post todos_url,
           params: { todo: { create_date: @todo.create_date, description: @todo.description, due_date: @todo.due_date,
                             is_complete: @todo.is_complete } }
    end

    assert_redirected_to todo_url(Todo.last)
  end

  test 'should show todos' do
    get todo_url(@todo)
    assert_response :success
  end

  test 'should get edit' do
    get edit_todo_url(@todo)
    assert_response :success
  end

  test 'should update todos' do
    patch todo_url(@todo),
          params: { todo: { create_date: @todo.create_date, description: @todo.description, due_date: @todo.due_date,
                            is_complete: @todo.is_complete } }
    assert_redirected_to todo_url(@todo)
  end

  test 'should destroy todos' do
    assert_difference('Todo.count', -1) do
      delete todo_url(@todo)
    end

    assert_redirected_to todos_url
  end
end
