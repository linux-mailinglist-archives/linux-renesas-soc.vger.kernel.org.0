Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 779B038CBFB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 May 2021 19:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbhEURXA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 May 2021 13:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbhEURW7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 May 2021 13:22:59 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AD3AC061574;
        Fri, 21 May 2021 10:21:35 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id g38so28413914ybi.12;
        Fri, 21 May 2021 10:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SSt6zYcmfrW8VRHKDZwqwYPhG1/8NCxmTwtrQFl+xI8=;
        b=IgEt9OlHc77C1gVVvtwwENks34nttH0X1zD1bzNVPa3LLp8NLPtLfes6clpPJ0Zs5g
         281PzVP/mhZZ9Bk/6zsO3VCe6mSmC0Y9qGbi6e1MXCal40++K7HKL/b1bZFZXFtcfmtx
         a80gvpDVA7FIrt4BJj6FHf/ycr1NRxo0kDzPlfLYTAZktLbNzuYzki/tGodor095+B4R
         yw1dtr7QvycgtL7O4gKVaEom4ouY4i0jzYgQ1zT5N8uLLl0LG6Ohb7Um8a0EJNQSfat3
         7OEP2AUanD3AeugImIX9421M4ywHxKAWXu162ebalr30yuvtwFKskPeznd1hcT9XtopQ
         cesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SSt6zYcmfrW8VRHKDZwqwYPhG1/8NCxmTwtrQFl+xI8=;
        b=FISmMutNAv/dTeVlUtYfK/tTvwg8SS+He89u/do546wKSwm5AWCuQNTdTeSyRrExNC
         uvuNQWL4XEIH8JgNn6CzNDDSIFjH3FWbhEE10xigjZjUmq398nRTCdwsSzx/WNqTuQoi
         nWPf8TiHQPXKtVHsZJrWPkWo1mFXnT5dorMtJEeVNj9+3VWp9nmLAiWkzEOMV6S12wy9
         QlRSsOglR8+hC34BwVjgKaBXfdtObSDcIgd9XXUB0iqBVF2rfyAssfX1N2AlY34zj3h4
         qzo/YVP1qC+s7+EfCKNjPGt+Hm7fXhnxCPtSKp+joRovHvQUr1aKMjiLQR/1TOgM+LXV
         8Mxg==
X-Gm-Message-State: AOAM532EhrFCpAy0z35GxJaE3x1DpMx2InZel/ooMZxTwnBgnFYizUai
        3rpZRvUi0kQ5LAzogEB1E3YqBN1X1Rg8DIZ7Ba0=
X-Google-Smtp-Source: ABdhPJwzhoGli6kwjHJBWYuxjCMjfCMslBCXvlDHF8usa+Cqez/ZjREqBiiGBy3lczIp8NrQQ+PYvZM7JcAvcZ4b/jg=
X-Received: by 2002:a25:50c2:: with SMTP id e185mr3417747ybb.222.1621617694555;
 Fri, 21 May 2021 10:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210514192218.13022-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVOTfV9XBo0t0CxGU1=Zo3VjFioDaDU1rdX8Hb6Pvz-Zw@mail.gmail.com>
In-Reply-To: <CAMuHMdVOTfV9XBo0t0CxGU1=Zo3VjFioDaDU1rdX8Hb6Pvz-Zw@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 21 May 2021 18:21:08 +0100
Message-ID: <CA+V-a8to86aG-1eB38OfaydJ7U0g4p1x8biRfBSnOa1S2g3bvA@mail.gmail.com>
Subject: Re: [PATCH 04/16] soc: renesas: Add ARCH_R9A07G044{L,LC} for the new
 RZ/G2{L,LC} SoC's
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the review.

On Fri, May 21, 2021 at 2:25 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, May 14, 2021 at 9:23 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add ARCH_R9A07G044{L,LC} as a configuration symbol for the new Renesas
> > RZ/G2{L,LC} SoC's.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/soc/renesas/Kconfig
> > +++ b/drivers/soc/renesas/Kconfig
> > @@ -279,6 +279,16 @@ config ARCH_R8A774B1
> >         help
> >           This enables support for the Renesas RZ/G2N SoC.
> >
> > +config ARCH_R9A07G044L
> > +       bool "ARM64 Platform support for RZ/G2L SoC"
>
> Please drop the "SoC", for consistency with other entries.
>
Oops will do that.

> > +       help
> > +         This enables support for the Renesas RZ/G2L SoC.
> > +
> > +config ARCH_R9A07G044LC
> > +       bool "ARM64 Platform support for RZ/G2LC SoC"
>
> Likewise.
>
will do.

> > +       help
> > +         This enables support for the Renesas RZ/G2LC SoC.
> > +
> >  endif # ARM64
>
> Given LSI DEVID is the same, do we need both, or can we do with a
> single ARCH_R9A07G044?
>
The reason behind adding separate configs was in case if we wanted to
just build an image for RZ/G2L and not RZ/G2LC this would increase
image size and also build unneeded dtb's.

Cheers,
Prabhakar

> Gr{oetje,eeting}s,
>
>                         Geert
>
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
