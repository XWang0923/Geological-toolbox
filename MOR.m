clear; close all;

tiledlayout(3, 4, "TileSpacing", "compact");
times = [660 635 560 445];
for kase = 4:4
    data = readtable(times(kase) + " Divergence.csv");
    N = height(data);
    
    zz = -90:10:90;
    zz = zz';
    mid_points = (zz(1:end-1) + zz(2:end)) / 2;
    A = 2 * pi * 6371 * 6371 * abs(sind(zz(1:end-1)) - sind(zz(2:end)));
    res = zeros(length(mid_points), 1);
    nexttile(kase);
    for i = 1:N
        cur = data{i, :};
        cur(isnan(cur)) = [];
        M = length(cur) / 2;
        lngs = cur(1:M); lats = cur(M+1:end);
        plot(lngs, lats, 'k-'); hold on;
        for j = 1:M-1 % iterate the segments in a mid ocean ridge
            d = length_on_map(lngs(j), lats(j), lngs(j+1), lats(j+1)); % total length of this segment
            Dlat = abs(lats(j) - lats(j+1));
            lat_min = min(lats([j j+1])); lat_max = max(lats([j j+1]));
            for k = 1:length(mid_points)
                if lat_max >= zz(k) && lat_min <= zz(k+1) % this segment is crossing this latitudinal bin
                    if lat_max <= zz(k+1) && lat_min >= zz(k) % fully within this bin
                        res(k) = res(k) + d;
                    elseif lat_max >= zz(k+1) && lat_min <= zz(k) % penetrating through this bin
                        res(k) = res(k) + d * 10 / Dlat;
                    elseif lat_max >= zz(k+1) && lat_min >= zz(k) % crossing the upper boundary
                        res(k) = res(k) + d * (zz(k+1) - lat_min) / Dlat;
                    elseif lat_max <= zz(k+1) && lat_min <= zz(k) % crossing the lower boundary
                        res(k) = res(k) + d * (lat_max - zz(k)) / Dlat;
                    end
                end
            end
        end
    end
    xlim([-180 180]); ylim([-90 90]);
    title(times(kase) + " Ma");
    if kase == 1
        ylabel("Mid-ocean ridge map");
    end
    nexttile(kase+4);
    plot(res, mid_points, 'r-o');
    ylim([-90 90]);
    if kase == 1
        ylabel("MOR length (km)");
    end
    nexttile(kase+8);
    plot(res./A, mid_points, 'r-o');
    ylim([-90 90]);
    if kase == 1
        ylabel("MOR density (km/km^2)");
    end
    [mid_points res res./A ]
    break;
end

function ret=length_on_map(lon1, lat1, lon2, lat2)
R = 6371;
Dlat = lat1 - lat2;
Dlon = lon1 - lon2;
a = sind(Dlat/2) .^ 2 + cosd(lat1) .* cosd(lat2) .* (sind(Dlon/2) .^ 2);
c = 2 * atan2(sqrt(a), sqrt(1-a));
ret = R * c;
end