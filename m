Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D75E628473
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Nov 2022 16:54:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237264AbiKNPyv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Nov 2022 10:54:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237261AbiKNPyr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 10:54:47 -0500
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2ED02E9E0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 07:54:46 -0800 (PST)
Received: by mail-qv1-f41.google.com with SMTP id n18so7987292qvt.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 07:54:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JYAT0bxIHFk075z5zPn3dFGsqpa+QenBzaUQ8pTdheQ=;
        b=3ORJuJqhA6lnzfJAUBranMj2R2X4TofdBJRwQr5KaeNhTlAd0ASFR/U9TZ2swxghWi
         xGM4YWOctbeYIYm9C4mwTd9P9pKQ/FIIEnR32MkVMh0H4AD9ed4DFgL/ppaxqgcp0/Iq
         3zpDv7xq5W5mQcA1mbqlM4obiNYr3k4E7iDvzgjRpMrsNdciH5HVSLk/5Fxd0omZVCX2
         sFV17fxjKfNoPJNw60AdO278tNG/HDx509uXMnhiQQ1zqAKmWpCbsqHDohIwzD5wr9TJ
         0Q2Mrf0GNgy+30Y1H+gm2tRYgb3V2gzzg/g+00w7vbgiCAZZuSDjVf5i0WnqQnhOXVNH
         O9VQ==
X-Gm-Message-State: ANoB5pkex9Ii/A/CvUaRuPAe3s/FkSzXskz2Nuo3B6lVz1RCevDpoGAK
        qkdOGLEx8rOvn+o69g3vL2KHDJYcDv0Qbg==
X-Google-Smtp-Source: AA0mqf7frGkThKoXuiJXUvqq4yxPz0jANnY/m2jKHPaGQAgNu3molayhyv3cNWOicSVG7hmwlrqn3A==
X-Received: by 2002:a05:6214:18ec:b0:4bb:7ad8:deae with SMTP id ep12-20020a05621418ec00b004bb7ad8deaemr13032552qvb.92.1668441285699;
        Mon, 14 Nov 2022 07:54:45 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id fg20-20020a05622a581400b003a5c60686b0sm5491942qtb.22.2022.11.14.07.54.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 07:54:45 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-370547b8ca0so110829137b3.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 07:54:45 -0800 (PST)
X-Received: by 2002:a81:a085:0:b0:37e:6806:a5f9 with SMTP id
 x127-20020a81a085000000b0037e6806a5f9mr8295438ywg.47.1668441285150; Mon, 14
 Nov 2022 07:54:45 -0800 (PST)
MIME-Version: 1.0
References: <20221110131630.3814538-1-yoshihiro.shimoda.uh@renesas.com> <20221110131630.3814538-2-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20221110131630.3814538-2-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Nov 2022 16:54:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVQLJMmzXFmqrEyew30K8qjn6=mE1bDwb17UCw7JuBEXA@mail.gmail.com>
Message-ID: <CAMuHMdVQLJMmzXFmqrEyew30K8qjn6=mE1bDwb17UCw7JuBEXA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] arm64: dts: renesas: r8a779f0: Add Ethernet Switch
 and SERDES nodes
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Thu, Nov 10, 2022 at 2:16 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add Ethernet Switch and SERDES nodes into R-Car S4-8 (r8a779f0).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

LGTM, but...

> --- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi

> @@ -651,6 +661,105 @@ ufs: ufs@e6860000 {
>                         status = "disabled";
>                 };
>
> +               rswitch: ethernet@e6880000 {
> +                       compatible = "renesas,r8a779f0-ether-switch";
> +                       reg = <0 0xe6880000 0 0x20000>, <0 0xe68c0000 0 0x20000>;
> +                       reg-names = "base", "secure_base";
> +                       interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 285 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 291 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "mfwd_error", "race_error",
> +                                         "coma_error", "gwca0_error",
> +                                         "gwca1_error", "etha0_error",
> +                                         "etha1_error", "etha2_error",
> +                                         "gptp0_status", "gptp1_status",
> +                                         "mfwd_status", "race_status",
> +                                         "coma_status", "gwca0_status",
> +                                         "gwca1_status", "etha0_status",
> +                                         "etha1_status", "etha2_status",
> +                                         "rmac0_status", "rmac1_status",
> +                                         "rmac2_status",
> +                                         "gwca0_rxtx0", "gwca0_rxtx1",
> +                                         "gwca0_rxtx2", "gwca0_rxtx3",
> +                                         "gwca0_rxtx4", "gwca0_rxtx5",
> +                                         "gwca0_rxtx6", "gwca0_rxtx7",
> +                                         "gwca1_rxtx0", "gwca1_rxtx1",
> +                                         "gwca1_rxtx2", "gwca1_rxtx3",
> +                                         "gwca1_rxtx4", "gwca1_rxtx5",
> +                                         "gwca1_rxtx6", "gwca1_rxtx7",
> +                                         "gwca0_rxts0", "gwca0_rxts1",
> +                                         "gwca1_rxts0", "gwca1_rxts1",
> +                                         "rmac0_mdio", "rmac1_mdio",
> +                                         "rmac2_mdio",
> +                                         "rmac0_phy", "rmac1_phy",
> +                                         "rmac2_phy";
> +                       clocks = <&cpg CPG_MOD 1505>;
> +                       power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
> +                       resets = <&cpg 1505>;
> +                       status = "disabled";
> +
> +                       ethernet-ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;

... please insert a blank line between properties and subnodes.

> +                               port@0 {
> +                                       reg = <0>;
> +                                       phys = <&eth_serdes 0>;
> +                               };
> +                               port@1 {
> +                                       reg = <1>;
> +                                       phys = <&eth_serdes 1>;
> +                               };
> +                               port@2 {
> +                                       reg = <2>;
> +                                       phys = <&eth_serdes 2>;
> +                               };
> +                       };
> +               };
> +
>                 scif0: serial@e6e60000 {
>                         compatible = "renesas,scif-r8a779f0",
>                                      "renesas,rcar-gen4-scif", "renesas,scif";

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
