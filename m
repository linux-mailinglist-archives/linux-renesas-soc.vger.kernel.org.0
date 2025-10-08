Return-Path: <linux-renesas-soc+bounces-22809-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1FDBC69EF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Oct 2025 23:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8ED6D189B506
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Oct 2025 21:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D2A63B9;
	Wed,  8 Oct 2025 21:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JW0ED8O5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AE12BD5B4;
	Wed,  8 Oct 2025 21:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759957211; cv=none; b=pJDLmKHaZ/ljVfU/K5pCdc/mdK24+Fdyd5GE2amQzL2+53P/f84aQgxakELlf2ctLxTktc2uClDl29cUOi97HQRxED0D/vgj6+eYWl6JggUvMzxOWKWjxvDhmME5hwF8yi0M2rBla7Zz3BMy7sZ2apnbxtB8YPKUX8qNKTG5XQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759957211; c=relaxed/simple;
	bh=/zKymE8vFP4PMsDC0onV9cFElIIjnUvFsTSIrhVFd7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HmbtnxNRbDvwf+Awm2k64som45N4K+yDKNTPNMhDTbvaw2iLZ+AG+SrYEMY2nKR1h9K2Lnd4tRy49DHDzC/uYHQum7RDOoB8ZQVoaiJL4J560tbQk7CtXaOsS8KXrbKO9rlNiGroJTJzd+O8MBShSMYH00/hdwPbCuoMIF2QyAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JW0ED8O5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D31C4CEE7;
	Wed,  8 Oct 2025 21:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759957209;
	bh=/zKymE8vFP4PMsDC0onV9cFElIIjnUvFsTSIrhVFd7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JW0ED8O5CnMbLwV51u9kjZ6t3ch8758U6dWvCjreUEmU6aGNi1GdM6aLOcnofqycN
	 tos2QPyw8W3A3JLUxohdRW7rY/9UksUpGoCXqtezXvt7IRovFbMQ8WpVysC4NMsqic
	 1Vy3vNSTN+0Ze9sXlimTfdFX2BAQin1ORFqUdgUUbX86dZSw3XSBn0iQCFpNcTxR2w
	 dsj4bza9mRs0aiFlER9hzzwuZW3Yk828HWtEAHat0BTp1UJQghJeJeE5watgi/HqA0
	 a4xlV1oqqMtznDTEvEkkWaY4wvFuu2KFQZIoCxbld1W9DttQZkG/AvhlTvgqPFI87h
	 fZQ2FAHtn15eg==
Date: Wed, 8 Oct 2025 22:00:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: serial: sh-sci: Fix r8a78000 interrupts
Message-ID: <20251008-snowshoe-flyer-13e2c12ef244@spud>
References: <09bc9881b31bdb948ce8b69a2b5acf633f5505a4.1759920441.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jsdfNGgpffUE0CFJ"
Content-Disposition: inline
In-Reply-To: <09bc9881b31bdb948ce8b69a2b5acf633f5505a4.1759920441.git.geert+renesas@glider.be>


--jsdfNGgpffUE0CFJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 12:50:36PM +0200, Geert Uytterhoeven wrote:
> The SCIF instances on R-Car Gen5 have a single interrupt, just like on
> other R-Car SoCs.
>=20
> Fixes: 6ac1d60473727931 ("dt-bindings: serial: sh-sci: Document r8a78000 =
bindings")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/serial/renesas,scif.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b=
/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> index e925cd4c3ac8a47e..72483bc3274d5582 100644
> --- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> @@ -197,6 +197,7 @@ allOf:
>                - renesas,rcar-gen2-scif
>                - renesas,rcar-gen3-scif
>                - renesas,rcar-gen4-scif
> +              - renesas,rcar-gen5-scif
>      then:
>        properties:
>          interrupts:
> --=20
> 2.43.0
>=20

--jsdfNGgpffUE0CFJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaObQ1QAKCRB4tDGHoIJi
0guSAP43dC9HGiRNBMT7VSsDkr3egfLnvm+oMWzO0jriseKPZQEApo+ACfPTNC25
kLSxmc/MvwDOxx8Uha8AQaO2Ya4ekQ8=
=uNf9
-----END PGP SIGNATURE-----

--jsdfNGgpffUE0CFJ--

