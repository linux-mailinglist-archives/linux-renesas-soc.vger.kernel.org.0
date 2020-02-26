Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E38401709FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2020 21:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727387AbgBZUsr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Feb 2020 15:48:47 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41154 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727379AbgBZUsq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Feb 2020 15:48:46 -0500
Received: by mail-ot1-f65.google.com with SMTP id v19so761122ote.8;
        Wed, 26 Feb 2020 12:48:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vg9cOMro+i98waebif4aU1cclILRMqAhraoxkLqHft0=;
        b=mu4po8KOeN8+sK3sDalexKmtwZVBXFyHrIlZRx5cQ1QeemIyxggGCTKLNc3NRXqSCQ
         6jAKeAUxqiJXmEeZwu8LEGwTtcl8dlUSCM8Juj9jI2N8NMDbAyLKxyhHK0/J4KLLPw5e
         8XsjNhQMcgeKJRHw2NQ5A6xLuNGz9Fo2z4Ori5Tch8SO2TcqM/INU6FKQapuZgRnC2KP
         cd80XDwvDko2inbWRxVXFArHCZGiKVpjsnPxmo2LjyBL2B8FuDPkEtqTLuTf6HZHJ+RI
         f1zGCW8T5VXEqsWOeCXCtEMgOYs5xwLui3Kb0VAtbriQc81rxEPkWNGJL/TMoBwxds6+
         3Efw==
X-Gm-Message-State: APjAAAWUMH/SjQ3FuJ9Tu5lJNgLjM+GTea/cjLcsLgP0qTpNVsRY3Hrp
        DRJdH9RSb7k9lXbFP6OrrU5leUZHr3xATgb9KJk=
X-Google-Smtp-Source: APXvYqwzOCFDwkSx8fqJ8n9QNgT5p20qDoRYME/GR3OFM779WW+FCNzSMRtSIS4BmNIfF2IP3lG/MO8bygAra/IeEMo=
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr531250ots.250.1582750125806;
 Wed, 26 Feb 2020 12:48:45 -0800 (PST)
MIME-Version: 1.0
References: <CGME20200225144815eucas1p1229ceb0d017b46cbbe2409639a7c1f83@eucas1p1.samsung.com>
 <20200225144749.19815-1-geert+renesas@glider.be> <e249c123-8d00-4aa3-34b8-f82d52428966@samsung.com>
 <20200226174905.GE25745@shell.armlinux.org.uk> <CAMuHMdW1ojYyWXZpzgiy8PrZnR2PQ9n3SEDrQ7hFFUg0j-jegg@mail.gmail.com>
 <20200226175723.GF25745@shell.armlinux.org.uk>
In-Reply-To: <20200226175723.GF25745@shell.armlinux.org.uk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 26 Feb 2020 21:48:34 +0100
Message-ID: <CAMuHMdV9VyS3kBnhFT-5ry_O-aRafq-8Yor0xxxnjGqNQiSgZw@mail.gmail.com>
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

On Wed, Feb 26, 2020 at 6:57 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
> On Wed, Feb 26, 2020 at 06:56:06PM +0100, Geert Uytterhoeven wrote:
> > On Wed, Feb 26, 2020 at 6:49 PM Russell King - ARM Linux admin
> > <linux@armlinux.org.uk> wrote:
> > > On Wed, Feb 26, 2020 at 07:35:14AM +0100, Marek Szyprowski wrote:
> > > > On 25.02.2020 15:47, Geert Uytterhoeven wrote:
> > > > > At early boot, register r8 may contain an ATAGs or DTB pointer.
> > > > > When an appended DTB is found, its address is stored in r8, for
> > > > > extraction of the RAM base address later.
> > > > >
> > > > > However, if r8 contained an ATAGs pointer before, that pointer will be
> > > > > lost, and the provided ATAGs is no longer folded into the provided DTB.
> > > > >
> > > > > Fix this by leaving r8 untouched.
> > > > >
> > > > > Fixes: 137e522593918be2 ("ARM: 8960/1: boot: Obtain start of physical memory from DTB")
> > > > > Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > The original commit hasn't been submitted, so it can be fixed before it
> > > hits mainline if you want.  Let me know what you want to do.  Thanks.
> >
> > Fixing the original is fine for me, of course.
> > Thanks!
>
> Please submit a replacement for 8960/1, thanks.

Done.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
