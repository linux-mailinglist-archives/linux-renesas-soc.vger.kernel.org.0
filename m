Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4492D19A8C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2020 11:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732158AbgDAJml (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Apr 2020 05:42:41 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41930 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731544AbgDAJml (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Apr 2020 05:42:41 -0400
Received: by mail-ot1-f68.google.com with SMTP id f52so25240221otf.8;
        Wed, 01 Apr 2020 02:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9NFB4A2CPVwSz9Sg1U5/CRoks4HY24v+VcMc1LJYhlA=;
        b=p1WRaOvxvULH8ETXZWUa2OKQudPCObw8EmvnL7gmHglr6xirhDFra5OFJqOh4iP94/
         l3YFXm2BRljkuXohvkeRMQMMo1k9wohT5Ds3OEShcqfs7hkXHJkfd1YTtJq5X2+hxgNM
         V19sT2eM4pcmDr24KvWP//l6XaJ3YCKyNSaXcxp3AbUxXAJJVS3667eziHptQVg9UTTA
         1QWlQ0FbZ7BEkgvdMh+OQzhGKSmbHW4Npte2e5mcE17pnkDQl0gvrOk1cNiHU7hnXdr3
         pgomRw8EREWcbAk6LY89/zI2J0iRb9/7B7U+NkRqq7pW9t1x2zrEWgTmODmbY3hKvEzR
         voIg==
X-Gm-Message-State: ANhLgQ3z56mS8WqiuuPgVFSXvAV/nGlVIbNOJJiuZjdfH4+WNKZDXSP/
        bsknkJyGroQeuT6wXsN/Q9EwjXMATaAlXUeEeV0=
X-Google-Smtp-Source: ADFU+vvaJkvIXHbATb21lCcc0MJLscOCEDsiXUahQfh8sCQeWQkEkYa7KZWVyEhPq2xVAduTUBjZdSJVtLeQCzJ8nlk=
X-Received: by 2002:a9d:7590:: with SMTP id s16mr16100426otk.250.1585734160600;
 Wed, 01 Apr 2020 02:42:40 -0700 (PDT)
MIME-Version: 1.0
References: <1584886352-4132-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1584886352-4132-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 1 Apr 2020 11:42:29 +0200
Message-ID: <CAMuHMdXhi_1rxpB3zXO+KwtY+36dh+_O8NqVfyLs5mU1+Vy6Og@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a774c0-cat874: Add support for
 AISTARVISION MIPI Adapter V2.1
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Sun, Mar 22, 2020 at 3:13 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> This patch adds support for AISTARVISION MIPI Adapter V2.1 board connected
> to G2E board. Common file aistarvision-mipi-adapter-2.1.dtsi is created
> which have the camera endpoint nodes for imx219 and ov5645 so that this can
> be re-used with other G2x platforms.
>
> r8a774c0-ek874-mipi-2.1.dts file enables the required VIN/CSI nodes and by
> default ties ov5645 camera endpoint to CSI2.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Changes for v2:
>  * Dropped #{address,size}-cells
>  * Dropped unit address and reg for port

Thanks for the update!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
> @@ -0,0 +1,75 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the Silicon Linux RZ/G2E 96board platform (CAT874)
> + * connected with aistarvision-mipi-v2-adapter board
> + *
> + * Copyright (C) 2020 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include "r8a774c0-ek874.dts"
> +#define MIPI_PARENT_I2C i2c3
> +#include "aistarvision-mipi-adapter-2.1.dtsi"
> +
> +/ {
> +       model = "Silicon Linux RZ/G2E evaluation kit EK874 (CAT874 + CAT875) with aistarvision-mipi-v2-adapter board";
> +       compatible = "si-linux,cat875", "si-linux,cat874", "renesas,r8a774c0";
> +};
> +
> +&i2c3 {
> +       status = "okay";
> +};
> +
> +&vin4 {
> +       status = "okay";
> +};
> +
> +&vin5 {
> +       status = "okay";
> +};
> +
> +&csi40 {
> +       status = "okay";
> +
> +       ports {
> +               port {
> +                       csi40_in: endpoint {
> +                               clock-lanes = <0>;
> +                               data-lanes = <1 2>;
> +                               remote-endpoint = <&ov5645_ep>;
> +                       };
> +               };
> +       };
> +};
> +
> +&ov5645 {
> +       enable-gpios = <&gpio5 5 GPIO_ACTIVE_HIGH>;
> +       reset-gpios = <&gpio5 3 GPIO_ACTIVE_LOW>;
> +
> +       clocks = <&cpg CPG_MOD 716>;

I'm still a bit puzzled here.

CPG_MOD 716 is the CSI40 module clock, which runs at 25 MHz, and is
presumably output to the CSI0_CLKP/N pair? Or is its rate controlled
by the CSI driver?
On the MIPI board[*], that signal becomes MIPI1_CP/N.
However, the MIPI board also has a "Clock Source Selection" header,
which allows you to choose one of:
  1. The fixed 24 MHz crystal, which is apparently used for the imx219
     camera, as described by imx219_clk above, and matches the wanted
     clock rate specified below?
  2. CSI1_CLK,
  3. CSI2_CLK.
The last two become CLK0/1 on the CAT874 board, which are driven by
TPU0TO0/1.

Which setting do you use for the ov5645 camera?

> +       clock-frequency = <24000000>;

After your patch for the ov5645 driver, this should be replaced by
assigned-clock-rates?

The rest looks good to me, but I'm not a multi-media/camera expert.

[*] https://github.com/Kevin-WSCU/96Boards-Camera

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
