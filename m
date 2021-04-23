Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE50368FF7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Apr 2021 12:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbhDWKBg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Apr 2021 06:01:36 -0400
Received: from mail-vs1-f54.google.com ([209.85.217.54]:35776 "EHLO
        mail-vs1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbhDWKBf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Apr 2021 06:01:35 -0400
Received: by mail-vs1-f54.google.com with SMTP id g20so24382630vst.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Apr 2021 03:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3mdPITiGyNQKtY+bn/TrJgLhjE0h+E3CGLWoEkiVycE=;
        b=razc3XCcUeK839JLEcFtPXOMaEnHS0+cPlM7qlIBeW/w/Jayt7Rt7MxG/GnieBPdcL
         uni+c+WqTUu4SEuoS5Yi7Y2kTDNCtuo102sJQo9qe+/wDGqXeMSsJUsF8yDSPM4W8Lb9
         fLLcoYsIdVyjTxcKKlL81tNsDei3Ul5TclfWw+dB8fh6FyKk9Fx6GzcSjAN8PnJh56dj
         JcuZvn6xH+5CiC57CG5UENIzHVF6qFJlHAnWGHn5WR3cEXcyzDX8dA4KwUhQm31FK3Je
         fq/8EQoJiQoxlFzWSGTgcTyxiC+p3JRiiemYfmUi8IeTtXTua3SICSnSgoMzZEOlK+xb
         EzUQ==
X-Gm-Message-State: AOAM531iZziUspyG7nM38rdV7giJnlRD9Bo1rSA9bMcx0/nefv7h01Xh
        oaIbsDAvD98hLP0LAz5vJmyhKBBo+4PZjorbIczsrBeQ
X-Google-Smtp-Source: ABdhPJzez11TTI2NzkkIw+mf2mxVxQAQYfrgAC9NY/C3YIdVql4SVF5UGqXlz64pZad69vn/bKoUDxI9qomtqIWuAYg=
X-Received: by 2002:a67:8745:: with SMTP id j66mr2485068vsd.18.1619172058907;
 Fri, 23 Apr 2021 03:00:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210413184844.2606086-1-niklas.soderlund+renesas@ragnatech.se> <20210413184844.2606086-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20210413184844.2606086-2-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Apr 2021 12:00:47 +0200
Message-ID: <CAMuHMdVtqf_32zE7GPA17OWTv63ovMma9xGFQ-FZP33OgbqEew@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a779a0: Add and connect all
 CSI-2, ISP and VIN nodes
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 13, 2021 at 8:49 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The V3U have 32 VIN, 4 CSI-2 and 4 ISP nodes that interact with each
> other for video capture. Add all nodes and record how they are
> interconnected.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> @@ -1137,6 +2001,415 @@ vspd1: vsp@fea28000 {
>                         renesas,fcp = <&fcpvd1>;
>                 };
>
> +               csi40: csi2@feaa0000 {
> +                       compatible = "renesas,r8a779a0-csi2";
> +                       reg = <0 0xfeaa0000 0 0x10000>;
> +                       interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 331>;
> +                       power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +                       resets = <&cpg 331>;
> +                       status = "disabled";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +

Missing required port@0.
Same for the other CSI nodes.

> +                               port@1 {
> +                                       reg = <1>;
> +                                       csi40isp0: endpoint {
> +                                               remote-endpoint = <&isp0csi40>;
> +                                       };
> +                               };
> +                       };
> +               };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
