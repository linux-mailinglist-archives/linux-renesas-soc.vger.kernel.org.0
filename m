Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB862CD91D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Dec 2020 15:30:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728159AbgLCOa3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Dec 2020 09:30:29 -0500
Received: from mail-oo1-f68.google.com ([209.85.161.68]:39101 "EHLO
        mail-oo1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727922AbgLCOa3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Dec 2020 09:30:29 -0500
Received: by mail-oo1-f68.google.com with SMTP id l10so546313oom.6;
        Thu, 03 Dec 2020 06:30:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qnScdmTa9jUhGlp19x28zc+ijbwexrDTUCyumi+GyL8=;
        b=CHc5AU2jAXgGI1aoBYI0g+4aZSHNxFFXL7avrpXlD7diOKR5XQIqXMlRKaXP41vTNs
         wV/D3biLXrYVswUY1n00M02naVmGO6r6+xpQzrEYngcd7iZsAfH/qeDMqhO8vhOqP9AN
         ENMHlgz1fI3zacFJPnXuR4ijwQFTdTKGoxKV+Ei+lXzehKkxi1etyi641EtVrAI7xOfH
         6CSypv58Rjstt+OXMGG16Qyg233NycmHfihBNprOXvQVXTpa1q1pOvkJ2WBT3lRrbT+o
         9UNFJtJT+1Vq6M7Xx2J7mcwMATcrvRiwbcCiiXtY9dygR9gJmZxW2GgX++1vbyGD83Oh
         HmLg==
X-Gm-Message-State: AOAM532Nc408AuJwKILxH6LeZpLDTIsKtA+wSjKUaYrT7tkphjWPUtds
        zdvuwQJPIOtKJrBE/CA4ppaSszAj51ZIDCdqrfk=
X-Google-Smtp-Source: ABdhPJxgsuYf1/RsJTmPbHm679dJlC38zcIxCRNs39CuPDekx5OtuPh2g9Ud54qa2R1YmAwODds+HvxZdB0JKkh82RA=
X-Received: by 2002:a4a:dc1:: with SMTP id 184mr2292726oob.40.1607005787874;
 Thu, 03 Dec 2020 06:29:47 -0800 (PST)
MIME-Version: 1.0
References: <20201203121916.2870975-1-geert+renesas@glider.be>
 <20201203121916.2870975-4-geert+renesas@glider.be> <20201203140450.GH1551@shell.armlinux.org.uk>
In-Reply-To: <20201203140450.GH1551@shell.armlinux.org.uk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Dec 2020 15:29:36 +0100
Message-ID: <CAMuHMdWuHz_ndk9atkv+9LKtqCpEWik+AfHPrvb+fXTVh4h3rA@mail.gmail.com>
Subject: Re: [PATCH v10 3/3] ARM: uncompress: Validate start of physical
 memory against passed DTB
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Nicolas Pitre <nico@fluxnic.net>, Ard Biesheuvel <ardb@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Russell,

On Thu, Dec 3, 2020 at 3:05 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
> On Thu, Dec 03, 2020 at 01:19:16PM +0100, Geert Uytterhoeven wrote:
> > diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
> > index d9cce7238a365081..1b6425df87e84e71 100644
> > --- a/arch/arm/boot/compressed/head.S
> > +++ b/arch/arm/boot/compressed/head.S
> > @@ -282,10 +282,36 @@ not_angel:
> >                * are already placing their zImage in (eg) the top 64MB
> >                * of this range.
> >                */
> > -             mov     r4, pc
> > -             and     r4, r4, #0xf8000000
> > +             mov     r0, pc
> > +             and     r0, r0, #0xf8000000
> > +#ifdef CONFIG_USE_OF
> > +             adr     r1, LC1
> > +#ifdef CONFIG_ARM_APPENDED_DTB
> > +             /*
> > +              * Look for an appended DTB.  If found, we cannot use it to
> > +              * validate the calculated start of physical memory, as its
> > +              * memory nodes may need to be augmented by ATAGS stored at
> > +              * an offset from the same start of physical memory.
> > +              */
> > +             ldr     r2, [r1, #4]    @ get &_edata
> > +             add     r2, r2, r1      @ relocate it
> > +             ldr     r2, [r2]        @ get DTB signature
> > +             ldr     r3, =OF_DT_MAGIC
> > +             cmp     r2, r3          @ do we have a DTB there?
> > +             beq     1f              @ if yes, skip validation
> > +#endif /* CONFIG_ARM_APPENDED_DTB */
> > +
> > +             /* Make sure we have some stack */
> > +             ldr     sp, [r1]        @ get stack location
> > +             add     sp, sp, r1      @ apply relocation
> > +
> > +             /* Validate calculated start against passed DTB */
> > +             mov     r1, r8
> > +             bl      fdt_check_mem_start
>
> I don't think this is going to work. You can only run C code when
> it has been linked for a specific address and is loaded at the
> correct address as it contains absolute addresses. We work around
> that in the decompressor by (ab)using the GOT table, and the code
> that fixes up the GOT table is run later, after you've called out
> to some C code here.
>
> Quite how this works for you without the GOT fixups having been
> done, I'm not sure.

It works in the same way as the existing atags_to_fdt() works:

     * [...] No GOT fixup has occurred
     * yet, but none of the code we're about to call uses any
     * global variable.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
