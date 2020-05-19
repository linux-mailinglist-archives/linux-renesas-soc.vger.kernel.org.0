Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E64AB1D99C6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2020 16:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729022AbgESOcO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 May 2020 10:32:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:34444 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728994AbgESOcO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 May 2020 10:32:14 -0400
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F155420874;
        Tue, 19 May 2020 14:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589898733;
        bh=1XXHRqjtt+WSYWwOg1XwbutxmoWaeM/OCUneB2tBKtc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tG/WI7qQXvcO60JsLcmZL5mhQU5vPQ0IHLJS4jcjTvZENfGM+Yvq4lzkb9/1+kaB2
         boc74Yf1/+FDphKy4BZbh1UpmI2oYLclKJ0DLY3pUBKKMzVY8sF5M70UUe+gmRCTVZ
         kREZZxHkz8TNNNsJCb35V4HGVab/CIMbYgd8Pzn0=
Received: by mail-io1-f54.google.com with SMTP id f4so14698585iov.11;
        Tue, 19 May 2020 07:32:12 -0700 (PDT)
X-Gm-Message-State: AOAM530UPsdNbfLq8hh9rbIiWhxxhh8p/HI3H75idb7VX9uIJXi3716l
        SWN1+DI1YEm0CNdGjeTUhrDCJ531/QQVJNvfd3E=
X-Google-Smtp-Source: ABdhPJxjyA1i44V17SV1ppXFEe39BzP/hHzIXIE8WLdS8tIhuMM1cTHG9CMqQhTXIWplXBdei1EfUxsbrT+5qpVkWgc=
X-Received: by 2002:a5d:898a:: with SMTP id m10mr18219593iol.203.1589898732296;
 Tue, 19 May 2020 07:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200429082134eucas1p2415c5269202529e6b019f2d70c1b5572@eucas1p2.samsung.com>
 <20200429082120.16259-1-geert+renesas@glider.be> <dleftjmu645mqn.fsf%l.stelmach@samsung.com>
 <CAMuHMdXxq6m6gebQbWvxDynDcZ7dLyZzKC_QroK63L8FGeac1Q@mail.gmail.com>
 <20200519094637.GZ1551@shell.armlinux.org.uk> <CAMuHMdU5DG06G4H=+PH+OONMT_9oE==KS=wP+bLgY9xVCez6Ww@mail.gmail.com>
 <CAMj1kXH_s4qjDfTO03PkGNaiwfjmfkrZ-FE8vTm74QSrgoVt0A@mail.gmail.com> <20200519142854.GF1551@shell.armlinux.org.uk>
In-Reply-To: <20200519142854.GF1551@shell.armlinux.org.uk>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Tue, 19 May 2020 16:32:01 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEk3Tkj2HQOhxPP3m7gMX7nAViJ7ZBU7XB0wUy2ceNuWw@mail.gmail.com>
Message-ID: <CAMj1kXEk3Tkj2HQOhxPP3m7gMX7nAViJ7ZBU7XB0wUy2ceNuWw@mail.gmail.com>
Subject: Re: [PATCH v6] ARM: boot: Obtain start of physical memory from DTB
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Grant Likely <grant.likely@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 19 May 2020 at 16:29, Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> On Tue, May 19, 2020 at 03:56:59PM +0200, Ard Biesheuvel wrote:
> > On Tue, 19 May 2020 at 13:21, Geert Uytterhoeven <geert@linux-m68k.org>=
 wrote:
> > >
> > > Hi Russell,
> > >
> > > CC devicetree
> > >
> > > On Tue, May 19, 2020 at 11:46 AM Russell King - ARM Linux admin
> > > <linux@armlinux.org.uk> wrote:
> > > > On Tue, May 19, 2020 at 11:44:17AM +0200, Geert Uytterhoeven wrote:
> > > > > On Tue, May 19, 2020 at 10:54 AM Lukasz Stelmach <l.stelmach@sams=
ung.com> wrote:
> > > > > > It was <2020-04-29 =C5=9Bro 10:21>, when Geert Uytterhoeven wro=
te:
> > > > > > > Currently, the start address of physical memory is obtained b=
y masking
> > > > > > > the program counter with a fixed mask of 0xf8000000.  This ma=
sk value
> > > > > > > was chosen as a balance between the requirements of different=
 platforms.
> > > > > > > However, this does require that the start address of physical=
 memory is
