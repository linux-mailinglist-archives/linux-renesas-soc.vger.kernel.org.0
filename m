Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EDF139B9B1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jun 2021 15:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbhFDNUU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Jun 2021 09:20:20 -0400
Received: from mail-ua1-f51.google.com ([209.85.222.51]:44667 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbhFDNUU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jun 2021 09:20:20 -0400
Received: by mail-ua1-f51.google.com with SMTP id 68so5226121uao.11;
        Fri, 04 Jun 2021 06:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=vdiWA2h0w+CYdNSc212dy6mOCXZdgVBoEJYP7gHHI0g=;
        b=V75G2KPuIkWKtRjWJcrXdWvJUBWvUmMicHGqCmPusRNRutDaHRznpceN1GmA8tYdAg
         j1W7SgGmp5fpUgtrT3DBr6DgMj3kF/k2Ej62i31qUHGpe/vkz9mc6Y9mPRF0cRV/0mac
         BkWaF60sZPvKIqMbfa3q7tWUfx9Mn8WGAXmzUNuinjpNa9HTHaYwLl/INxslgo3uKL+Y
         QjAvV0pzpVDyYnQgTjZ8b1in8w+Hydi7dSPpdvksCRtrhcYN8bgcwnT1jAlL+w9OlKA8
         NScC5sK2dmj+Fc95IsRy2TJKJQtxDqMDaFx8gWCYamIPO81vlPPwLiHHG1ZmONA5Tus1
         Aa8g==
X-Gm-Message-State: AOAM53129KXxgqkh1YnON/Zwbq5y4FA3bYqEjVfhQNY0YB9f3m80o6fi
        MinHgx9mA5eQjECVmey1ZdGPFdm65QM6jHLTQAg=
X-Google-Smtp-Source: ABdhPJw6/AcSN0rM3j3E/hJ9ycDK2/E1VXGgvr9TYFVb2r07zaIeD3ixGhrlxwdt4mN+Bcha1wR4fGVcSdPOTx3ehkU=
X-Received: by 2002:ab0:63d9:: with SMTP id i25mr797462uap.106.1622812713414;
 Fri, 04 Jun 2021 06:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <ee8af5d631f5331139ffea714539030d97352e93.1622811525.git.geert+renesas@glider.be>
 <YLonvKsHCjtE9W9x@kunai>
In-Reply-To: <YLonvKsHCjtE9W9x@kunai>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 4 Jun 2021 15:18:22 +0200
Message-ID: <CAMuHMdVAbhjYHaK0GbDHzVVrYA8LRyU83NoQK=QHgd5g40YS9w@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: Fix HS400 on R-Car M3-W+
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Fri, Jun 4, 2021 at 3:16 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Fri, Jun 04, 2021 at 02:59:43PM +0200, Geert Uytterhoeven wrote:
> > R-Car M3-W ES3.0 is marketed as R-Car M3-W+ (R8A77961), and has its own
> > compatible value "renesas,r8a77961".
> >
> > Hence using soc_device_match() with soc_id = "r8a7796" and revision =
> > "ES3.*" does not actually match running on an R-Car M3-W+ SoC.
> >
> > Fix this by matching with soc_id = "r8a77961" instead.
> >
> > Fixes: a38c078fea0b1393 ("mmc: renesas_sdhi: Avoid bad TAP in HS400")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Great, thanks for this fix!
>
> > Boot-tested on Salvator-XS with R-Car M3-W+ ES3.0.
> > No difference seen in eMMC/SHHC detection:
>
> You'd need some stress testing plus debug output of the TAPs chosen to
> actually see a difference. However, the patch is obviously correct.
> Testing if soc_id actually matches now is good enough.

FTR, I did check that part.

> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
