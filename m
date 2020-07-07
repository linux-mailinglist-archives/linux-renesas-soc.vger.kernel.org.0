Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA9121698F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2020 11:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbgGGJyQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jul 2020 05:54:16 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44496 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgGGJyQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jul 2020 05:54:16 -0400
Received: by mail-oi1-f193.google.com with SMTP id k6so30516008oij.11;
        Tue, 07 Jul 2020 02:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ML+IG31NmApHhHNaAv1AOruku3M5aZvabGp/gFt0CiI=;
        b=UDObmA8OLzu6GvtTgFzJ71p+B1PQJKLQD4CCAtQmW7xJKeLDFKlN99b7NuWXBVEXWP
         7tov35AYc6oCWV5qA3nP8UelVdiNoHnTW59TKtUJS5AtYiHQVvsvEZny83RxeMcZZH/g
         X0fcJ6HRjk14kAApQLWMwEzweQak+jEa7EjG8dtR+rjH5Sgmn21V33LytLmbOt/m8V96
         0ctZeDO6rybxW0Wu0UETkv2YWoTQj2gs96RMx7+T8TEmDleziWbYzHKdJhvmc4qbCNns
         Pt7M+D/nm6KGP13KWcW5LAEcLGfgV+qA6F0S/12WlWz9EQDH9kn+wuQqcBPhnpzCcpJR
         mCmA==
X-Gm-Message-State: AOAM533dlZcVRJg3s+1ssa1d4jRisqYX6+cP3yhdl1dJYu9t00TA6/XT
        w03hHXqCWKdQG5JTVo5cdRaiKD/yX3XhdvPhSK4=
X-Google-Smtp-Source: ABdhPJzLOmIoxWl3hy3Vu0/WCWZBCG2GC2UQdRp7NKpTq9bVt9kyh+MbUhOP5PDCfKudTp36uLg5vNMsOKizoa64YCY=
X-Received: by 2002:aca:5c41:: with SMTP id q62mr2498841oib.148.1594115655102;
 Tue, 07 Jul 2020 02:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <850d4a7b-4984-eb0f-de89-e5c39d61d19e@cogentembedded.com> <322ca212-a45f-cd2c-f1eb-737f0aa42d22@cogentembedded.com>
In-Reply-To: <322ca212-a45f-cd2c-f1eb-737f0aa42d22@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Jul 2020 11:54:04 +0200
Message-ID: <CAMuHMdUPyrJqibM2jScPa0QhP+h_pEO_YQe-qtAK2mFBEP29UA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r8a77980: condor/v3hsk: add
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

On Tue, May 19, 2020 at 10:14 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Define the Condor/V3HSK board dependent parts of the RPC-IF device node.
> Add device nodes for Spansion S25FS512S SPI flash and MTD partitions on it.
>
> Based on the original patches by Dmitry Shifrin.
>
> Signed-off-by: Dmitry Shifrin <dmitry.shifrin@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.9.

However, one question below...

> --- renesas-devel.orig/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> +++ renesas-devel/arch/arm64/boot/dts/renesas/r8a77980-condor.dts

> @@ -273,6 +278,68 @@
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

Why no "spi-tx-bus-width = <4>;"? Same for V3HSK.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
