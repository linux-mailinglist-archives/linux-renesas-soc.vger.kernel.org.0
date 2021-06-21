Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1EA23AECC1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 17:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbhFUPvd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 11:51:33 -0400
Received: from mail-vk1-f169.google.com ([209.85.221.169]:33285 "EHLO
        mail-vk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230161AbhFUPvc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 11:51:32 -0400
Received: by mail-vk1-f169.google.com with SMTP id j19so3847816vkj.0;
        Mon, 21 Jun 2021 08:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RuGKBjbp+BrEpqSxTDuG5X4dZC+D6zrmLacYTuAQECM=;
        b=ntKH96gBgCjuW2VgX8j2Gef0MhiNpz1d/Q7TPRRiXJtIX60GTfZryg8HG9ES9ZDFsI
         oacMBi0dHgaHxKYukrh/h7KW1Ysoucb5V8SNljkpqU29mt4vrNYJln2nLAFDDOzqC15M
         CiQMbW3QeOHVYLFZo13plMfKWilZ5RxknenPNhj1qkMItn9zgZYKqcZw8VF5aiuyF/At
         Z9h8FpvH1LNwKlh6ga/zrFXtJOPGCNcMYyavNNshqQmMLECEN68DFuO57kTxxiHfUXAv
         t5OswxexQTDj1WCx2NfVWiAaESVYej+1kp+oRkl8WMb8/FxZwUeNZCaW+uBSlUB8GAQM
         ylEw==
X-Gm-Message-State: AOAM530W7C+iNhVbPyIgiSXRWuJbMtxpB7mxGcYZ/xSyBLLA1gxWNVu3
        ekARBKvdcTCf8mlp1DUut/YqRV9yK8f9kMKYqaXIF5i0d/3vTA==
X-Google-Smtp-Source: ABdhPJyS5c3rK85zSmf0huiWWk8sFkZU238pJgFHUaF6ZTCQqQWxme6RMPvYrgB+GOQm3VZDu/z49zB/BFIhF1c7en8=
X-Received: by 2002:a1f:d8c3:: with SMTP id p186mr14697150vkg.1.1624290556467;
 Mon, 21 Jun 2021 08:49:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210618095823.19885-1-biju.das.jz@bp.renesas.com> <20210618095823.19885-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210618095823.19885-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Jun 2021 17:49:04 +0200
Message-ID: <CAMuHMdXLrfU99sQCbwLFifqrV4B94pzGi_DWbBvpS4-Y=Z09RA@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: clk: r9a07g044-cpg: Update clock definitions
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Jun 18, 2021 at 11:58 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Update clock definitions as per the RZG2L_clock_list(Rev.02) manual.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/include/dt-bindings/clock/r9a07g044-cpg.h
> +++ b/include/dt-bindings/clock/r9a07g044-cpg.h

> +#define R9A07G044_USB_SCLK             73

It looks like USB_SCLK cannot be gated, but is driven directly from
OSCCLK, so I think it should be left out, and the DTS should just
reference R9A07G044_OSCCLK

> +#define R9A07G044_ETH0_CLK_AXI         74
> +#define R9A07G044_ETH0_CLK_CHI         75
> +#define R9A07G044_ETH0_REFCLK          76
> +#define R9A07G044_ETH1_CLK_AXI         77
> +#define R9A07G044_ETH1_CLK_CHI         78
> +#define R9A07G044_ETH1_REFCLK          79

According to the Hardware User's Manual, ETH0_REFCLK and  ETH1_REFCLK
cannot be gated (see the note for CPG_CLKMON_ETH), so I think it
should be left out, and the DTS should just reference R9A07G044_CLK_HP.

The rest of the clocks look good to me.  Some are still missing, but they
can be added later.

I do think we need a separate list of definitions for resets.  While
simple modules like SCIF and I2C have a one-to-one mapping from
clock bits to reset bits for, this is not the case for all modules.
E.g. SDHI has 4 clocks per instance, but only a single reset signal
per instance, while CANFD has a single clock, but two reset signals.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
