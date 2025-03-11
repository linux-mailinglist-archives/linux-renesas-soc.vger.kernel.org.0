Return-Path: <linux-renesas-soc+bounces-14267-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67598A5C559
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 16:14:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A748217A73F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 15:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDEAF25E833;
	Tue, 11 Mar 2025 15:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mss7qbqp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2003125E820;
	Tue, 11 Mar 2025 15:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741705905; cv=none; b=OSXxxFufgnqMdEXHZnr3RbJNLo9gT8j5zCdhueWXdhC6DLnYkYzTuazMmlmErtKM7g3gYIxlbxjOQ3WFmXpOILuHwOsIObth0emBzIASwkAYLgGKqJUL+yscV8oXLiWSCSmklYAmxc3czBUvSiU4EY4n2Nr20XYVLLL2vdHA0uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741705905; c=relaxed/simple;
	bh=zu/L7+HG6HCLqSThKKvejHwz7q04O4o7/CbXHL+MeOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BlziOqiULFoqel2H35UYJ2lwH2GLFQ9qwLHwhZQ696+vCHHPyMOtxPMbUdokk/Z/mRD1cZj9SUuXyU7O50+3M0prFJf3vyWOsjP/PTnd88pWbdSNgxVWoE91Ubqov8ElrUaq9QZJi+MWsyBjQHdvVdBjaOmH1pIqIkXqVVSSoJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mss7qbqp; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-867129fdb0aso5038603241.1;
        Tue, 11 Mar 2025 08:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741705903; x=1742310703; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTuA7YSQf6BTENhRE44x2ahXNAujiJZaMhILjLcujAA=;
        b=Mss7qbqpDDXbAP5nmPTtXEUlCGPNMUKCWAsmmQIEKxcYw5P9SGpLeckaurYCHOGI6S
         ZbmsmIAAvalt5OjRgN9pbUP4cybR8hq1FMbNhgwIeTBlV3VzyMfZX/J3MRX2qQdBy0o0
         ib+6YpRS5mXU68OeSZ7Zd910NP1n9Oxs6hZXwPtSjjNIjuanaxP/hW9yL/HDUle7xJRb
         JMSsPuqXHzGIvjVrYt5iWVZv5M88XyZhOs+ywI+nkieihVHyQPNm8+q54FA4+SlkBizq
         1731sHUwxXQUmLOjSKFUbeMCCT8T+gojA0Eri4TdCD/UfCJT37HGjrn2r8IZP9gHvUeS
         7u9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741705903; x=1742310703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTuA7YSQf6BTENhRE44x2ahXNAujiJZaMhILjLcujAA=;
        b=QfdVmK89ZAZ3ox3bS/MS3RiQy/7eIyISkmKm8OY3r2JQwWEu4969mVoWrQ3tU0EjQY
         9aaxVd3I15LJQPX/jdrp81CnRQu57lHx1Hl77+9yVVnMVWY9uN6JbKMLtrzCBczXyo6T
         5//xriQ/igQus4UV9zSWXnq933tsfbYaB3xhotazk25jBJ/GbQO3jlYMcDVOgJY1Ni43
         6qszwFKq4Zm8UVGYQXnbmwJBhHLyGWSKVwAbdqhrJJ5zMv+L1FoAtY7v/GLgcvIJ163q
         9dk4qH7DTJFvG3fTsci+2RvlvgzzH806hFjJS1wprUTJqYm6ndl/EFMfEEx+PezJ5vzt
         3N9w==
X-Forwarded-Encrypted: i=1; AJvYcCVqo2mnDHkxu8Nzy7R58qoz2WTXQ9g6nDd6d80LZjlXuwOOBuUFw2Tk34xkfweQSJSUR/yqp0nu1iMRZ+E=@vger.kernel.org, AJvYcCWI2pyYwPOCL9rAgamdN7OHva2I2Sb/cbxVursi12l5TySNCelLpoy8Dk7wUHOPtNW6JdacUUxbfpY9EuWsCl1cuU0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5+2oaF+0KUCOPed2xUweZ+hNezWq5E5IsdcF9FRALVrrRFLZR
	BvH2TEL37XXQ23de0wd1Y9s4OCcn8yuJYc3kX4BhOxrft6bbOJnxaVc8uVIfEh9/uMn81SWFNWU
	/8C6V15aBPlaLrcvMm+Wg/cndHCM=
X-Gm-Gg: ASbGncvTfh4AiDke79Uaf1SQOR8w8UeB4BVYG1Pd+C8C+v1DqqbAYv/Ax1FkWNY3MY9
	ymwivzVZH7a2riQbhkgwTonBRZotLyEh6M3c93nael6eRdAmyTEdgtkxHQf4HPrqYIcxfo1nCnq
	y05uCazjyabeCbsAyNkyBRAOUIog==
X-Google-Smtp-Source: AGHT+IGrRBAfEL4AxUiuseuyI92pGLRtD/JII/C+DL6HvPbEkqygZtUt+JWnvwrEiMJgIWvk5rmcyl+90xCH5yInaRw=
X-Received: by 2002:a05:6102:5793:b0:4bb:e14a:9451 with SMTP id
 ada2fe7eead31-4c34d31add4mr3130230137.20.1741705902795; Tue, 11 Mar 2025
 08:11:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c499234d559a0d95ad9472883e46077311051cd8.1741612208.git.geert+renesas@glider.be>
