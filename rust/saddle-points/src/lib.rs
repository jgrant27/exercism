pub fn find_saddle_points(input: &[Vec<u64>]) -> Vec<(usize, usize)> {

    let mut max_inds = Vec::new();

    // For each row in the matrix ...
    for ri in 0..input.len() {
        if input[ri].is_empty() { continue; }
        let mut col_max_is = Vec::new();
        // ... obtain column indices for max vals ...
        for ci in 0..input[ri].len() {
            if col_max_is.is_empty() {
                col_max_is.push(ci);
                continue;
            } else if input[ri][ci] > input[ri][col_max_is[0]] {
                col_max_is.clear();
                col_max_is.push(ci);
            } else if input[ri][ci] == input[ri][col_max_is[0]] {
                col_max_is.push(ci);
            }
        }

        // ... and check corresponding row indices match as
        //     minimum vals.
        for col_max_i in col_max_is {
            //let mut row_min_is = Vec::new();
            let mut row_min_is = Vec::new();
            for rj in 0..input.len() {
                if row_min_is.is_empty() {
                    row_min_is.push(rj);
                    continue;
                } else if
                    input[rj][col_max_i] < input[row_min_is[0]][col_max_i] {
                    row_min_is.clear();
                    row_min_is.push(rj);
                } else if
                    input[rj][col_max_i] == input[row_min_is[0]][col_max_i] {
                    row_min_is.push(rj);
                }
            }
            // Add saddle points
            for row_min_i in row_min_is {
                if row_min_i == ri {
                    max_inds.push((row_min_i, col_max_i));
                }
            }
        }
    }

    max_inds

}
