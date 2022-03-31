Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA4A4EDA7F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Mar 2022 15:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235041AbiCaN3z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Mar 2022 09:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232708AbiCaN3y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Mar 2022 09:29:54 -0400
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96A333EB92;
        Thu, 31 Mar 2022 06:28:07 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id 10so21358761qtz.11;
        Thu, 31 Mar 2022 06:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SEK65c0rmqlDEgPee+rLVfUuEb48b9lkZpIYefao/sM=;
        b=uH9fiDxvCYW2KTpJ6M+ydmQdQjoJ/7u/61qWHUeXqRhoXcF6IfIfriPJklpBOULrUD
         YY6XbXex9K0dvRCwIUSPmHLkQS5+JZ1aZh6sqfD+Nqqv+SoDsn51uKqj7IOvxSFIGSVH
         R1Buuwlr5+Fy325k7JxiF0bQ5wtuc3CFMlCusFILCPR7eHr04uX/m/LDYTUYylT9V3aI
         dWSrzireOYAHgwyO/ynpY1OTY1h21OOjRD/LOXn/lrjS3kD8xOw5pZun+Lrsg1QhN6ZA
         +uIGP+XXnfVTLt23CHAMxXtlYpmy/0kcPwxTCgZmLnslp8ibBuhXIqlovH1KoNIa41W4
         5Q2Q==
X-Gm-Message-State: AOAM532tbJd0I705f0pxW5WKF51Angf7aW/mQLrPRKOoagju/cK6avhv
        NucW73t2iiiNKL/dnXAj7io6Bof2l6Bn1A==
X-Google-Smtp-Source: ABdhPJwpob/pOogJiNdUm/VcUJbZL89P5dCWgNmXgPQVFsdaqC9QSZrk/U1JPZvVmfXRzaaiP6Tu6w==
X-Received: by 2002:a05:622a:110:b0:2e1:f084:d855 with SMTP id u16-20020a05622a011000b002e1f084d855mr4234209qtw.198.1648733286177;
        Thu, 31 Mar 2022 06:28:06 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id a9-20020ac85b89000000b002e2072c9dedsm20804515qta.67.2022.03.31.06.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Mar 2022 06:28:05 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id f38so42318359ybi.3;
        Thu, 31 Mar 2022 06:28:05 -0700 (PDT)
X-Received: by 2002:a25:45:0:b0:633:96e2:2179 with SMTP id 66-20020a250045000000b0063396e22179mr4187759yba.393.1648733285221;
 Thu, 31 Mar 2022 06:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220315155919.23451-1-biju.das.jz@bp.renesas.com> <20220315155919.23451-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220315155919.23451-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Mar 2022 15:27:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWWBaVHaQ8AiBOSdmcBLcXS=5-Rocx_rn-Et=jCWkXdw@mail.gmail.com>
Message-ID: <CAMuHMdWWWBaVHaQ8AiBOSdmcBLcXS=5-Rocx_rn-Et=jCWkXdw@mail.gmail.com>
Subject: Re: [PATCH 2/7] arm64: dts: renesas: rzg2ul-smarc: Add scif0 and
 audio clk pins
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
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Tue, Mar 15, 2022 at 4:59 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add scif0 and audio clk pins to soc pinctrl dtsi and drop deleting

Serial and audio: sounds (pun intended) like a strange combination? ;-)

> the pinctrl-0 and pinctrl-names properties for scif0 node so that
> we now actually make use of these properties for scif0.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

LGTM...

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/G2UL SMARC pincontrol parts
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> +
> +&pinctrl {
> +       pinctrl-0 = <&sound_clk_pins>;
> +       pinctrl-names = "default";
> +
> +       scif0_pins: scif0 {
> +               pinmux = <RZG2L_PORT_PINMUX(6, 4, 6)>, /* TxD */
> +                        <RZG2L_PORT_PINMUX(6, 3, 6)>; /* RxD */

... but I cannot review the pin muxing yet, due to lack of documentation
(SOM schematics).

> +       };
> +
> +       sound_clk_pins: sound_clk {
> +               pins = "AUDIO_CLK1", "AUDIO_CLK2";
> +               input-enable;
> +       };
> +};


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
