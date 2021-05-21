Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 738F938CD9B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 May 2021 20:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238842AbhEUSju (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 May 2021 14:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbhEUSjs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 May 2021 14:39:48 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0E1CC061574;
        Fri, 21 May 2021 11:38:24 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id y2so28715963ybq.13;
        Fri, 21 May 2021 11:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=olQZoZywvM5Y52kkIexHOvGtbXaTwbR42GcPh6oe6xs=;
        b=UgzUkAWR+ddmD0U+NcVtqPFVk+5y+o2fEFxfbeRjGOLPg42jie6iU6hxBD4+/ewgVq
         UIBmBNZutkxKVW1a0l2HbXMI4d3F9upe04/M5fXSARDHDkwHR2fMBdlsK+m4qHwy1NLU
         bzSVvdWHMJgpB/rgwlw+zrG/glpvwtIvymRKm7pJkxLgx1fRPkQrWrfugYIbjv2sSrjl
         c4J42fysX2yNsq6LrGoXqNV3hU2oYR38KW04JLXfzn9qISlLyuRcSh8NybDeMDo5axQU
         mHTnDY7PS5inh94o6TYa+/2qvcN6RxRpMy+2LI6nCqgJwIPMdsX82IHmt+3KsUdV8qkh
         uJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=olQZoZywvM5Y52kkIexHOvGtbXaTwbR42GcPh6oe6xs=;
        b=hr76vgyhKbJJLjLV056djo4asoNl+k/MhscTPecwIV12sITGH8MtwpS8BVdHxL4Lag
         LlCOkqfiWnN6pztVXZDSG3pRiox/on9HP99DTncNpCcY21SNTbWfEZK0jWtVISZn4UCd
         2h723z2guZvhyHjAhIf+NgEgboEwOu60u8BwICQVrFAh6w4EUWQbafmQoLuX+69sb6/0
         Cn4qAP1Kc0s6EtdUmBeAO/w4OoXmMoNobVux7Zl5kkoPDGCMQLF+cyEPmLAvz0muoyhE
         i4lQ90RcPZw9MVPbZU7TlAvE4O7SKZeZK41HTQIwJfzBO/Sbhe466y+99KW/F5w+3CfZ
         9VJQ==
X-Gm-Message-State: AOAM532uQh4rJ7gOz7D91njPDCdd3Ir4Ll/Da+enXgtXK9se4skZy7vU
        IXWdTz2iyon81G89KLaFcBFABDM4ELMJS2R5j8c=
X-Google-Smtp-Source: ABdhPJwtnKYsildB4JiaI/0BdF9vgryKdln/lTVgnl/dt7wD6r5Eet/3fFCECsk4pa9QTbYmSy4lKYeJ0NE3zo2Bh1I=
X-Received: by 2002:a25:a522:: with SMTP id h31mr18133967ybi.426.1621622304013;
 Fri, 21 May 2021 11:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210514192218.13022-13-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXPfpp3omsx8MjQ9W4mFmW0KJ1GcHXx+y5DcXobxLcw_A@mail.gmail.com>
In-Reply-To: <CAMuHMdXPfpp3omsx8MjQ9W4mFmW0KJ1GcHXx+y5DcXobxLcw_A@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 21 May 2021 19:37:58 +0100
Message-ID: <CA+V-a8u17VLbHEL2PBUU-9sDuvgpW8zoCO5tCDd=K-eRLNhRUg@mail.gmail.com>
Subject: Re: [PATCH 12/16] clk: renesas: Define RZ/G2L CPG Clock Definitions
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

On Fri, May 21, 2021 at 4:19 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, May 14, 2021 at 9:23 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Define RZ/G2L (R9A07G044) Clock Pulse Generator Core Clock
> > and module clock outputs.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  include/dt-bindings/clock/r9a07g044l-cpg.h | 89 ++++++++++++++++++++++
> >  1 file changed, 89 insertions(+)
> >  create mode 100644 include/dt-bindings/clock/r9a07g044l-cpg.h
> >
> > diff --git a/include/dt-bindings/clock/r9a07g044l-cpg.h b/include/dt-bindings/clock/r9a07g044l-cpg.h
> > new file mode 100644
> > index 000000000000..2bc13f4e575b
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/r9a07g044l-cpg.h
>
> I think the filename should be r9a07g044-cpg.h, as this is
> shared by RZ/G2L ('044l) and RZ/G2LC ('044c).
>
Agreed will rename that.

Cheers,
Prabhakar

> > @@ -0,0 +1,89 @@
> > +/* SPDX-License-Identifier: GPL-2.0
> > + *
> > + * Copyright (C) 2021 Renesas Electronics Corp.
> > + */
> > +#ifndef __DT_BINDINGS_CLOCK_R9A07G044_CPG_H__
> > +#define __DT_BINDINGS_CLOCK_R9A07G044_CPG_H__
>
> The include guards are fine ;-)
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
