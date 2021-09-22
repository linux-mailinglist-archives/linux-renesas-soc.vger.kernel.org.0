Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A42A414922
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 14:40:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235576AbhIVMl4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 08:41:56 -0400
Received: from mail-vs1-f42.google.com ([209.85.217.42]:44672 "EHLO
        mail-vs1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234294AbhIVMly (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 08:41:54 -0400
Received: by mail-vs1-f42.google.com with SMTP id u4so2731585vsu.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Sep 2021 05:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4EXAlLsvyb6Qpq7ztQhJ1IrK46FP6hl7ERLXWPYyRWU=;
        b=l1gk+HIQrJsEmwHMKCFZ49DIr+Rr7ztH3MZT0xzPxhpGdb0NxemDnTZR7151LgHNzy
         6vF86+Eqc/4xrVPp//cJY0/J3dqm9Ghwgyt0GK5Dv8Spo4Ie4IB/lf9sXLHoFsCd0ZUS
         +K1dAw2FZFvnbE+YLYH7S7TY9Njmjdw8Fca3fwR/s43bm6oqFpXoDfB2Xb2A8zSH/SdC
         V84Rihn2Z8UtXp09RafobTytXHeUPNa9IhwJRMZMiN2wgpXyEcfYM4UuLIEyKcpdEO3X
         rsDFh+aypCzjZkq5/cadmu+jEhUffmeotD/Z8fYYGa1uCCvFv4yCGPwRHYMbRgTEsrKf
         88UA==
X-Gm-Message-State: AOAM5306KOXSGi6EDwgw3itoTO5vkdzDORcPQJ4xgB8jtZr/kk4U+p6p
        OZtN5FCrQm8u7TEJ1nZl9R18YIeRBsHbWwn2ljktP1BfQ3I=
X-Google-Smtp-Source: ABdhPJz1eHKt5JzgYhiNYfVSpQ3b3lSKiIPI19cQ5hhDaaznjpnTnFoDnlpn+rJBF0eI0fXG7d16HqVKD4+Nu50P4OY=
X-Received: by 2002:a67:2c58:: with SMTP id s85mr8592917vss.35.1632314424610;
 Wed, 22 Sep 2021 05:40:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210914094650.15235-1-julien.massot@iot.bzh> <20210914094650.15235-2-julien.massot@iot.bzh>
 <CAMuHMdVT+OgASuzwnNHEHYpc3hc1-ObThTmdHETfxF5inePP5g@mail.gmail.com> <9922048a-2278-e3bf-ea23-b07f95ab607b@iot.bzh>
In-Reply-To: <9922048a-2278-e3bf-ea23-b07f95ab607b@iot.bzh>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 22 Sep 2021 14:40:13 +0200
Message-ID: <CAMuHMdV0S50KpUhXFr53Q1Z=LtL9RFGYSKJp2sareW0WTU+gtA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] soc: renesas: rcar-rst: Add support to set rproc
 boot address
To:     Julien Massot <julien.massot@iot.bzh>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Julien,

On Wed, Sep 22, 2021 at 11:54 AM Julien Massot <julien.massot@iot.bzh> wrote:
> > In general, I think this looks like a good abstraction, which we can
> > also use for further abstraction of R-Car Gen2 (cfr. [1]).
> Yes I was also thinking about future generation like Gen4, but I don't have the documentation
> at this point.
>  From what I understand in [1]: CA7BAR in Gen2 is managed by the SYSC module and not by the RST module
> as for CR7BAR in Gen3. So despite the fact that the procedure is similar, we won't be able to set CA7BAR in
> rcar-rst.c.

On R-Car Gen2, CA7BAR is managed by the RST module.
On R-Mobile APE6, it is managed by the SYSC module.

> > I'm just wondering if we should pass the BAR offset to
> > rcar_rst_set_rproc_boot_addr() explicitly (and rename the function),
> > or have multiple functions for the different BARs.
> Passing BAR offset will imply to spread RST module offsets across different subsystems,
> and the second question will be to be able to do the correct boundary check for the targeted
> processor: CR7BAR is aligned on 4k an it looks like CA7BAR is on 256k. It looks like it's
> manageable thanks to the driver data which already holds the 'mode monitor register' offset per SoC generation.
>
> One missing point will be for future R-Car SoCs: trends on others SoC seems to be to go to have
> several 'realtime', or remote processor. In this case this function will not scale up.

On R-Car V3U, CR52BAR is managed by the APMU module.

There's not much we can do about future processors yet ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
