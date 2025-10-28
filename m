Return-Path: <linux-renesas-soc+bounces-23798-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C62AEC169CE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 20:29:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88F47188A8EA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 19:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B20434DCD8;
	Tue, 28 Oct 2025 19:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sfF4SApS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446DD261581;
	Tue, 28 Oct 2025 19:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761679708; cv=none; b=V/rzbUoOH47ytPukOIobQtzoY1Zi0hoWl2XOW0/ak1A8cxEuJsonQXHRaaYc+YMGOhL4bI1AIBWzeSlgyt1QliyWRK1WzUDYUKMT/JKa2hevn7tfAy4MUbYhNXqS4TzV4Pqp8n2BO0F7x0czHgFg9mjWmzD9ecn0gZ71pzPeL/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761679708; c=relaxed/simple;
	bh=TsJiVu7tfPU5QNygJ6AqlG+Y4qq+GJW0tdIrv8h5l9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BlEF2jCb/R0BXl3IauzuGdo48+v/7F1hRfsGgAsmlXH83qzobhQihWSL7HzUcG1EVuBNOt6NxvbDA+YHCJtsUHndsrcu6tQdyu3pNyPIRZg6kJza0nxWfWxvP63te7yuRkcy6G9Z5/154nzvxGZjzFr9WMXKAs0in/xKX/gH4BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sfF4SApS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 246A1C4CEE7;
	Tue, 28 Oct 2025 19:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761679707;
	bh=TsJiVu7tfPU5QNygJ6AqlG+Y4qq+GJW0tdIrv8h5l9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sfF4SApSUDaWgAqHux/sZKL8rGKvF5aC9xIr0LZdA/DWukqRfpRXhZ5NpdGiQM/NZ
	 hYxLcFVBbFn7lEZ34F/OFimfnnk7OG03JURHlQcVg9wmdt+ghiQaY1opjrx8RXv0V9
	 Wws5J7hXfop8wNR3dw3ct57yR07K//BCoKuoqSeXhO7GAmnAaArYxpOneooV8JxGAD
	 j6qTxVNgoY0SDjuQf/Eb/9mPVHw/W15LXv1uUr4RdjHIPVLzacl35NEHonun3jD/y+
	 YVOGUk+ilcCcWEO10OjPOnuFaUa+Iv0c2ZdRw/7uKYMMVHMEek/gb/h+3R96awhXXS
	 3QfGuik4m2Q3w==
Date: Tue, 28 Oct 2025 19:28:22 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH 02/19] dt-bindings: serial: rsci: Drop "uart-has-rtscts:
 false"
Message-ID: <20251028-griminess-undocked-b6918de546fc@spud>
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
 <20251027154615.115759-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D1Iw+TUx8nS+nqMu"
Content-Disposition: inline
In-Reply-To: <20251027154615.115759-3-biju.das.jz@bp.renesas.com>


--D1Iw+TUx8nS+nqMu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 03:45:49PM +0000, Biju Das wrote:
> Drop "uart-has-rtscts: false" from binding as the IP support hardware
> flow control.

Why is it being removed, rather than only being required for the
existing devices? It's not clear to me that the comment about the IP
supporting flow control excludes the integration on these particular
devices from somehow having flow control disabled.

>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/serial/renesas,rsci.yaml | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b=
/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> index f50d8e02f476..6b1f827a335b 100644
> --- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> @@ -54,8 +54,6 @@ properties:
>    power-domains:
>      maxItems: 1
> =20
> -  uart-has-rtscts: false
> -
>  required:
>    - compatible
>    - reg
> --=20
> 2.43.0
>=20

--D1Iw+TUx8nS+nqMu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQEZVgAKCRB4tDGHoIJi
0g1VAQDAsorsBQUBiytjGezt5B9ODmmBWiLhV7Aikg2Eb1NlcAEAr/RZE2msMsdZ
1ge0LJZ0bqws73j19QI4et4h4LCbpQc=
=3GfB
-----END PGP SIGNATURE-----

--D1Iw+TUx8nS+nqMu--

