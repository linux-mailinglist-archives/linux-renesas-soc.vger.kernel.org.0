Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D85454A9816
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Feb 2022 11:59:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345534AbiBDK7t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Feb 2022 05:59:49 -0500
Received: from mail-ua1-f50.google.com ([209.85.222.50]:36595 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346009AbiBDK7t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Feb 2022 05:59:49 -0500
Received: by mail-ua1-f50.google.com with SMTP id 35so1308758uau.3;
        Fri, 04 Feb 2022 02:59:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WceRl2o8PtMwWvfIKtRE+jHAJt8L4PqeW5zWHmyyUts=;
        b=fxp8BFMF6PT8l3QHH5sGJ/oAHd/S2BnWFTmgR+juwoXq8IUKp2DXdgQ6vl765rN1nW
         Wup+KLbgAfshrjFgLeKdzFJflUGBuxkFG+c3hq6We/2n/aY7HjAa8y5ru02kETZbv4uU
         SNZ42oVnAcrAAVREcUqDHd4azUOfooUaNvbuwn4hKa+3yNrvNHfK2eYf395fVlm7l3j/
         1wQlojn1hwim7XwNWF52J9wz1XywnaCUOH8tb40WgJZbnlCnY/ecMmcpIadNCdLH50eI
         mpFAmPSYzegM2IC1WM1athTX+MlzgE4ke1oHei3NqDEoG2HcSM1SrTucoXUsRuspUUHw
         Vmeg==
X-Gm-Message-State: AOAM532RpmMM4JzXDjPsUsp6+atOCyZlaqo62kqnLlyNDOU//XyRPHYm
        Q9vOS4Pi1F5T3BnlQTqSVKQvFF2RmQxADw==
X-Google-Smtp-Source: ABdhPJy6ssYP10Ldz9ixK0FZxbJ75UNcUR5kLBTmqlBsZQRSwMdszf+FfDfLPQoDZPpI7thZbax9KA==
X-Received: by 2002:ab0:3011:: with SMTP id f17mr699629ual.94.1643972388722;
        Fri, 04 Feb 2022 02:59:48 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id n67sm384500vkf.41.2022.02.04.02.59.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Feb 2022 02:59:48 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id p7so10142788uao.6;
        Fri, 04 Feb 2022 02:59:48 -0800 (PST)
X-Received: by 2002:a67:fd63:: with SMTP id h3mr652597vsa.77.1643972388054;
 Fri, 04 Feb 2022 02:59:48 -0800 (PST)
MIME-Version: 1.0
References: <20220203170636.7747-1-biju.das.jz@bp.renesas.com> <20220203170636.7747-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220203170636.7747-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 4 Feb 2022 11:59:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWV0dwgRoq=X7bKy230AU1O7QuuaHkv82+eeJQf38154w@mail.gmail.com>
Message-ID: <CAMuHMdWV0dwgRoq=X7bKy230AU1O7QuuaHkv82+eeJQf38154w@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] arm64: dts: renesas: rzg2lc-smarc: Add macros for
 DIP-Switch settings
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Feb 3, 2022 at 6:06 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RZ/G2LC SoM uses DIP-SWitch SW1 for various pin multiplexing functions.
>
> This patch describes DIP-SWitch SW1 settings on SoM and adds the
> corresponding macros for enabling pinmux functionality on RZ/G2LC
> SMARC EVK.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.18.

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/G2LC SMARC EVK parts
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> +
> +/*
> + * DIP-Switch SW1 setting on SoM
> + * 1 : High; 0: Low
> + * SW1-2 : SW_SD0_DEV_SEL      (1: eMMC; 0: uSD)
> + * SW1-3 : SW_SCIF_CAN         (1: CAN1; 0: SCIF1)
> + * SW1-4 : SW_RSPI_CAN         (1: CAN1; 0: RSPI1)
> + * SW1-5 : SW_I2S0_I2S1                (1: I2S2 (HDMI audio); 0: I2S0)
> + * Please change below macros according to SW1 setting
> + */
> +
> +#define SW_SCIF_CAN    0
> +#if (SW_SCIF_CAN)
> +/* Due to HW routing, SW_RSPI_CAN is always 0 when SW_SCIF_CAN is set to 1 */
> +#define SW_RSPI_CAN    0
> +#else
> +/* Please set SW_RSPI_CAN. Default value is 1 */
> +#define SW_RSPI_CAN    1
> +#endif
> +
> +#if (SW_SCIF_CAN & SW_RSPI_CAN)
> +#error "Can not set 1 to both SW_SCIF_CAN and SW_RSPI_CAN due to HW routing"
> +#endif

Would it make sense to have a macro for SW_SD0_DEV_SEL, too, or is
there a special reason to keep the separate EMMC and SDHI macros?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
