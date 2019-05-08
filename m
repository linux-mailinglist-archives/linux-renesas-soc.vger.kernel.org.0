Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA1A317A53
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 15:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727978AbfEHNUQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 09:20:16 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:43362 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727453AbfEHNUQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 09:20:16 -0400
Received: by mail-ua1-f65.google.com with SMTP id 94so5088056uaf.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 May 2019 06:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vxge8c0Vxi1T7nYlAa9OeuDqJOUYQ8h5Blla0Ehqg7E=;
        b=Iq7fXlnSwrq4/Fm0nyx6mRFJ0advACBnk0slGtI2vYkX2GUhSIP5HWnwGzSO4iE0vG
         YqH9C6g4FSBfNA7zN7YKrz5dYX8Bbirb5PxJHfe4sxUtv3bSjA3cb5PObEIARJUOEcNj
         /O95jq+meUacKMYEOXCVJQSaYqSQcJbx8kIGyeyILTpiIrTm4bv7je4+fmXkqhu40Cb/
         c5tWl4D08elI07NgB0534wWPoEpQrhhR5OWryEtGlabRl0cnuUDd9ecRcjh6TqD0yP7l
         zWiPJ9ovct9fgLhfSTlvtHv/L6d5miCX6ROABsLiLwql/mB93gdC1qjd87orqfvRm2Rd
         Bkig==
X-Gm-Message-State: APjAAAX8KQHyPXdQmX33c7E2vbGwEsqOGkgZmJejipZ1E55HuOQs9uLi
        GdOhhJrB0HADUQlyl77IEjBLdu3ZDom90a6VZB6nC81d
X-Google-Smtp-Source: APXvYqy+09oDA6eSEwjGV6Rz9PrI3l7+/XyTg9qu8kZL5oMBtXA2c1sxJqcGdTAXRBoweyGt8q0Y42wLZllZYVVloJY=
X-Received: by 2002:ab0:d89:: with SMTP id i9mr19771477uak.96.1557321615237;
 Wed, 08 May 2019 06:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190508115605.13726-1-horms+renesas@verge.net.au>
In-Reply-To: <20190508115605.13726-1-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 May 2019 15:20:03 +0200
Message-ID: <CAMuHMdX3YW0NaDXvN1WjWeNrCH366LALa3UT41REqAHNJk-9JA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a7795: Create thermal zone to
 support IPA
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

Thanks for your patch!

On Wed, May 8, 2019 at 1:56 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> From: Dien Pham <dien.pham.ry@renesas.com>
>
> Setup a thermal zone driven by SoC temperature sensor.
> Create passive trip points and bind them to CPUFreq cooling
> device that supports power extension.
>
> In R-Car Gen3, IPA is supported for only one channel
>  (on H3/M3/M3N board, it is channel THS3). Reason:
>   Currently, IPA controls base on only CPU temperature.
>   And only one thermal channel is assembled closest
>   CPU cores is selected as target of IPA.
>   If other channels are used, IPA controlling is not properly.
>
> The device supports 5 cooling states which can be categorised as follows:
>
> 0 & 1) boost (clocking up)
> 2)     default
> 3 & 4) cooling (clocking down)
>
> Currently the thermal framework assumes that the default is the minimum,
> or in other words there is no provision for handling boost states.
> So this patch only describes the upper 3 states, default and cooling.
>
> A single cooling device is described for all A57 CPUs as this
> reflects that physically there is only one cooling device present.
>
> This patch improves on an earlier version by:
>
> * Omitting cooling-max-level and cooling-min-level properties which
>   are no longer present in mainline as of v4.17
> * Removing an unused trip-point0 node sub-property from the trips
>   property.
> * Using cooling-device indexes such that maximum refers to maximum cooling
>   rather than the inverse.
>
> The long signed-off by chain below reflects many revisions, mainly
> internal, that this patch has been through.
>
> Signed-off-by: Keita Kobayashi <keita.kobayashi.ym@renesas.com>
> Signed-off-by: Gaku Inami <gaku.inami.xw@bp.renesas.com>
> Signed-off-by: Hien Dang <hien.dang.eb@rvc.renesas.com>
> Signed-off-by: An Huynh <an.huynh.uj@rvc.renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> Signed-off-by: Simon Horman <simon.horman@netronome.com>

Did you intend to use this SoB value?

> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -155,6 +155,7 @@
>                         power-domains = <&sysc R8A7795_PD_CA57_CPU0>;
>                         next-level-cache = <&L2_CA57>;
>                         enable-method = "psci";
> +                       dynamic-power-coefficient = <854>;

The dynamic-power-coefficient property is a property of the CPU,
documented in Documentation/devicetree/bindings/arm/cpus.yaml,
and not directly related to thermal zones.

Hence I think its addition should be done in a separate patch.

>                         clocks = <&cpg CPG_CORE R8A7795_CLK_Z>;
>                         operating-points-v2 = <&cluster0_opp>;
>                         capacity-dmips-mhz = <1024>;
> @@ -207,6 +208,8 @@
>                         power-domains = <&sysc R8A7795_PD_CA53_CPU0>;
>                         next-level-cache = <&L2_CA53>;
>                         enable-method = "psci";
> +                       #cooling-cells = <2>;
> +                       dynamic-power-coefficient = <277>;

Likewise.

>                         clocks = <&cpg CPG_CORE R8A7795_CLK_Z2>;
>                         operating-points-v2 = <&cluster1_opp>;
>                         capacity-dmips-mhz = <535>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
