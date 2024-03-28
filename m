Return-Path: <linux-renesas-soc+bounces-4013-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1217A88B6E1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Mar 2024 02:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B69B22E5754
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Mar 2024 01:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899181CD29;
	Tue, 26 Mar 2024 01:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Bx+l1E1R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FD11CD16
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Mar 2024 01:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711416689; cv=none; b=LPI/upkoioowspMh2nw423fw7AhJ7TVkj5MT5MxXz400X/7PXDCryckrdlm9tFcpsXR14dbvly00JmXkKt1NVjULTBEvMvMqwr0fqxDiaWpO3NgNJRGvNGhhpq7UDjNCqME78CiuMQ2o3xu6bwJmrzQLsQExeu8C3fQyDx1gRPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711416689; c=relaxed/simple;
	bh=Fl+yRjd0UrHOAiD6WIaH4FFdnBSi6P1vaZZG/JCGnkU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=AYW9qA7QCQjqROLig1iH9/yx5RJnkvpN0m7OdxBK+sSrh/TILvN4YvWUKQOYuekkKQGKrRERmL1Cvp+0EFW7IsfCC9AbMjz3M3XLd4+PMJGVLlu6j9krwzQJSVk6Z2q/rJzQ9y7oo2kK/sMEdgSYmQCMvV7SpHMJAq+EFVawR6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Bx+l1E1R; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e6ee9e3cffso3421659b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Mar 2024 18:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711416686; x=1712021486; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xL3rc040eKk6aS3kn8YpvfEGan/cVzm8MFiFJYrFFIA=;
        b=Bx+l1E1RguroxyboASRE3Si+qswODnxyduA5v/aQg41xzqQQzPF9Brv42Ss9eGu9QY
         Eoi2ud/qY7znvCdUVw9NOQMP845PUjdW+D9EjiM/hLZcCJ7dlZalwqgmqFCWMBoJMGQb
         ZDTcGE4iCH4s1inbntlg9HD7IaTVyDgIUami8HqMjAyxKG33LbAyl5UzNPGEQpvRgDwT
         nfPDGqvQf6Vdx8lbhsAodoB+KlszPHIf1/HHRKgLBwUSTjbV8nnCimvEubio1PeHVDPT
         k3Sblo5bWDma+KZfE6u905VjyG1c4AjxqIEvJHPNlhoic9x6zjQB9Fp5XaCOfV1/w0E2
         hl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711416686; x=1712021486;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xL3rc040eKk6aS3kn8YpvfEGan/cVzm8MFiFJYrFFIA=;
        b=nYSoD5UpLwngbqteggt05PP7bMgj7y2p1vqYrJBfcC7v7HY9BwwWoGF4htAZU/3q/6
         eaXvPM08y0JaEXk0F2ZVQLEzx0prj21Lud9bFdJQ2oROqdZIHg0TB/IJapFIwttXwuFh
         yBgcFJR9nHa5JnziqMHPacDcxQe1CI5mlzxvYmcOeLPDR9aW3iIlgzBvJr4YC/nb/DYQ
         D7qYv2Yk5H7BUkE7ZnaV6flF+fTO+V01wgV2DfL3OC8+af05CNMaOXukBTRp/2rY4oHh
         ELnijBdF2Jt+FPObhqzkuSbwsOj99Gh/txfoF7BtixaixY20bmN/2XFS4MX+xD9HJSDi
         AAyA==
X-Forwarded-Encrypted: i=1; AJvYcCXU82KQkrGDTzwMv3R391O8xHIiZHCYiMYPMk+1MrtDj2hQQruM9a+YqZoW3Yv4WHj7eESHocdnTFMpO5QdYxQfyw7DDHBSuF+aGyYWRmn9aKk=
X-Gm-Message-State: AOJu0YyTawljmNdzUFqiJ4eeXW7sX5T6GypjaG6uaRZjB1pE1F9mLFnr
	C9RsfDPFTkq9S8nzysnjULQIUVqt8U5lQTnSBUdY0j1RI1+YqFRZKEqnYrSvUpg=
