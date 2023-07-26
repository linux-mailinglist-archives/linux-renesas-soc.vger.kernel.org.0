Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46503763B2B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jul 2023 17:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231933AbjGZPfa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Jul 2023 11:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbjGZPfa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jul 2023 11:35:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC842F2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jul 2023 08:35:27 -0700 (PDT)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D3F65AA;
        Wed, 26 Jul 2023 17:34:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690385666;
        bh=POk8fjXmRnPI2XCgvzU2nQZZrEOO5X9raz2DRsjhHds=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=IonBXcmgv+TgWVl5mxeMjll64lilzWGnHvKpPq5Tzr0yFiGyZb/apzdnpKnACaG7x
         b3Uk7gUYUft86LAVOnTAn6x30We4/rZaaJXhrDQ7hNH3D6WzItPxczivjO2KTaMdxg
         pczWE7Y08yv24mjhcCBL4GJ8+7ZxY1S1sHI/gK5g=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d6ccbb7b7a73eb35f1e1a8d85adcf9f1f980b2c1.1690382328.git.geert+renesas@glider.be>
References: <cover.1690382328.git.geert+renesas@glider.be> <d6ccbb7b7a73eb35f1e1a8d85adcf9f1f980b2c1.1690382328.git.geert+renesas@glider.be>
Subject: Re: [PATCH/RFT 3/3] arm64: dts: renesas: spider: Add keyboard to test IRQ[0145]
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Date:   Wed, 26 Jul 2023 16:35:22 +0100
Message-ID: <169038572206.137962.5086123226679977259@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2023-07-26 15:44:43)
> Add an interrupt-controlled keyboard to test operation of the Interrupt
> Controller for External Devices (INTC-EX) on the Spider development
> board.
>=20
> Test procedure:
>   - Run "evtest" (select device event number "0"),
>   - Pull one of the following signals on the Spider Breakout Board low
>     to trigger the corresponding interrupt and keypress (key release is
>     automatic):
>       - Test point CP18 -> IRQ0 (KEY_0),
>       - Test point CP17 -> IRQ1 (KEY_1),
>       - CN37 pin 4 -> IRQ4 (KEY_4),
>       - CN37 pin 2 -> IRQ5 (KEY_5).

Pin 4 working, while Pin 2 fires 'once'.

CP18/CP17 yet to be found.

In cooperation with Geert ...

Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>=20


>=20
> GND is available on e.g. pin 8 of CN37 (MSIOF0 PIN HEADER).
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Not intended for upstream merge.
>=20
> I do not have physical access to a Spider development board.
> Thanks for testing!
>=20
> Note that this IRQ conflicts with operation of LED7, so do not apply the
> LED patch while testing.
> ---
>  .../boot/dts/renesas/r8a779f0-spider.dts      | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts b/arch/arm64=
/boot/dts/renesas/r8a779f0-spider.dts
> index 7aac3f4d319c330c..a73251da1f215141 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
> @@ -6,12 +6,56 @@
>   */
> =20
>  /dts-v1/;
> +
> +#include <dt-bindings/input/input.h>
> +
>  #include "r8a779f0-spider-cpu.dtsi"
>  #include "r8a779f0-spider-ethernet.dtsi"
> =20
>  / {
>         model =3D "Renesas Spider CPU and Breakout boards based on r8a779=
f0";
>         compatible =3D "renesas,spider-breakout", "renesas,spider-cpu", "=
renesas,r8a779f0";
> +
> +       keyboard-irq {
> +               compatible =3D "gpio-keys";
> +
> +               pinctrl-0 =3D <&keyboard_irq_pins>;
> +               pinctrl-names =3D "default";
> +
> +               interrupt-parent =3D <&intc_ex>;
> +
> +               key-0 {
> +                       interrupts =3D <0 IRQ_TYPE_EDGE_FALLING>;
> +                       linux,code =3D <KEY_0>;
> +                       label =3D "Breakabout Board CP18";
> +                       wakeup-source;
> +                       debounce-interval =3D <20>;
> +               };
> +
> +               key-1 {
> +                       interrupts =3D <1 IRQ_TYPE_EDGE_FALLING>;
> +                       linux,code =3D <KEY_1>;
> +                       label =3D "Breakabout Board CP17";
> +                       wakeup-source;
> +                       debounce-interval =3D <20>;
> +               };
> +
> +               key-4 {
> +                       interrupts =3D <4 IRQ_TYPE_EDGE_FALLING>;
> +                       linux,code =3D <KEY_4>;
> +                       label =3D "Breakout Board CN37-4";
> +                       wakeup-source;
> +                       debounce-interval =3D <20>;
> +               };
> +
> +               key-5 {
> +                       interrupts =3D <5 IRQ_TYPE_EDGE_FALLING>;
> +                       linux,code =3D <KEY_5>;
> +                       label =3D "Breakout Board CN37-2";
> +                       wakeup-source;
> +                       debounce-interval =3D <20>;
> +               };
> +       };
>  };
> =20
>  &i2c4 {
> @@ -22,3 +66,11 @@ eeprom@51 {
>                 pagesize =3D <8>;
>         };
>  };
> +
> +&pfc {
> +       keyboard_irq_pins: keyboard-irq {
> +               groups =3D "intc_ex_irq0", "intc_ex_irq1", "intc_ex_irq4",
> +                        "intc_ex_irq5";
> +               function =3D "intc_ex";
> +       };
> +};
> --=20
> 2.34.1
>
