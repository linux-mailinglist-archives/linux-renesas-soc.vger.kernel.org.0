Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 297AC517371
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 May 2022 18:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386165AbiEBQFR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 May 2022 12:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386041AbiEBQEt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 May 2022 12:04:49 -0400
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 174E7BF4F;
        Mon,  2 May 2022 09:01:02 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id w3so3847608qkb.3;
        Mon, 02 May 2022 09:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7XKNxlIFh4s0xEo9/Cot6psYFrDCFLdPJ6BIwh+df10=;
        b=pjxLe1mS7sYK/P2+FX26j/6XKWkxlnitCmkoPs8XzUAtfUAB0ychabQ969P03/rmpL
         qBlXAOlfACMH900uxKebJ+yHUNuzdZpVM/pTUPpNAY7aCgioetjPVtBnGpKUdvwSrf8/
         8ZfXAdDv3+X3+qZx6JfhvPYzvh18iWKoBmjDHfUAJnslfOJnbt2k9Lp9v0+FHQOcJZrG
         eVj+XhOKiB1IhjYA3a4Ufz2kuEbpBQ7FGlNjX9FrM/YgglnkksEmuURjvf4F9FWJ6A6e
         3H08t+MX+dvmyf2wlOvuuliq7U9A4UFO/Wql6SA6iSU4ucL7GyH4O9ragS3U2Uqp6+kA
         K/+A==
X-Gm-Message-State: AOAM531PI8TVCMuvFZufJp8srTG4aVZNNLh3cHMscKQfna6UHPad3mEo
        4Vvt4CUIEAj8wHO7LoYNiEhDKWQcBF7OGg==
X-Google-Smtp-Source: ABdhPJx6uLh8IGMqsxM2qT5eS3kLAVOBGMFk/Rm4QAEP0n6DFJU2oJmkUJ5lN+Z7y0seGUfAhlvIVg==
X-Received: by 2002:a05:620a:4149:b0:69f:f18e:c493 with SMTP id k9-20020a05620a414900b0069ff18ec493mr1983423qko.561.1651507260123;
        Mon, 02 May 2022 09:01:00 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id g23-20020ac84817000000b002f39b99f693sm4291900qtq.45.2022.05.02.09.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 09:01:00 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id j2so26866489ybu.0;
        Mon, 02 May 2022 09:00:59 -0700 (PDT)
X-Received: by 2002:a25:4506:0:b0:648:cfc2:301d with SMTP id
 s6-20020a254506000000b00648cfc2301dmr10708194yba.380.1651507259451; Mon, 02
 May 2022 09:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220501112926.47024-1-biju.das.jz@bp.renesas.com> <20220501112926.47024-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220501112926.47024-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 May 2022 18:00:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV1fO4EuV2n-iQ1jYmX9Fz5B6nX8oYMfduVHSEPAKG+dg@mail.gmail.com>
Message-ID: <CAMuHMdV1fO4EuV2n-iQ1jYmX9Fz5B6nX8oYMfduVHSEPAKG+dg@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: dts: renesas: r9a07g043: Add SPI Multi I/O Bus
 controller node
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Sun, May 1, 2022 at 1:29 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add SPI Multi I/O Bus controller node to R9A07G043 (RZ/G2UL) SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> @@ -418,12 +418,20 @@ adc: adc@10059000 {
>                 };
>
>                 sbc: spi@10060000 {
> +                       compatible = "renesas,r9a07g043-rpc-if",
> +                                    "renesas,rzg2l-rpc-if";
>                         reg = <0 0x10060000 0 0x10000>,
>                               <0 0x20000000 0 0x10000000>,
>                               <0 0x10070000 0 0x10000>;
> +                       reg-names = "regs", "dirmap", "wbuf";
> +                       interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;

LGTM, but this interrupt is not documented in the RZ/G2UL Hardware
User's Manual (Rev. 0.51 and 1.00)?

> +                       clocks = <&cpg CPG_MOD R9A07G043_SPI_CLK2>,
> +                                <&cpg CPG_MOD R9A07G043_SPI_CLK>;
> +                       resets = <&cpg R9A07G043_SPI_RST>;
> +                       power-domains = <&cpg>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> -                       /* place holder */
> +                       status = "disabled";
>                 };
>
>                 cpg: clock-controller@11010000 {

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
