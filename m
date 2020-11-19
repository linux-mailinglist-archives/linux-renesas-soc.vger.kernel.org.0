Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BFF62B992E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Nov 2020 18:22:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728147AbgKSRUZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Nov 2020 12:20:25 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:46923 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726474AbgKSRUZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Nov 2020 12:20:25 -0500
Received: by mail-oi1-f196.google.com with SMTP id q206so7100561oif.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2020 09:20:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sk4MoO+LBfDTKu6OgdJdAY5YUGXwENPvznRsktaXdo4=;
        b=jUkUervr6VUFJK/L1Z80pJQt+mhRZWJlcSC3IapY0TzWuU84Z8V15wMxwl2pKrC37Q
         yTzdO3zgqrnadoQ1dIgjPrUg6ExFWscbCWg8e+o2wIL4qyu5NHaYAqMrcWMu2qDk+tFM
         7WjOKMc8DyGnEo/9rjmqqUj7wVabl7LAgQYZ7dspROBc4/KczpcIvkZFZgOWuhc/Sh1z
         Ai/d5ljIOLNK3RrguQKXvQD49t/2mwlKZrrkZeyAR5eI6zYrhAy5dHr5LMzgixq8lckz
         SmPBqzJv5Lr7wJvepvsWcqo541KjjBTxKmD5urSIZ0R2JBusbkyVTIahA+9jCNa0CQ2a
         +sKQ==
X-Gm-Message-State: AOAM531tB622zpPGFnHl7zMhqNZ2MIIEVGGl5oIOswXmZPYFYVtZJT1b
        EesAwarI4QE9IhmBm8ao/30DTCUc4tdmiOrLSNMZ4jpjqPZXgA==
X-Google-Smtp-Source: ABdhPJzgZrXSuxmDdjWZrHUmxsm+jfFVAzUz5sBfRUlrwoFQZyrcDI5kwCuyl1wH1xbwx4NkdOaD2shf4anOir8QBnc=
X-Received: by 2002:aca:52c9:: with SMTP id g192mr3713049oib.54.1605806422678;
 Thu, 19 Nov 2020 09:20:22 -0800 (PST)
MIME-Version: 1.0
References: <20201119125318.4066097-1-geert+renesas@glider.be>
 <CAK8P3a0mHYgOYLBO1MHw1CUVgdnOQk4aRf5XTBj+jR-yEtzcoA@mail.gmail.com>
 <CAMuHMdXmHOo+6TgYOsAuSC7-iHEyBnLvqX=MCN3qYybUi5M-hw@mail.gmail.com> <CAK8P3a17rA4N7TyiwrTdS_=4AAyDXrAi7W8k45BPuTLL1xU4Gg@mail.gmail.com>
In-Reply-To: <CAK8P3a17rA4N7TyiwrTdS_=4AAyDXrAi7W8k45BPuTLL1xU4Gg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 19 Nov 2020 18:20:11 +0100
Message-ID: <CAMuHMdW=gi2hpMts5KdxhLSm4XUD1e4Q9ubjrDZbe85yGuT=Zw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsi: Stop using __raw_*() I/O accessors
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Arnd,

On Thu, Nov 19, 2020 at 5:22 PM Arnd Bergmann <arnd@kernel.org> wrote:
> On Thu, Nov 19, 2020 at 5:13 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, Nov 19, 2020 at 4:54 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > On Thu, Nov 19, 2020 at 1:53 PM Geert Uytterhoeven
> > > <geert+renesas@glider.be> wrote:
> > >
> > > I'm also not sure whether changing this breaks big-endian SuperH,
> > > which defines the accessors differently from Arm and most other
> > > architectures.
> >
> > On SH, this driver is only used on SH7724 systems.
> > Compiling an ecovec24_defconfig kernel with CONFIG_CPU_BIG_ENDIAN=y
> > shows that the same code (native 32-bit access) is generated for
> > big-endian as for little-endian, which means that it indeed must be
> > broken for one of them. But this is not changed by my patch.
>
> Not necessarily: I think superh is more like the old 'BE32' variant of Arm
> big-endian, in that on-chip registers are accessed in CPU-endian byte order,
> while access to external RAM is byte-swapped.

That's indeed quite likely: according to the SH7724 docs, the endianness
of "the system" is configured by an external pin at power-on reset time,
and cannot be changed dynamically.  Hence testing this would require a
big-endian boot loader, too.

> > > Maybe better just mark the driver as 'depends on SH || !CPU_BIG_ENDIAN'
> > > as it is clearly broken on big-endian Arm.
> >
> > "depends on !CPU_BIG_ENDIAN"?
>
> I think I'd just leave it as it is. Unless someone wants to try out this

OK.

> board in both big-endian and little-endian configurations and also
> listen to the audio output, it's impossible to know whether it is actually
> broken. sound/soc/sh/dma-sh7760.c does have a comment from 2007
> saying "// FIXME: little-endian only for now".

SH7760 does not use the FSI driver.
A few SH defconfig files have CONFIG_CPU_BIG_ENDIAN=y, but
the later SH4A parts all seem to be used in little-endian mode.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
