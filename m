Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E78E216992
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2020 11:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728149AbgGGJy3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jul 2020 05:54:29 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:42157 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgGGJy3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jul 2020 05:54:29 -0400
Received: by mail-oi1-f196.google.com with SMTP id t4so16583540oij.9;
        Tue, 07 Jul 2020 02:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oRQPEZclk2p+vUqZ5x7KplALV6qN8KF09BgwCnIt7ds=;
        b=EOXiUlQXuR0/sgxzwtU4C0M8TpaVctXRpDfBZwRbCD7CkpU13epFBRvxUtTbc100Cb
         igUN/QPEZVqPxkhiOsEn5mzqx3cJh8Lz95J2M+4UiG6W7uokB4bV/0lLD1O1XHoz86c8
         20l+Qrgn9k5CNlCSXoIt1rXdYFs+8p1Ck1PGQm1GT2KvExuZa3ROq+3vMwphek3uJ0Fw
         XQqIrIeaguqG+3MndX9UyqMXZSG7ta+7J3qBrs6YhOguxOInIZg6aeJGikzxPD1t8wpf
         biETYhiN7dUgecJSUsmbOIgftJmkZ0bc87fOv+EvmeL4Wv441iz9LJNM5puvbp7X2tPd
         4leg==
X-Gm-Message-State: AOAM532kELv0Xx/kV2HHRqpgyJS52HsiY4dP0/lFkZnJCSZeMpsFW64P
        Y+L/PFqRh9ykClPeBzeAguq5VELwJQKNFiOXDKI=
X-Google-Smtp-Source: ABdhPJy5HUj28BOj4+XrkqQnBHQ7+cryKtw8O9TAqRGosaPgnKZTEddk9tadxQyInqHgBk3/TfHZAtHxPF50JAJAQwY=
X-Received: by 2002:a05:6808:64a:: with SMTP id z10mr2645680oih.54.1594115668145;
 Tue, 07 Jul 2020 02:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <13425133-eedf-081f-4ed7-cd9012ce7d6d@cogentembedded.com> <fca1d012-29bf-eead-1c0d-4dd837c0bc68@cogentembedded.com>
In-Reply-To: <fca1d012-29bf-eead-1c0d-4dd837c0bc68@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Jul 2020 11:54:14 +0200
Message-ID: <CAMuHMdX1nguBr3ARDcRL9JCxL=mCGr7PC_65EerSkpXd8tVkjQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r8a77980: eagle/v3msk: add
 QSPI flash support
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergei,

On Fri, Jun 19, 2020 at 10:22 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Define the Eagle/V3MSK board dependent parts of the RPC-IF device node.
> Add device nodes for Spansion S25FS512S SPI flash and MTD partitions on it.
>
> Based on the original patches by Dmitry Shifrin.
>
> Signed-off-by: Dmitry Shifrin <dmitry.shifrin@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.9, with the subject fixed.

However, one question below...

> --- renesas-devel.orig/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> +++ renesas-devel/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> @@ -187,12 +187,79 @@
>                 function = "i2c0";
>         };
>
> +       qspi0_pins: qspi0 {
> +               groups = "qspi0_ctrl", "qspi0_data4";
> +               function = "qspi0";
> +       };
> +
>         scif0_pins: scif0 {
>                 groups = "scif0_data";
>                 function = "scif0";
>         };
>  };
>
> +&rpc {
> +       pinctrl-0 = <&qspi0_pins>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +
> +       flash@0 {
> +               compatible = "spansion,s25fs512s", "jedec,spi-nor";
> +               reg = <0>;
> +               spi-max-frequency = <50000000>;
> +               spi-rx-bus-width = <4>;

Why no "spi-tx-bus-width = <4>;"? Same for V3MSK.
If there's no good reason to omit it, I'll add it when applying.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
