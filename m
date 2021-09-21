Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF8654136AF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Sep 2021 17:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234184AbhIUPyD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Sep 2021 11:54:03 -0400
Received: from mail-vs1-f47.google.com ([209.85.217.47]:34779 "EHLO
        mail-vs1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234250AbhIUPyC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 11:54:02 -0400
Received: by mail-vs1-f47.google.com with SMTP id u8so20725350vsp.1;
        Tue, 21 Sep 2021 08:52:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VhRf8BLo/BgtklNiu/+Lm2GZe+HL9Z1Tw4HZxYLS9NY=;
        b=uTO6DoT0FItg9UMloPgHDIBnsq+KZIqE1e2yjyymj3/fC8S1Iha2EKT0gnsq5xykN9
         ZpuiSc9DiU6pvXEwlkdyiVrIYmmLWFGjcPb7nKF/tA98hsIZus3Kx/0ns0EmfXBKEI75
         kkNIF/caV2Yse9abUbhnjJp1E1Dniqnc2boJFfv8OsheOiHAnBFrB56b9Mfi24SZ5ooI
         ydjbB0YbXxHKf/tCXBncnbntojgLDPpY+9QqPIos1mCl+0WFHpF/MjgF4NeY0Jk0IA8n
         0HF6A9ncp3WYBdV37EKdCL2rAD+rpiPMOCR+3fY09UT9yYOjogy9hOlGN457ZaltS2Td
         omDw==
X-Gm-Message-State: AOAM5311bmrt+Op9OiFyKkiMk7kWkgEu3d2jgV7Pim7LunYvArJeQBVI
        K7YQST9IA5DaXuo1PY6xAUv591iBs1QpeARX8bs=
X-Google-Smtp-Source: ABdhPJw1U97Es7btXIzEvBTB2Flslq/UuPMpebXz8tM82SMpoL91rh1Q85q9WsYmi6fklcDArmKH5rDOT3Yl+0Zsgds=
X-Received: by 2002:a05:6102:2086:: with SMTP id h6mr13901355vsr.50.1632239553344;
 Tue, 21 Sep 2021 08:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210901235330.1611086-1-kieran.bingham@ideasonboard.com> <20210901235330.1611086-3-kieran.bingham@ideasonboard.com>
In-Reply-To: <20210901235330.1611086-3-kieran.bingham@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 21 Sep 2021 17:52:22 +0200
Message-ID: <CAMuHMdWdwKHF1QBrBcRcJm_9H=tpU9Adzy0Vhu15tNpGb8W4Cg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r8a779a0: Add DSI encoders
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Thu, Sep 2, 2021 at 1:53 AM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> Provide the two MIPI DSI encoders on the V3U and connect them to the DU
> accordingly.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -1161,12 +1161,72 @@ ports {
>                                 port@0 {
>                                         reg = <0>;
>                                         du_out_dsi0: endpoint {
> +                                               remote-endpoint = <&dsi0_in>;
>                                         };
>                                 };
>
>                                 port@1 {
>                                         reg = <1>;
>                                         du_out_dsi1: endpoint {
> +                                               remote-endpoint = <&dsi1_in>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               dsi0: dsi-encoder@fed80000 {
> +                       compatible = "renesas,r8a779a0-dsi-csi2-tx";
> +                       reg = <0 0xfed80000 0 0x10000>;
> +                       power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +                       clocks = <&cpg CPG_MOD 415>,
> +                                <&cpg CPG_CORE R8A779A0_CLK_DSI>;
> +                       clock-names = "fck", "dsi";

The last posted binding says you need 3 clocks?

No interrupts (yes, they're not in the bindings either)?

The rest looks good to me.

> +                       resets = <&cpg 415>;
> +                       status = "disabled";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       reg = <0>;
> +                                       dsi0_in: endpoint {
> +                                               remote-endpoint = <&du_out_dsi0>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg = <1>;
> +                                       dsi0_out: endpoint {
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
