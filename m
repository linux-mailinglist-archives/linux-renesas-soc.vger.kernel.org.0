Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B209E3A0E27
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jun 2021 09:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237227AbhFIH6m (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Jun 2021 03:58:42 -0400
Received: from mail-yb1-f173.google.com ([209.85.219.173]:43668 "EHLO
        mail-yb1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235676AbhFIH6l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jun 2021 03:58:41 -0400
Received: by mail-yb1-f173.google.com with SMTP id b9so34189621ybg.10;
        Wed, 09 Jun 2021 00:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KXMGHXTBrIil+I7I4kjVUCaxAzxvJ/gccp3wjNKkRTM=;
        b=TdlrugkUXsgXQ/klf03KArJGCtrAiDPExNhLRnhLTnf0alb/+ecpu/0+DwhUwzslD8
         nGjl98bGRk4TwWuui+zYqmbhQr9bE0tNad0C3W2RJJpCdV7bG1JYyCQyLp6E2zYgAgge
         hYHrDcWoMprH8As++8E927poTTiodJXfPK8yQ60+diRba59Zs8p1OizhGYGLa2UCPvPO
         shDuXeIIZjrEwzvPp0q8fRjng4RqUsXokYqWPTvr37PzK88XtWMX169uVCMYLKFj/Oy5
         OaJ0Krnxml+yQE3E7NIdcLkIIdr83D4StVlpWWXnNynGmnQy5cXUCG7QldrHNjjwAuJB
         p3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KXMGHXTBrIil+I7I4kjVUCaxAzxvJ/gccp3wjNKkRTM=;
        b=tqEBozAFRcT+wQhxQoyEFjz/b3tE7qI1nGAoGxyPpSxAUQvxT0sCk2ID7nKwz8ehDI
         SIjSdhReWt5ufQMDcBoOwoUq/ceIsOdUwAnT+8jGKujRYRkIxRLRPf4XYOq9pbVUm1f1
         /F8Sgy7hDpNZx11xo3cV2HpF7WR95rSdiAz35xTZnaKo4GsEwglED1MIQnH28jUugTF/
         QImAYjzIVgbpx1ck8eiAhANvAgXhI0jAQJGSgo5lAmabbLFXySy4+OVnS4pm6H0qigfP
         9DN0yjfT9ubCTgLq3xYG0e1xN7IXm34S9w0/IPI8rVeNqZ/jw8Bwxtd3eCgj6UTo92+a
         LhgA==
X-Gm-Message-State: AOAM530WV5PG2ASxpQPK9R0Rx6oDkMtjm4WzZ2ytRXc/ATR8LLJ5h2jD
        1YXxyLXnculWQ2c2Az/Qh14dywP5T1zIMHDLSts=
X-Google-Smtp-Source: ABdhPJwAbGPtDbZtlUcIsNuAqy/YZy5uVx2bQGCuOHQkm9uid77r2z6Qq8LBhTcmzyQfawpZBULT7hw/ULTpug/IjSw=
X-Received: by 2002:a25:d888:: with SMTP id p130mr1010477ybg.179.1623225331965;
 Wed, 09 Jun 2021 00:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210603221758.10305-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210603221758.10305-13-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXO1RyF9ZuXR2CGHqvPOh6jnf07_EEreTOmiwUzoEg5hQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXO1RyF9ZuXR2CGHqvPOh6jnf07_EEreTOmiwUzoEg5hQ@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 9 Jun 2021 08:55:06 +0100
Message-ID: <CA+V-a8uaAcFOqqRzNVdjmSD2LsQO9yHjM8AcQRA8gOFmF5q8gg@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] arm64: dts: renesas: Add initial device tree for
 RZ/G2L SMARC EVK
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the review.

On Wed, Jun 9, 2021 at 8:18 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, Jun 4, 2021 at 12:19 AM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add basic support for RZ/G2L SMARC EVK (based on R9A07G044L2):
> > - memory
> > - External input clock
> > - SCIF
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
> > @@ -0,0 +1,21 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +/*
> > + * Device Tree Source for the RZ/G2L SMARC EVK board
> > + *
> > + * Copyright (C) 2021 Renesas Electronics Corp.
> > + */
> > +
> > +/dts-v1/;
> > +#include "r9a07g044.dtsi"
>
> So this should include r9a07g044l2.dtsi.
>
Good point I'll create an empty r9a07g044l2.dtsi file including
"r9a07g044.dtsi '' along with the compatible value and include it
here.

Cheers,
Prabhakar

> The rest looks fine, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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
