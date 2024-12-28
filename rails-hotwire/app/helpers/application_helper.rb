# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def sort_link_to(name = nil, sort_name = nil, &block) # rubocop:disable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity
    if block.present?
      sort_name = name
      name = capture(&block)
    end

    current_sort = params[:sort]
    current_sort = params[:sort][1..] if params[:sort].present? && params[:sort].start_with?('-')

    icon = if current_sort != sort_name || current_sort.blank?
             <<~HTML.html_safe # rubocop:disable Rails/OutputSafety
               <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="inline ml-2 w-4 h-4">
                 <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 15 12 18.75 15.75 15m-7.5-6L12 5.25 15.75 9" />
               </svg>
             HTML
           elsif params[:sort].start_with?('-') && current_sort == sort_name
             <<~HTML.html_safe # rubocop:disable Rails/OutputSafety
               <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="inline ml-2 w-4 h-4">
                 <path stroke-linecap="round" stroke-linejoin="round" d="m4.5 15.75 7.5-7.5 7.5 7.5" />
               </svg>
             HTML
           else
             <<~HTML.html_safe # rubocop:disable Rails/OutputSafety
               <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="inline ml-2 w-4 h-4">
                 <path stroke-linecap="round" stroke-linejoin="round" d="m19.5 8.25-7.5 7.5-7.5-7.5" />
               </svg>
             HTML
           end

    sort = if current_sort != sort_name || !params[:sort].start_with?('-')
             "-#{sort_name}"
           else
             sort_name
           end

    link_to url_for(permitted_params.merge(sort: sort)), data: { turbo_action: 'replace' } do
      [
        name,
        icon
      ].join.html_safe # rubocop:disable Rails/OutputSafety
    end
  end

  def permitted_params
    params.slice(:page, :per_page, :completed).permit!.to_h
  end

  def timeago(date, format: :long)
    return if date.blank?

    content = I18n.l(date, format: format)

    tag.time(content,
             title: content,
             data: {
               controller: 'timeago',
               timeago_datetime_value: date.iso8601,
               timeago_add_suffix_value: true
             })
  end

  def loading_tag
    <<~HTML.html_safe # rubocop:disable Rails/OutputSafety
      <div role="status">
        <svg aria-hidden="true" class="w-6 h-6 text-gray-200 animate-spin fill-blue-600" viewBox="0 0 100 101" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z" fill="currentColor"/>
          <path d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z" fill="currentFill"/>
        </svg>

        <span class="sr-only">Loading...</span>
      </div>
    HTML
  end
end
