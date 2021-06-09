Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48AC53A1A28
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jun 2021 17:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236269AbhFIPw4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Jun 2021 11:52:56 -0400
Received: from mail-yb1-f172.google.com ([209.85.219.172]:33690 "EHLO
        mail-yb1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235827AbhFIPwz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jun 2021 11:52:55 -0400
Received: by mail-yb1-f172.google.com with SMTP id f84so36218583ybg.0;
        Wed, 09 Jun 2021 08:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aBTN9nJMcjuczcYEKzyMHwRihscHxKS/kDo9+PJCmN4=;
        b=ms5C9nDO22l6b82s4qeFr0cb0SJcO5eHC60T8kui+Dd57hCUfr0CDSqt24AliiLEpd
         BeoldJeG+yuqBDfHZYSJ8BG5U3Bk29hd8XmdTZ0blOOYvBP6dJveoUfEMbbXATMY4Mx+
         OdUjHYuLznMpzbiw+5g4mMdoomZbXTPSx86iVLEFjjwsPYUywMzbQWDsi/vO7u1bd9Vx
         eGhkD25LkM1UIsaoef92MQlQLoqV4AlQ6UaTYqBxhpuD/TelmGCkQEZLpLTrQu9eczUt
         Pmu5sFbdnYxiX14buLaBbfGgGF50zh8TKGW3jkB51X6KP7CiIaeulyNckyS5NhnGfsQH
         cQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aBTN9nJMcjuczcYEKzyMHwRihscHxKS/kDo9+PJCmN4=;
        b=V2KfjvSnrdO44DQ/n+lIwVy5DDkxivtadqdizV56WwFlAWAlREso2pKOWnwUeKxy70
         L5UIcn7+O+pELYAKGCCLobQJpT5NInNFkxGU6dGyzH1QT5Rt4wOVy6LymMeVQvVbWsgD
         6hFfizpV3ntKpxhCc2tFbZcNBLZdsK5ebeXz2m4WifMT1pA6Q+2wCoI1R68ovonVYAeJ
         +DWIqFORQIzA5XZVULtwaWu5/W7qseDoWZMcdq9dp6rzD0zDaJ6ZyCPm6OIqlvoKBUT8
         NZ2/+g0wICV7dihIc++3QkWXimn8or/gzEOW7T6EVQ5MUyUFgqq5qQDnarQZ/muOGw5b
         joCA==
X-Gm-Message-State: AOAM531NJLNBXb8awZ4djujZwaRih0/1q43Da6AkTOZBPu7WhCbmgAxG
        jSHNRlhxNu3ED9rDueT48vEj5oasrHIMfNeVp9GVjwxdzt0=
X-Google-Smtp-Source: ABdhPJzdYIkJvQwfRiIEk/K+MGk13mZ6eCQ5fCyo7dydKfGS8Ok1LiDkYnwNrOGFbrpLtbz8UGHSY6SGZyf/firFwSg=
X-Received: by 2002:a25:743:: with SMTP id 64mr905819ybh.426.1623253800926;
 Wed, 09 Jun 2021 08:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210604180933.16754-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210604180933.16754-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVkKhD3kU-DtPzrGfNf4Sn5Ht09Z1N0scwx1XJoG-F6Mg@mail.gmail.com>
In-Reply-To: <CAMuHMdVkKhD3kU-DtPzrGfNf4Sn5Ht09Z1N0scwx1XJoG-F6Mg@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 9 Jun 2021 16:49:34 +0100
Message-ID: <CA+V-a8tOMtS59OoWVK-c=zy2iK_nv_16Xu+2DBcUQPTq7nCa1Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: renesas: Add support to read LSI DEVID register
 of RZ/G2{L,LC} SoC's
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

Hi Geert,

Thank you for the review.

On Wed, Jun 9, 2021 at 8:27 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, Jun 4, 2021 at 8:09 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add support for reading the LSI DEVID register which is present in
> > SYSC block of RZ/G2{L,LC} SoC's.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/soc/renesas/renesas-soc.c
> > +++ b/drivers/soc/renesas/renesas-soc.c
> > @@ -56,6 +56,11 @@ static const struct renesas_family fam_rzg2 __initconst __maybe_unused = {
> >         .reg    = 0xfff00044,           /* PRR (Product Register) */
> >  };
> >
> > +static const struct renesas_family fam_rzg2l __initconst __maybe_unused = {
> > +       .name   = "RZ/G2L",
> > +       .reg    = 0x11020a04,
>
> Please don't add hardcoded register addresses for new SoCs (i.e. drop
> ".reg").  The "renesas,r9a07g044-sysc" is always present.
> And if it were missing, the hardcoded fallback would lead into the
> classic CCCR/PRR scheme, which is not correct for RZ/G2L...
>
I wanted to avoid iomap for the entire sysc block for just a single register.

> > @@ -348,6 +361,25 @@ static int __init renesas_soc_init(void)
> >                 goto done;
> >         }
> >
> > +       np = of_find_compatible_node(NULL, NULL, "renesas,r9a07g044-sysc");
> > +       if (np) {
> > +               of_node_put(np);
> > +               chipid = ioremap(family->reg, 4);
>
> Just use of_iomap(np, 0)...
>
will do.

> > +
> > +               if (chipid) {
> > +                       product = readl(chipid);
>
> ... and add the DEVID offset within the SYSC block here.
>
will do.

Cheers,
Prabhakar

> > +                       iounmap(chipid);
> > +
> > +                       if (soc->id && (product & 0xfffffff) != soc->id) {
> > +                               pr_warn("SoC mismatch (product = 0x%x)\n",
> > +                                       product);
> > +                               return -ENODEV;
> > +                       }
> > +               }
> > +
> > +               goto done;
> > +       }
> > +
> >         /* Try PRR first, then hardcoded fallback */
> >         np = of_find_compatible_node(NULL, NULL, "renesas,prr");
> >         if (np) {
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
