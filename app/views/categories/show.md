<div class="border w-full h-full grid place-items-center overflow">

  <div class="grid place-items-center px-4 w-2/3 h-auto p-2">
    <h1 class="actions bg-accentV1 uppercase text-lg flex gap-4 items-center justify-center">  
      <%= @category.category_name %>            
      <%= link_to edit_category_path(@category) do %>
        <i class="fa-solid fa-pencil grid place-items-center text-xs"></i>
      <% end %>                                  
    </h1>
  </div>

  <div class="border w-full h-full px-6 flex justify-center">
    <div class="w-1/4 h-[500px] border-2 border-slate-950 rounded-3xl bg-sky-100 flex flex-col justify-between gap-2">
      <div class="header--main h-auto border-b-2 border-slate-950">
        <h1>Add Task</h1>
      </div>   
      <div class="h-2/3 px-6 py-2 flex flex-col items-center">
        <%= render partial: "tasks/add_task_form" %>
      </div>
      <div class="h-1/4 w-full bg-primary border-t-2 border-slate-950 rounded-tr-[5rem] rounded-b-3xl"></div>
    </div>
  

    <div class="<%= @tasks.size > 0 ? "w-2/3 max-h-full overflow" : "hidden" %>">
      <h1 class="header--main text-slate-700">Tasks</h1>
      <div class="border max-h-full w-full px-6 py-2 flex flex-col items-center gap-2 overflow">
        <% @tasks.each do |task| %>
          <% if task.id.present? && task.is_completed == false %>
            <div class="border-2 border-slate-950 w-full py-4 px-6 rounded-2xl bg-sky-50">
              <%= render partial: "tasks/show_task", locals: { task: task } %> 
            </div>
          <% end %>  
        <% end %>

        <% if @tasks.any?(&:is_completed) %>
          <p class="w-full text-4xl lowercase font-bold text-slate-700 mt-4">Completed</p>        
          <% @tasks.each do |task| %>
            <% if task.id.present? && task.is_completed == true %>
            <div class="border-2 border-slate-950 w-full py-4 px-6 rounded-2xl bg-sky-50">
              <%= render partial: "tasks/show_task", locals: { task: task } %>
            </div>
            <% end %>
          <% end %>
        <% end %>
      </div>
    </div>
  </div>


</div>
