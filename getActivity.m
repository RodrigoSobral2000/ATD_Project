function activity= getActivity(num_activity)
    switch num_activity
        case 1
            activity = "W";
        case 2
            activity = "W_U";
        case 3
            activity = "W_D";
        case 4
            activity = "SIT";
        case 5
            activity = "STAND";
        case 6
            activity = "LAY";
        case 7
            activity = "STAND_SIT";
        case 8
            activity = "SIT_STAND";
        case 9
            activity = "SIT_LIE";
        case 10
            activity = "LIE_SIT";
        case 11
            activity = "STAND_LIE";
        case 12
            activity = "LIE_STAND";
        otherwise
            disp("Error in activity identification!");
    end
end