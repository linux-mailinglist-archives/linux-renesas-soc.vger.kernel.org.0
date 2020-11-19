Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 912912B92C2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Nov 2020 13:50:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727266AbgKSMrI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Nov 2020 07:47:08 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43344 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727256AbgKSMrH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Nov 2020 07:47:07 -0500
Received: by mail-oi1-f193.google.com with SMTP id t143so6136206oif.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2020 04:47:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0+1ykdbEFH8R3w0SxpTa8NsIek1Wl9jH4RMm/Wcugy4=;
        b=PBY7dgTvq6ZfsPWP2f3SSwSFbrrFdJ/hWXl+Na0dDtobrUZyOXQyQjvg15FHHp8zGh
         mY0NubU5XWBY2cNtVTj8Xlln8KjngNBbeCc5IXgd2EbFsyOOaiYagT5pEteP1PvQFAkJ
         xWRVH2V+9Rs1GsofAI/B4jniOeBafMVy0kQt3QVp3FHhLpCHh78WzpnPXgei1wpN19G8
         R39nuxZ2suITRVnNqutrnGivVGvRWMSCE4Bk+YSzxYjw+Ht8hnwZYUedVG2VheyLrf35
         GZeHPJf2hRGLRewc0DSRdWnyjV88qaN78lsrx5DIgMmodzz5HpXf98NQACThRaIzGO/K
         0F7Q==
X-Gm-Message-State: AOAM532rpVYHpGzY5qNBuet4Zht2euj8X8TesISG4Cc2GTgI1NpzIPxc
        A02DOKV5yNgzICs2A6N1RVSpK6+JdOK8sanJJ8c=
X-Google-Smtp-Source: ABdhPJw20zSOvdthSiLtX1ccxSMgImMba/xfuLWNWZJaOcJQmNflV0c3X84qJNLPXo1RrrmGmQLtFIssi/U5rCjdL9Q=
X-Received: by 2002:aca:c3c4:: with SMTP id t187mr2509888oif.148.1605790026883;
 Thu, 19 Nov 2020 04:47:06 -0800 (PST)
MIME-Version: 1.0
References: <20200902153606.13652-1-geert+renesas@glider.be>
 <CACRpkdZ44wuYp1aWZ-mYkJJAZUXfAZ9XVYf0rDKT8GH_JE8ezQ@mail.gmail.com>
 <CAMuHMdXBpLSdRiVkfpO-F7HpJLDqFW1LKfZnCS8nzH_ncq8ZQA@mail.gmail.com>
 <CACRpkdaUgatCxQvZdPbc+HvxCVF2=O71T5XjrW=0jsTR7j+_ZQ@mail.gmail.com> <CAMuHMdU75LGWFxNQaRCc3Ltr+s5JiO4Nep3R3_tNae0NseCAcw@mail.gmail.com>
In-Reply-To: <CAMuHMdU75LGWFxNQaRCc3Ltr+s5JiO4Nep3R3_tNae0NseCAcw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 19 Nov 2020 13:46:55 +0100
Message-ID: <CAMuHMdV5BWB_THy3bV5JrRcGTQk6MGUs+OkXrSzhO8ZDL29=3Q@mail.gmail.com>
Subject: Re: [PATCH v9] ARM: boot: Validate start of physical memory against DTB
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        Ard Biesheuvel <ardb@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Sep 16, 2020 at 10:55 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Wed, Sep 16, 2020 at 10:24 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Tue, Sep 8, 2020 at 8:55 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > I agree there are plenty of opportunities to improve of head.S.
> > > Unfortunately there are also plenty of opportunities to break someone's
> > > boot process ;-(
> > >
> > > Nicolas' patch to reshuffle the registers looks like a good first step...
> >
> > I must have missed this patch! I'll try to find it.
>
> https://lore.kernel.org/linux-arm-kernel/nycvar.YSQ.7.78.906.2009041431440.4095746@knanqh.ubzr/

FTR: that one is not for boot/compressed/head.S, but for the normal
head.S, so it doesn't help...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
