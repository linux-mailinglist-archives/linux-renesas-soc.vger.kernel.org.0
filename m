Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81B1E26BFEB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Sep 2020 10:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbgIPI4H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Sep 2020 04:56:07 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:43759 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbgIPI4H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 04:56:07 -0400
Received: by mail-ot1-f67.google.com with SMTP id n61so5944921ota.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2020 01:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5FdrzUDXCRYPUsvoelE/VW7MtqLFiUfqv8aPSNHnFKY=;
        b=uUx94qac0FQD13qPxrlvKE6fz6lqHVxdChQH9mxp2sEpkBauNfyniYl9GxYg/SsNx3
         iSqYPJnyiKS084xuOMHcDh7i2nowwqe2zJyArkjS41VWgkS9H3mKTBZOWfZ+MMtAf/h7
         iDMRoIQM1YjjuVDVhYRDMTAzq0MdF0MqgGptItlO25P/wtDUWYm7Ax82DZ01/de57FBi
         0g2vk5GkjBCnEphO1tVq9+9Zhm1T2ob81QtcL0F4u2eHr57eBkM+SAbjUgwiqp5M4oXV
         zrMha+GHpnj2mOh7ZKrwPbuQ51z2p1JT8Jgkzi55UOWQ2Vl8kJMJHvo0ArdrtUBcZSmd
         NTXg==
X-Gm-Message-State: AOAM531vCHD9ktkMIXTJS2uZ4bvBahpT+nYNPmky5PttXycW7X9ahmue
        cd2OmMbiKUbw+1UeSYVElSsi6AaWXYys2czK3NFizVplKEM=
X-Google-Smtp-Source: ABdhPJxZhJZX2Arrzfrg3SzutQ5oVLCzB6N6lI719RUhxAAUwjG843quZYt6qGqvPzJi9D1cYPv5zi617nj3equYTuc=
X-Received: by 2002:a05:6830:1008:: with SMTP id a8mr14588810otp.107.1600246566133;
 Wed, 16 Sep 2020 01:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200902153606.13652-1-geert+renesas@glider.be>
 <CACRpkdZ44wuYp1aWZ-mYkJJAZUXfAZ9XVYf0rDKT8GH_JE8ezQ@mail.gmail.com>
 <CAMuHMdXBpLSdRiVkfpO-F7HpJLDqFW1LKfZnCS8nzH_ncq8ZQA@mail.gmail.com> <CACRpkdaUgatCxQvZdPbc+HvxCVF2=O71T5XjrW=0jsTR7j+_ZQ@mail.gmail.com>
In-Reply-To: <CACRpkdaUgatCxQvZdPbc+HvxCVF2=O71T5XjrW=0jsTR7j+_ZQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Sep 2020 10:55:54 +0200
Message-ID: <CAMuHMdU75LGWFxNQaRCc3Ltr+s5JiO4Nep3R3_tNae0NseCAcw@mail.gmail.com>
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
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Linus,

On Wed, Sep 16, 2020 at 10:24 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Sep 8, 2020 at 8:55 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > I agree there are plenty of opportunities to improve of head.S.
> > Unfortunately there are also plenty of opportunities to break someone's
> > boot process ;-(
> >
> > Nicolas' patch to reshuffle the registers looks like a good first step...
>
> I must have missed this patch! I'll try to find it.

https://lore.kernel.org/linux-arm-kernel/nycvar.YSQ.7.78.906.2009041431440.4095746@knanqh.ubzr/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
