Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCD056E9880
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Apr 2023 17:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231553AbjDTPkV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Apr 2023 11:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbjDTPkU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Apr 2023 11:40:20 -0400
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D7BC1727;
        Thu, 20 Apr 2023 08:40:19 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id t16so2364547ybi.13;
        Thu, 20 Apr 2023 08:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682005218; x=1684597218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1CbDl2sZnXbCY7AReBr1CM3aUijWiPVhGOXUZHxRKE=;
        b=EO7Od2kM0MgMnSAJmUDP/X6Ll/jMADldzGbv9j40MLtHMqUbTkNBncjO6SmM2WWfvF
         QYN5B5vK3AZXEUzUDG6GBHEMhLywc9KgtHryValH5hlcVCDZqGwcOt6EG5QTORMrx/3Q
         WyRGoitIf7NR+W8Q9NrSO2nRB7uYhRdr3xTgdVL3svKhzjiAA8jJkB5o6i50Hh8t+Eu2
         Vc0NpwtX4K31H7ZAVxg6X+L6qF3x1pgbgl3Yu5ODPixoz542Bg5Ya9wap0HP1/neW5pH
         Iudf/G992qQom7SM1GrssvrRaSep3qd9UjhJRN0aIY11Cg809EPAUVN5nicCtH4SJlpS
         HlHw==
X-Gm-Message-State: AAQBX9fWA7J5/C424IRyDWf61Eg7BwpwFL4JXU2iuFqHCDoqXDNKmcct
        HQT/jeuz5wJVYSi7Yvm5wtn8sCJCD0B9cqch
X-Google-Smtp-Source: AKy350ZfraFBSDuTesG+HuCEdRFxv3uUxmzYQyRsqjfptlOGPsz2bwNTbHYpMkM6yCDZqUU5WpF4Wg==
X-Received: by 2002:a25:e7c6:0:b0:b92:46ac:b6eb with SMTP id e189-20020a25e7c6000000b00b9246acb6ebmr1947698ybh.20.1682005218226;
        Thu, 20 Apr 2023 08:40:18 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id d14-20020a81ab4e000000b0054f885d381esm393015ywk.135.2023.04.20.08.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 08:40:17 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-54f6a796bd0so46765127b3.12;
        Thu, 20 Apr 2023 08:40:17 -0700 (PDT)
X-Received: by 2002:a81:6fd4:0:b0:54e:ffbd:7a7e with SMTP id
 k203-20020a816fd4000000b0054effbd7a7emr1082887ywc.45.1682005216897; Thu, 20
 Apr 2023 08:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230417090159.191346-1-biju.das.jz@bp.renesas.com> <20230417090159.191346-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230417090159.191346-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 20 Apr 2023 17:40:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQ9NLra76pknQ+ASNiRVK2RWSh2jG=Ub+tZpC6uiwK6g@mail.gmail.com>
Message-ID: <CAMuHMdXQ9NLra76pknQ+ASNiRVK2RWSh2jG=Ub+tZpC6uiwK6g@mail.gmail.com>
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
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

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pmod.dtso
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the RZ/{G2L,V2L} SMARC EVK PMOD parts

Please add a comment here to document what exactly this provides.

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

Unless I'm missing something, this signal is not available on the PMOD
connector?

> +
> +               mtu3-ext-clk-input-pin {
> +                       pinmux = <RZG2L_PORT_PINMUX(48, 0, 4)>, /* MTCLKA */
> +                                <RZG2L_PORT_PINMUX(48, 1, 4)>; /* MTCLKB */
> +               };

So this provides two external clock inputs on the pins on the PMOD
connector that usually provides a UART?

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

As you disable CD functionality, don't you need to add "broken-cd" to
the sdhi1 node?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
