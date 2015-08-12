# NAME

Log::Dispatch::Pipe - Object for logging to pipe output

# SYNOPSIS

    use Log::Dispatch;

    my $log = Log::Dispatch->new(
        outputs => [
            [
                'Pipe',
                min_level => 'info',
                output_to => 'cronolog path/to/%Y-%m-%d/something.log',
                binmode   => ':utf8',
            ]
        ],
    );

# DESCRIPTION

This module provides a simple object for logging to pipe under the Log::Dispatch::\* system.

# METHODS

## new

The constructor takes the following parameters in addition to the standard parameters documented in [Log::Dispatch::Output](https://metacpan.org/pod/Log::Dispatch::Output):

- output\_to :Str

    A process to be created via pipe.

- binmode :Str

    A layer name to be passed to binmode, like ":utf8".

# LICENSE

Copyright (C) yowcow.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

yowcow <yowcow@cpan.org>
