function love.load ()
    love.graphics.setLineStyle('smooth')
    W, H = love.graphics.getDimensions()
    X, Y, K1, K2 = W/2, H/2, 5*W, 5*H
    speed = 0
    Stars = {}

    maxStars = 1024
    function reset (s)
        s.x = K1*(love.math.random() - 0.5)
        s.y = K2*(love.math.random() - 0.5)
        s.z = love.math.random() * (900) + 100
        s.vz = love.math.random() * (5.0) + 0.5
        s.sx = s.x / s.z * 100 + X
        s.sy = s.y / s.z * 100 + Y
        s.ox = s.sx
        s.oy = s.sy
    end

    for i=1, maxStars do
        Stars[i] = {}
        reset(Stars[i])
    end
end

function love.update (dt)
    if love.keyboard.isDown('up') then
        speed = speed + dt
    elseif love.keyboard.isDown('down') then
        speed = speed - dt
    end
end

function love.draw ()
    for i=1, maxStars do
        s = Stars[i]

        s.z = s.z - s.vz - speed
        s.sx = s.x / s.z * 100 + X
        s.sy = s.y / s.z * 100 + Y

        if s.sx < 0 or s.sx > W or
           s.sy < 0 or s.sy > H or
           s.sx == X and s.sy == Y or
           s.z < 1 or s.z > 1000 then
            reset(s)
        end

        b = 280 - s.z * 0.280
        if b > 255 then b = 255 end
        love.graphics.setColor(b, b, b)
        love.graphics.line(s.sx, s.sy, s.ox, s.oy)
        s.ox = s.sx
        s.oy = s.sy
    end
end

function love.keypressed (k)
    if k == 'escape' then
        love.event.quit()
    end
end

function love.resize (w, h)
    W, H = w, h
    X, Y, K1, K2 = W/2, H/2, 5*W, 5*H
end
