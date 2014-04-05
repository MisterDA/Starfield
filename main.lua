function love.load ()
    W, H = love.graphics.getDimensions()
    X, Y = W/2, H/2
    b, x, y, fx, fy, btl, btr, bbl, bbr = 0,0,0,0,0,0,0,0,0
    maxStars = 1024
    Stars = {}

    function reset (s)
        s.x = love.math.random() * (W*6) -W*3
        s.y = love.math.random() * (H*6) -H*3
        s.z = love.math.random() * (900) + 100
        s.vz = love.math.random() * (5.0) + 0.5
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

        s.z = s.z - s.vz

        s.sx = s.x / s.z * 100 + X
        s.sy = s.y / s.z * 100 + Y

        if s.sx < 0 or s.sx > W or
           s.sy < 0 or s.sy > H or
           s.z < 1 then
            reset(s)
        end

        b = 325 - s.z * 0.325
        if b > 255 then b = 255 end
        x, y = math.floor(s.sx), math.floor(s.sy)
        fx, fy = s.sx - x, s.sy - y
        btl = (1-fx)*(1-fy)*b
        btr = (fx)*(1-fy)*b
        bbl = (1-fx)*(fy)*b
        bbr = (fx)*(fy)*b
        love.graphics.setColor(btl, btl, btl)
        love.graphics.point(x, y)
        love.graphics.setColor(btr, btr, btr)
        love.graphics.point(x+1, y)
        love.graphics.setColor(bbl, bbl, bbl)
        love.graphics.point(x, y+1)
        love.graphics.setColor(bbr, bbr, bbr)
        love.graphics.point(x+1, y+1)
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
