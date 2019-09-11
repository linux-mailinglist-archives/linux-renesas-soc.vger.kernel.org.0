Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BAD0B0494
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Sep 2019 21:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728582AbfIKTfP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Sep 2019 15:35:15 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41729 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728285AbfIKTfP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Sep 2019 15:35:15 -0400
Received: by mail-oi1-f195.google.com with SMTP id w17so1921397oiw.8;
        Wed, 11 Sep 2019 12:35:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=penkjc+LnYL0IVOn0C5YqiNfiHGL74bK4bzlXB2bL6U=;
        b=c8KSZyGQrcOkTOZL6cULasJgBcvhIsXujTL+ZH4qY842Q0IsqWMr9vEYeS4Htkqqi5
         eKEHmdiWvMRHl3mK3FVJQf0G+730OPWNkguUjFEbWDyaxzZQw0vsPmpGwQZkWmao6WVY
         vX7uTPl1gxVs2ybqUISHFVNsK9yzAT/QQbd+I6X9oXRO2AwDkCEhGn9kaeTgKE3/WiXI
         c/qgnFFxouOsFU1qDE210iQNbgPBQLKsiDtuqCjc2o62bfNfmvwdUWeceTWc1bbbQaAo
         zvHox0JGo7ftJi4pWhjkDHLHe4Z7iNm7yNaVHzL+DryMe/o0Rplb5lPSwbMVgaxAANsI
         z9/g==
X-Gm-Message-State: APjAAAVwkbBqfWQpQqlkjXIVEzmmDWX7J2Tt1mgp5U+OrSCXAeBoDxAZ
        U7lftNaf8R2lZLNAba0S4p5PUDgz7sG3kMvhsnc=
X-Google-Smtp-Source: APXvYqyJdRnqC2XFz9KVuyV7Z2Tg3fGD1B7L/xryD3+0MqDbsyKiCQF3MfIw1ksiQ17evudnCYwQkiCFnvpRB59HZWk=
X-Received: by 2002:aca:f305:: with SMTP id r5mr5436595oih.131.1568230514186;
 Wed, 11 Sep 2019 12:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
 <20190906135436.10622-10-jacopo+renesas@jmondi.org> <49012496-1a6e-d62c-2882-45ed8aeb88f7@ideasonboard.com>
In-Reply-To: <49012496-1a6e-d62c-2882-45ed8aeb88f7@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 11 Sep 2019 21:35:02 +0200
Message-ID: <CAMuHMdVfgsUVbsyH=Q9FGU_auLapUS-uTGgPDYzeX4wuXNd5cA@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] arm64: dts: renesas: Add CMM units to Gen3 SoCs
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        VenkataRajesh.Kalakodima@in.bosch.com,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>, muroya@ksk.co.jp,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran, Jacopo,

On Wed, Sep 11, 2019 at 8:16 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> On 06/09/2019 14:54, Jacopo Mondi wrote:
> > Add CMM units to Renesas R-Car Gen3 SoC that support it, and reference them
> > from the Display Unit they are connected to.
> >
> > Sort the 'vsps' and 'renesas,cmm' entries in the DU unit consistently
> > in all the involved DTS.
>
> I think if you chose the ordering in the r8a7795, then you only have to
> adjust/correct the ordering in the r8a7796 and r8a77965 ...
>
> Especially as you haven't changed the ordering of r8a77970, and r8a77980
> which have the status after the vsps entry.
>
>
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

> > --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi

> > @@ -3142,9 +3178,11 @@
> >                                <&cpg CPG_MOD 722>,
> >                                <&cpg CPG_MOD 721>;
> >                       clock-names = "du.0", "du.1", "du.2", "du.3";
> > -                     vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
> >                       status = "disabled";
>
> I'm not sure the vsps should be below the status = disabled line.
>
> I'd have this as:
>
>         clock-names...
>         vsps...
>         renesas,cmms...
>                 <blank line>
>         status...
>                 <blank line>
>         ports...

Indeed.

And better write "ports { ... }", so it's clear this is a subnode.

>
> >
> > +                     vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;

And the above will become "renesas,vsps", needing another reordering?

> > +                     renesas,cmms = <&cmm0 &cmm1 &cmm2 &cmm3>;
>
> I think these should be separated by comma's to show they are separate
> references, or references to separate phandles or such.

Yep, looks better, and makes the grouping clear.

> The only precedence I could find was in pmu_a53:
>
>           interrupt-affinity = <&a53_0>, <&a53_1>, <&a53_2>, <&a53_3>;

That's because most other phandle stuff has #<foo>-cells as non-zero.

We do have

    clocks = ... <&audio_clk_a>, <&audio_clk_b>, <&audio_clk_c>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
