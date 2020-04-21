Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70B721B2C79
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2020 18:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbgDUQTq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Apr 2020 12:19:46 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36098 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgDUQTp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Apr 2020 12:19:45 -0400
Received: by mail-ot1-f65.google.com with SMTP id b13so11634326oti.3;
        Tue, 21 Apr 2020 09:19:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rMu3klCIHTko91xLqiY17Crj+p7Y4rNwVMkOgmrRdjc=;
        b=pxduWfmlrPL9eMlfnEDnTrONIXCUMy1+VSw0GgwEkPXusOpvbbCYXC67X5b3uUQi3C
         cT5NhaWkrefsBmj0HOxb6oNAXxNbA1TTpTDZxqViB2ZAlhkEvCee2xde4Of4VTYWdgzu
         Qb/lbpRl9esnCDhZwpyp7lipADg+prCahmvVFBx7lihWUrCnGCtmdkwKhGP+Hj0RFk9l
         RkWv/KsgbzX8M/ZY1sN0oaZ8/m7hugUmXfBoR9X/il2TnNvSpIwNaBw6bIPWpUca76lc
         juWA3B4p8PsCll1j0T6Tff6gAlINXBa8O++ZzRqGcjSR4OwMbLgxGFeBRzWtxgLAQIZq
         5slQ==
X-Gm-Message-State: AGi0PuZisTacgXLuf50cD2Hvm9vvVOWSfl0nadM2aqhWSK7UDRhtTWPJ
        j0b82HNL9z/A9NA2jpNeQSfaLLuHxELKh6N00QY=
X-Google-Smtp-Source: APiQypJsqzlVBwBP0EqDIPyCl00zSKE/zjVy6OIFCkatDQTt1ohKrYd6rQIJlptwqNv4riX8sdI+OYsGaKBUVHcWaYo=
X-Received: by 2002:a9d:76c7:: with SMTP id p7mr13880170otl.145.1587485983529;
 Tue, 21 Apr 2020 09:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200415153409.30112-1-geert+renesas@glider.be>
 <CAMj1kXHm=xA4gafwAaBn8=YcAsQCYDNmZ=4REsfvEUgZShm3Ww@mail.gmail.com> <20200421160137.GE25745@shell.armlinux.org.uk>
In-Reply-To: <20200421160137.GE25745@shell.armlinux.org.uk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 21 Apr 2020 18:19:31 +0200
Message-ID: <CAMuHMdWt_XkDk+t8tZJcx43kFEGj-POAqwYEu6uGLmg3iUFRxw@mail.gmail.com>
Subject: Re: [PATCH v5] ARM: boot: Obtain start of physical memory from DTB
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
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

On Tue, Apr 21, 2020 at 6:01 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
> On Tue, Apr 21, 2020 at 05:19:40PM +0200, Ard Biesheuvel wrote:
> > On Wed, 15 Apr 2020 at 17:34, Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > Currently, the start address of physical memory is obtained by masking
> > > the program counter with a fixed mask of 0xf8000000.  This mask value
> > > was chosen as a balance between the requirements of different platforms.
> > > However, this does require that the start address of physical memory is
> > > a multiple of 128 MiB, precluding booting Linux on platforms where this
> > > requirement is not fulfilled.
> > >
> > > Fix this limitation by obtaining the start address from the DTB instead,
> > > if available (either explicitly passed, or appended to the kernel).
> > > Fall back to the traditional method when needed.
> > >
> > > This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> > > on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> > > i.e. not at a multiple of 128 MiB.
> > >
> > > Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
> > > Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> > > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > Tested-by: Dmitry Osipenko <digetx@gmail.com>
> >
> > This is ready to go into the patch system, no?
> >
> > The sooner Russell picks it up, the sooner I can respin my patches
> > that go on top.
>
> This seems to be a particularly risky change (it's already been subject
> to various failures for people) so I do not intend to rush to pick it
> up.

Yeah, I'm fully aware head.S is fragile ;-)

> In any case, Masahiro Yamada has resubmitted a patch to sort out the
> libfdt builds that he's been trying to get merged for some time now,
> so I'm going to be giving that priority. Your change conflicts with
> this libfdt build change.

OK, will resubmit after his changes have landed (in your tree?).

> So, I think all in all, it needs to spend a bit longer being provenly
> tested before I merged it (and eventually fixed up for the libfdt
> change), and I don't think merging it so it appears in linux-next
> will help with that.

Please note that I also have a DTS patch that depends on this.
Hence if this patch doesn't make it into v5.8, the board support DTS
patch that depends on this will have to be postponed one more cycle,
too...

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
