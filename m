Return-Path: <linux-renesas-soc+bounces-7912-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C91E95722C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 19:30:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2AD2DB217FD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 17:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307D617A591;
	Mon, 19 Aug 2024 17:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hoZfb1pV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0489748CFC;
	Mon, 19 Aug 2024 17:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724087514; cv=none; b=dXr4ManGWzpGumx3+GFF1ugozv/pdQAYY2+/94SW1KtxDfwaNPAfKcxxfm8GDZq/W68vTglIC61+SI2AbqsOA7NXM9AvjfFFTQfVsrWc40qH2bFrDSaSGwQ2MZv6qsIJDqL7gsAps3k8LZIb37Db5U6/bNtw+M3kkT/5MbQHcxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724087514; c=relaxed/simple;
	bh=yxprBbzXIBreAd4YHR01Nx4Vzjx/xfk6ZsgZ20Vi1C8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JIS5q1r36AjyX5ifvLUu/7h2V14j1tHN38NL1XNpcU31TPttbmxRLgsODPwNX5sZ4366S16SLz1RZ9CR8gdkDZctwOQD9dpryQbDIzUBQaOFLf0ymLy5ma12yayyUjYiXrBT0ndDInQtoaA9V8vM6VMGDoX+cQUicw4iYPdRtuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hoZfb1pV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ECA4C32782;
	Mon, 19 Aug 2024 17:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724087513;
	bh=yxprBbzXIBreAd4YHR01Nx4Vzjx/xfk6ZsgZ20Vi1C8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hoZfb1pVyS8RNG47epcVVwfA4Z+MrQWiW3ZH9/Bld0xoj7PCXasdTiQrAQjXQNLJH
	 0ILEux1Zzhd2il3gVgONY5U+P/VVFNgytAJoaFXVcNpyKwqLUSRflOGjYS87lypn89
	 cwLsoC8Ox9/4oQCdakE39SCmI3a8Kflv9JP9xaVBS211aTAb9Kp8YGdVXwP1LACrRz
	 sj9xcnfd1Zi91xmDQyj/ICkXSK4yzcx92ZZf5I28DwH7T/P/BNAnQYbpNqCLXxab5j
	 Rv1x5v2D/Ob0fPKAkz/EHpYwkCBEDPIHbnuzZMoB2vzDPvBSyEjtQGk7SNokpphG8E
	 RESaOJeSN2MQw==
Date: Mon, 19 Aug 2024 18:11:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: display: renesas,du: add top-level
 constraints
Message-ID: <20240819-destiny-sampling-e9bdaa79e128@spud>
References: <20240818173003.122025-1-krzysztof.kozlowski@linaro.org>
 <20240818173003.122025-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xUU/JYu+XtKbnnug"
Content-Disposition: inline
In-Reply-To: <20240818173003.122025-2-krzysztof.kozlowski@linaro.org>


--xUU/JYu+XtKbnnug
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 07:30:03PM +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks, clock-names, interrupts, resets, reset-names, renesas,cmms
> and renesas,vsps.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  .../bindings/display/renesas,du.yaml          | 26 ++++++++++++++++---
>  1 file changed, 22 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/=
Documentation/devicetree/bindings/display/renesas,du.yaml
> index 147842b6465a..9a2d1c08cb1f 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -46,12 +46,26 @@ properties:
>      maxItems: 1
> =20
>    # See compatible-specific constraints below.
> -  clocks: true
> -  clock-names: true
> +  clocks:
> +    minItems: 1
> +    maxItems: 8
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 8
> +
>    interrupts:
> +    minItems: 1
> +    maxItems: 4
>      description: Interrupt specifiers, one per DU channel
> -  resets: true
> -  reset-names: true
> +
> +  resets:
> +    minItems: 1
> +    maxItems: 2
> +
> +  reset-names:
> +    minItems: 1
> +    maxItems: 2
> =20
>    power-domains:
>      maxItems: 1
> @@ -77,6 +91,8 @@ properties:
> =20
>    renesas,cmms:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 2
> +    maxItems: 4
>      items:
>        maxItems: 1
>      description:
> @@ -85,6 +101,8 @@ properties:
> =20
>    renesas,vsps:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
> +    maxItems: 4
>      items:
>        items:
>          - description: phandle to VSP instance that serves the DU channel
> --=20
> 2.43.0
>=20

--xUU/JYu+XtKbnnug
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsN81AAKCRB4tDGHoIJi
0lqzAQDEzNVptamgSWR7ZQT4b0vDeHuVE/bagG1JpSirSojIkgD5AYcRIBIW8BLr
eqgIzbzIMcv8p4Npru/ForYsRWGYWww=
=R730
-----END PGP SIGNATURE-----

--xUU/JYu+XtKbnnug--

