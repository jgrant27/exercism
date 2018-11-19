pub struct PascalsTriangle {
    rows: Vec<Vec<u32>>,
}

impl PascalsTriangle {

    pub fn new(row_cnt: u32) -> Self {
        new_func(row_cnt)
        // new_iter(row_cnt)
    }

    pub fn rows(&self) -> Vec<Vec<u32>> {
        self.rows.to_owned()
    }

}

// Functional
pub fn new_func(row_cnt: u32) -> PascalsTriangle {
    let rows = (0..row_cnt).fold(Vec::new(), |mut a: Vec<Vec<u32>>, _| {
        if let Some(last) = a.pop() {
            let mut lv = vec![0, 0]; lv.splice(1..1, last.clone().into_iter());
            let nv = lv.windows(2).map(|a| a.iter().sum()).collect();
            a.append(&mut vec![last, nv]); a
        } else {
            vec![vec![1]]
        }
    });
    PascalsTriangle{rows: rows}
}

// Iterative
pub fn new_iter(row_cnt: u32) -> PascalsTriangle {
    let mut rows: Vec<Vec<u32>> = Vec::new();
    for n in 0..row_cnt {
        match n {
            0 => rows.push(vec![1]),
            _ => {
                let mut nv = vec![];
                let pv = rows[(n-1) as usize].clone();
                let nlen = pv.len() + 1;
                for o in 0..nlen {
                    let left  = if o == 0 { 0 } else { *pv.get(o - 1).unwrap() };
                    let right = if o == nlen - 1 { 0 } else { *pv.get(o).unwrap() };
                    nv.push(left + right);
                }
                rows.push(nv);
            }
        }
    }
    PascalsTriangle{rows: rows}
}