X-Google-Smtp-Source: AGHT+IG9ZhWQHv78QSHczCurjPGCufikynH54sKO+XOUJb+NA4j/kl8/nWQa7OAQoYkmCdzpzJl8fQ==
X-Received: by 2002:a05:6a20:3950:b0:1a3:c8ab:5a7c with SMTP id r16-20020a056a20395000b001a3c8ab5a7cmr105666pzg.22.1711416686296;
        Mon, 25 Mar 2024 18:31:26 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d18-20020a63d712000000b005bdbe9a597fsm6396157pgg.57.2024.03.25.18.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 18:31:25 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: geert+renesas@glider.be
Cc: arnd@arndb.de,
	hca@linux.ibm.com,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	jstultz@google.com,
	kai.heng.feng@canonical.com,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux@armlinux.org.uk,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	npiggin@gmail.com,
	peterz@infradead.org,
	rafael.j.wysocki@intel.com,
	robin.murphy@arm.com,
	s.nawrocki@samsung.com,
	sboyd@kernel.org,
	tero.kristo@linux.intel.com,
	tglx@linutronix.de,
	tomasz.figa@gmail.com,
	tony@atomide.com,
	ulf.hansson@linaro.org,
	vincent.guittot@linaro.org,
	will@kernel.org,
	wsa+renesas@sang-engineering.com,
	yoshihiro.shimoda.uh@renesas.com,
	zhengdejin5@gmail.com
Subject: Re: [PATCH v3 2/7] iopoll: Do not use timekeeping in read_poll_timeout_atomic()
Date: Tue, 26 Mar 2024 09:31:19 +0800
Message-Id: <20240326013119.10591-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <3d2a2f4e553489392d871108797c3be08f88300b.1685692810.git.geert+renesas@glider.be>
References: <3d2a2f4e553489392d871108797c3be08f88300b.1685692810.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

On Fri, Jun 02, 2023 at 10:50:37AM +0200, Geert Uytterhoeven wrote:
> read_poll_timeout_atomic() uses ktime_get() to implement the timeout
> feature, just like its non-atomic counterpart.  However, there are
> several issues with this, due to its use in atomic contexts:
> 
>   1. When called in the s2ram path (as typically done by clock or PM
>      domain drivers), timekeeping may be suspended, triggering the
>      WARN_ON(timekeeping_suspended) in ktime_get():
> 
> 	WARNING: CPU: 0 PID: 654 at kernel/time/timekeeping.c:843 ktime_get+0x28/0x78
> 
>      Calling ktime_get_mono_fast_ns() instead of ktime_get() would get
>      rid of that warning.  However, that would break timeout handling,
>      as (at least on systems with an ARM architectured timer), the time
>      returned by ktime_get_mono_fast_ns() does not advance while
>      timekeeping is suspended.
>      Interestingly, (on the same ARM systems) the time returned by
>      ktime_get() does advance while timekeeping is suspended, despite
>      the warning.
> 
>   2. Depending on the actual clock source, and especially before a
>      high-resolution clocksource (e.g. the ARM architectured timer)
>      becomes available, time may not advance in atomic contexts, thus
>      breaking timeout handling.
> 
> Fix this by abandoning the idea that one can rely on timekeeping to
> implement timeout handling in all atomic contexts, and switch from a
> global time-based to a locally-estimated timeout handling.  In most
> (all?) cases the timeout condition is exceptional and an error
> condition, hence any additional delays due to underestimating wall clock
> time are irrelevant.
>

Hi Geert,
I tested this patch on the FPGA, and I noticed the timeout duration
was much longer than expected. I tested it by removing the op operation
and break condition for avoiding the influence of other factors.
The code would look like as follows:

for (;;) {
        if (__timeout_us && __left_ns < 0)
                break;
        if (__delay_us) {
                udelay(__delay_us);
                if (__timeout_us)
                        __left_ns -= __delay_ns;;
	cpu_relex();
        if (__timeout_us)
                __left_ns--;
        }
}

Despite setting the timeout to 1 second, it actually takes 25 seconds
to reach the specified timeout value. I displayed the value of
__left_ns when a timeout occurred. As follows: __delay_us is 1, when
__left_ns counts down to -1, the system has run for 25 seconds.

