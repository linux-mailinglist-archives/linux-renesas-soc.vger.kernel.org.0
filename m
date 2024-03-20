Return-Path: <linux-renesas-soc+bounces-3960-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACC488187B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Mar 2024 21:18:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E6911C22945
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Mar 2024 20:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E53C8592A;
	Wed, 20 Mar 2024 20:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VNlW0smn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E030C8564F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Mar 2024 20:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710965917; cv=none; b=MYfvb1oQoH8nfYSIKrhmeKUeO1lkRbLg9B3gufd8K1FRHh5OVpxNl0RT9qJ2MFGL7YC+7o/WVMQ1yQQp6qUDhbcTRpfNsfnyu6AeqFB2CFrKpSz+oQqu/Qruk3X7eTxqAOEQ1ZqGBfbBukuCQX2OvJ5g8F3iwVXJM0UQ+IEZvGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710965917; c=relaxed/simple;
	bh=P8Domv5WqTvgS1GmnEkQPzqgFNJc7dGQVd7liXEnfi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DnoSJY/01mY7Th1PhDaQYZX1CgP7iTk4ykdJTJlbZrzMYofgFTqrzsWzX9UAJiIzXDgnxJY/nVUQYO451idufCgj2rz2z3qaQJdDpu8C2pmP1O+6Fe7esmcT4koENvVVwGTeW2JR9SbxNpZuatCBvEfkvgRG7uHoYQBDmpDcdEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VNlW0smn; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-430e1e06e75so98601cf.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Mar 2024 13:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710965915; x=1711570715; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcBOsw97Cw3dCwC0IpeN5YUGl16Tlt2YUvn3jG+nAW8=;
        b=VNlW0smnGQK/f2a53vzC5XACTkHZEOXKJepTUC/FSffNflkkX6SA+vjHEFpq/Fm876
         AJHGS5fEY/ANEf+r1k+frfta/eXFF7csj1h+pybjNwjrZNZIx+s3Urn545GLblwvDEqu
         KQxSe9fXq/IaXutmdnaeF2YBL6+0CCDqRp1Nucd7ngPCiieOA7uXEKUXk4gVuB81ha58
         dg5+Gct/V6dQqufdUElCi+X76ujfdSrzXEjXBJ/cJwUfEjPo4Mp5mUVTDgrXmtO21p+r
         qRe1EDEmGIfYKe8McAlaB8vxfnPFAOxblPLEeWpzd3HxZaYls6VVXHciZxbetDJz3R1B
         3+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710965915; x=1711570715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZcBOsw97Cw3dCwC0IpeN5YUGl16Tlt2YUvn3jG+nAW8=;
        b=jBAICAGw8ZrqS26rDDPS6ZYpU/3QJAJ0MPKQxglKFT2Suilvd3syvlfFC3lJKV8j69
         hwRrvvbhEUIAE8SQdKtGfFQNAX3g12Z1Iqd5F9Lsb/Z+JP5XkvBo8klXYxKP2q9xpsf0
         BSSEbpW3NlcfUgofxI0vN473MOz42C5DkC4D9b786kDlwoQYjgtT/9nyJN+f7SlDaO5f
         C0acjWYlmPaMjWnl7lc9hYDYxfzMHZLLN1vJWPPUpNRZrke5UR7nOGc+wtfZcjGSxr52
         asnJ9MlJQiS76/qNmBdC/IBXIk7pS2f04iKgjjF/INnPyRlWU7Juc6YCp1FRyTCdESrp
         MkVA==
X-Forwarded-Encrypted: i=1; AJvYcCUPMZJmhP5O6Sbha20oRx4opst0XcvLPMehGNFRTTxroIdqrzt+N1dOKjT9coB/YIxHOsA78nOJbqU2HfjLfkvqG1lmLdYISgQb50/IoRs0W9w=
X-Gm-Message-State: AOJu0YxG1Q1HbrJ4ofWVJgeiF820uCdkfHw5VLLHU6hIgUNViTxIXbNv
	VljnAUs1thm/tAmK+nMBqSENGpLkwwH0Cqha+14oQqZQZo9QuMhvqaXHGZ9+1GdOikOzR2rHCfB
	B2Xz1o7jS2yLo6x/dbxkj03T2ha1JwY2ti5EoIj1/LmDWxgHUMdHm
