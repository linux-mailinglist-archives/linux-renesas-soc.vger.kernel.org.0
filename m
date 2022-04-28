Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06BE05133D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 14:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346309AbiD1MjF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 08:39:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346418AbiD1MjB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 08:39:01 -0400
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A82AAAC929;
        Thu, 28 Apr 2022 05:35:46 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id b189so3424925qkf.11;
        Thu, 28 Apr 2022 05:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ota7gHRE87eJmh6wHOVGcmYlVLZKWZc39ppAbTzKG6E=;
        b=NVzeFigjNnJmoD1aN+EoumttmpQx8bLR5UD5t9FPCiqgiPWYhB94ZHXf1dMh66XVvO
         d1gnH7+K7dN3Bfx/oXdvtsfh897EfZyBjvamoxwQEGFVW1FSXIKX86Rkp1wapGyt8mfR
         Nr+ADRnACyj+9EPX1uP+e+4L98gTz0uN1t/4sac8PRX127lWoRcOZPn9+UlM1SHr+Grq
         xWHXdCsUIKKmfA3sDfZihOYasorZPP1+74AUJ4DDk+ZHn15eks4Yb7fx3djetUpoebev
         ykdR8pGrzuIECd5u2yhu2cVrNyh9lrfRWGW46kzyas082MpuN2ZGaJGqdXfibqdMgpyb
         TSDQ==
X-Gm-Message-State: AOAM530i/7F6ib/ogdGwulnwJ4A2S9B2+ZPmibZQ/K3hOpcRJ1p9oBvn
        TBmjsJrYX63iETL6r7j4c4tibY3MZiW9pg==
X-Google-Smtp-Source: ABdhPJxiA0k85dNHBkMfjY3K9mMJI4zKvkTrxVaThKPzkYn2IiXotUi04iI49UfBZGIAUMdDDfRxTg==
X-Received: by 2002:a37:98c4:0:b0:69a:e14:16a2 with SMTP id a187-20020a3798c4000000b0069a0e1416a2mr19241812qke.610.1651149345570;
        Thu, 28 Apr 2022 05:35:45 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id d1-20020a05622a15c100b002f373d233d3sm5587986qty.71.2022.04.28.05.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 05:35:45 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id g28so8721681ybj.10;
        Thu, 28 Apr 2022 05:35:44 -0700 (PDT)
X-Received: by 2002:a25:d84c:0:b0:648:7d5e:e2d4 with SMTP id
 p73-20020a25d84c000000b006487d5ee2d4mr17457781ybg.6.1651149344687; Thu, 28
 Apr 2022 05:35:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220426064002.9411-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220426064002.9411-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Apr 2022 14:35:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX5k5nsczGBPrO8HTio_8yONyLbs6JYBDBBLGrv0nzvMw@mail.gmail.com>
Message-ID: <CAMuHMdX5k5nsczGBPrO8HTio_8yONyLbs6JYBDBBLGrv0nzvMw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: renesas: r9a07g044: Fix external clk
 node names
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Tue, Apr 26, 2022 at 8:40 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add suffix '-clk' for can and extal clk node names and replace the
> clk node names audio_clk{1,2} with clk-{1,2} as per the device
> tree specification.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Sorted clk node-names alphabetically
> v1->v2:
>  * Replaced clk node names audio_clk{1,2} with clk-{1,2}.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> @@ -13,29 +13,29 @@ / {
>         #address-cells = <2>;
>         #size-cells = <2>;
>
> -       audio_clk1: audio_clk1 {
> +       /* External CAN clock - to be overridden by boards that provide it */
> +       can_clk: can-clk {

OK.

>                 compatible = "fixed-clock";
>                 #clock-cells = <0>;
> -               /* This value must be overridden by boards that provide it */
>                 clock-frequency = <0>;
>         };
>
> -       audio_clk2: audio_clk2 {
> +       audio_clk1: clk-1 {

"clk-1" has a high risk of conflicts. "audio_clk1: audio1-clk"?

>                 compatible = "fixed-clock";
>                 #clock-cells = <0>;
>                 /* This value must be overridden by boards that provide it */
>                 clock-frequency = <0>;
>         };
>
> -       /* External CAN clock - to be overridden by boards that provide it */
> -       can_clk: can {
> +       audio_clk2: clk-2 {

audio_clk2: audio-2clk?

>                 compatible = "fixed-clock";
>                 #clock-cells = <0>;
> +               /* This value must be overridden by boards that provide it */
>                 clock-frequency = <0>;
>         };
>
>         /* clock can be either from exclk or crystal oscillator (XIN/XOUT) */
> -       extal_clk: extal {
> +       extal_clk: extal-clk {

OK

>                 compatible = "fixed-clock";
>                 #clock-cells = <0>;
>                 /* This value must be overridden by the board */

Same comments for patch 2/2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
