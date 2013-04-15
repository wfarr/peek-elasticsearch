$(document).on 'peek:update', ->
  elasticsearchContext = $('#peek-context-elasticsearch')
  if elasticsearchContext.size()
    context = elasticsearchContext.data('context')
    primaries = context.primaries
    replicas  = context.replicas
    $('#elasticsearch-active-tooltip').
      attr('title', "Primaries: #{primaries}; Replicas: #{replicas}").
      tipsy()