[   26.016213] __timeout_us: 1000000 __left_ns: -1
[   50.818585] __timeout_us: 1000000  __left_ns: -1
[   75.620467] __timeout_us: 1000000  __left_ns: -1
[  100.422664] __timeout_us: 1000000  __left_ns: -1
[  125.224775] __timeout_us: 1000000  __left_ns: -1
...

I attempted to blend the two versions (e.g., ktime version and the
current version) for discarding the value of __left_ns. The resulting
output is as follows: __delay_us is 1, when it exceeds 1 second
according to ktime, __left_ns only counts around 40 ms.

[    6.734482] __timeout_us: 1000000  __left_ns: 961699000
[    7.738485] __timeout_us: 1000000  __left_ns: 961228000
[    8.812797] __timeout_us: 1000000  __left_ns: 961755000
[    9.814021] __timeout_us: 1000000  __left_ns: 961542000
[   10.815373] __timeout_us: 1000000 __left_ns: 962464000
[   11.816184] __timeout_us: 1000000 __left_ns: 961536000
[   12.817137] __timeout_us: 1000000 __left_ns: 961121000
...

Per your suggestion, I attempted to increase delay_us to 10 us,
it really helps to eliminate the underestimation. The actual
timeout became 3 secs on the FPGA.

I moved on my host x86 machine, the timeout has been reduced to
2 seconds even if the delay_us is 1. And the timeout can be
precise 1 seconds when delay_us is 10. I'm not sure if the clock
frequency or RTC frequency might also determine the underestimation
of wall clock time? Is there a suggested value of delay_us for a
driver that runs on various platforms?
What is your perspective for those situation?

Thanks.

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Tony Lindgren <tony@atomide.com>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
> The first issue was seen with the rcar-sysc driver in the BSP, as the
> BSP contains modifications to the resume sequence of various PM Domains.
> 
> v3:
>   - Add Acked-by, Reviewed-by,
>   - Add comment about not using timekeeping, and its impact,
> 
> v2:
>   - New.
> ---
>  include/linux/iopoll.h | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/iopoll.h b/include/linux/iopoll.h
> index 0417360a6db9b0d6..19a7b00baff43595 100644
> --- a/include/linux/iopoll.h
> +++ b/include/linux/iopoll.h
> @@ -74,6 +74,10 @@
>   * Returns 0 on success and -ETIMEDOUT upon a timeout. In either
>   * case, the last read value at @args is stored in @val.
>   *
> + * This macro does not rely on timekeeping.  Hence it is safe to call even when
> + * timekeeping is suspended, at the expense of an underestimation of wall clock
> + * time, which is rather minimal with a non-zero delay_us.
> + *
>   * When available, you'll probably want to use one of the specialized
>   * macros defined below rather than this macro directly.
>   */
> @@ -81,22 +85,30 @@
>  					delay_before_read, args...) \
>  ({ \
>  	u64 __timeout_us = (timeout_us); \
> +	s64 __left_ns = __timeout_us * NSEC_PER_USEC; \
>  	unsigned long __delay_us = (delay_us); \
> -	ktime_t __timeout = ktime_add_us(ktime_get(), __timeout_us); \
> -	if (delay_before_read && __delay_us) \
> +	u64 __delay_ns = __delay_us * NSEC_PER_USEC; \
> +	if (delay_before_read && __delay_us) { \
>  		udelay(__delay_us); \
> +		if (__timeout_us) \
> +			__left_ns -= __delay_ns; \
> +	} \
>  	for (;;) { \
>  		(val) = op(args); \
>  		if (cond) \
>  			break; \
> -		if (__timeout_us && \
> -		    ktime_compare(ktime_get(), __timeout) > 0) { \
> +		if (__timeout_us && __left_ns < 0) { \
>  			(val) = op(args); \
>  			break; \
>  		} \
> -		if (__delay_us) \
> +		if (__delay_us) { \
>  			udelay(__delay_us); \
> +			if (__timeout_us) \
> +				__left_ns -= __delay_ns; \
> +		} \
>  		cpu_relax(); \
> +		if (__timeout_us) \
> +			__left_ns--; \
>  	} \
>  	(cond) ? 0 : -ETIMEDOUT; \
>  })
> -- 
> 2.34.1
> 

