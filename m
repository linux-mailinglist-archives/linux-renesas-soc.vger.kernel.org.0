Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9346956392F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Jul 2022 20:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbiGASdz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Jul 2022 14:33:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbiGASdz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Jul 2022 14:33:55 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79DAE32EFF;
        Fri,  1 Jul 2022 11:33:54 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id b24so2453428qkn.4;
        Fri, 01 Jul 2022 11:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5CPgSxlxvAD6mxf8VRHupyPppcZp6QH5VnwOoF3PTjo=;
        b=oM136O7pbMkKZWjM/Bks7ER8Ydfcj+Qyts3FT/hgHCYdNP3r6t1Zyiis5zFUhNTb8r
         n+jIUZqv1F5UH2rL2WYzwKMsr+qp8TsdAaWG8ryddFsM3uCR5WiwasU5fp6nxdgJOxFy
         4kUyhFA2bAXsEfWPyldUHf3nwTWptYevVZ9JUwl+QqJ/8cnlB2dWMdodLKFt+ZUbJJCS
         McTknanMI+y7nL3Bj+TF+SrGI5sqWY4ZuX8eToQ6Amc9OBujIFhWbSj5roZsmbCHxdDL
         XgxnT3QzQZCsMM7HKOD/pqWPSynW/I/wfTkapiXMtzt2kX9O/Ly/OdMVTg1lONQF6YI/
         CmEg==
X-Gm-Message-State: AJIora+RcqgsmKSHg7FIOjqW+4c9fTFdLGMIJSrplUaDMfmLyZfkvD+l
        nHO5pNJ+E1lixyDQ7tLX4zJwu+dXG0ocCQ==
X-Google-Smtp-Source: AGRyM1vPUaCgX1d2BNK70OXZKI8ltkJGTA9v07Gx86YPl5UhFhAAZUyHZPydugVx9WQxmjATXzefwQ==
X-Received: by 2002:a05:620a:9de:b0:6af:20a:586f with SMTP id y30-20020a05620a09de00b006af020a586fmr11884385qky.432.1656700433428;
        Fri, 01 Jul 2022 11:33:53 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id bq9-20020a05620a468900b006af6f0893c6sm7425194qkb.91.2022.07.01.11.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 11:33:53 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 194so460731ybc.4;
        Fri, 01 Jul 2022 11:33:53 -0700 (PDT)
X-Received: by 2002:a05:6902:1246:b0:66d:5b0b:19b0 with SMTP id
 t6-20020a056902124600b0066d5b0b19b0mr16010441ybu.365.1656700432819; Fri, 01
 Jul 2022 11:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220701162320.102165-1-biju.das.jz@bp.renesas.com> <20220701162320.102165-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220701162320.102165-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Jul 2022 20:33:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUNm+HubG_JWwGWcSu4rJc=0-YUf1+1BpQQ6QX-5LOYrw@mail.gmail.com>
Message-ID: <CAMuHMdUNm+HubG_JWwGWcSu4rJc=0-YUf1+1BpQQ6QX-5LOYrw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: r9a06g032: Add CAN{0,1} nodes
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
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

On Fri, Jul 1, 2022 at 6:23 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add CAN{0,1} nodes to R9A06G032 (RZ/N1) SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/r9a06g032.dtsi
> @@ -423,6 +423,24 @@ gic: interrupt-controller@44101000 {
>                         interrupts =
>                                 <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
>                 };
> +
> +               can0: can@52104000 {
> +                       compatible = "nxp,sja1000";

Is this block 100% compatible to the nxp,sja1000 block, or do we
need an SoC-specific compatible value?

> +                       reg = <0x52104000 0x800>;
> +                       reg-io-width = <4>;
> +                       interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&sysctrl R9A06G032_HCLK_CAN0>;

According to the (old) bindings, the clock rate is specified using the
non-standard "nxp,external-clock-frequency property" (seems like both
bindings and driver can use some overhaul), and defaults to 16 MHz.
According to the RZ/N1S documentation, the CAN clock is 48 MHz?

> +                       status = "disabled";
> +               };
> +
> +               can1: can@52105000 {
> +                       compatible = "nxp,sja1000";
> +                       reg = <0x52105000 0x800>;
> +                       reg-io-width = <4>;
> +                       interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&sysctrl R9A06G032_HCLK_CAN1>;
> +                       status = "disabled";
> +               };
>         };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
