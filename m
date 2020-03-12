Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19C31183033
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2020 13:29:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbgCLM3X (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Mar 2020 08:29:23 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39417 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgCLM3X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Mar 2020 08:29:23 -0400
Received: by mail-ot1-f65.google.com with SMTP id a9so5960560otl.6;
        Thu, 12 Mar 2020 05:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zjFcVOAemnoKsr2cIZIjqhkKv+6KDzTh2mCpNYwVHFw=;
        b=mSKPMazigamgms/JZDxDRl9wOnOf8Kk/jZ3N+hK8E2zgzKinTzLzGJaUz4UdqqYWhp
         Vpdr2G9qNXK4oiM15kuqP5kXDN8ve7hhg1GvULquditB0spNtP+rD6d6pYp7uhPF6wbj
         IYPN9dAaPP1ROyyp4u6WxbB3DbHVhcvO9JoeYVRvNUb6vVxaaroimX+G+6quc/0m1ryT
         8OUsbA7FjsAeBJ/QYcTgIlve62W62wc0tp3LMfCq+4ASpxWrwqP69vgMYhLdnNr0ZEmm
         q485NQ16YxbIeIhXHW40vJVQ4397wAb2+i5mhRbyAGtesWkMIdjmmhaMfY0/drHkJct6
         VB+A==
X-Gm-Message-State: ANhLgQ3rPAd83SXfBLdX6PNX/oUNMqo9YAYWJloG97ynAcNGazz4fRyn
        dZE7gy8Ht2kkqp6h7RGbcENV7Xbwh4/n2zcxPGdhzCUb
X-Google-Smtp-Source: ADFU+vucH2ks+fpvX4BNhVKQ3S6LjZbVYW6W1MizjhNyTjKcraAwX6o5NYlfrTlM4Dx4g8mOMmj4P3VTBGu0rNdkPKs=
X-Received: by 2002:a4a:e211:: with SMTP id b17mr3815296oot.79.1584016162158;
 Thu, 12 Mar 2020 05:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200225144815eucas1p1229ceb0d017b46cbbe2409639a7c1f83@eucas1p1.samsung.com>
 <20200225144749.19815-1-geert+renesas@glider.be> <e249c123-8d00-4aa3-34b8-f82d52428966@samsung.com>
 <20200226174905.GE25745@shell.armlinux.org.uk> <CAMuHMdW1ojYyWXZpzgiy8PrZnR2PQ9n3SEDrQ7hFFUg0j-jegg@mail.gmail.com>
 <20200226175723.GF25745@shell.armlinux.org.uk> <CAMuHMdV9VyS3kBnhFT-5ry_O-aRafq-8Yor0xxxnjGqNQiSgZw@mail.gmail.com>
 <f30208dc-e74a-cae7-95e6-d99220d9735c@samsung.com>
In-Reply-To: <f30208dc-e74a-cae7-95e6-d99220d9735c@samsung.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 Mar 2020 13:29:11 +0100
Message-ID: <CAMuHMdV=A-ObmHCsSQgbGCm=QxZ==3vSpFg3OMp-o0Aq=N3w6Q@mail.gmail.com>
Subject: Re: [PATCH] ARM: boot: Fix ATAGs with appended DTB
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
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

Hi Marek,

On Thu, Mar 12, 2020 at 1:23 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> On 26.02.2020 21:48, Geert Uytterhoeven wrote:
> > On Wed, Feb 26, 2020 at 6:57 PM Russell King - ARM Linux admin
> > <linux@armlinux.org.uk> wrote:
> >> On Wed, Feb 26, 2020 at 06:56:06PM +0100, Geert Uytterhoeven wrote:
> >>> On Wed, Feb 26, 2020 at 6:49 PM Russell King - ARM Linux admin
> >>> <linux@armlinux.org.uk> wrote:
> >>>> On Wed, Feb 26, 2020 at 07:35:14AM +0100, Marek Szyprowski wrote:
> >>>>> On 25.02.2020 15:47, Geert Uytterhoeven wrote:
> >>>>>> At early boot, register r8 may contain an ATAGs or DTB pointer.
> >>>>>> When an appended DTB is found, its address is stored in r8, for
> >>>>>> extraction of the RAM base address later.
> >>>>>>
> >>>>>> However, if r8 contained an ATAGs pointer before, that pointer will be
> >>>>>> lost, and the provided ATAGs is no longer folded into the provided DTB.
> >>>>>>
> >>>>>> Fix this by leaving r8 untouched.
> >>>>>>
> >>>>>> Fixes: 137e522593918be2 ("ARM: 8960/1: boot: Obtain start of physical memory from DTB")
> >>>>>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >>>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>>> The original commit hasn't been submitted, so it can be fixed before it
> >>>> hits mainline if you want.  Let me know what you want to do.  Thanks.
> >>> Fixing the original is fine for me, of course.
> >>> Thanks!
> >> Please submit a replacement for 8960/1, thanks.
> > Done.
>
> Gentle ping. This fix is still not present in linux-next for over 2 weeks...

According to
https://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=8963
the fixed version was applied less than one hour ago.

It's now part of arm/for-next.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
