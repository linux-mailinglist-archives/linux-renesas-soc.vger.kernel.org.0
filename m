Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBE41F1B6B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2020 16:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730071AbgFHOvZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jun 2020 10:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730050AbgFHOvY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jun 2020 10:51:24 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A56F1C08C5C2;
        Mon,  8 Jun 2020 07:51:23 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id p70so15494793oic.12;
        Mon, 08 Jun 2020 07:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g3MBGN2/qgTthG7Bacadsg6LtdGnLpRJHzYte56MVk0=;
        b=KxOcWy9pwItkMt83neB0L38db9zig/d8b2mnHE4kHmdjkewZojJOAriIxN40VsBkFI
         i+ipccwbysvUQNgYvzucBL2u7OhHBuGqAiTgkyw6fHuV0cpgVo1mFiCcusXgOyMb9cBR
         RZl6eQJd1+0PBzew2+MOoIsc7QB/S8MqsO8WcAKCN38SL2f2FwXQelEX9k1VUzutbVHM
         VRP8kXZn4M1vvc5YHsStL3Awt6BhvX0adPBHMspwzRi9tFSkrsbTT6ktZn8leh8/q1m/
         nWF1bp9pp7fl/stliiVtyHtGqvJiTwxVImQL7QbZWHVqadD/SqOgfST6NM9V5QbZcceo
         b+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g3MBGN2/qgTthG7Bacadsg6LtdGnLpRJHzYte56MVk0=;
        b=AG+15wEPT1t18Kw6b1TZ7xt9HrUu/vs0ogYvmMow3lbSZtxvohlcTXkb1a/ZAKJYyc
         sqvlg89TnDfTlfP8exMY5DxD1pPQAofHKcDIEbSIYNSLfaqtBus8/zvwoTXDQCFCrrgF
         fO73hw6kkDxFw3/Pp5EQAL81sXWhcl9j0gwzVkb8v1KpMDFuhUTqwJZFeHM42mXhJjmL
         ApvfQjJYzyQqGqekp438v9sAGAojexghAKh9k0xKZKlrC/eo66/TIl0MMzjjevuvfJof
         D0MUm74pCQxllHghzjwMbpX5FjDwcEmFUoxuPvS3gAQyYhv4lUFXgkmHBrcdhKjf0093
         Endw==
X-Gm-Message-State: AOAM532MiJfh32yX/5x2awXtpCAR6FAMAEHtFSqscMyIvK7W44MQEteD
        OVhpeWli2aZs993DnWQg2wu7OBXaR9sy3dN9kHM=
X-Google-Smtp-Source: ABdhPJw4lJWKcqGnl1NRTWwU003loPTNSBnIDpBym8xuClC9RdPx9fW7bWemVW/+2NhhZD5TJBhfXuNpIyhwv7XsPrs=
X-Received: by 2002:aca:d68f:: with SMTP id n137mr10914828oig.62.1591627882881;
 Mon, 08 Jun 2020 07:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <1591555267-21822-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1591555267-21822-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdU35fvy2TM+u=Zu3-4aVnzOC1Sxophu8WaExS7unVH1fg@mail.gmail.com>
In-Reply-To: <CAMuHMdU35fvy2TM+u=Zu3-4aVnzOC1Sxophu8WaExS7unVH1fg@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 8 Jun 2020 15:50:56 +0100
Message-ID: <CA+V-a8vOErQGkSYtiQ=8QLg+0WRyDZ1dHWfuxm6P2E-gAiirzA@mail.gmail.com>
Subject: Re: [PATCH 03/11] arm64: dts: renesas: hihope-common: Separate out
 Rev.2.0 specific into hihope-common-rev2.dtsi file
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the review.

On Mon, Jun 8, 2020 at 3:27 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> Thanks for your patch!
>
> On Sun, Jun 7, 2020 at 8:41 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Separate out Rev.2.0 specific hardware changes into
> > hihope-common-rev2.dtsi file so that hihope-common.dtsi can be used
> > by all the variants for RZ/G2M[N] boards.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/hihope-common-rev2.dtsi
> > @@ -0,0 +1,101 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Device Tree Source for the HiHope RZ/G2[MN] main board Rev.2.0 common
> > + * parts
> > + *
> > + * Copyright (C) 2020 Renesas Electronics Corp.
> > + */
> > +
> > +#include <dt-bindings/gpio/gpio.h>
>
> What about adding
>
>     #include "hihope-common.dtsi"
>
> here?
> Then the *rev2.dts files have to include only "hihope-common-rev2.dtsi",
> and get "hihope-common.dtsi" for free?
>
> The same is true for the rev4.dtsi and the rev4.dts files.
>
Agreed.

Cheers,
--Prabhakar

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
