function love.load ()
    W, H = love.graphics.getDimensions()
    X, Y = W/2, H/2
    maxStars = 1024
    Stars = {}

    function reset (s)
        s.x = math.random(-W*3, W*3)
        s.y = math.random(-H*3, H*3)
        s.z = math.random(100, 1000)
        s.sx = 0
        s.sy = 0
    end

    for i=1, maxStars do
        Stars[i] = {}
        reset(Stars[i])
    end
end

function love.draw ()
    for i=1, maxStars do
        s = Stars[i]

        s.z = s.z - 5

        s.sx = s.x / s.z * 100 + X
        s.sy = s.y / s.z * 100 + Y

        if s.sx < 0 or s.sx > W or
           s.sy < 0 or s.sy > H or
           s.z < 1 then
            reset(s)
        end

        b = 350 - s.z * 0.35
        if b > 255 then b = 255 end
        love.graphics.setColor(b, b, b)
        love.graphics.point(s.sx, s.sy)
    end
end

function love.keypressed (k)
    if k == 'escape' then
        love.event.quit()
    end
end

function love.resize (w, h)
    W, H = w, h
    X, Y = W/2, H/2
end
