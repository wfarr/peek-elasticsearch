$(document).on 'peek:update', ->
  elasticsearchContext = $('#peek-context-elasticsearch')
  if elasticsearchContext.size()
    context = elasticsearchContext.data('context')
    index            = context.index
    primary          = context.primary
    replica          = context.replica
    inactive_primary = context.inactive_primary
    inactive_replica = context.inactive_replica
    $('#elasticsearch-status-tooltip').
      attr('title', "<strong>Index:</strong> #{index}<br>
      <strong>Primary Shards:</strong> #{primary}<br>
      <strong>Replica Shards:</strong> #{replica}<br>
      <strong>Inactive Prim. Shards:</strong> #{inactive_primary}<br>
      <strong>Inactive Repl. Shards:</strong> #{inactive_replica}").
      tipsy({html: true})
