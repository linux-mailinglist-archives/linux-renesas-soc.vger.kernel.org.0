Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AED301706BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2020 18:56:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgBZR4S (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Feb 2020 12:56:18 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35057 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbgBZR4S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Feb 2020 12:56:18 -0500
Received: by mail-oi1-f193.google.com with SMTP id b18so417743oie.2;
        Wed, 26 Feb 2020 09:56:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o2vY9IYp03giWqGFoGJ0CHo6HYbOh4Eilf+MUDG2LtI=;
        b=QUFk7Q/S/0rXSvba0Lxly20bNA8HamhGyY7fWE6GGZ5NiWkG0pk+ZDCNzr3JKUGizh
         NU3lE1CoEXN3155NgLeqsK024VzNAD9QCR2PCzIH34i3qDHizO0ZD0ynQv1mdN1kzM/y
         92hzvkKQ/Y6xdmhI1/6RZd91z0X7NAq5Bsg4uC+dZYB8NLefOjIJ9ZS+A0Q9s/x8o1dP
         m1Glo5NlgNjXa3UWknXZs3LM2CPx9PWUnN9mJq3//ta8NVVLoasbgUnFQ6EjyimWW7sn
         3Wxo8qzUtg0P8aoTmJB+SGukWqMNUhOAeX11KpwUu3BF3F4CWVcDmzq+FB1bqm6e3UNX
         eGmA==
X-Gm-Message-State: APjAAAXdDdRWOLRfRU1WjDsl200/lbUxpAzgJ+zYQHADplCR2DJudoMY
        IdY0f21Wflf+30mxDM7UvK1jm16wROdYFb92mJrWyQ==
X-Google-Smtp-Source: APXvYqxtyz/hmND7MN3FtCJyPuXLik9L68653TraA5yNPFKW2DOvYLDAW68OGWHaUnODifdT18/wvc/7WG69dRcEqYk=
X-Received: by 2002:aca:48cd:: with SMTP id v196mr166058oia.102.1582739777300;
 Wed, 26 Feb 2020 09:56:17 -0800 (PST)
MIME-Version: 1.0
References: <CGME20200225144815eucas1p1229ceb0d017b46cbbe2409639a7c1f83@eucas1p1.samsung.com>
 <20200225144749.19815-1-geert+renesas@glider.be> <e249c123-8d00-4aa3-34b8-f82d52428966@samsung.com>
 <20200226174905.GE25745@shell.armlinux.org.uk>
In-Reply-To: <20200226174905.GE25745@shell.armlinux.org.uk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 26 Feb 2020 18:56:06 +0100
Message-ID: <CAMuHMdW1ojYyWXZpzgiy8PrZnR2PQ9n3SEDrQ7hFFUg0j-jegg@mail.gmail.com>
Subject: Re: [PATCH] ARM: boot: Fix ATAGs with appended DTB
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Russell,

On Wed, Feb 26, 2020 at 6:49 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
> On Wed, Feb 26, 2020 at 07:35:14AM +0100, Marek Szyprowski wrote:
> > On 25.02.2020 15:47, Geert Uytterhoeven wrote:
> > > At early boot, register r8 may contain an ATAGs or DTB pointer.
> > > When an appended DTB is found, its address is stored in r8, for
> > > extraction of the RAM base address later.
> > >
> > > However, if r8 contained an ATAGs pointer before, that pointer will be
> > > lost, and the provided ATAGs is no longer folded into the provided DTB.
> > >
> > > Fix this by leaving r8 untouched.
> > >
> > > Fixes: 137e522593918be2 ("ARM: 8960/1: boot: Obtain start of physical memory from DTB")
> > > Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> The original commit hasn't been submitted, so it can be fixed before it
> hits mainline if you want.  Let me know what you want to do.  Thanks.

Fixing the original is fine for me, of course.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
