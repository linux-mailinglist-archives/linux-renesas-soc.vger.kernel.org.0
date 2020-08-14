Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51EFB244B0E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Aug 2020 16:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728284AbgHNOG2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Aug 2020 10:06:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:53506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728219AbgHNOGP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Aug 2020 10:06:15 -0400
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1534222BEF
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2020 14:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597413975;
        bh=dslG9lAnq1w0dbslkszSchExW5P9tHNSwKHwP4Mxf9Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lMXQjq93P4LrSNvfxDLZPswDA0fpYBfx6VPlO8ScGHsjvzhK/RAdQfSS/leaQYWUY
         xD89EH+AtJrB9WpZ0aQR+oEGA/Qmd2WeW0Kes8r7uRshfTs6mW1zRnWEHG6Hm+r/kA
         EiXCm9YzHRnvoqRYPTh7nDWpjI5G+/QotzcWrOqc=
Received: by mail-oo1-f48.google.com with SMTP id u28so1919547ooe.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2020 07:06:15 -0700 (PDT)
X-Gm-Message-State: AOAM531DwS+BU3XBhB+EgHSd62zU/0TMfdi0fOEEJ08vG2jeTkAOpvHJ
        xL/jWKNbRxKm4rUmylIzlzFUvcEIwdlB0eAtYsw=
X-Google-Smtp-Source: ABdhPJyR/Zs3Ngi1209NXw3lIninpFG8tYBsvnPmxBDSKNmpf1q3M9WPhKAdNPjDNPym5Qdgd+/bHh6dJRbuYKbmsac=
X-Received: by 2002:a4a:da4c:: with SMTP id f12mr1790142oou.41.1597413974324;
 Fri, 14 Aug 2020 07:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200706150205.22053-1-geert+renesas@glider.be>
 <CACRpkdZD3gVLdcjaOL9ZCfZD+hrOUB0-q0NpoHu6m1Ujupw6Fw@mail.gmail.com>
 <CAK8P3a33AWe-fa8jJnRrme56Hgc-hLdNH4FK6FEPyZ0=O=vwtg@mail.gmail.com>
 <CACRpkdbxQrmNtByZ1cHSROyX7rwwaa2Mb=GQLpVcDi4FsZ06FQ@mail.gmail.com>
 <159546718359.3847286.13460778905630969897@swboyd.mtv.corp.google.com> <CACRpkdaN22OjWsG+d-hp_NEw==3VVAsWHkFsiG642KmbjD_6Mg@mail.gmail.com>
In-Reply-To: <CACRpkdaN22OjWsG+d-hp_NEw==3VVAsWHkFsiG642KmbjD_6Mg@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Fri, 14 Aug 2020 16:06:03 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFcS2+i7+Uf6mSkg+aO6j3FOaTJhN70vbWUDZe2CBm1Hg@mail.gmail.com>
Message-ID: <CAMj1kXFcS2+i7+Uf6mSkg+aO6j3FOaTJhN70vbWUDZe2CBm1Hg@mail.gmail.com>
Subject: Re: [PATCH/RFC v7] ARM: boot: Obtain start of physical memory from DTB
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
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
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 14 Aug 2020 at 16:03, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Jul 23, 2020 at 3:19 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> > > > textofs-$(CONFIG_ARCH_IPQ40XX) := 0x00208000
> > > > textofs-$(CONFIG_ARCH_MSM8X60) := 0x00208000
> > > > textofs-$(CONFIG_ARCH_MSM8960) := 0x00208000
> > >
> > > But what on earth is this? I just deleted this and the platform
> > > boots just as well.
> >
> > We need to shift the kernel text to start 2MB beyond the start of memory
> > because there is the shared memory region used to communicate with other
> > processors in the SoC there. It took a while for us to convince other OS
> > folks in the company to put shared memory somewhere else besides the
> > start of RAM, but eventually we won that battle.
> >
> > Does your booted kernel have its text section at the start of RAM or is
> > it offset by 2MB without this change? Check out /proc/iomem to see where
> > the kernel text is in relation to the start of RAM.
>
> The memory on this machine starts at 0x40200000 since the effect
> of the current code is to take pc &= 0xf8000000 and that results in
> 0x40000000 and then this adds textofs 0x00208000 to that
> resulting in 0x40208000 for the kernel physical RAM. Which
> is what we want to achieve since the RAM starts at
> 0x40200000.
>
> But TEXT_OFFSET is also used inside the kernel to offset the
> virtual memory. This means that when we set up the virtual
> memory split, the kernel virtual memory is also bumped by
> these 2 MB so the virtual memory starts at 0xC0208000
> instead of 0xC0008000 as is normal.
>
> It looks weird to me but maybe someone can explain how
> logical that is?
>

The ARM mm code assumes that the relative alignment between PA and VA
is 16 MB, so if we skip 2 MB in the physical space, we must do the
same in the virtual space.
