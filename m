Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3513E5822
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Aug 2021 12:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237928AbhHJKUc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Aug 2021 06:20:32 -0400
Received: from mail-vs1-f44.google.com ([209.85.217.44]:34709 "EHLO
        mail-vs1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238900AbhHJKUb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Aug 2021 06:20:31 -0400
Received: by mail-vs1-f44.google.com with SMTP id y1so12007713vsc.1;
        Tue, 10 Aug 2021 03:20:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ViSXR6yXK8nsqcEj3nqGncGWwhL5obzmTb+wOi66chs=;
        b=EV4S8Pu33fNwapCwclrDr8O/IQ63wO3ZnlPG+XueAKNm1palHCtY3+Qk+w1SbrBT6z
         QL6kjWtlSUcXJrAWL4MPIQ7lL4Pk6EnbVNLuE2ATdIjF0zuvND5Vk6oEFs4f+eCQbbJj
         d3nKks+ZLA7s1b6Jdr56CxyPoF+dhNg8RzIP3MPkhxSaljYLm9NoB+Lazfn41PNrvigl
         hjHAkuvHBgku4gvDiJ1XPtKZ3hSlReNp2dYJTYj5UazAfhqZ6uhVJ3/ezVJSvzuT7FxP
         oybQszDQy5/2GfouF4PP+du69jd4F2o5e2aJt9s1c9czRMVQSII0kGxz801Fk6W3/OeH
         xY+Q==
X-Gm-Message-State: AOAM532h86cuLEQ7xt9n0OauE5IQX6YYThFQ+qQYqp0FQC+xqPGMiN9K
        WBxz/F1BpEStN8POkGdMeNhmUv/iw2oG3hqte7s=
X-Google-Smtp-Source: ABdhPJyOj4tbjccYcMl81/wp6Mmxp3+Qc6KXndH2R/c2o5BHeaS5HPmc1utV+HCZCUWiuQaRQce+ScpO+478z+yngUA=
X-Received: by 2002:a67:e2c7:: with SMTP id i7mr20171647vsm.3.1628590809393;
 Tue, 10 Aug 2021 03:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210727185527.19907-1-biju.das.jz@bp.renesas.com> <20210727185527.19907-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210727185527.19907-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 10 Aug 2021 12:19:58 +0200
Message-ID: <CAMuHMdXJY62vYx-ukDtdARg5duWqyKnL1CsoXEvf7-CfRcLZ0g@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] arm64: dts: renesas: r9a07g044: Add USB2.0 phy and
 host support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Tue, Jul 27, 2021 at 8:55 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add USB2.0 phy and host support to SoC DT.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> @@ -200,6 +200,100 @@
>                               <0x0 0x11940000 0 0x60000>;
>                         interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
>                 };
> +
> +               phyrst: usbphy-ctrl@11c40000 {
> +                       compatible = "renesas,r9a07g044-usbphy-ctrl",
> +                                    "renesas,rzg2l-usbphy-ctrl";
> +                       reg = <0 0x11c40000 0 0x10000>;
> +                       clocks = <&cpg CPG_MOD R9A07G044_USB_PCLK>;
> +                       resets = <&cpg R9A07G044_USB_PRESETN>;
> +                       power-domains = <&cpg>;
> +                       #reset-cells = <1>;

Should there be a status = "disabled"?

> +               };

The rest looks good to me, so with the above clarified:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
