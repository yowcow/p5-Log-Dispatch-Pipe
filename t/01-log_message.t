use strict;
use utf8;
use warnings;
use File::Temp qw(tempdir);
use Log::Dispatch::Pipe;
use Test::More;

my $tmp = tempdir(CLEANUP => 1);

subtest 'Test log_message' => sub {
    my $output_file = "${tmp}/test.log";

    subtest 'Output log' => sub {
        my $log = Log::Dispatch::Pipe->new(
            min_level => 'info',
            output_to => "xargs echo >> ${output_file}",
            binmode   => ':utf8',
        );

        ok $log->log(level => 'info', message => 'あいうえお');
        ok $log->log(level => 'info', message => 'かきくけこ');
    };

    subtest 'Check written log' => sub {
        my $content = do {
            open my $fh, '<', $output_file
                or die "Failed opening output file: $!";
            binmode $fh, ':utf8';
            local $/ = undef;
            <$fh>;
        };

        is $content, <<END;
あいうえお
かきくけこ
END
    };
};

done_testing;
