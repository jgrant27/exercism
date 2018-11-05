pub struct Node<T> {
    data: T,
    next: Option<Box<Node<T>>>,
}

impl<T> Node<T> {
    pub fn new(data: T, next: Option<Box<Node<T>>>) -> Option<Box<Node<T>>> {
        Some(Box::new(Node{data: data, next: next}))
    }
}

pub struct SimpleLinkedList<T> {
    head: Option<Box<Node<T>>>,
}

impl<T: Clone> SimpleLinkedList<T> {
    pub fn new() -> Self {
        SimpleLinkedList{ head: None }
    }

    pub fn len(&self) -> usize {
        let mut cnt: usize = 0;
        let mut nnode = &self.head;
        while let Some(node) = nnode { nnode = &node.next; cnt += 1; }
        cnt
    }

    pub fn push(&mut self, _element: T) {
        self.head = Node::new(_element, self.head.take());
    }

    pub fn pop(&mut self) -> Option<T> {
        match self.head.take() {
            Some(mut head) => { self.head = head.next.take();
                                Some(head.data) },
            _ => None
        }
    }

    pub fn peek(&self) -> Option<&T> {
        match self.head {
            Some(ref head) => Some(&head.data),
            _ => None
        }
    }

    pub fn rev(&self) -> Self {
        let mut lst = SimpleLinkedList::new();
        let mut nnode = &self.head;
        while let Some(node) = nnode { lst.push(node.data.clone());
                                       nnode = &node.next; }
        lst
    }
}

impl<'a, T: Clone> From<&'a [T]> for SimpleLinkedList<T> {
    fn from(_item: &[T]) -> Self {
        _item.iter().fold(SimpleLinkedList::new(),
                          |mut lst, it| { lst.push(it.clone()); lst })
    }
}

impl<T: Clone> Into<Vec<T>> for SimpleLinkedList<T> {
    fn into(self) -> Vec<T> {
        let mut vec = Vec::new();
        let mut nnode = &self.head;
        let len = vec.len().clone();
        while let Some(node) = nnode { vec.insert(len, node.data.clone());
                                       nnode = &node.next; }
        vec
    }
}
