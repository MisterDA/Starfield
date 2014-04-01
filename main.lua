function love.load()
    X, Y = love.graphics.getWidth() / 2, love.graphics.getHeight() / 2
    maxStars = 63
    Stars = {}
    for i=0, maxStars do
        Stars[i] = {
            x = X,
            y = Y,
            vx = math.random() * 4 - 2,
            vy = math.random() * 4 - 2
        }
    end
end

function love.draw()
    for i=0, maxStars do
        s = Stars[i]
        s.x = s.x + s.vx
        s.y = s.y + s.vy

        if s.x < 0 or s.x > love.graphics.getWidth() or
           s.y < 0 or s.y > love.graphics.getHeight() then
            s.x = X
            s.y = Y
            s.vx = math.random() * 4 - 2
            s.vy = math.random() * 4 - 2
        end

        love.graphics.point(s.x, s.y)
    end
end

function love.keypressed (k)
    if k == 'escape' then
        love.event.quit()
    end
end
