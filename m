Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A20E4136DB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Sep 2021 18:00:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234372AbhIUQBO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Sep 2021 12:01:14 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:36700 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234373AbhIUQBE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 12:01:04 -0400
Received: by mail-vs1-f53.google.com with SMTP id h30so8779199vsq.3;
        Tue, 21 Sep 2021 08:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mTJZgRpQCXW35Rxvt9ZGI3fck6n1VBcSO8z5XwjCQEY=;
        b=2BbEIx6A/1/cug/wakdaI14vhJDAVa7NWDs05Ndf05M/vDq+tbzctgVCmuWZ3Ya2E4
         EzZ1G7x0LhAz1Ybf+zPRuNXYZecBAdBosZ7d1AXZyqDG2MrbWU5HWfpHjEEH7T+PrHUS
         VxsjTJ9ht+8YqbD/Qw1ODCN4RA6lBN5zg5vpGUgpuPLn7xf3ZTocO4fXiugoKsJsvnxX
         CqcWGSPSV2lB9OosHFltYAytOK8rJbaUGMxO0OCQrMfqzY52WFGYd8bB2yTa9844W71z
         EKLJoGBgChivIfuiktqC3C1Ra0oOp9mVDdunRgPtk6q1t+wssCrbY3ILXgMY8aJTrlrK
         XD7A==
X-Gm-Message-State: AOAM531katc+AXcFRXdSCRup4XKm2haMBUQJ/JsAipJej9EFsex151Ra
        HLMphJWAqCInAZSnCP2zP4Zp8uwt44URuaSqeg4=
X-Google-Smtp-Source: ABdhPJxGk+ZNAOK4RBRiV2IzpsOAK6PbKaCelOzB5jSrZCZBiBVoZTnMHFDNeaB0VyOmBwe1DOacP03WrEAzuNEPy2M=
X-Received: by 2002:a67:cc1c:: with SMTP id q28mr20464519vsl.37.1632239975914;
 Tue, 21 Sep 2021 08:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210901235330.1611086-1-kieran.bingham@ideasonboard.com> <20210901235330.1611086-4-kieran.bingham@ideasonboard.com>
In-Reply-To: <20210901235330.1611086-4-kieran.bingham@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 21 Sep 2021 17:59:24 +0200
Message-ID: <CAMuHMdU5WzvdfeSqEESt0r7_7XX0Mc9jRNGCBHLtt_JCMCWZyw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: falcon-cpu: Add DSI display output
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
> Provide the display output using the sn65dsi86 MIPI DSI bridge.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
> @@ -66,6 +66,15 @@ memory@700000000 {
>                 reg = <0x7 0x00000000 0x0 0x80000000>;
>         };
>
> +       reg_1p2v: regulator-1p2v {
> +               compatible = "regulator-fixed";
> +               regulator-name = "fixed-1.2V";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +       };
> +
>         reg_1p8v: regulator-1p8v {
>                 compatible = "regulator-fixed";
>                 regulator-name = "fixed-1.8V";
> @@ -83,6 +92,46 @@ reg_3p3v: regulator-3p3v {
>                 regulator-boot-on;
>                 regulator-always-on;
>         };
> +
> +       mini-dp-con {
> +               compatible = "dp-connector";
> +               label = "CN5";
> +               type = "mini";
> +
> +               port {
> +                       mini_dp_con_in: endpoint {
> +                               remote-endpoint = <&sn65dsi86_out>;
> +                       };
> +               };
> +       };
> +
> +       sn65dsi86_refclk: sn65dsi86-refclk {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <38400000>;
> +       };
> +};
> +
> +&dsi0 {
> +       status = "okay";
> +
> +       clocks = <&cpg CPG_MOD 415>,
> +                <&cpg CPG_CORE R8A779A0_CLK_DSI>,
> +                <&extal_clk>;
> +       clock-names = "fck", "dsi", "extal";

Ah, that's where the third clock was hiding ;-)

Is this hardwired to extal, or board-specific?
In case of the former, I think it should be moved to the .dtsi.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
