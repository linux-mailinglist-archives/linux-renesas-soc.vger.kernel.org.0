Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8FF5135A6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 15:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347687AbiD1Nw1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 09:52:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344676AbiD1Nw0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 09:52:26 -0400
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F370B3695;
        Thu, 28 Apr 2022 06:49:09 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id 126so2620977qkm.4;
        Thu, 28 Apr 2022 06:49:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GtXTuyetOQXEPvEx9pdxnHQcYoTGIjHvr+XboJiHeys=;
        b=Q9JjcrireY3sP57lqc3RCFt1wieNyASBn3cBGTPOVujFzn06OhXRIjJKoAq0omvw58
         EKhgSEGUFvYavcwJ9bk4c+DL8GPujRRSSKHjztFuRlu8WkLIK9mlEg36PEj1arpMTgQA
         zRhqjR80zalfiUomBN33HCnJlLoXkpAwb7k+bVHqiRkTTWF2xfJPfgpFY9rOUZTpk7pq
         D47kDO3DcSGOqtPfUYgYsYIR21A8QhVV2S8oSDaEgS0Ccka5TQHuf51D/ttnHj0xYYCx
         UkJj3b4nYPI2jNWvhvYXHqunj8xbdtmuAfmyJSZ7Dk4PhXCRg6Xriyy5jF5sknmoCk58
         6cEg==
X-Gm-Message-State: AOAM533i8bTeiLs9s1VRfnvVWrQGj8AoWNC1AWrYn0OMYBKZkyz6EulW
        6AlsBaKc6nwpQ4/n/YPukcWjO3fALZc1aA==
X-Google-Smtp-Source: ABdhPJz4N4GqGUhUI31Uw+yCV/tY+3qs2d2NNnao+tGExmWK5IScIsnTGVLYz3Fl6HaT59q7HGbvWw==
X-Received: by 2002:a05:620a:40d3:b0:69f:4050:7307 with SMTP id g19-20020a05620a40d300b0069f40507307mr14255632qko.80.1651153747937;
        Thu, 28 Apr 2022 06:49:07 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id p14-20020a05622a13ce00b002f20a695972sm33172qtk.14.2022.04.28.06.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 06:49:07 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id d12so9124702ybc.4;
        Thu, 28 Apr 2022 06:49:07 -0700 (PDT)
X-Received: by 2002:a25:d84c:0:b0:648:7d5e:e2d4 with SMTP id
 p73-20020a25d84c000000b006487d5ee2d4mr17797233ybg.6.1651153747119; Thu, 28
 Apr 2022 06:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220425170530.200921-1-biju.das.jz@bp.renesas.com> <20220425170530.200921-9-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220425170530.200921-9-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Apr 2022 15:48:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUC+iBEri0eg-eR2DEFBFiX_dmbsKnHp-NF6WoymO76Nw@mail.gmail.com>
Message-ID: <CAMuHMdUC+iBEri0eg-eR2DEFBFiX_dmbsKnHp-NF6WoymO76Nw@mail.gmail.com>
Subject: Re: [PATCH 08/13] arm64: dts: renesas: rzg2l-smarc: Move ssi0 and cpu
 sound_dai nodes from common dtsi
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thanks for your patch!

On Mon, Apr 25, 2022 at 7:06 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> On RZ/G2{L,LC} SoM module, ssi0 is connected to wm8978 audio codec whereas
> on RZ/G2UL it is connected to ssi1. So move ssi0 and cpu sound_dai nodes
> from common dtsi to soc specific dtsi.

The first sentence reads a bit odd. Perhaps:

    On RZ/G2{L,LC} SoM module, the wm8978 audio codec is connected
    to ssi0, whereas on RZ/G2UL it is connected to ssi1.

?

> --- a/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
> @@ -52,7 +52,6 @@ snd_rzg2l: sound {
>                             "Mic Bias", "Microphone Jack";
>
>                 cpu_dai: simple-audio-card,cpu {
> -                       sound-dai = <&ssi0>;
>                 };
>
>                 codec_dai: simple-audio-card,codec {

> --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> @@ -49,6 +49,19 @@ &scif2 {
>  };
>  #endif
>
> +&snd_rzg2l {
> +       cpu_dai: simple-audio-card,cpu {

Why not refer to &cpu_dai instead?

> +               sound-dai = <&ssi0>;
> +       };
> +};
> +
> +&ssi0 {
> +       pinctrl-0 = <&ssi0_pins>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +};
> +
>  &vccq_sdhi1 {
>         gpios = <&pinctrl RZG2L_GPIO(39, 1) GPIO_ACTIVE_HIGH>;
>  };
> diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
> index 74a844ea7537..522cfab69db6 100644
> --- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
> @@ -91,6 +91,19 @@ &scif1 {
>  };
>  #endif
>
> +&snd_rzg2l {
> +       cpu_dai: simple-audio-card,cpu {

&cpu_dai?

> +               sound-dai = <&ssi0>;
> +       };
> +};
> +
> +&ssi0 {
> +       pinctrl-0 = <&ssi0_pins>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +};
> +
>  #if (SW_RSPI_CAN)
>  &spi1 {
>         /delete-property/ pinctrl-0;

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
