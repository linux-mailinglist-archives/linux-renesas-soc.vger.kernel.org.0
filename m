Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACB181D98AD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2020 15:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728633AbgESN5N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 May 2020 09:57:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:45782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727904AbgESN5N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 May 2020 09:57:13 -0400
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 261DB20842;
        Tue, 19 May 2020 13:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589896632;
        bh=1ge7GtnAk4d1zwaRewUucQ51+d00fLsHnCTj6b5UyPo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=w9c30JTdPhumdFKVx2WLG4ahdfmskibm3/J+VpvUHwCHDwxhKwWf068pSXin5P5W5
         sq6YVsbx0z10ZWXz4kigPPjLTQzdth1AYxFcExRK24RFiAXIqkLlV8ovdAkMN5l1WA
         M8mvGtaWJchuBp/Eh7FlgjR1Uss23J7O2tUEAQH4=
Received: by mail-io1-f50.google.com with SMTP id s10so14589508iog.7;
        Tue, 19 May 2020 06:57:12 -0700 (PDT)
X-Gm-Message-State: AOAM533IzhrR/qovi3/2tkjc/kU/KL7rblDWZ3IPzNHFDlnkyQcQNQew
        A2sapHqwRNoFW8UKKVvDu0yUPj9M2bwo1X7bkNQ=
X-Google-Smtp-Source: ABdhPJxR1/bZ6OQaZesRjgU+B2k0BoP9B3nyHCz01LxPD8dIW+o5nveijsFfnE7y+oXqf41DyfMUKU6mdLde+phk4Ts=
X-Received: by 2002:a6b:5008:: with SMTP id e8mr19309744iob.161.1589896631339;
 Tue, 19 May 2020 06:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200429082134eucas1p2415c5269202529e6b019f2d70c1b5572@eucas1p2.samsung.com>
 <20200429082120.16259-1-geert+renesas@glider.be> <dleftjmu645mqn.fsf%l.stelmach@samsung.com>
 <CAMuHMdXxq6m6gebQbWvxDynDcZ7dLyZzKC_QroK63L8FGeac1Q@mail.gmail.com>
 <20200519094637.GZ1551@shell.armlinux.org.uk> <CAMuHMdU5DG06G4H=+PH+OONMT_9oE==KS=wP+bLgY9xVCez6Ww@mail.gmail.com>
In-Reply-To: <CAMuHMdU5DG06G4H=+PH+OONMT_9oE==KS=wP+bLgY9xVCez6Ww@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Tue, 19 May 2020 15:56:59 +0200
X-Gmail-Original-Message-ID: <CAMj1kXH_s4qjDfTO03PkGNaiwfjmfkrZ-FE8vTm74QSrgoVt0A@mail.gmail.com>
Message-ID: <CAMj1kXH_s4qjDfTO03PkGNaiwfjmfkrZ-FE8vTm74QSrgoVt0A@mail.gmail.com>
Subject: Re: [PATCH v6] ARM: boot: Obtain start of physical memory from DTB
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
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

On Tue, 19 May 2020 at 13:21, Geert Uytterhoeven <geert@linux-m68k.org> wro=
te:
>
> Hi Russell,
>
> CC devicetree
>
> On Tue, May 19, 2020 at 11:46 AM Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
> > On Tue, May 19, 2020 at 11:44:17AM +0200, Geert Uytterhoeven wrote:
> > > On Tue, May 19, 2020 at 10:54 AM Lukasz Stelmach <l.stelmach@samsung.=
com> wrote:
> > > > It was <2020-04-29 =C5=9Bro 10:21>, when Geert Uytterhoeven wrote:
> > > > > Currently, the start address of physical memory is obtained by ma=
sking
> > > > > the program counter with a fixed mask of 0xf8000000.  This mask v=
alue
> > > > > was chosen as a balance between the requirements of different pla=
tforms.
> > > > > However, this does require that the start address of physical mem=
ory is
> > > > > a multiple of 128 MiB, precluding booting Linux on platforms wher=
e this
> > > > > requirement is not fulfilled.
> > > > >
> > > > > Fix this limitation by obtaining the start address from the DTB i=
nstead,
> > > > > if available (either explicitly passed, or appended to the kernel=
).
> > > > > Fall back to the traditional method when needed.
> > > > >
> > > > > This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of=
 SDRAM
> > > > > on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 sp=
ace),
> > > > > i.e. not at a multiple of 128 MiB.
> > > > >
> > > > > Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
> > > > > Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> > > > > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > > > Tested-by: Dmitry Osipenko <digetx@gmail.com>
> > > > > ---
> > > >
> > > > [...]
> > > >
> > > > Apparently reading physical memory layout from DTB breaks crashdump
> > > > kernels. A crashdump kernel is loaded into a region of memory, that=
 is
> > > > reserved in the original (i.e. to be crashed) kernel. The reserved
> > > > region is large enough for the crashdump kernel to run completely i=
nside
> > > > it and don't modify anything outside it, just read and dump the rem=
ains
> > > > of the crashed kernel. Using the information from DTB makes the
> > > > decompressor place the kernel outside of the dedicated region.
> > > >
> > > > The log below shows that a zImage and DTB are loaded at 0x18eb8000 =
and
> > > > 0x193f6000 (physical). The kernel is expected to run at 0x18008000,=
 but
> > > > it is decompressed to 0x00008000 (see r4 reported before jumping fr=
om
> > > > within __enter_kernel). If I were to suggest something, there need =
to be
> > > > one more bit of information passed in the DTB telling the decompres=
sor
> > > > to use the old masking technique to determain kernel address. It wo=
uld
> > > > be set in the DTB loaded along with the crashdump kernel.
> > >
> > > Shouldn't the DTB passed to the crashkernel describe which region of
> > > memory is to be used instead?
> >
> > Definitely not.  The crashkernel needs to know where the RAM in the
> > machine is, so that it can create a coredump of the crashed kernel.
>
> So the DTB should describe both ;-)
>
> > > Describing "to use the old masking technique" sounds a bit hackish to=
 me.
> > > I guess it cannot just restrict the /memory node to the reserved regi=
on,
> > > as the crashkernel needs to be able to dump the remains of the crashe=
d
> > > kernel, which lie outside this region.
> >
> > Correct.
> >
> > > However, something under /chosen should work.
> >
> > Yet another sticky plaster...
>
> IMHO the old masking technique is the hacky solution covered by
> plasters.
>

I think debating which solution is the hacky one will not get us anywhere.

The simple reality is that the existing solution works fine for
existing platforms, and so any changes in the logic will have to be
opt-in in one way or the other.

Since U-boot supports EFI boot these days, one potential option is to
rely on that. I have some changes implementing this that go on top of
this patch, but they don't actually rely on it - it was just to
prevent lexical conflicts.

The only remaining options imo are a kernel command line option, or a
DT property that tells the decompressor to look at the memory nodes.
But using the DT memory nodes on all platforms like this patch does is
obviously just too risky.

On another note, I do think the usable-memory-region property should
be implemented for ARM as well - relying on this rounding to ensure
that the decompressor does the right thing is too fragile.
