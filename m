Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D37F170E2F1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 May 2023 19:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238000AbjEWRgU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 May 2023 13:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238239AbjEWRgE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 May 2023 13:36:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2835E41;
        Tue, 23 May 2023 10:35:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6E54D63547;
        Tue, 23 May 2023 17:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9C8C433D2;
        Tue, 23 May 2023 17:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684863349;
        bh=V6La7xHuyVytMAyfQCoW1fs5fxMyIO2p76AI2SCUOEA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GtPdzUJqCnuCdbrKHnn6ERa4f+5zTE+NOlHT2B2jd36yEoOXyZEbzZGuHV6/xr73A
         FXH4S5r69z3TpvH5ecaYAKiR9+zuR4vRRQy2LmCkz/cGZt3LNgpnQ+VdFufEwgc+aZ
         y+8dhTUguas7Ej+7mZ3fCjz+I4XOtDxm3kysvSLUl8bib7rwnOO961Gh14b5OslPA2
         jnZQTEnr176dhlZWml11cjIcPJ0CDW6KM203OioUtuzMuv3HkJ6qmMRtFYvHZ3s6/c
         CLRezJz/AoZ6jI9uEi9DTSItUODShygq9vv5BEwMW4JFGG+R9DEjOz79RWSUHSXO1i
         3Vn6LiKRGOa/A==
Date:   Tue, 23 May 2023 18:35:44 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: backlight: pwm: Make power-supply not
 required
Message-ID: <20230523-outlying-repulsive-efc0f9e1435e@spud>
References: <29943059c80c8db0db437f9548f084a67326647b.1684856131.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nG5CKQOdzr5W/qlH"
Content-Disposition: inline
In-Reply-To: <29943059c80c8db0db437f9548f084a67326647b.1684856131.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--nG5CKQOdzr5W/qlH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 23, 2023 at 05:38:37PM +0200, Geert Uytterhoeven wrote:
> make dtbs_check:
>=20
>     arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dtb: backlight: 'power-su=
pply' is a required property
> 	    From schema: Documentation/devicetree/bindings/leds/backlight/pwm-ba=
cklight.yaml
>=20
> As that backlight device node already has an "enable-gpios" property to
> control the power supplied to the backlight, it sounds a bit silly to
> have to add a "power-supply" property just to silence this warning.  In
> addition, as of commit deaeeda2051fa280 ("backlight: pwm_bl: Don't rely
> on a disabled PWM emiting inactive state"), the Linux driver considers
> the power supply optional.
>=20
> Fix this by synchronizing the bindings with actual driver behavior by
> making the "power-supply" optional.

That seems to follow from reading the aforementioned commit.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> Fixes: deaeeda2051fa280 ("backlight: pwm_bl: Don't rely on a disabled PWM=
 emiting inactive state")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> As commit deaeeda2051fa280 was only upstreamed in v6.3, I'm wondering if
> the backlight on the iWave Systems RainboW-G20D/G21D Qseven and
> RainboW-G22D-SODIMM boards worked before?  I don't have the hardware.
>=20
> Thanks!
> ---
>  .../devicetree/bindings/leds/backlight/pwm-backlight.yaml        | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/leds/backlight/pwm-backlig=
ht.yaml b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.ya=
ml
> index 5ec47a8c6568b60e..53569028899020d6 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
> @@ -68,7 +68,6 @@ dependencies:
>  required:
>    - compatible
>    - pwms
> -  - power-supply
> =20
>  additionalProperties: false
> =20
> --=20
> 2.34.1
>=20

--nG5CKQOdzr5W/qlH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGz5cAAKCRB4tDGHoIJi
0mDPAQDCdFT25r3FjLLlJyhgTRdLJpa3ifbcKQxOZ20+M4dpXQD/dsHStncq/F4X
8OY2cqOzQwlc8EIm4K1E801mM1/RQwA=
=HU1s
-----END PGP SIGNATURE-----

--nG5CKQOdzr5W/qlH--
