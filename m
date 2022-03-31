Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D29A24EDA73
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Mar 2022 15:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236778AbiCaNZ7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Mar 2022 09:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235041AbiCaNZ6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Mar 2022 09:25:58 -0400
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88C7E21407E;
        Thu, 31 Mar 2022 06:24:11 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id b189so19651718qkf.11;
        Thu, 31 Mar 2022 06:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+OxnI2YqlNpSRFOzU+LEyQPYWBCYX+nKcxRRevtKn7c=;
        b=HO5Tq+k+kHvAnmBpg9XSyElzVYAP/kEt6O7WNkCWpHSXoUuakKaa9YNtrIrKx2d9/k
         zGKbjxaA+b333u5UU4uLMVi+PmSpKP2UPla5UTWefFTqUu/c7KbXcsVQcWqymHrFI/oH
         zH3yyXVlpGtWVtGv95Po7OFkix/UxdCowIkCzq+xWY6oJ+bNOasKxtcofd5yGCkaVDrX
         Mzt2UaNkw3mkCqXzXcxrjfn1cgqze6olGwqL2m1DWLsPbZUAwShrCYiHG12j9R9p7vbV
         IsZVuNSJZHPrqSgxzxOhzYPGr6rwf7QYVIpOJCDx7VvynlLGniuG4emkhq04AG6VcGaW
         nGiw==
X-Gm-Message-State: AOAM532SHIACwpOtG8oev9gvBeSLlv/VvrqsAJYhnjC+5FvP3Lx6Nk8K
        sAA8rtBYvjcnC6B3yPEQaihxyTwheLOpyw==
X-Google-Smtp-Source: ABdhPJyy7+invJ6K7uQeZBH53OH+uFosnfME1fy1tY83NgV/nkIUURqwS5lBh1pnu4/kSq3T6yV74w==
X-Received: by 2002:a05:620a:4244:b0:67e:86d7:757f with SMTP id w4-20020a05620a424400b0067e86d7757fmr3239204qko.779.1648733050440;
        Thu, 31 Mar 2022 06:24:10 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 188-20020a3709c5000000b0067b147584c2sm12452843qkj.102.2022.03.31.06.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Mar 2022 06:24:10 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-2e5827a76f4so253800907b3.6;
        Thu, 31 Mar 2022 06:24:10 -0700 (PDT)
X-Received: by 2002:a0d:ccd6:0:b0:2e7:98e2:a5a2 with SMTP id
 o205-20020a0dccd6000000b002e798e2a5a2mr4663241ywd.479.1648733049813; Thu, 31
 Mar 2022 06:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220315155919.23451-1-biju.das.jz@bp.renesas.com> <20220315155919.23451-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220315155919.23451-6-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Mar 2022 15:23:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUPfMMK2Mv0ffQcYVitpOLv5Y4iB-eVPa1u=nYXF5o7mw@mail.gmail.com>
Message-ID: <CAMuHMdUPfMMK2Mv0ffQcYVitpOLv5Y4iB-eVPa1u=nYXF5o7mw@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: renesas: rzg2ul-smarc: Enable microSD on
 SMARC platform
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Tue, Mar 15, 2022 at 4:59 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable the microSD card slot connected to SDHI1 on the RZ/G2UL SMARC
> platform by removing the sdhi1 override which disabled it, and by adding
> the necessary pinmux required for SDHI1.
>
> This patch also overrides vqmmc-supply for SDHI1.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/G2UL Type-1 SMARC EVK parts
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +#include "rzg2ul-smarc-som.dtsi"
> +#include "rzg2ul-smarc-pinfunction.dtsi"
> +#include "rz-smarc-common.dtsi"
> +
> +/ {
> +       vccq_sdhi1: regulator-vccq-sdhi1 {
> +               compatible = "regulator-gpio";
> +               regulator-name = "SDHI1 VccQ";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <3300000>;
> +               gpios = <&pinctrl RZG2L_GPIO(6, 1) GPIO_ACTIVE_HIGH>;
> +               gpios-states = <1>;
> +               states = <3300000 1>, <1800000 0>;
> +       };

This regulator is already defined in rz-smarc-common.dtsi, which is
included above?  That definition does use a different gpios property,
though.

> +};
> +
> +&sdhi1 {
> +       vqmmc-supply = <&vccq_sdhi1>;
> +};
> +

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
