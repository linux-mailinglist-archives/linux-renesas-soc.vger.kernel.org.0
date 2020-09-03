Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF5AA25C0DE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Sep 2020 14:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgICMXF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Sep 2020 08:23:05 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:42161 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728788AbgICMUo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 08:20:44 -0400
Received: by mail-oi1-f193.google.com with SMTP id x14so2883154oic.9;
        Thu, 03 Sep 2020 05:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b0ZpySPy7yqyV6pHx8W2hSYMz0jzeiFIxsxLxJiD2v0=;
        b=UreiSPv7jZpNexLepp754X/0i2pAh15YPG19kwE7alEtsHrxNuYvoI8WInwIlZvy0e
         Wft4K/5FHIt3yhrwAoTyFV1iD5cjHqtVCxrcWe/64qYXxAWCCJcxEJdUY0cqfVX0YTpj
         A3srpaz9YJSNp4Y0d5khGw9B6hoEgRuwlETmQFztjU2sjq+D4JabnDcXDAHPABqGG9mu
         2N9KMJr7bGPIhvGioUJi57XY9CdXU8lL7N4j+Tfwkr1HAk0f3DdzFrjhmgRAn2ngO58r
         vA2+hqKzjo8BSOa/xSACr1o2oU3POrKjyVUB5wrZzi0W54ytu466LhR26SxtwwZin63e
         68WQ==
X-Gm-Message-State: AOAM531pQsFVbQndflilVDV8gHW/rCG+nGeY9leZMpvsTcxtI7+acgvn
        VZaW/zCCR2mElVn9r2xy6eA/CmboFMViy8UcKt0=
X-Google-Smtp-Source: ABdhPJzi0RqG44kBfG7yCJKST/WW8DdmYKQRVvygPG19xSbPCTmfEGN6JDpJovKl1yQPxiTTd5NyotNlR35Bf088kaU=
X-Received: by 2002:aca:b742:: with SMTP id h63mr1755272oif.148.1599135622590;
 Thu, 03 Sep 2020 05:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200825162718.5838-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200825162718.5838-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200825162718.5838-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Sep 2020 14:20:11 +0200
Message-ID: <CAMuHMdXkGBfwNOwd5-=U3wg6U0O+3BErbXuybbuytgzsCmZqRQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: r8a7742-iwg21d-q7: Enable SD2 LED indication
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Tue, Aug 25, 2020 at 6:28 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add support for LED trigger on SD2 interface.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

> --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> @@ -63,6 +63,16 @@
>                 enable-gpios = <&gpio3 11 GPIO_ACTIVE_HIGH>;
>         };
>
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               sdhi2_led {
> +                       label = "sdio-led";
> +                       gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;

GPIO_ACTIVE_HIGH?

The LED is driven by an NPN transistor, with the LED between 3.3V and
the transistor's collector.

> +                       linux,default-trigger = "mmc1";
> +               };
> +       };
> +
>         lvds-receiver {
>                 compatible = "ti,ds90cf384a", "lvds-decoder";
>                 vcc-supply = <&vcc_3v3_tft1>;

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
