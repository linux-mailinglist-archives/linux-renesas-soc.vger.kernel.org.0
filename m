Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 533F8763B80
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jul 2023 17:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbjGZPph (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Jul 2023 11:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231167AbjGZPpg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jul 2023 11:45:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E76DCE47
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jul 2023 08:45:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9A735AA;
        Wed, 26 Jul 2023 17:44:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690386275;
        bh=QUnIxeQFhl92BV1ILRqThFJCvdVgtB4kYgnt+iW6fD8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=XgQSTd1Lbb2dBiVGFhrk2ENr5Kxcc5EOAev0EeYOy6QLqM2NJoPAYA8LaGCv3GrjD
         UAhAZy/QLuVaak2mp0Mr8nQW2ZXQku5B6i/UMPJbOc/5Cv45GqbmUNl9FI0GTgxN6l
         ZBTkpAF2dssTKRPPsenqHm+yYGR4vldOVy0eu3wY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aa1a92cf69dc341724bcb5662de994a54cb14422.1690382707.git.geert+renesas@glider.be>
References: <aa1a92cf69dc341724bcb5662de994a54cb14422.1690382707.git.geert+renesas@glider.be>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: spider-cpu: Add GP LEDs
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Date:   Wed, 26 Jul 2023 16:45:32 +0100
Message-ID: <169038633210.137962.3548138584643048570@Monstersaurus>
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

Quoting Geert Uytterhoeven (2023-07-26 15:45:57)
> Describe the two General Purpose LEDs LED7 and LED8 on the Spider CPU
> board, so they can be used as indicator LEDs.
>=20
> Note that General Purpose LEDs LED9 to LED11 are not added, as they are
> connected to GPIO block 4, which can only be accessed from the Control
> Domain.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> I do not have physical access to a Spider development board.
> Thanks for testing!

In collaboration with Geert,

Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi b/arch/=
arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> index dd8e0e1595260b3d..76a94812875ef261 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> @@ -6,6 +6,8 @@
>   */
> =20
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
>  #include "r8a779f0.dtsi"
> =20
>  / {
> @@ -22,6 +24,24 @@ chosen {
>                 stdout-path =3D "serial0:1843200n8";
>         };
> =20
> +       leds {
> +               compatible =3D "gpio-leds";
> +
> +               led-7 {

I presume there is a reason to start the sequence at 7?
But that's fine with me anyway...

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> +                       gpios =3D <&gpio0 11 GPIO_ACTIVE_HIGH>;
> +                       color =3D <LED_COLOR_ID_GREEN>;
> +                       function =3D LED_FUNCTION_INDICATOR;
> +                       function-enumerator =3D <7>;
> +               };
> +
> +               led-8 {
> +                       gpios =3D <&gpio0 14 GPIO_ACTIVE_HIGH>;
> +                       color =3D <LED_COLOR_ID_GREEN>;
> +                       function =3D LED_FUNCTION_INDICATOR;
> +                       function-enumerator =3D <8>;
> +               };
> +       };
> +
>         memory@48000000 {
>                 device_type =3D "memory";
>                 /* first 128MB is reserved for secure area. */
> --=20
> 2.34.1
>
