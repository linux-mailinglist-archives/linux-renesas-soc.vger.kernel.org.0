Return-Path: <linux-renesas-soc+bounces-21522-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAABB4628D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 20:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E43A7A617B0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 18:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B140530597E;
	Fri,  5 Sep 2025 18:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OuctfBdC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8427E290F;
	Fri,  5 Sep 2025 18:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757098004; cv=none; b=f6zjq3pwEJg1BujLOuYul+ftw8M8iE/Pm4gIAm5BF/PL2KUyT+KpbUquowvn1lO+fKShBGQ+Pr46pFzUK3NbapdKgLP9gxqcfnK0hw6iDMggSAAKIFXZkNAXwxMG6XHRk4pmeWHYxvJArU3U9BR7dr/A5V2DBnzaRMwuoQjQR0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757098004; c=relaxed/simple;
	bh=c8XeQ8AHKcUAr6EHs6+PRSWtjO1mvJ0xUlTR7B+dyj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fpmbxUhOcS71s9IYcOCQ72gUlv8u5KOTY5QCLkmTdLbP2GBc4wvXhxQbcLY3jGrUSJO+28DXDouAjhJkvvNG6zjKSOQ8gq9oqXCdAppSUvA/Aa2iz8g5LOnHneVe7zwAqRPJxpoV2IOeyG0H6vIAQvDoC1F7jGjSQ91uN386paU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OuctfBdC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F18C4CEF1;
	Fri,  5 Sep 2025 18:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757098004;
	bh=c8XeQ8AHKcUAr6EHs6+PRSWtjO1mvJ0xUlTR7B+dyj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OuctfBdCL5a7s7Wae/HcmUrDnLIPVkl9jtf37ZUWtzkgxH8ZtSEDJ6betPnlQq6Kn
	 gXK+kRSQcThuJ0hZn7QCHLly79NPRzxb2AkQAgpALXtorYzQq74D7KtFSJ7bJDfHyG
	 z/i1sw7jxDyNrIZzigR/qL4BO/JmCf9dvdQ7qlsgSUyjfg2d1h7g8GELM/Nsx4HGj4
	 /tny3Lkgzqf4d/614ih4nUQzBIL4O2i8Z8MoM1g+vwZX+FU5jZL3J4EYRRib/P/vU3
	 HXlnx9706K1rVcFjIgxZP5wKzaPinHCqMDAhLRBeAl/M9Z0F9qSg81qz3XYUF3nn+P
	 vdryKfMyoSwrw==
Date: Fri, 5 Sep 2025 19:46:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] regulator: dt-bindings: rpi-panel: Split 7" Raspberry Pi
 720x1280 v2 binding
Message-ID: <20250905-humble-framing-3d9b786c87a2@spud>
References: <20250904200036.168222-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8NT7fW0b+w7vAM07"
Content-Disposition: inline
In-Reply-To: <20250904200036.168222-1-marek.vasut+renesas@mailbox.org>


--8NT7fW0b+w7vAM07
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 04, 2025 at 09:58:26PM +0200, Marek Vasut wrote:
> The 5" and 7" Raspberry Pi 720x1280 Display 2 MCU is a bit more
> complex than the original Display 1 ATTINY88 and the binding is
> also a bit more demanding. Split the binding into separate file
> and fill in required gpio-controller, #gpio-cells and #pwm-cells
> which must be present for the V2 MCU. Include mention of the 5"
> panel in the description of Display 2, as the 5" panel uses the
> same MCU.
>=20
> Fixes: 6d09c6e474bd ("regulator: dt-bindings: rpi-panel: Add regulator fo=
r 7" Raspberry Pi 720x1280")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadc=
om.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-rpi-kernel@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  ...,7inch-touchscreen-panel-regulator-v2.yaml | 61 +++++++++++++++++++
>  ...ypi,7inch-touchscreen-panel-regulator.yaml |  7 +--
>  2 files changed, 63 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/regulator/raspberry=
pi,7inch-touchscreen-panel-regulator-v2.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/regulator/raspberrypi,7inc=
h-touchscreen-panel-regulator-v2.yaml b/Documentation/devicetree/bindings/r=
egulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
> new file mode 100644
> index 0000000000000..efc7815a136b4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touch=
screen-panel-regulator-v2.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/raspberrypi,7inch-touchscre=
en-panel-regulator-v2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RaspberryPi 5" and 7" display V2 MCU-based regulator/backlight co=
ntroller
> +
> +maintainers:
> +  - Marek Vasut <marek.vasut+renesas@mailbox.org>
> +
> +description: |
> +  The RaspberryPi 5" and 7" display 2 has an MCU-based regulator, PWM
> +  backlight and GPIO controller on the PCB, which is used to turn the
> +  display unit on/off and control the backlight.
> +
> +allOf:
> +  - $ref: regulator.yaml#
> +
> +properties:
> +  compatible:
> +    const: raspberrypi,touchscreen-panel-regulator-v2
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +  "#gpio-cells":
> +    const: 2
> +    description:
> +      The first cell is the pin number, and the second cell is used to
> +      specify the gpio polarity (GPIO_ACTIVE_HIGH or GPIO_ACTIVE_LOW).
> +
> +  "#pwm-cells":
> +    const: 3
> +    description: See ../../pwm/pwm.yaml for description of the cell form=
ats.
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - "#pwm-cells"
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +      gpio@45 {

ngl, seems strange to classify the device as a regulator in directory
and name, but use gpio as the node name in the example.

Otherwise, this seems fine - if you feel that the hardware is
substantively differentially to what's in the "v1" regulator then
keeping them apart is valid.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> +        compatible =3D "raspberrypi,touchscreen-panel-regulator-v2";
> +        reg =3D <0x45>;
> +        gpio-controller;
> +        #gpio-cells =3D <2>;
> +        #pwm-cells =3D <3>;
> +      };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/regulator/raspberrypi,7inc=
h-touchscreen-panel-regulator.yaml b/Documentation/devicetree/bindings/regu=
lator/raspberrypi,7inch-touchscreen-panel-regulator.yaml
> index 18944d39d08fc..41678400e63fa 100644
> --- a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touch=
screen-panel-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touch=
screen-panel-regulator.yaml
> @@ -12,17 +12,14 @@ maintainers:
>  description: |
>    The RaspberryPi 7" display has an ATTINY88-based regulator/backlight
>    controller on the PCB, which is used to turn the display unit on/off
> -  and control the backlight. The V2 supports 5" and 7" panels and also
> -  offers PWM backlight control.
> +  and control the backlight.
> =20
>  allOf:
>    - $ref: regulator.yaml#
> =20
>  properties:
>    compatible:
> -    enum:
> -      - raspberrypi,7inch-touchscreen-panel-regulator
> -      - raspberrypi,touchscreen-panel-regulator-v2
> +    const: raspberrypi,7inch-touchscreen-panel-regulator
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.50.1
>=20

--8NT7fW0b+w7vAM07
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLswDwAKCRB4tDGHoIJi
0tzQAPwIq5ZowCj5YDo5tdlwNeaRrtS/3b7s6nLfM0aAapmsgwD+IXNaBK3GbYBL
HkLI14b80zT4kJRYP61NmE5POzpW0gw=
=IvvS
-----END PGP SIGNATURE-----

--8NT7fW0b+w7vAM07--

