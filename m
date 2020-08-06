Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2150A23D834
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Aug 2020 10:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbgHFI5H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Aug 2020 04:57:07 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:34803 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725927AbgHFI5H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Aug 2020 04:57:07 -0400
Received: by mail-ot1-f65.google.com with SMTP id k12so18774383otr.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Aug 2020 01:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9EhX0XmG8695p9w3cLFIWpHhGigd+DJ9e/oKz8y9fOU=;
        b=YyV1/EmWGvYv77Q89G8LFMEGM6UL5lHtwu7YEROYd0ctCTNcLr3ZHJobALfoyvDdeH
         Khw2pwU8wtzxD2JY1/atuKQgaRB2P9cQaP4P5+KkYM/tmxZwX5KL6VCoYa5bN6M/dQCR
         wmzDcvxlsHhigUYt/qMmhGtvPeFGgPHmjbDW2HLyL59M0HtfDDQpqHj2xSM7ecSv9Q2s
         mS9z9OYaL3zHBJa9XTqxamTWA1x27TQYhUL+pb2MIuWB231ZIslaPns5eOrKlw0RSTi+
         g5FVv1lxmWhmV1lRTsxFYBJGQZoOSfZE5Tdlx4NvVqevCfCUH1/Pd2ZPeRzDdsfMTvhd
         zzIA==
X-Gm-Message-State: AOAM531nLLl/DpNCOvC0jbKIPPpRwDfjFgeNrJxkP0k3YAXbVvGpi8BP
        CtOAOA/O5Lj25RkjoGDQ6AmHKC3yOJd4hYBgcAo=
X-Google-Smtp-Source: ABdhPJz3kKASqU4zEGDpCw2STq7BNeoOkIGVgTG5LakToPbYKOrpjj/qJVzR6BuiCyxMuKSIBaZG7AH+PXUuK1S+U+k=
X-Received: by 2002:a9d:7d8c:: with SMTP id j12mr6313985otn.250.1596704226032;
 Thu, 06 Aug 2020 01:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <87sgd3gcv4.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdUB=--G6PGYrKtkDUZweDeJuOGJhUErPkNB4+dVixsAyQ@mail.gmail.com> <87ft907hwk.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ft907hwk.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 6 Aug 2020 10:56:54 +0200
Message-ID: <CAMuHMdWjvoRvtEe29i5_0-vrYB3euh372WzDqamGaEuysiR1zQ@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: use menu for Renesas SoC
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Thu, Aug 6, 2020 at 2:12 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > >  config ARCH_R8A774A1
> > > -       bool "Renesas RZ/G2M SoC Platform"
> > > +       bool "SoC Platform support for RZ/G2M"
> > >         select ARCH_RCAR_GEN3
> > >         select SYSC_R8A774A1
> > >         help
> > >           This enables support for the Renesas RZ/G2M SoC.
> > >
> > >  config ARCH_R8A774B1
> > > -       bool "Renesas RZ/G2N SoC Platform"
> > > +       bool "SoC Platform support for RZ/G2N"
> >
> > [...]
> >
> > Why these changes?
>
> Because if this patch was applied, these are under "Renesas" menu.

OK, and you want the SoC name last, for easier reading?

> > >  # SoC
> > >  config SYSC_R8A7743
> > > -       bool "RZ/G1M System Controller support" if COMPILE_TEST
> > > +       bool "System Controller support for RZ/G1M" if COMPILE_TEST
> > >         select SYSC_RCAR
> > >
> > >  config SYSC_R8A7745
> > > -       bool "RZ/G1E System Controller support" if COMPILE_TEST
> > > +       bool "System Controller support for RZ/G1E" if COMPILE_TEST
> >
> > [...]
> >
> > Why these changes?
>
> Because of good looking.
>
>         - R-Car H2 System Controller support
>         - R-Car M2-W/N System Controller support
>         - R-Car V2H System Controller support
>         - R-Car E2 System Controller support
>
>         + System Controller support for R-Car H2
>         + System Controller support for R-Car M2-W/N
>         + System Controller support for R-Car V2H
>         + System Controller support for R-Car E2

I see, easier reading, too.

> > BTW, if you want to increase consistency, please also update the
> > descriptions for arm32 and family-specific options.
>
> Sorry I don't understand this.
> what does "arm32 and family-specific options" mean ?

I mean the other options in drivers/soc/renesas/Kconfig:
  1. The arm32 SoCs are at the top, protected by "if ARM &&
      ARCH_RENESAS", and also under the "Renesas" menu,
  2. The family-specific options (R-Car/R-Mobile Reset/System Controller)
     are at the bottom, and part of the same menu.

If you change any, it would be good to have consistent descriptions for
all of these.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
