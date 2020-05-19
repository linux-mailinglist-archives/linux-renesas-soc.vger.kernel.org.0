Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E35C1D9529
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2020 13:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgESLVX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 May 2020 07:21:23 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33656 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbgESLVX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 May 2020 07:21:23 -0400
Received: by mail-ot1-f66.google.com with SMTP id v17so10811822ote.0;
        Tue, 19 May 2020 04:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=C6lb9JZ25g+Kaugzt8krb+iM4CDC/jdUqY0YVxzMNaw=;
        b=oHZg/6XzIpBDqk3doFlitvzXvATX+uBFkD837gQPTXspx1VereGWGpJJ7jIJC97LBr
         YYmBIbGtdOuOcjsdIbWuIJgmZm6OyUDvCcuyKu6RTvrASdMfAKjZ0RNmrobIDAA1TbT2
         54fBy3bDSQH6t2SFzMhJdDh9bVxwRxb0UhCAZvQmm948XAGyD3tTNbvxUcomgYBE+GDq
         Cte2gu2ym8KI37rMjepl/kv+tnx5uawQkYSRoLskgoknV+xFJKBY920TOANoZYfP2/Vy
         mh1/zZ/G8F0036UXnd9T3WwWmQr24bri/wV3GkegKXfEuUO9qXHqYQrDpWJKRTYbm+/m
         Derw==
X-Gm-Message-State: AOAM533ZpUPpyu0i7ctuiu2ljYUqAnO1517iNBy5KaITEqUkJeHhQAA5
        RQCJcC1whXfbwNohHm278XmB8xFjpNowh1XrYaU=
X-Google-Smtp-Source: ABdhPJzQvKCdDSoxUltKaj8LuBKKd6bmonffri7fJu3t4HqC7Gw+4iPEhSPjUsG1MLNa3/nqnoVs2YpZGvTGdKys2wU=
X-Received: by 2002:a9d:7e92:: with SMTP id m18mr15339151otp.145.1589887282035;
 Tue, 19 May 2020 04:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200429082134eucas1p2415c5269202529e6b019f2d70c1b5572@eucas1p2.samsung.com>
 <20200429082120.16259-1-geert+renesas@glider.be> <dleftjmu645mqn.fsf%l.stelmach@samsung.com>
 <CAMuHMdXxq6m6gebQbWvxDynDcZ7dLyZzKC_QroK63L8FGeac1Q@mail.gmail.com> <20200519094637.GZ1551@shell.armlinux.org.uk>
In-Reply-To: <20200519094637.GZ1551@shell.armlinux.org.uk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 May 2020 13:21:09 +0200
Message-ID: <CAMuHMdU5DG06G4H=+PH+OONMT_9oE==KS=wP+bLgY9xVCez6Ww@mail.gmail.com>
Subject: Re: [PATCH v6] ARM: boot: Obtain start of physical memory from DTB
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Lukasz Stelmach <l.stelmach@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
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
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Russell,

CC devicetree

On Tue, May 19, 2020 at 11:46 AM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
> On Tue, May 19, 2020 at 11:44:17AM +0200, Geert Uytterhoeven wrote:
> > On Tue, May 19, 2020 at 10:54 AM Lukasz Stelmach <l.stelmach@samsung.com> wrote:
> > > It was <2020-04-29 śro 10:21>, when Geert Uytterhoeven wrote:
> > > > Currently, the start address of physical memory is obtained by masking
> > > > the program counter with a fixed mask of 0xf8000000.  This mask value
> > > > was chosen as a balance between the requirements of different platforms.
> > > > However, this does require that the start address of physical memory is
> > > > a multiple of 128 MiB, precluding booting Linux on platforms where this
> > > > requirement is not fulfilled.
> > > >
> > > > Fix this limitation by obtaining the start address from the DTB instead,
> > > > if available (either explicitly passed, or appended to the kernel).
> > > > Fall back to the traditional method when needed.
> > > >
> > > > This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> > > > on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> > > > i.e. not at a multiple of 128 MiB.
> > > >
> > > > Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
> > > > Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> > > > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > > Tested-by: Dmitry Osipenko <digetx@gmail.com>
> > > > ---
> > >
> > > [...]
> > >
> > > Apparently reading physical memory layout from DTB breaks crashdump
> > > kernels. A crashdump kernel is loaded into a region of memory, that is
> > > reserved in the original (i.e. to be crashed) kernel. The reserved
> > > region is large enough for the crashdump kernel to run completely inside
> > > it and don't modify anything outside it, just read and dump the remains
> > > of the crashed kernel. Using the information from DTB makes the
> > > decompressor place the kernel outside of the dedicated region.
> > >
> > > The log below shows that a zImage and DTB are loaded at 0x18eb8000 and
> > > 0x193f6000 (physical). The kernel is expected to run at 0x18008000, but
> > > it is decompressed to 0x00008000 (see r4 reported before jumping from
> > > within __enter_kernel). If I were to suggest something, there need to be
> > > one more bit of information passed in the DTB telling the decompressor
> > > to use the old masking technique to determain kernel address. It would
> > > be set in the DTB loaded along with the crashdump kernel.
> >
> > Shouldn't the DTB passed to the crashkernel describe which region of
> > memory is to be used instead?
>
> Definitely not.  The crashkernel needs to know where the RAM in the
> machine is, so that it can create a coredump of the crashed kernel.

So the DTB should describe both ;-)

> > Describing "to use the old masking technique" sounds a bit hackish to me.
> > I guess it cannot just restrict the /memory node to the reserved region,
> > as the crashkernel needs to be able to dump the remains of the crashed
> > kernel, which lie outside this region.
>
> Correct.
>
> > However, something under /chosen should work.
>
> Yet another sticky plaster...

IMHO the old masking technique is the hacky solution covered by
plasters.

DT describes the hardware.  In general, where to put the kernel is a
software policy, and thus doesn't belong in DT, except perhaps under
/chosen.  But that would open another can of worms, as people usually
have no business in specifying where the kernel should be located.
In the crashkernel case, there is a clear separation between memory to
be used by the crashkernel, and memory to be solely inspected by the
crashkernel.

Devicetree Specification, Release v0.3, Section 3.4 "/memory node" says:

    "The client program may access memory not covered by any memory
     reservations (see section 5.3)"

(Section 5.3 "Memory Reservation Block" only talks about structures in
the FDT, not about DTS)

Hence according to the above, the crashkernel is rightfully allowed to
do whatever it wants with all memory under the /memory node.
However, there is also
Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt.
This suggests the crashkernel should be passed a DTB that contains a
/reserved-memory node, describing which memory cannot be used freely.
Then the decompressor needs to take this into account when deciding
where the put the kernel.

Yes, the above requires changing code. But at least it provides a
path forward, getting rid of the fragile old masking technique.

Thanks for your comments!


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
