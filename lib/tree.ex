defmodule Tree do
  def main(x,dx,n) do
    lister(x,dx,n)
    |> draw_lines
    |> save_image
    end

    def save_image(image) do
        File.write("image_of_tree.png", image )

    end


    def lister(x,dx,n)  do
        if n > 1 do
            list =[lister(x+dx,dx/2,n-1) | [[[x-dx,n-1],[x,n]], [[x+dx, n-1], [x,n]]]]
            list = [lister(x-dx,dx/2,n-1) | list]
            list =Enum.reverse(list)
            list = List.flatten(list)
            list = Enum.chunk_every(list,4)
        else 
            list = [[[x-dx,n-1],[x,n]], [[x+dx, n-1], [x,n]]]
        end    
            list
        end

    def draw_lines(list) do
        image = :egd.create(2500, 2500)
        color = :egd.color({0,0,0})
        for i <- list do
            [x,y,x2,y2] = i
            :egd.line(image, {round(x),round(y*208)}, {round(x2),round(y2*208)}, color) 
             
        end
        
        :egd.render(image)
    end
end










