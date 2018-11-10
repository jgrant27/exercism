#[macro_use]
extern crate maplit;


pub mod graph {

    use std::collections::HashMap;
    use graph::graph_items::edge::Edge;
    use graph::graph_items::node::Node;

    #[derive(Debug, Clone, PartialEq, Eq)]
    pub struct Graph { pub nodes: Vec<Node>,
                       pub edges: Vec<Edge>,
                       pub attrs: HashMap<String, String> }

    impl Graph {
        pub fn new() -> Graph {
            Graph{ nodes: vec![], edges: vec![], attrs: hashmap!{} }
        }

        pub fn with_nodes(mut self, nodes: &[Node]) -> Self {
            self.nodes.extend_from_slice(&nodes);
            self
        }

        pub fn with_edges(mut self, edges: &[Edge]) -> Self {
            self.edges.extend_from_slice(&edges);
            self
        }

        pub fn with_attrs(mut self, attrs: &[(&str,&str)]) -> Self {
            self.attrs.extend(attrs.iter().map(|(k,v)| {(String::from(*k),
                                                         String::from(*v))}));
            self
        }

        pub fn get_node(self, node_name: &str) -> Option<Node> {
            self.nodes.iter().find(|n| n.name == node_name).cloned()
        }
    }

    pub mod graph_items {
        pub mod edge {
            use std::collections::HashMap;

            #[derive(Debug, Clone, PartialEq, Eq)]
            pub struct Edge { pub src: String,
                              pub dest: String,
                              pub attrs: HashMap<String, String> }

            impl Edge {
                pub fn new (src: &str, dest: &str) -> Self {
                    Edge { src: String::from(src),
                           dest: String::from(dest),
                           attrs: hashmap!{} }
                }

                pub fn with_attrs(mut self, attrs: &[(&str,&str)]) -> Self {
                    self.attrs.extend(attrs.iter().map(|(k,v)| {(String::from(*k),
                                                                 String::from(*v))}));
                    self
                }

                pub fn get_attr(&self, attr_name: &str) -> Option<&str> {
                    self.attrs.get(attr_name).map(|s| s.as_str())
                }
            }
        }

        pub mod node {
            use std::collections::HashMap;

            #[derive(Debug, Clone, PartialEq, Eq)]
            pub struct Node { pub name: String, pub attrs: HashMap<String, String> }

            impl Node {
                pub fn new (name: &str) -> Self {
                    Node { name: String::from(name), attrs: hashmap! {} }
                }

                pub fn with_attrs(mut self, attrs: &[(&str,&str)]) -> Self {
                    self.attrs.extend(attrs.iter().map(|(k,v)| {(String::from(*k),
                                                                 String::from(*v))}));
                    self
                }

                pub fn get_attr(&self, attr_name: &str) -> Option<&str> {
                    self.attrs.get(attr_name).map(|s| s.as_str())
                }
            }
        }

    }

}
