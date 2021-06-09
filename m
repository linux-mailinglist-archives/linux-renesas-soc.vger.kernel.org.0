Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA603A1A4A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jun 2021 17:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234424AbhFIQAH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Jun 2021 12:00:07 -0400
Received: from mail-vs1-f51.google.com ([209.85.217.51]:38700 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233575AbhFIQAG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jun 2021 12:00:06 -0400
Received: by mail-vs1-f51.google.com with SMTP id x8so195194vso.5;
        Wed, 09 Jun 2021 08:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eoJtWHTY9D4MPvxk9n7gKkmyyHPN7V7mUcBlJqd6sSw=;
        b=gV6gsG8fnD2VmrscSXDkwgr6X11r0JcTZZL2PhQMo9KBPW0uIDJYVb+GuU2G+ZTb5W
         LOeypJCWLM90kccZ36psVfnEV7bWLpBarNMX5aun+zw6gtdQf2T+vDLq5EtpVRlvuV8z
         vweqG6aSQyCKHu4RAs1sNZXclJSYKVl8kTY99jGZ3lWc3p6N68S7GAIw7y41wQnuxTj6
         Hv2xhWBEktN6dnfOEEKQLwfd26rXrPnoY7HyWWP+9Ed/zsvlZEPirKDEeVXMvj3uQG2v
         tZD8hyx2QyphU6Z3GvlUIG0eXimL+oJFxmISxTcxuf8Dpei0x9wxLOWH63imPIr0b0tg
         8UkA==
X-Gm-Message-State: AOAM532KU3AbBtt7CRDFFd1tkTQdQ6k7AUO3la7eEbJEUczAqX6j4P5i
        etPYOY/y8iZid9wmayyd1dMePG2p80hnzDwgjlc=
X-Google-Smtp-Source: ABdhPJwmSh/SJ+NZzcFDhxWRy5iXzTG1mfR+aQ4RsmpRZ4CTPyWGJvwhozh1PTFfxBX/CdOheEppwS3UXswSQEAo0iY=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr927502vsd.42.1623254275141;
 Wed, 09 Jun 2021 08:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210604180933.16754-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210604180933.16754-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVkKhD3kU-DtPzrGfNf4Sn5Ht09Z1N0scwx1XJoG-F6Mg@mail.gmail.com> <CA+V-a8tOMtS59OoWVK-c=zy2iK_nv_16Xu+2DBcUQPTq7nCa1Q@mail.gmail.com>
In-Reply-To: <CA+V-a8tOMtS59OoWVK-c=zy2iK_nv_16Xu+2DBcUQPTq7nCa1Q@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Jun 2021 17:57:43 +0200
Message-ID: <CAMuHMdXQkqyQtXEPWTuAF9LG0HFPEJEWLuME_X0ejrs0G4J4Uw@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: renesas: Add support to read LSI DEVID register
 of RZ/G2{L,LC} SoC's
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Wed, Jun 9, 2021 at 5:50 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Wed, Jun 9, 2021 at 8:27 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, Jun 4, 2021 at 8:09 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > Add support for reading the LSI DEVID register which is present in
> > > SYSC block of RZ/G2{L,LC} SoC's.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/soc/renesas/renesas-soc.c
> > > +++ b/drivers/soc/renesas/renesas-soc.c
> > > @@ -56,6 +56,11 @@ static const struct renesas_family fam_rzg2 __initconst __maybe_unused = {
> > >         .reg    = 0xfff00044,           /* PRR (Product Register) */
> > >  };
> > >
> > > +static const struct renesas_family fam_rzg2l __initconst __maybe_unused = {
> > > +       .name   = "RZ/G2L",
> > > +       .reg    = 0x11020a04,
> >
> > Please don't add hardcoded register addresses for new SoCs (i.e. drop
> > ".reg").  The "renesas,r9a07g044-sysc" is always present.
> > And if it were missing, the hardcoded fallback would lead into the
> > classic CCCR/PRR scheme, which is not correct for RZ/G2L...
> >
> I wanted to avoid iomap for the entire sysc block for just a single register.

The mapping will be rounded up to PAGE_SIZE anyway
(I know, SYSC is 64 KiB, hence larger than the typical page size).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
