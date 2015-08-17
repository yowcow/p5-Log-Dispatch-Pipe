requires 'perl', '5.008001';

requires 'Log::Dispatch';
requires 'Scalar::Util';

on 'test' => sub {
    requires 'File::Temp';
    requires 'File::Touch';
    requires 'Test::Exception';
    requires 'Test::More', '0.98';
};

on 'develop' => sub {
    requires 'Log::Log4perl';
    requires 'Time::Piece';
};
