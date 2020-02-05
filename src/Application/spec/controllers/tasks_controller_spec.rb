require 'rails_helper'

RSpec.describe TasksController, type: :controller do

     @task = Task.create(Description:"test task")

    it 'index page' do
        get :index
        expect(response).to have_content()
    end

    it "should get new" do
        get :new
        expect(response).to have_content()
    end
    
    it "should create task" do
        expect do
            post :create, params: { task: { Description: "create test" } }
        end.to change{Task.count}
        assert_redirected_to task_url(Task.last)
    end
    
    it "should show task" do
        get :show, params:{ id: Task.first.id}
        assert_response :success
    end

    it "should get edit" do
        get :edit, params:{ id: Task.first.id}
        assert_response :success
    end
    
    it "should update task" do
        task = Task.first
         patch :update, params: { id:task.id, task: { Description: "updated" } }
         assert_redirected_to task_url(task)
    end
    
    it "should destroy task" do
        task = Task.first
        expect do
            delete :destroy, params: { id: task.id }
        end.to change{Task.count}
        assert_redirected_to tasks_url
    end
end