In-Reply-To: <c499234d559a0d95ad9472883e46077311051cd8.1741612208.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 11 Mar 2025 15:11:16 +0000
X-Gm-Features: AQ5f1Jpx2fGdbJPdj5FDcS5GoLqqOGLJlYzfmSg2SJ8trxO8w9qoL6dJAOW-mek
Message-ID: <CA+V-a8tGuxgan7Zx0YedSByfFSgrg5gmR6Fy3dMDXwU+TscZzg@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: smp: Enforce shmobile_smp_* alignment
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Nicolas Pitre <nico@fluxnic.net>, Simon Horman <horms+renesas@verge.net.au>, 
	Kees Cook <kees@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the patch.

On Mon, Mar 10, 2025 at 1:14=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> When the addresses of the shmobile_smp_mpidr, shmobile_smp_fn, and
> shmobile_smp_arg variables are not multiples of 4 bytes, secondary CPU
> bring-up fails:
>
>     smp: Bringing up secondary CPUs ...
>     CPU1: failed to come online
>     CPU2: failed to come online
>     CPU3: failed to come online
>     smp: Brought up 1 node, 1 CPU
>
> Fix this by adding the missing alignment directive.
>
> Fixes: 4e960f52fce16a3b ("ARM: shmobile: Move shmobile_smp_{mpidr, fn, ar=
g}[] from .text to .bss")
I wonder if this fixes tag should go back a bit far as I was able to
reproduce this on 5.10-cip BSP kernel on RZ/G1E this was only seen
when CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE was enabled,

RZ/G1E failure logs:
--------------------------
[    0.006719] smp: Bringing up secondary CPUs ...
[    1.040749] CPU1: failed to come online
[    1.041014] smp: Brought up 1 node, 1 CPU
[    1.041038] SMP: Total of 1 processors activated (65.00 BogoMIPS).
[    1.041063] CPU: All CPU(s) started in SVC mode.
[    1.041904] devtmpfs: initialized
[    1.050811] VFP support v0.3: implementor 41 architecture 2 part 30
variant 7 rev 5
[    1.051143] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 19112604462750000 ns
[    1.051197] futex hash table entries: 512 (order: 3, 32768 bytes, linear=
)
[    1.060510] pinctrl core: initialized pinctrl subsystem
[    1.063139] NET: Registered protocol family 16

$ grep shmobile_smp_ System.map-notworking
c021caa0 t shmobile_smp_apmu_cpu_kill
c021cb20 t shmobile_smp_apmu_enter_suspend
c021cb54 t shmobile_smp_apmu_boot_secondary
c021cbc0 t shmobile_smp_apmu_cpu_shutdown
c021cc18 t shmobile_smp_apmu_do_suspend
c021cc60 t shmobile_smp_apmu_cpu_die
c021cc84 T shmobile_smp_hook
c021ccd8 T shmobile_smp_cpu_can_disable
c021d050 t shmobile_smp_continue_gen2
c021d0c4 T shmobile_smp_boot
c021d0e4 t shmobile_smp_boot_find_mpidr
c021d0fc t shmobile_smp_boot_next
c021d10c t shmobile_smp_boot_found
c021d114 T shmobile_smp_sleep
c021d380 T shmobile_smp_scu_cpu_die
c021d3b4 T shmobile_smp_scu_cpu_kill
c120a87c t shmobile_smp_apmu_prepare_cpus_dt
c120aab8 T shmobile_smp_apmu_suspend_init
c120aad0 T shmobile_smp_init_fallback_ops
c120b0f0 T shmobile_smp_scu_prepare_cpus
c1262778 t __cpu_method_of_table_shmobile_smp_apmu
c154d5fd B shmobile_smp_mpidr
c154d61d B shmobile_smp_fn
c154d63d B shmobile_smp_arg


> Closes: https://lore.kernel.org/r/CAMuHMdU=3DQR-JLgEHKWpsr6SbaZRc-Hz9r91J=
fpP8c3n2G-OjqA@mail.gmail.com
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-fixes-for-v6.14.
> ---
>  arch/arm/mach-shmobile/headsmp.S | 1 +
>  1 file changed, 1 insertion(+)
>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm/mach-shmobile/headsmp.S b/arch/arm/mach-shmobile/he=
adsmp.S
> index a956b489b6ea12ca..2bc7e73a8582d2b3 100644
> --- a/arch/arm/mach-shmobile/headsmp.S
> +++ b/arch/arm/mach-shmobile/headsmp.S
> @@ -136,6 +136,7 @@ ENDPROC(shmobile_smp_sleep)
>         .long   shmobile_smp_arg - 1b
>
>         .bss
> +       .align  2
>         .globl  shmobile_smp_mpidr
>  shmobile_smp_mpidr:
>         .space  NR_CPUS * 4
> --
> 2.43.0
>
>

