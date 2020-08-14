Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8F4244B06
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Aug 2020 16:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726662AbgHNOD5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Aug 2020 10:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbgHNODz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Aug 2020 10:03:55 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B1AFC061384
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2020 07:03:55 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id v12so10034790ljc.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2020 07:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=93GgJeOPsEHlXCzZpU0GIvSvnE8x2U0hwUe2Csg/4vY=;
        b=JWFV+4ihWt7sA2GNrK9mFG7fZDVjvYHL2LuwlNtVIRsJcIlP5jSH0CaesGCTdrRjSq
         UkDJbs9pSspUJbqFebkJP8OTX0HvaG8F1qOq+MysdtOP/Gty4dPew7Kb3rKhw4Wtew24
         NnHhvmglhJ89xPKTEw1aw3F3pVZueyqlJduRS8n94zn2JhfHcqqsiCb7jiUR9AQjdbBT
         JfCthxvMtLmxJP0hl4D7KA9u8VEaTcWZwE3A2csLrFgsQpJTTEC91A9Tc0ZcIB2bhU1N
         vVsZgXyPp1oIwFN2iOiVeU9lNqHutfWUOpGxYELYVXe68YlTJnI+FH8HIaqUiB97PyuK
         lBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=93GgJeOPsEHlXCzZpU0GIvSvnE8x2U0hwUe2Csg/4vY=;
        b=AHsK2eyav2dXxPDCHiqv/8hZxoZWRRjgRhP7wYddavPGRukrrQUvdYkpDyJhFkdRuv
         i2lWgE/Tbhd5zu4fAkxpuUQuuHBmgPQdW3Cq9aAOoKuIchcJ/oMnL5of3D+it1pH/JRW
         RL1MSKchJqeJwTr9VNX7Oqq1lI3iMcs547fHC3ebp2bSL7Ll94yr1QrRA/zEmfEGRRQp
         c/OfCUP5dScyGpOeLwsqpv7MzBklKfrLLsGUPAgqyujDk7hJ4O4IGYcFOCByUZXEmBsM
         dXvOS4idbgm8R5glwT5jOl5MGRFDzmoz1hFoxjpn8zHRxLXVg9LV6AuwUD8rWHoWP9d6
         vAxg==
X-Gm-Message-State: AOAM531rIdRa+nScGoRMEVVt9W9Z6KdExHjrKQiJKGM0LdybXQXp4HUk
        LBZM2qyerx82bKZ32pI8lh3KldKxB8QBaxL+a6q1JA==
X-Google-Smtp-Source: ABdhPJy7CbwaLYwOUyPaLN7vIIiorxP2p4IsG1qwplDbAE9cX6Xaar7oBqEaxMEoHvTk0VkVJArd9jf+RSLh9We6OAc=
X-Received: by 2002:a2e:90e:: with SMTP id 14mr1436078ljj.293.1597413833107;
 Fri, 14 Aug 2020 07:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200706150205.22053-1-geert+renesas@glider.be>
 <CACRpkdZD3gVLdcjaOL9ZCfZD+hrOUB0-q0NpoHu6m1Ujupw6Fw@mail.gmail.com>
 <CAK8P3a33AWe-fa8jJnRrme56Hgc-hLdNH4FK6FEPyZ0=O=vwtg@mail.gmail.com>
 <CACRpkdbxQrmNtByZ1cHSROyX7rwwaa2Mb=GQLpVcDi4FsZ06FQ@mail.gmail.com> <159546718359.3847286.13460778905630969897@swboyd.mtv.corp.google.com>
In-Reply-To: <159546718359.3847286.13460778905630969897@swboyd.mtv.corp.google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 14 Aug 2020 16:03:41 +0200
Message-ID: <CACRpkdaN22OjWsG+d-hp_NEw==3VVAsWHkFsiG642KmbjD_6Mg@mail.gmail.com>
Subject: Re: [PATCH/RFC v7] ARM: boot: Obtain start of physical memory from DTB
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Laura Abbott <labbott@redhat.com>,
        Kumar Gala <kumar.gala@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Nicolas Pitre <nico@fluxnic.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Eric Miao <eric.miao@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jul 23, 2020 at 3:19 AM Stephen Boyd <sboyd@kernel.org> wrote:

> > > textofs-$(CONFIG_ARCH_IPQ40XX) := 0x00208000
> > > textofs-$(CONFIG_ARCH_MSM8X60) := 0x00208000
> > > textofs-$(CONFIG_ARCH_MSM8960) := 0x00208000
> >
> > But what on earth is this? I just deleted this and the platform
> > boots just as well.
>
> We need to shift the kernel text to start 2MB beyond the start of memory
> because there is the shared memory region used to communicate with other
> processors in the SoC there. It took a while for us to convince other OS
> folks in the company to put shared memory somewhere else besides the
> start of RAM, but eventually we won that battle.
>
> Does your booted kernel have its text section at the start of RAM or is
> it offset by 2MB without this change? Check out /proc/iomem to see where
> the kernel text is in relation to the start of RAM.

The memory on this machine starts at 0x40200000 since the effect
of the current code is to take pc &= 0xf8000000 and that results in
0x40000000 and then this adds textofs 0x00208000 to that
resulting in 0x40208000 for the kernel physical RAM. Which
is what we want to achieve since the RAM starts at
0x40200000.

But TEXT_OFFSET is also used inside the kernel to offset the
virtual memory. This means that when we set up the virtual
memory split, the kernel virtual memory is also bumped by
these 2 MB so the virtual memory starts at 0xC0208000
instead of 0xC0008000 as is normal.

It looks weird to me but maybe someone can explain how
logical that is?

Yours,
Linus Walleij
