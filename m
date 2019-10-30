Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 947AFE9AE8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2019 12:38:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbfJ3LiH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Oct 2019 07:38:07 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:40210 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbfJ3LiG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Oct 2019 07:38:06 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07A8DDD;
        Wed, 30 Oct 2019 12:38:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1572435483;
        bh=PYSXHQU4ebLwM3qXkjfo0OlrpoJSgX6NYoliZZ4xefk=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=JMaDAKLVhhTN1ObWUbdEIssC6ron/kgVfOF5u9W+bqHJi35UjWpVoTCYfhntmnBKW
         JMXSaWgbSNxhM0sNtWFbSqgYu4X9A73LVkJD0R9Mxc0IWrwG+Qu7uC4rAT9ImOqQUr
         Cu9DiWhoSJH+FnIlCY1dTW99KSHeVF0CvaCqq9pQ=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v3] replace timeconst bc script with an sh script
To:     Ethan Sommer <e5ten.arch@gmail.com>,
        "H . Peter Anvin" <hpa@zytor.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        "Chang S. Bae" <chang.seok.bae@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@suse.de>,
        Mark Rutland <mark.rutland@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Corey Minyard <cminyard@mvista.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20190620062246.2665-1-e5ten.arch@gmail.com>
 <20191029210250.17007-1-e5ten.arch@gmail.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <aaec7b5b-3a58-f36e-74e6-5be0a6185c5b@ideasonboard.com>
Date:   Wed, 30 Oct 2019 11:37:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191029210250.17007-1-e5ten.arch@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ethan,

On 29/10/2019 21:02, Ethan Sommer wrote:
> removes the bc build dependency introduced when timeconst.pl was
> replaced by timeconst.bc:
> commit 70730bca1331 ("kernel: Replace timeconst.pl with a bc script")
> 
> the reason for this change is that this is the only use of bc in the
> actual compilation of the kernel, so by replacing it with a shell script
> compiling the kernel no longer depends on bc.
> 
> Signed-off-by: Ethan Sommer <e5ten.arch@gmail.com>
> ---
>  Documentation/process/changes.rst |   6 --
>  Kbuild                            |   4 +-
>  kernel/time/timeconst.bc          | 117 ------------------------------
>  kernel/time/timeconst.sh          | 111 ++++++++++++++++++++++++++++

Running shellcheck on kernel/time/timeconst.sh produces the following
warnings:

shellcheck kernel/time/timeconst.sh

In kernel/time/timeconst.sh line 11:
	local i=1 j=0
        ^-- SC2039: In POSIX sh, 'local' is undefined.


In kernel/time/timeconst.sh line 20:
	local i="$1" j="$2" k
        ^-- SC2039: In POSIX sh, 'local' is undefined.


In kernel/time/timeconst.sh line 34:
	local i
        ^-- SC2039: In POSIX sh, 'local' is undefined.


In kernel/time/timeconst.sh line 44:
	local i=0 j
        ^-- SC2039: In POSIX sh, 'local' is undefined.



Will this cause an issue for people running posix shells?
Which shells have you tested your script on ?


Furthermore, I fear this conversion may not be suitable at present, as
it produces potentially different results for CONFIG_HZ < 100