X-Google-Smtp-Source: AGHT+IEEdkkrAwg9Hn12Fn2f8WRvxvqM4dUNa2hRJvQECS2Cceasc/eOQXEDSl8MHwRDyIE6jx27qFryR5Xcu6CHesg=
X-Received: by 2002:a05:622a:55:b0:431:608:ef03 with SMTP id
 y21-20020a05622a005500b004310608ef03mr61735qtw.0.1710965914619; Wed, 20 Mar
 2024 13:18:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bd027379713cbaafa21ffe9e848ebb7f475ca0e7.1710930542.git.geert+renesas@glider.be>
In-Reply-To: <bd027379713cbaafa21ffe9e848ebb7f475ca0e7.1710930542.git.geert+renesas@glider.be>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 20 Mar 2024 13:17:58 -0700
Message-ID: <CAGETcx_KNvY4NyQ+HSfkgVJS625R-LVNh_tsoZMM0or78ryEWg@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/renesas-ostm: Avoid reprobe after
 successful early probe
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	=?UTF-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>, 
	Paul Cercueil <paul@crapouillou.net>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2024 at 3:30=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The Renesas OS Timer (OSTM) driver contains two probe points, of which
> only one should complete:
>   1. Early probe, using TIMER_OF_DECLARE(), to provide the sole
>      clocksource on (arm32) RZ/A1 and RZ/A2 SoCs,
>   2. Normal probe, using a platform driver, to provide additional timers
>      on (arm64 + riscv) RZ/G2L and similar SoCs.
>
> The latter is needed because using OSTM on RZ/G2L requires manipulation
> of its reset signal, which is not yet available at the time of early
> probe, causing early probe to fail with -EPROBE_DEFER.  It is only
> enabled when building a kernel with support for the RZ/G2L family, so it
> does not impact RZ/A1 and RZ/A2.  Hence only one probe method can
> complete on all affected systems.
>
> As relying on the order of initialization of subsystems inside the
> kernel is fragile, set the DT node's OF_POPULATED flag after a succesful
> early probe.  This makes sure the platform driver's probe is never
> called after a successful early probe.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Tested on RZ/A2 (after force-enabling the platform driver probe).
> Regression-tested on RZ/Five (member of the RZ/G2L family).
>
> In between commit 4f41fe386a94639c ("clocksource/drivers/timer-probe:
> Avoid creating dead devices") and its revert 4479730e9263befb (both in
> v5.7), the clocksource core took care of this.  Other subsystems[1]
> still handle this, either minimally (by just setting OF_POPULATED), or
> fully (by also clearing OF_POPULATED again in case of probe failure).
>
> Note that despite the revert in the clocksource core, several
> clocksource drivers[2] still clear the OF_POPULATED flag manually, to
> force probing the same device using both TIMER_OF_DECLARE() and standard
> platform device probing (the latter may be done in a different driver).
>
> [1] See of_clk_init(), of_gpiochip_scan_gpios(), of_irq_init().
> [2] drivers/clocksource/ingenic-sysost.c
>     drivers/clocksource/ingenic-timer.c
>     drivers/clocksource/timer-versatile.c
> ---
>  drivers/clocksource/renesas-ostm.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/ren=
esas-ostm.c
> index 8da972dc171365bc..37db7e23a4d29135 100644
> --- a/drivers/clocksource/renesas-ostm.c
> +++ b/drivers/clocksource/renesas-ostm.c
> @@ -210,6 +210,7 @@ static int __init ostm_init(struct device_node *np)
>                 pr_info("%pOF: used for clock events\n", np);
>         }
>
> +       of_node_set_flag(np, OF_POPULATED);
>         return 0;

Couldn't you also solve this by using the more specific compatible
strings for the driver and TIMER_OF_DECLARE()?

-Saravana

>
>  err_cleanup:
> --
> 2.34.1
>

