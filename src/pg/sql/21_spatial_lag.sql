-- Spatial Lag with kNN neighbors (internal function)
CREATE OR REPLACE FUNCTION
  CDB_SpatialLag(
      subquery TEXT,
      column_name TEXT,
      w_type TEXT,
      num_ngbrs INT,
      geom_col TEXT DEFAULT 'the_geom',
      id_col TEXT DEFAULT 'cartodb_id')
RETURNS TABLE (spatial_lag NUMERIC, rowid INT)
AS $$
  from crankshaft.spatial_lag import Spatial
  spatial = Spatial()
  return spatial.spatial_lag(subquery, column_name, w_type,
                          num_ngbrs, geom_col, id_col)
$$ LANGUAGE plpythonu;