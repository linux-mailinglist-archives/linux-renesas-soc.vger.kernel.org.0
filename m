Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93C5B392D28
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 May 2021 13:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234281AbhE0Lxr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 May 2021 07:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233825AbhE0Lxq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 May 2021 07:53:46 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 571DAC061574;
        Thu, 27 May 2021 04:52:13 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id r7so236212ybs.10;
        Thu, 27 May 2021 04:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3ztHqaJd8TZGg8MpcMneObhMgohg69m32H8qjFRoVWg=;
        b=n0huFgbY3EuP++q2YDLUKvv6fsD71uqrbC6f/7lPdNA6UmRYfrTY/UL+54ImTfl0oe
         /OPLpxQ2bJ3Pvuc4HwWWQ3/kmi116fgdqq+52UwhZaN1s2G/IDnT83LLvUphy574glt2
         sJbli/a5PBCF9VdOXL2DNp62UVH2E5FoZS0hgOvpGN2kW0NyuTkmhu0f+VMZseS/xruW
         WIE37TY9JDfOIMKzFZPi0DWhi2Mm7sxVEsCvihTVfcsXWyylmPMf4W1B6jXeTMW9PCQn
         hXxJzZ74zFBWGmnQnMQgDPjLCDSRow2mYo0FcPLc46tdd2U6RbpAwVs4lBHs3eYnbN1a
         cIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3ztHqaJd8TZGg8MpcMneObhMgohg69m32H8qjFRoVWg=;
        b=YWiZU4w9FSxwYOF9em8WvmXnfFgGNIdrU5RPFk+v+CGp5mUSMsBWmmtZZZLgOoNfYI
         /HeHkiNiPUPOHZy9Ejs+/bsdiT6n8R0W9nNy5Hu12EbDuTwhTzXHQRRG9czbziKk6AyQ
         8ChOWvmoFUq2Xkqa9B1pxYn8FxiDXP4TryFhQILBga1ux/BoWGDouZ9Sy7w2zkWNqkAN
         HCzDdLlsC3c6flwvuA+0OZtF/p0O6yD5eGt/exFNhwfQuRHSeJcCGGxLWliLsUbd2ugN
         /0bBdU8D5ulLzZlfn341QgKXnthtGbqGk9LXQ/jASkYZTqChkZCnuImNFR4oZlRlSs+7
         gOgA==
X-Gm-Message-State: AOAM531PxMp29xgxNBayu9NXFPISZu6IZ/Arz5QAtfOEQEInozvOCoP7
        xpe0qXSezNnZD1CHI6opYXkGUzCnwI8ARHmuF2U=
X-Google-Smtp-Source: ABdhPJzmSdh/2yuDgX+UGFst4MfR74s636tsnw14IC+qBQu5iC3o1HDP0MYdVUDDkqC63A5AmMqf6+tVrkFBeA8SWY8=
X-Received: by 2002:a25:26c3:: with SMTP id m186mr3875079ybm.47.1622116332651;
 Thu, 27 May 2021 04:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210514192218.13022-16-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUNdZvPfU1Zu_F2CyneX-m3hGwwsp+TrYR3+ZjGfHxP-g@mail.gmail.com>
In-Reply-To: <CAMuHMdUNdZvPfU1Zu_F2CyneX-m3hGwwsp+TrYR3+ZjGfHxP-g@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 27 May 2021 12:51:46 +0100
Message-ID: <CA+V-a8vPn3S8tO-Rd0VCwBQm7GV9vhDy6ug9iDPS=WKZhea5UA@mail.gmail.com>
Subject: Re: [PATCH 15/16] arm64: dts: renesas: Add initial DTSI for
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

On Thu, May 27, 2021 at 12:17 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, May 14, 2021 at 9:24 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add initial DTSI for RZ/G2{L,LC} SoC's.
> >
> > File structure:
> > r9a07g044.dtsi  => RZ/G2L family SoC common parts
> > r9a07g044l.dtsi => Specific to RZ/G2L (R9A07G044L) SoC
> > r9a07g044l1.dtsi => Specific to RZ/G2L (R9A07G044L single cortex A55) SoC
> > r9a07g044l2.dtsi => Specific to RZ/G2L (R9A07G044L dual cortex A55) SoC
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> > @@ -0,0 +1,70 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Device Tree Source for the RZ/G2L and RZ/G2LC common SoC parts
> > + *
> > + * Copyright (C) 2021 Renesas Electronics Corp.
> > + */
> > +
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/clock/r9a07g044l-cpg.h>
> > +
> > +/ {
> > +       compatible = "renesas,r9a07g044";
>
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
> > @@ -0,0 +1,43 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Device Tree Source for the RZ/G2L R9A07G044L1 common parts
> > + *
> > + * Copyright (C) 2021 Renesas Electronics Corp.
> > + */
> > +
> > +/dts-v1/;
> > +#include "r9a07g044l.dtsi"
> > +
> > +/ {
> > +       compatible = "renesas,r9a07g044l1";
>
> This overwrites the main compatible value set by r9a07g044.dtsi before.
> As per your bindings, you want both:
>
>     compatible = "renesas,r9a07g044l1", "renesas,r9a07g044".
>
Agreed will fix that in next respin.

Cheers,
Prabhakar
