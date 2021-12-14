Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41041474138
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Dec 2021 12:13:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbhLNLNT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Dec 2021 06:13:19 -0500
Received: from mail-ua1-f47.google.com ([209.85.222.47]:40512 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbhLNLNS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Dec 2021 06:13:18 -0500
Received: by mail-ua1-f47.google.com with SMTP id y5so34193297ual.7;
        Tue, 14 Dec 2021 03:13:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g4mI9Nyw4nQYld93EJ8iwG1Gm12PyF7hqAGNjATrF2k=;
        b=oQmhVwcjP8DHBj5X1hWdiTgRqpbnWCymFXnamalMgS4dFr9xvTF2e7h4dHrMCbLKN2
         i2zyUg04lTShH6AovIvrl5nrkfrchc2LTgYMMXD/+ldHb2Ys5rv6354OfFK/zYVKE48a
         8TYHpXbhr/BrY1hNSJS02IpQY2M0oMd8hot85ZUocpR7+sNPiYnIUGjUDA632+Jraqg5
         0dLxuG662OCjvU1siuTpUi8uop8zfNzUIzRGRv4l5T4GJ6Eur8fs0EPPbJ7XqQc5e1OT
         Zf3cHDPsdSHzRAjHSw/ZV/AoFEOvqXw82hbouy+JMrAQHTa/qmauMxtA5++IrV2Ktmcl
         AfpA==
X-Gm-Message-State: AOAM533KJfmu6/SMcaorwQ+W2xi1ytfD7RLjWX75844baQxiAA0MfSKe
        0icXpLk14lOjqCsYkVLJVkHUEfkV07Gdqw==
X-Google-Smtp-Source: ABdhPJzUYyyyz0Jk0CWeKwRnmgwO/EtYUqxJtpwDOwYiUDyHXFVihCj1LJsXZpVY7gu0MdoF7z3nuw==
X-Received: by 2002:a67:bb11:: with SMTP id m17mr3932335vsn.5.1639480397863;
        Tue, 14 Dec 2021 03:13:17 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id r2sm4279127vsk.28.2021.12.14.03.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Dec 2021 03:13:17 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id p2so34160156uad.11;
        Tue, 14 Dec 2021 03:13:17 -0800 (PST)
X-Received: by 2002:ab0:7354:: with SMTP id k20mr4235674uap.78.1639480396951;
 Tue, 14 Dec 2021 03:13:16 -0800 (PST)
MIME-Version: 1.0
References: <20211208142729.2456-1-biju.das.jz@bp.renesas.com> <20211208142729.2456-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211208142729.2456-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Dec 2021 12:13:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQkXe4-5BjZ++-kYR9J2zjyQMWaR_V6PYeEy7p6H7zDg@mail.gmail.com>
Message-ID: <CAMuHMdXQkXe4-5BjZ++-kYR9J2zjyQMWaR_V6PYeEy7p6H7zDg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a07g044: Create thermal zone
 to support IPA
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 8, 2021 at 3:27 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Setup a thermal zone driven by SoC temperature sensor.
> Create passive trip points and bind them to CPUFreq cooling
> device that supports power extension.
>
> Based on the work done by Dien Pham <dien.pham.ry@renesas.com>
> and others for r8a77990 SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

LGTM (I'm no thermal expert, so an additional pair of eyes wouldn't hurt), so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17.

> --- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> @@ -88,6 +88,7 @@
>                         compatible = "arm,cortex-a55";
>                         reg = <0>;
>                         device_type = "cpu";
> +                       #cooling-cells = <2>;
>                         next-level-cache = <&L3_CA55>;
>                         enable-method = "psci";
>                         clocks = <&cpg CPG_CORE R9A07G044_CLK_I>;
> @@ -917,6 +918,15 @@
>                         polling-delay-passive = <250>;
>                         polling-delay = <1000>;
>                         thermal-sensors = <&tsu 0>;
> +                       sustainable-power = <717>;
> +
> +                       cooling-maps {
> +                               map0 {
> +                                       trip = <&target>;
> +                                       cooling-device = <&cpu0 0 2>;
> +                                       contribution = <1024>;
> +                               };
> +                       };
>
>                         trips {
>                                 sensor_crit: sensor-crit {
> @@ -924,6 +934,12 @@
>                                         hysteresis = <1000>;
>                                         type = "critical";
>                                 };
> +
> +                               target: trip-point {
> +                                       temperature = <100000>;
> +                                       hysteresis = <1000>;
> +                                       type = "passive";
> +                               };
>                         };
>                 };
>         };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
