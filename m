Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEE02760DDF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jul 2023 11:02:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232835AbjGYJB7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jul 2023 05:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232981AbjGYJBi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jul 2023 05:01:38 -0400
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB891FC6;
        Tue, 25 Jul 2023 02:01:16 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-57a551ce7e9so65425737b3.3;
        Tue, 25 Jul 2023 02:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690275659; x=1690880459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FSXy4qE50TdFxBx4CX6TLVPm/1GTfiQWlEqaofMONqM=;
        b=hvdZDNIvRUM3AdhZ7pIsVOPnqfIEQdJN26EU3iwZzqZ5OnzZZABvy1ka+31yAQebtV
         YSqxv1fFn9fLzcK+xZjALdjYX0peT46NGTKe/lu8yvwm4novy/2g97uoKh2h+LwgN0IN
         R+rr3N4HrUyU3bDXcs7u/Ge0d0Fg9FsrrL3PckbmoIZkEk1pKQd7LKlfb5MUcc72U59e
         wMd2pZ76US8BU/l+wcY3z2OM7JZkkz9dyYdxbV+eS1pUQg0GgeVeZbne0xVUvQ7i9+K4
         KRrwSTjt5ho3bt0geIObaxDx9zanLYXqjWw62WuJKn+CKFC2QyBjjvtyEOAXqCvwx2gz
         Jeng==
X-Gm-Message-State: ABy/qLYE9R7PnIdVJdvl2sAM33ckTT5Ypuvtbh9ZsXIaCrG3grIMadzz
        gqy3b0hNKbA96aAykj6oeFn31DLKgiTMlNmW
X-Google-Smtp-Source: APBJJlF6nEBvlqn5LMuHSdeMe2YUyOAow2Bgpc0Ptnq2Hgy6YGyhZC8t12hWaTj4Q7qFkkjta1dLbg==
X-Received: by 2002:a0d:d78a:0:b0:56d:824e:d93f with SMTP id z132-20020a0dd78a000000b0056d824ed93fmr9083711ywd.38.1690275658750;
        Tue, 25 Jul 2023 02:00:58 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id c3-20020a0df303000000b005707f542f62sm3388550ywf.25.2023.07.25.02.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 02:00:58 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d05a63946e0so4280832276.1;
        Tue, 25 Jul 2023 02:00:58 -0700 (PDT)
X-Received: by 2002:a25:acdc:0:b0:d07:87b0:f2a8 with SMTP id
 x28-20020a25acdc000000b00d0787b0f2a8mr7258972ybd.21.1690275657838; Tue, 25
 Jul 2023 02:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230724091927.123847-1-biju.das.jz@bp.renesas.com> <20230724091927.123847-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230724091927.123847-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 25 Jul 2023 11:00:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUoPugUVtPwrPEvKXjOOU-Bq=-tDbCtFFT3Ryh6B8O+pg@mail.gmail.com>
Message-ID: <CAMuHMdUoPugUVtPwrPEvKXjOOU-Bq=-tDbCtFFT3Ryh6B8O+pg@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] arm64: dts: renesas: r9a07g044: Update
 overfow/underflow IRQ names for MTU3 channels
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        stable@kernel.org
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

On Mon, Jul 24, 2023 at 11:19 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> As per R01UH0914EJ0130 Rev.1.30 HW manual the MTU3 overflow/underflow
> interrupt names starts with 'tci' instead of 'tgi'.
>
> Replace the below overflow/underflow interrupt names:
>  - tgiv0->tciv0
>  - tgiv1->tciv1
>  - tgiu1->tciu1
>  - tgiv2->tciv2
>  - tgiu2->tciu2
>  - tgiv3->tciv3
>  - tgiv4->tciv4
>  - tgiv6->tciv6
>  - tgiv7->tciv7
>  - tgiv8->tciv8
>  - tgiu8->tciu8
>
> Fixes: 26336d66d021 ("arm64: dts: renesas: r9a07g044: Add MTU3a node")
> Fixes: dd123dd01def ("arm64: dts: renesas: r9a07g054: Add MTU3a node")

These were added in v6.5-rc1, so it would be good to get this fixed before
the final release of v6.5 (i.e. before I sent my first PR for v6.6
later this week).

> Cc: stable@kernel.org

No need to CC stable.

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * No change.

Thanks for your patch!
> ---
>  arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 16 ++++++++--------
>  arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 16 ++++++++--------
>  2 files changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> index 232910e07444..66f68fc2b241 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> @@ -223,20 +223,20 @@ mtu3: timer@10001200 {
>                                      <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>,
>                                      <GIC_SPI 213 IRQ_TYPE_EDGE_RISING>;
>                         interrupt-names = "tgia0", "tgib0", "tgic0", "tgid0",
> -                                         "tgiv0", "tgie0", "tgif0",
> -                                         "tgia1", "tgib1", "tgiv1", "tgiu1",
> -                                         "tgia2", "tgib2", "tgiv2", "tgiu2",
> +                                         "tciv0", "tgie0", "tgif0",
> +                                         "tgia1", "tgib1", "tciv1", "tciu1",
> +                                         "tgia2", "tgib2", "tciv2", "tciu2",
>                                           "tgia3", "tgib3", "tgic3", "tgid3",
> -                                         "tgiv3",
> +                                         "tciv3",
>                                           "tgia4", "tgib4", "tgic4", "tgid4",
> -                                         "tgiv4",
> +                                         "tciv4",
>                                           "tgiu5", "tgiv5", "tgiw5",
>                                           "tgia6", "tgib6", "tgic6", "tgid6",
> -                                         "tgiv6",
> +                                         "tciv6",
>                                           "tgia7", "tgib7", "tgic7", "tgid7",
> -                                         "tgiv7",
> +                                         "tciv7",
>                                           "tgia8", "tgib8", "tgic8", "tgid8",
> -                                         "tgiv8", "tgiu8";
> +                                         "tciv8", "tciu8";
>                         clocks = <&cpg CPG_MOD R9A07G044_MTU_X_MCK_MTU3>;
>                         power-domains = <&cpg>;
>                         resets = <&cpg R9A07G044_MTU_X_PRESET_MTU3>;

While SPI 213 is documented to be used for TCIU8, the actual MTU3a
documentation does not mention this interrupt.

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
