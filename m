Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8CFAC4A6E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2019 11:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbfJBJUU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Oct 2019 05:20:20 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43292 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfJBJUT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 05:20:19 -0400
Received: by mail-oi1-f194.google.com with SMTP id t84so17012399oih.10;
        Wed, 02 Oct 2019 02:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zO+tNlkfwYOYwgo9Rwy/x2Myvg50guhXleT3msC6d9I=;
        b=IWpZJPr3C2f1Ob3w9MOF5oiaEGyWakS1aZcnOyig8TghwV1ioTpZglQCwbqYQMW7xw
         knXMlCi82++YgV6dRsl+w4hqNmMXuFvFOV16HwcM8Jb/eWojZmWqvA3rwqJdCaPp2eeo
         y9sZWMVlsanJZFz7etcnpYG11Oy1IzQO0hrRRcWxtXnsY+RNBAHQuu1IXu4/ekYV9lqr
         23fLTgHABSQzhad/TJh7M5iMQo9flj8RXQNSQZqcL94tC8XZCRmDAc9GsCtx+TLh1dss
         v3P3LfMFXCCybPYDdVigclFDgtq0ExtZwW3wor86fpzJAOQw1ZtfoBc2/fXGjKOQlxos
         Js4Q==
X-Gm-Message-State: APjAAAVp3HqWr+syyjmM6YbYjeL90um5EvylmoURN3TX+sqPVtmT2kBk
        beWMTDPiNbnOoJOfr01v7ljqAiUj7FR0tTsVvBuP6Q==
X-Google-Smtp-Source: APXvYqzLiDbsCQkDX2XprTfHsY1pJfYhBfhQdyM9WeoyJWN0tUTxulbP9vQUMSnHEPokt+69FbDxDqa/Yo6IpNWQ39A=
X-Received: by 2002:aca:dad4:: with SMTP id r203mr2110251oig.102.1570008018885;
 Wed, 02 Oct 2019 02:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20191001180703.910-1-geert+renesas@glider.be> <bc48041c-df06-8108-9c45-3dfb1d527678@cogentembedded.com>
In-Reply-To: <bc48041c-df06-8108-9c45-3dfb1d527678@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 2 Oct 2019 11:20:07 +0200
Message-ID: <CAMuHMdW=zF=hf2wHEeUHDciYF7wU7j0XZYuiG=T0vpsvykLCSA@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: Do not use platform_get_irq() to count interrupts
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergei,

On Wed, Oct 2, 2019 at 11:11 AM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 01.10.2019 21:07, Geert Uytterhoeven wrote:
> > As platform_get_irq() now prints an error when the interrupt does not
> > exist, counting interrupts by looping until failure causes the printing
>
>    s/the//?

I believe "the printing" is correct.
Any native English speakers to comment?

> > of scary messages like:
> >
> >      renesas_sdhi_internal_dmac ee140000.sd: IRQ index 1 not found
> >
> > Fix this by using the platform_irq_count() helper to avoid touching
> > non-existent interrupts.
> >
> > Fixes: 7723f4c5ecdb8d83 ("driver core: platform: Add an error message to platform_get_irq*()")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/mmc/host/renesas_sdhi_core.c
> > +++ b/drivers/mmc/host/renesas_sdhi_core.c
> [...]
> > @@ -825,24 +825,26 @@ int renesas_sdhi_probe(struct platform_device *pdev,
> >               host->hs400_complete = renesas_sdhi_hs400_complete;
> >       }
> >
> > -     i = 0;
> > -     while (1) {
> > +     /* There must be at least one IRQ source */
> > +     num_irqs = platform_irq_count(pdev);
> > +     if (num_irqs < 1) {
> > +             ret = num_irqs;
> > +             goto eirq;
>
>     This will return 0 with failed probe if 'num_irqs' is 0, I don't think you
> want this...

Thanks, will fix.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
