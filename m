Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE9B07277EA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jun 2023 08:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235085AbjFHG5q convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Jun 2023 02:57:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234755AbjFHG5n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Jun 2023 02:57:43 -0400
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 823F726BA;
        Wed,  7 Jun 2023 23:57:35 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-566586b180fso2410377b3.0;
        Wed, 07 Jun 2023 23:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686207454; x=1688799454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yg/0bGgq/+xM1eGAPXEvNBvh8k/qDoD0ZnfdAaap5UQ=;
        b=Wn7I/Aaav2FTmQ/HJ9azL0MJQjm1V1cNo0snbLszAwXhBzOSYr5Z63+4tgtvHWo5oX
         +JPe8sKDC+ZEaI3WcLkDDrR6gf0elQ5MNGbcaT7YA3DlJ4DTZxv3J/GwjG6mtM1oZiKu
         VpmEb3oOgEHeXy9sIGISYVoAoCuLWDgLvmmh+XVJmjnwH13OV/Ard3x3HUPQU79wjlO4
         X3rNfW0FSlULksPfNqFc2nxd3Ybww1XQHqWWB6YYnqgQ1jY9GYdDGWaCOk6nfEPCQhJ8
         TtRsjOnRKeBhMQC8w0s9lPgfMCchxGbDHCMzNpm5UdJQozfc1zcFhpwHbtmaqhOkNbut
         Q/iw==
X-Gm-Message-State: AC+VfDyP7aSFcjFiy1JL1/BBOdVywfL1bf1hdyKCiCYn5uTNA1SvDCON
        TMAYRaX4IujNayT1k/ej0dQRJeCsKHmX7w==
X-Google-Smtp-Source: ACHHUZ7GrYyyf2Tq8dHRTQUaNdr6PTeuKxOF4J2xzHt1lPpu16qeujlyx1Lb/JZYaNj+fomsfKqDxw==
X-Received: by 2002:a81:9209:0:b0:567:aea3:75ba with SMTP id j9-20020a819209000000b00567aea375bamr9810238ywg.4.1686207454593;
        Wed, 07 Jun 2023 23:57:34 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id h63-20020a0dc542000000b0055a777e3c50sm211541ywd.62.2023.06.07.23.57.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 23:57:33 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-565f1145dc8so2318217b3.1;
        Wed, 07 Jun 2023 23:57:33 -0700 (PDT)
X-Received: by 2002:a0d:dbc5:0:b0:55a:9b89:4eff with SMTP id
 d188-20020a0ddbc5000000b0055a9b894effmr9689801ywe.13.1686207453249; Wed, 07
 Jun 2023 23:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230417090159.191346-1-biju.das.jz@bp.renesas.com> <20230417090159.191346-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230417090159.191346-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 8 Jun 2023 08:57:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVNaBk8XV8aCpsiE1SruHNgq47e0YHrF=_H4+SbG5DVmw@mail.gmail.com>
Message-ID: <CAMuHMdVNaBk8XV8aCpsiE1SruHNgq47e0YHrF=_H4+SbG5DVmw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzg2l-smarc: Enable MTU3a
 counter using DT overlay
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Mon, Apr 17, 2023 at 11:02 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable mtu3 node using dt overlay and disable scif2 node and delete
> {sd1_mux,sd1_mux_uhs} nodes as the pins are shared with mtu3 external
> clock input pins and Z phase signal(MTIOC1A).
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/Makefile          |  2 +
>  .../boot/dts/renesas/rzg2l-smarc-pmod.dtso    | 43 +++++++++++++++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-smarc-pmod.dtso
>
> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> index f130165577a8..57727bcd1334 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -81,8 +81,10 @@ dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043-smarc-pmod.dtbo
>  dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-smarc.dtb
>  dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc.dtb
>  dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc-cru-csi-ov5645.dtbo
> +dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-smarc-pmod.dtbo
>
>  dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc.dtb
> +dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-smarc-pmod.dtbo
>
>  dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
>
> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-pmod.dtso b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pmod.dtso
> new file mode 100644
> index 000000000000..a502faf6e1ad
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pmod.dtso
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the RZ/{G2L,V2L} SMARC EVK PMOD parts
> + *
> + * Copyright (C) 2023 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> +
> +&mtu3 {
> +       pinctrl-0 = <&mtu3_pins>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +};
> +
> +&pinctrl {
> +       mtu3_pins: mtu3 {
> +               mtu3-zphase-clk {
> +                       pinmux = <RZG2L_PORT_PINMUX(19, 0, 3)>; /* MTIOC1A */
> +               };
> +
> +               mtu3-ext-clk-input-pin {
> +                       pinmux = <RZG2L_PORT_PINMUX(48, 0, 4)>, /* MTCLKA */
> +                                <RZG2L_PORT_PINMUX(48, 1, 4)>; /* MTCLKB */
> +               };
> +       };
> +};
> +
> +&scif2 {
> +       status = "disabled";
> +};
> +
> +&sdhi1_pins {
> +       /delete-node/ sd1_mux;
> +};
> +
> +&sdhi1_pins_uhs {
> +       /delete-node/ sd1_mux_uhs;
> +};

I'm afraid deleting nodes in the base DT from an overlay does not work...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