(There may be more diffs, but I haven't yet compared a larger search space)

using a quick script I put together to compare the output of
timeconst.sh and timeconst.bc for a given CONFIG_HZ:


 https://gist.github.com/kbingham/76e8718df7b7dc97361405cc1801a160


$ for i in `seq 0 300`; do ./check-timeconst.sh $i; done

produces a diff on almost every value 2 - 243

   http://paste.ubuntu.com/p/wNggrfFZXB/

Or rather 137 faults to be exact:

 for i in `seq 0 250`; \
	do ./check-timeconst.sh $i; \
 done | grep -- "--- BC" | wc -l


I think that might be considered a blocker to this implementation, or
those values and the impact should certainly be investigated thoroughly.

I haven't looked into detail into the change of any of those values, so
I can not ascertain which one is more correct (though I suspect it's
likely to be bc that will have the 'more correct' value)

I would fear doing this in shell just isn't going to maintain the
correct precision, which is likely a strong reason why bc was selected
in the first place.


If you can find the issue that causes this diff in your shell
processing, and clarify or fix it - then it might be possible to gain
some backing to the implementation, but even then it might become a
shell specific precision issue ...

--
Regards

Kieran



>  4 files changed, 113 insertions(+), 125 deletions(-)
>  delete mode 100644 kernel/time/timeconst.bc
>  create mode 100644 kernel/time/timeconst.sh
> 
> diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
> index 2284f2221f02..3ae168387109 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -105,12 +105,6 @@ Perl
>  You will need perl 5 and the following modules: ``Getopt::Long``,
>  ``Getopt::Std``, ``File::Basename``, and ``File::Find`` to build the kernel.
>  
> -BC
> ---
> -
> -You will need bc to build kernels 3.10 and higher
> -
> -
>  OpenSSL
>  -------
>  
> diff --git a/Kbuild b/Kbuild
> index 3109ac786e76..7eba24cbdb78 100644
> --- a/Kbuild
> +++ b/Kbuild
> @@ -18,9 +18,9 @@ $(bounds-file): kernel/bounds.s FORCE
>  
>  timeconst-file := include/generated/timeconst.h
>  
> -filechk_gentimeconst = echo $(CONFIG_HZ) | bc -q $<
> +filechk_gentimeconst = $(CONFIG_SHELL) $< $(CONFIG_HZ)
>  
> -$(timeconst-file): kernel/time/timeconst.bc FORCE
> +$(timeconst-file): kernel/time/timeconst.sh FORCE
>  	$(call filechk,gentimeconst)
>  
>  #####
> diff --git a/kernel/time/timeconst.bc b/kernel/time/timeconst.bc
> deleted file mode 100644
> index 7ed0e0fb5831..000000000000
> --- a/kernel/time/timeconst.bc
> +++ /dev/null
> @@ -1,117 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -
> -scale=0
> -
> -define gcd(a,b) {
> -	auto t;
> -	while (b) {
> -		t = b;
> -		b = a % b;
> -		a = t;
> -	}
> -	return a;
> -}
> -
> -/* Division by reciprocal multiplication. */
> -define fmul(b,n,d) {
> -       return (2^b*n+d-1)/d;
> -}
> -
> -/* Adjustment factor when a ceiling value is used.  Use as:
> -   (imul * n) + (fmulxx * n + fadjxx) >> xx) */
> -define fadj(b,n,d) {
> -	auto v;
> -	d = d/gcd(n,d);
> -	v = 2^b*(d-1)/d;
> -	return v;
> -}
> -
> -/* Compute the appropriate mul/adj values as well as a shift count,
> -   which brings the mul value into the range 2^b-1 <= x < 2^b.  Such
> -   a shift value will be correct in the signed integer range and off
> -   by at most one in the upper half of the unsigned range. */
> -define fmuls(b,n,d) {
> -	auto s, m;
> -	for (s = 0; 1; s++) {
> -		m = fmul(s,n,d);
> -		if (m >= 2^(b-1))
> -			return s;
> -	}
> -	return 0;
> -}
> -
> -define timeconst(hz) {
> -	print "/* Automatically generated by kernel/time/timeconst.bc */\n"
> -	print "/* Time conversion constants for HZ == ", hz, " */\n"
> -	print "\n"
> -
> -	print "#ifndef KERNEL_TIMECONST_H\n"
> -	print "#define KERNEL_TIMECONST_H\n\n"
> -
> -	print "#include <linux/param.h>\n"
> -	print "#include <linux/types.h>\n\n"
> -
> -	print "#if HZ != ", hz, "\n"
> -	print "#error \qinclude/generated/timeconst.h has the wrong HZ value!\q\n"
> -	print "#endif\n\n"
> -
> -	if (hz < 2) {
> -		print "#error Totally bogus HZ value!\n"
> -	} else {
> -		s=fmuls(32,1000,hz)
> -		obase=16
> -		print "#define HZ_TO_MSEC_MUL32\tU64_C(0x", fmul(s,1000,hz), ")\n"
> -		print "#define HZ_TO_MSEC_ADJ32\tU64_C(0x", fadj(s,1000,hz), ")\n"
> -		obase=10
> -		print "#define HZ_TO_MSEC_SHR32\t", s, "\n"
> -
> -		s=fmuls(32,hz,1000)
> -		obase=16
> -		print "#define MSEC_TO_HZ_MUL32\tU64_C(0x", fmul(s,hz,1000), ")\n"
> -		print "#define MSEC_TO_HZ_ADJ32\tU64_C(0x", fadj(s,hz,1000), ")\n"
> -		obase=10
> -		print "#define MSEC_TO_HZ_SHR32\t", s, "\n"
> -
> -		obase=10
> -		cd=gcd(hz,1000)
> -		print "#define HZ_TO_MSEC_NUM\t\t", 1000/cd, "\n"
> -		print "#define HZ_TO_MSEC_DEN\t\t", hz/cd, "\n"
> -		print "#define MSEC_TO_HZ_NUM\t\t", hz/cd, "\n"
> -		print "#define MSEC_TO_HZ_DEN\t\t", 1000/cd, "\n"
> -		print "\n"
> -
> -		s=fmuls(32,1000000,hz)
> -		obase=16
> -		print "#define HZ_TO_USEC_MUL32\tU64_C(0x", fmul(s,1000000,hz), ")\n"
> -		print "#define HZ_TO_USEC_ADJ32\tU64_C(0x", fadj(s,1000000,hz), ")\n"
> -		obase=10
> -		print "#define HZ_TO_USEC_SHR32\t", s, "\n"
> -
> -		s=fmuls(32,hz,1000000)
> -		obase=16
> -		print "#define USEC_TO_HZ_MUL32\tU64_C(0x", fmul(s,hz,1000000), ")\n"
> -		print "#define USEC_TO_HZ_ADJ32\tU64_C(0x", fadj(s,hz,1000000), ")\n"
> -		obase=10
> -		print "#define USEC_TO_HZ_SHR32\t", s, "\n"
> -
> -		obase=10
> -		cd=gcd(hz,1000000)
> -		print "#define HZ_TO_USEC_NUM\t\t", 1000000/cd, "\n"
> -		print "#define HZ_TO_USEC_DEN\t\t", hz/cd, "\n"
> -		print "#define USEC_TO_HZ_NUM\t\t", hz/cd, "\n"
> -		print "#define USEC_TO_HZ_DEN\t\t", 1000000/cd, "\n"
> -
> -		cd=gcd(hz,1000000000)
> -		print "#define HZ_TO_NSEC_NUM\t\t", 1000000000/cd, "\n"
> -		print "#define HZ_TO_NSEC_DEN\t\t", hz/cd, "\n"
> -		print "#define NSEC_TO_HZ_NUM\t\t", hz/cd, "\n"
> -		print "#define NSEC_TO_HZ_DEN\t\t", 1000000000/cd, "\n"
> -		print "\n"
> -
> -		print "#endif /* KERNEL_TIMECONST_H */\n"
> -	}
> -	halt
> -}
> -
> -hz = read();
> -timeconst(hz)
> diff --git a/kernel/time/timeconst.sh b/kernel/time/timeconst.sh
> new file mode 100644
> index 000000000000..d1aa25f46be8
> --- /dev/null
> +++ b/kernel/time/timeconst.sh
> @@ -0,0 +1,111 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +
> +if [ -z "$1" ]; then
> +	printf '%s <HZ>\n' "$0" >&2
> +	exit 1
> +fi
> +
> +# 2 to the power of n
> +pot() {
> +	local i=1 j=0
> +	while [ "$((j += 1))" -le "$1" ]; do
> +		: "$((i *= 2))"
> +	done
> +	printf '%u' "${i}"
> +}
> +
> +# Greatest common denominator
> +gcd() {
> +	local i="$1" j="$2" k
> +	while [ "${j}" -ne 0 ]; do
> +		k="${j}" j="$((i % j))" i="${k}"
> +	done
> +	printf '%u' "${i}"
> +}
> +
> +# Division by reciprocal multiplication.
> +fmul() {
> +	printf '%u' "$((($(pot "$1") * $2 + $3 - 1) / $3))"
> +}
> +
> +# Adjustment factor when a ceiling value is used.
> +fadj() {
> +	local i
> +	i="$(gcd "$2" "$3")"
> +	printf '%u' "$(($(pot "$1") * ($3 / i - 1) / ($3 / i)))"
> +}
> +
> +# Compute the appropriate mul/adj values as well as a shift count,
> +# which brings the mul value into the range 2^b-1 <= x < 2^b.  Such
> +# a shift value will be correct in the signed integer range and off
> +# by at most one in the upper half of the unsigned range.
> +fmuls() {
> +	local i=0 j
> +	while true; do
> +		j="$(fmul "${i}" "$2" "$3")"
> +		if [ "${j}" -ge "$(pot "$(($1 - 1))")" ]; then
> +			printf '%u' "${i}"
> +			return
> +		fi
> +		: "$((i += 1))"
> +	done
> +}
> +
> +printf '/* Automatically generated by kernel/time/timeconst.sh */\n'
> +printf '/* Time conversion constants for HZ == %u */\n\n' "$1"
> +
> +printf '#ifndef KERNEL_TIMECONST_H\n'
> +printf '#define KERNEL_TIMECONST_H\n\n'
> +
> +printf '#include <linux/param.h>\n'
> +printf '#include <linux/types.h>\n\n'
> +
> +printf '#if HZ != %u\n' "$1"
> +printf '#error "include/generated/timeconst.h has the wrong HZ value!"\n'
> +printf '#endif\n\n'
> +
> +if [ "$1" -lt 2 ]; then
> +	printf '#error Totally bogus HZ value!\n'
> +	exit 1
> +fi
> +
> +s="$(fmuls 32 1000 "$1")"
> +printf '#define HZ_TO_MSEC_MUL32\tU64_C(0x%X)\n' "$(fmul "${s}" 1000 "$1")"
> +printf '#define HZ_TO_MSEC_ADJ32\tU64_C(0x%X)\n' "$(fadj "${s}" 1000 "$1")"
> +printf '#define HZ_TO_MSEC_SHR32\t%u\n' "${s}"
> +
> +s="$(fmuls 32 "$1" 1000)"
> +printf '#define MSEC_TO_HZ_MUL32\tU64_C(0x%X)\n' "$(fmul "${s}" "$1" 1000)"
> +printf '#define MSEC_TO_HZ_ADJ32\tU64_C(0x%X)\n' "$(fadj "${s}" "$1" 1000)"
> +printf '#define MSEC_TO_HZ_SHR32\t%u\n' "${s}"
> +
> +cd="$(gcd "$1" 1000)"
> +printf '#define HZ_TO_MSEC_NUM\t\t%u\n' "$((1000 / cd))"
> +printf '#define HZ_TO_MSEC_DEN\t\t%u\n' "$(($1 / cd))"
> +printf '#define MSEC_TO_HZ_NUM\t\t%u\n' "$(($1 / cd))"
> +printf '#define MSEC_TO_HZ_DEN\t\t%u\n\n' "$((1000 / cd))"
> +
> +s="$(fmuls 32 1000000 "$1")"
> +printf '#define HZ_TO_USEC_MUL32\tU64_C(0x%X)\n' "$(fmul "${s}" 1000000 "$1")"
> +printf '#define HZ_TO_USEC_ADJ32\tU64_C(0x%X)\n' "$(fadj "${s}" 1000000 "$1")"
> +printf '#define HZ_TO_USEC_SHR32\t%u\n' "${s}"
> +
> +s="$(fmuls 32 "$1" 1000000)"
> +printf '#define USEC_TO_HZ_MUL32\tU64_C(0x%X)\n' "$(fmul "${s}" "$1" 1000000)"
> +printf '#define USEC_TO_HZ_ADJ32\tU64_C(0x%X)\n' "$(fadj "${s}" "$1" 1000000)"
> +printf '#define USEC_TO_HZ_SHR32\t%u\n' "${s}"
> +
> +cd="$(gcd "$1" 1000000)"
> +printf '#define HZ_TO_USEC_NUM\t\t%u\n' "$((1000000 / cd))"
> +printf '#define HZ_TO_USEC_DEN\t\t%u\n' "$(($1 / cd))"
> +printf '#define USEC_TO_HZ_NUM\t\t%u\n' "$(($1 / cd))"
> +printf '#define USEC_TO_HZ_DEN\t\t%u\n' "$((1000000 / cd))"
> +
> +cd="$(gcd "$1" 1000000000)"
> +printf '#define HZ_TO_NSEC_NUM\t\t%u\n' "$((1000000000 / cd))"
> +printf '#define HZ_TO_NSEC_DEN\t\t%u\n' "$(($1 / cd))"
> +printf '#define NSEC_TO_HZ_NUM\t\t%u\n' "$(($1 / cd))"
> +printf '#define NSEC_TO_HZ_DEN\t\t%u\n' "$((1000000000 / cd))"
> +
> +printf '\n#endif /* KERNEL_TIMECONST_H */\n'
> 

-- 
Regards
--
Kieran
