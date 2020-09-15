Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D96126A8B2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Sep 2020 17:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727432AbgIOPXY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Sep 2020 11:23:24 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:36101 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727354AbgIOPWa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 11:22:30 -0400
Received: by mail-oi1-f195.google.com with SMTP id x19so4308177oix.3;
        Tue, 15 Sep 2020 08:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ROuA6JYgT1yUVQHR4W9t/eQ9FLznlFdEs+Zytwjrg1U=;
        b=ajvfXp2a4TDwgiph0q/bqjab0HTFgU1WR5jSlZ2uPpBjytXJc797dn1L59SmIIM+a2
         G8VTcOC9Dt4i4NVUfgHoMHMNK+/qYBbaWbZvRwjWqRmE7mjLVqUNrDTUjuNaV93W1BJ2
         QJQFL7zzpBeYZ4yj7EXu1rCBmMs/l6Sw3Y1mvMq4rEVJS7jE8Hk+O3MvegUY+oGUYQFy
         oyk4RFSsN2R0pWrJSDxmpqlNnrvHCEJy+4z8i6OUQfvDAHtkQ5PuYTvacAqBp5HJ2JGp
         iLX5iwgIyJb8nDCAVPTcPSAauQZUt54IpuiFrjfFm+Cm4FUJwLWO3yA9GUtSWatio8nn
         c4xw==
X-Gm-Message-State: AOAM5308W9Yk3ymW0RnrcEwKHtI6z/viKtoeQG9Cr4M3+sSLKCMjOxMf
        8LYzzpPLhSKlml3TkpIUH3Ozv6Bo9Dxpkjj7cF4=
X-Google-Smtp-Source: ABdhPJy2I/56jMzl7zYEoOktmV7EiZA/gk3FplPKxql7nRs7S0omJfV+RLO2GKlV7CWyeVHcLw03Lk6Z4MuNEP0rNnc=
X-Received: by 2002:aca:3bc3:: with SMTP id i186mr3593580oia.148.1600183349438;
 Tue, 15 Sep 2020 08:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200915140110.11268-1-yuehaibing@huawei.com>
In-Reply-To: <20200915140110.11268-1-yuehaibing@huawei.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Sep 2020 17:22:17 +0200
Message-ID: <CAMuHMdXnuHnML3Gop4o3k_K9nYBRsc7w1cUgGcMrAso5oOKc5Q@mail.gmail.com>
Subject: Re: [PATCH -next] soc: renesas: r8a779a0-sysc: Make
 r8a779a0_sysc_info static
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Yue,

On Tue, Sep 15, 2020 at 4:58 PM YueHaibing <yuehaibing@huawei.com> wrote:
> Fix sparse warning:
>
> drivers/soc/renesas/r8a779a0-sysc.c:99:33: warning: symbol 'r8a779a0_sysc_info' was not declared. Should it be static?
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

As commit 7f29315cf4211316 ("soc: renesas: r8a779a0-sysc: Add r8a779a0
support") hasn't been merged into arm-soc yet, is it OK for you if I
just fold your fix into the original commit?

Thanks again!

> --- a/drivers/soc/renesas/r8a779a0-sysc.c
> +++ b/drivers/soc/renesas/r8a779a0-sysc.c
> @@ -96,7 +96,7 @@ static struct r8a779a0_sysc_area r8a779a0_areas[] __initdata = {
>         { "a1dsp1",     R8A779A0_PD_A1DSP1, R8A779A0_PD_A2CN1 },
>  };
>
> -const struct r8a779a0_sysc_info r8a779a0_sysc_info __initconst = {
> +static const struct r8a779a0_sysc_info r8a779a0_sysc_info __initconst = {
>         .areas = r8a779a0_areas,
>         .num_areas = ARRAY_SIZE(r8a779a0_areas),
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
