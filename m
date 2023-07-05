Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FFAD748418
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jul 2023 14:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbjGEMZa convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jul 2023 08:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjGEMZ3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 08:25:29 -0400
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F1F1709;
        Wed,  5 Jul 2023 05:25:28 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-bff89873d34so6196432276.2;
        Wed, 05 Jul 2023 05:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688559928; x=1691151928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AkpHOMESygR+qvWABpAELuBN+LI4SgAM9SMdU9sjC7w=;
        b=I8NC6Akz+A8OlMRMwC4leVVAb7blNmz4iDjVbY7X0Q19kbHzZ1vb3w5xK1lGAWBefE
         ScuJST8JIyr7YO4RM/eTwzrW4Eyh6oTNG1OdVQLIv9s+BVFyyhy/B/lXavwToAiiaPBn
         6p/KnSU0um7fRLQb5vgzhrw4a7z9cD2J3AKepKweaW0jau6ATU0SN1MUX2m4KnIEGj8r
         rF604fwDqBCDpM0FTVqG3ymRN1EkQ8Z/3bfTvr6Eh6liP++aN1WV4wzzE34cxoMisGBe
         bQ8KpABC/X4nV8OBiYAUY+Bb1uf/MUarFCqAl16Zg3FVM1jK1dhf17e77vpJCLSDuhRJ
         1OjQ==
X-Gm-Message-State: ABy/qLZWYBz7Dz60B9HNcS+6GmsdHq+1g3i+5ZFjxbu2GF6w9Xyfd+fV
        iVjtmcyb4N3pP8qRfk+Lfvsxf81llS1SzQ==
X-Google-Smtp-Source: APBJJlG1wH7BbOZAgzohgEuHXNSV4WtRYyJWdOQkSgTpaIT/GyiBmEkp2fmmdf+jXcBK0UZ1yca7ew==
X-Received: by 2002:a25:c550:0:b0:c5e:5573:bda with SMTP id v77-20020a25c550000000b00c5e55730bdamr3300215ybe.11.1688559927663;
        Wed, 05 Jul 2023 05:25:27 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id 80-20020a250353000000b00bcd91bb300esm5341105ybd.54.2023.07.05.05.25.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 05:25:27 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-c01e1c0402cso6210187276.0;
        Wed, 05 Jul 2023 05:25:27 -0700 (PDT)
X-Received: by 2002:a05:6902:38d:b0:c4d:af5f:5388 with SMTP id
 f13-20020a056902038d00b00c4daf5f5388mr7990375ybs.34.1688559926986; Wed, 05
 Jul 2023 05:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230703132929.356009-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230703132929.356009-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Jul 2023 14:25:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWHKR77MbhTcD6xJw42OXCF_DC3P0VNdXJqFXG5dZhQ+Q@mail.gmail.com>
Message-ID: <CAMuHMdWHKR77MbhTcD6xJw42OXCF_DC3P0VNdXJqFXG5dZhQ+Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a07g0{4,5}4: Add support for
 enabling MTU3
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
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

On Mon, Jul 3, 2023 at 3:29 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add support for MTU3 macro to enable MTU3 node on RZ/{G2,V2}L SMARC EVK.
>
> The MTU3a PWM pins are muxed with spi1 pins and counter external input
> phase clock pins are muxed with scif2 pins. Disable these IPs when MTU3
> macro is enabled.
>
> Apart from this, the counter Z phase clock signal is muxed with the
> SDHI1 cd signal. So disable SDHI1 IP, when the counter Z phase signal
> is enabled.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
> @@ -12,7 +12,43 @@
>  #include "rz-smarc-common.dtsi"
>  #include "rzg2l-smarc.dtsi"
>
> +#define MTU3   0

Should this be called PMOD_MTU3 instead? The signals are provided on
the PMOD0 and PMOD1 connectors.
Perhaps add some checking to make sure PMOD1_SER0 and PMOD_MTU3 are
mutually exclusive?

> +#define MTU3_COUNTER_Z_PHASE_SIGNAL    0
> +#if (!MTU3 && MTU3_COUNTER_Z_PHASE_SIGNAL)
> +#error "Cannot set 1 to MTU3_COUNTER_Z_PHASE_SIGNAL as MTU3=0"
> +#endif
> +

Please move these up, before the various includes, like is done in
arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts.

>  / {
>         model = "Renesas SMARC EVK based on r9a07g044l2";
>         compatible = "renesas,smarc-evk", "renesas,r9a07g044l2", "renesas,r9a07g044";
>  };
> +
> +#if MTU3
> +&mtu3 {
> +       pinctrl-0 = <&mtu3_pins>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +};
> +
> +&scif2 {
> +       status = "disabled";
> +};
> +
> +#if MTU3_COUNTER_Z_PHASE_SIGNAL
> +/* SDHI cd pin is used for counter Z phase signal */

And this pin is not available on any other extension connector but
the microSD connector.

> +&mtu3_pins {
> +       mtu3-zphase-clk {
> +               pinmux = <RZG2L_PORT_PINMUX(19, 0, 3)>; /* MTIOC1A */
> +       };
> +};

With the #defines moved up, mtu3-zphase-clk can be moved to mtu3_pins
in rzg2l-smarc-pinfunction.dtsi.

> +
> +&sdhi1 {
> +       status = "disabled";
> +};
> +#endif /* MTU3_COUNTER_Z_PHASE_SIGNAL */

BTW, how does the driver know it can use the counter Z phase clock
signal?  I understand this can be either an input or output signal?

> +
> +&spi1 {
> +       status = "disabled";
> +};
> +#endif /* MTU3 */
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts
> index 3d01a4cf0fbe..4186bfe739fa 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts

The changes to r9a07g054l2-smarc.dts are identical to those to
r9a07g044l2-smarc.dts.  So I think they should be unified and moved
to rzg2l-smarc-som.dtsi and rzg2l-smarc.dtsi.
The various #include "rzg2l-smarc-pinfunction.dtsi" probably need to
be moved down for that to work, though.

rzg2l-smarc-som.dtsi and rzg2l-smarc.dtsi already have similar handling
for EMMC, SDHI, and PMOD1_SER0.

> --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
> @@ -53,6 +53,20 @@ i2c3_pins: i2c3 {
>                          <RZG2L_PORT_PINMUX(18, 1, 3)>; /* SCL */
>         };
>
> +       mtu3_pins: mtu3 {
> +               mtu3-ext-clk-input-pin {
> +                       pinmux = <RZG2L_PORT_PINMUX(48, 0, 4)>, /* MTCLKA */
> +                                <RZG2L_PORT_PINMUX(48, 1, 4)>; /* MTCLKB */
> +               };
> +
> +               mtu3-pwm {
> +                       pinmux = <RZG2L_PORT_PINMUX(44, 0, 4)>, /* MTIOC3A */
> +                                <RZG2L_PORT_PINMUX(44, 1, 4)>, /* MTIOC3B */
> +                                <RZG2L_PORT_PINMUX(44, 2, 4)>, /* MTIOC3C */
> +                                <RZG2L_PORT_PINMUX(44, 3, 4)>; /* MTIOC3D */
> +               };
> +       };
> +
>         scif0_pins: scif0 {
>                 pinmux = <RZG2L_PORT_PINMUX(38, 0, 1)>, /* TxD */
>                          <RZG2L_PORT_PINMUX(38, 1, 1)>; /* RxD */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