> > > > > > > a multiple of 128 MiB, precluding booting Linux on platforms =
where this
> > > > > > > requirement is not fulfilled.
> > > > > > >
> > > > > > > Fix this limitation by obtaining the start address from the D=
TB instead,
> > > > > > > if available (either explicitly passed, or appended to the ke=
rnel).
> > > > > > > Fall back to the traditional method when needed.
> > > > > > >
> > > > > > > This allows to boot Linux on r7s9210/rza2mevb using the 64 Mi=
B of SDRAM
> > > > > > > on the RZA2MEVB sub board, which is located at 0x0C000000 (CS=
3 space),
> > > > > > > i.e. not at a multiple of 128 MiB.
> > > > > > >
> > > > > > > Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> > > > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > > Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
> > > > > > > Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> > > > > > > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > > > > > Tested-by: Dmitry Osipenko <digetx@gmail.com>
> > > > > > > ---
> > > > > >
> > > > > > [...]
> > > > > >
> > > > > > Apparently reading physical memory layout from DTB breaks crash=
dump
> > > > > > kernels. A crashdump kernel is loaded into a region of memory, =
that is
> > > > > > reserved in the original (i.e. to be crashed) kernel. The reser=
ved
> > > > > > region is large enough for the crashdump kernel to run complete=
ly inside
> > > > > > it and don't modify anything outside it, just read and dump the=
 remains
> > > > > > of the crashed kernel. Using the information from DTB makes the
> > > > > > decompressor place the kernel outside of the dedicated region.
> > > > > >
> > > > > > The log below shows that a zImage and DTB are loaded at 0x18eb8=
000 and
> > > > > > 0x193f6000 (physical). The kernel is expected to run at 0x18008=
000, but
> > > > > > it is decompressed to 0x00008000 (see r4 reported before jumpin=
g from
> > > > > > within __enter_kernel). If I were to suggest something, there n=
eed to be
> > > > > > one more bit of information passed in the DTB telling the decom=
pressor
> > > > > > to use the old masking technique to determain kernel address. I=
t would
> > > > > > be set in the DTB loaded along with the crashdump kernel.
> > > > >
> > > > > Shouldn't the DTB passed to the crashkernel describe which region=
 of
> > > > > memory is to be used instead?
> > > >
> > > > Definitely not.  The crashkernel needs to know where the RAM in the
> > > > machine is, so that it can create a coredump of the crashed kernel.
> > >
> > > So the DTB should describe both ;-)
> > >
> > > > > Describing "to use the old masking technique" sounds a bit hackis=
h to me.
> > > > > I guess it cannot just restrict the /memory node to the reserved =
region,
> > > > > as the crashkernel needs to be able to dump the remains of the cr=
ashed
> > > > > kernel, which lie outside this region.
> > > >
> > > > Correct.
> > > >
> > > > > However, something under /chosen should work.
> > > >
> > > > Yet another sticky plaster...
> > >
> > > IMHO the old masking technique is the hacky solution covered by
> > > plasters.
> > >
> >
> > I think debating which solution is the hacky one will not get us anywhe=
re.
> >
> > The simple reality is that the existing solution works fine for
> > existing platforms, and so any changes in the logic will have to be
> > opt-in in one way or the other.
> >
> > Since U-boot supports EFI boot these days, one potential option is to
> > rely on that. I have some changes implementing this that go on top of
> > this patch, but they don't actually rely on it - it was just to
> > prevent lexical conflicts.
> >
> > The only remaining options imo are a kernel command line option, or a
> > DT property that tells the decompressor to look at the memory nodes.
> > But using the DT memory nodes on all platforms like this patch does is
> > obviously just too risky.
> >
> > On another note, I do think the usable-memory-region property should
> > be implemented for ARM as well - relying on this rounding to ensure
> > that the decompressor does the right thing is too fragile.
>
> What is "too fragile" is trying to change this and expecting everything
> to continue working as it did before.
>

That is my point.

> How will switching to EFI help?  Won't the crashdump kernel detect EFI
> and try to get the memory map from EFI, whereby it runs into exactly
> the same issue that the DT approach does?
>

No. If you boot from kexec, then the EFI stub is completely
circumvented, and things work as before.

> The current crashkernel situation works precisely because of the 128M
> masking that is being done.
>

Indeed. That is precisely my point.
