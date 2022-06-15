Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0846A54D474
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jun 2022 00:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345418AbiFOWQp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jun 2022 18:16:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345243AbiFOWQp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jun 2022 18:16:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A32563A6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jun 2022 15:16:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 413F0A49;
        Thu, 16 Jun 2022 00:16:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655331403;
        bh=yA2gBDBPa+6cUOO6rFtlR4Do8bbHMQYzER1gtXSv4vA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=lqKl2VYX7J1Oqu1SWBF3bxJkXm4pv077iVkf0vdY855+9EJbVXtZXqRq/BipUs2/J
         PkIKQtmUKUzp/r3WjARaiY/f2221WUNnb19FxKlVz31HxO2dIpziy0LjiDWn28oOjD
         9oj6yKbbikDphcOUw15fM8XzxbbkrSCgVWkim9P4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f6e2883c16803b5d90a26c38d8e61ad15096089c.1655301593.git.geert+renesas@glider.be>
References: <f6e2883c16803b5d90a26c38d8e61ad15096089c.1655301593.git.geert+renesas@glider.be>
Subject: Re: [PATCH] ARM: dts: rza2mevb: Fix LED node names
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Chris Brandt <chris.brandt@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Date:   Wed, 15 Jun 2022 23:16:40 +0100
Message-ID: <165533140031.2586493.6360954956195081827@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2022-06-15 15:01:10)
> "make dtbs_check":
>=20
>     arch/arm/boot/dts/r7s9210-rza2mevb.dtb: leds: 'green', 'red' do not m=
atch any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
>             From schema: Documentation/devicetree/bindings/leds/leds-gpio=
.yaml
>=20
> Fix this by prefixing the LED node names with "led-".
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>


Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
> To be queued in renesas-devel for v5.20.
>=20
>  arch/arm/boot/dts/r7s9210-rza2mevb.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/r=
7s9210-rza2mevb.dts
> index 9c0d9686fe01133b..69a5a44b8a2fdd74 100644
> --- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
> +++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
> @@ -71,10 +71,10 @@ lbsc {
>         leds {
>                 compatible =3D "gpio-leds";
> =20
> -               red {
> +               led-red {
>                         gpios =3D <&pinctrl RZA2_PIN(PORT6, 0) GPIO_ACTIV=
E_HIGH>;
>                 };
> -               green {
> +               led-green {
>                         gpios =3D <&pinctrl RZA2_PIN(PORTC, 1) GPIO_ACTIV=
E_HIGH>;
>                 };
>         };
> --=20
> 2.25.1
>
