extern crate num_bigint;
extern crate num_traits;
extern crate rand;

use num_bigint::ToBigUint;
use num_traits::ToPrimitive;
use rand::{thread_rng, Rng};

pub fn private_key(p: u64) -> u64 {
    let mut rng = thread_rng();
    let rr: u64 = rng.gen_range(2, p);
    rr
}

pub fn public_key(p: u64, g: u64, a: u64) -> u64 {
    let gbui = g.to_biguint().unwrap();
    let abui = a.to_biguint().unwrap();
    let pbui = p.to_biguint().unwrap();
    gbui.modpow(&abui, &pbui).to_u64().unwrap()
}

pub fn secret(p: u64, b_pub: u64, a: u64) -> u64 {
    let bpbui = b_pub.to_biguint().unwrap();
    let abui = a.to_biguint().unwrap();
    let pbui = p.to_biguint().unwrap();
    bpbui.modpow(&abui, &pbui).to_u64().unwrap()
}
