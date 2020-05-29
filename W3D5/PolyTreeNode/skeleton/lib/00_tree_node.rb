class PolyTreeNode

    attr_reader :parent, :children, :value

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(parent_node)
        return if parent_node == @parent
        self.parent.children.delete(self) if self.parent 
        @parent = parent_node
        self.parent.children << self if self.parent != nil 
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        child_node.parent = nil
        raise error "not a child" if !self.children.include?(child_node)
    end

    def dfs(target_value)
        return self if self.value == target_value
        
        self.children.each do |child|
            temp = child.dfs(target_value)
            return temp unless temp.nil?
        end

        nil
    end

    def bfs(target_value)
        queue = [self]
        until queue.empty?
            firsty = queue.shift
            return firsty if firsty.value == target_value
            queue += firsty.children
        end
        nil
    end
    
end

