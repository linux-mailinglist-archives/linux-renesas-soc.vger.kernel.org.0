Return-Path: <linux-renesas-soc+bounces-20795-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8483CB2E640
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 22:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D2A87BD8C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 20:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE3B27B35D;
	Wed, 20 Aug 2025 20:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xf9fChm1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B57248F77;
	Wed, 20 Aug 2025 20:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755720686; cv=none; b=V+eiUySmUvBXaaIUnzIzCXVHjR3VNnWdGptLmW7Oh7rqVXBaRRk3eQ/y0uhu2T0j/ujRdki0Mey99pDLcEUPgOAx5SSNlRPdpNRr+p57pxgi9xZdEzxPRt5vbXS6B36+QSMf4mowl92rUXyYL3WNATUZqILAZrMtTuQ8aG2EJdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755720686; c=relaxed/simple;
	bh=XlLru7y5MSGajiGaryGBmyIhYBKNRiyhFMJDtDYqXFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYl42/OgX+bdN82yiD8trVesmt9KkTBol09DkEw2TDRpYB+DTXhj3NliyrBLMxQ/eDX1yjwXCNyJ5uD1/okd2EnSgVs8vh4DxYTn1+c9f3LfIwZE8rzE12iHESPOcfrlCHYTB+6HjyVSZ5AHx7hA/S+Q4vv/12BvizYjcvcCJu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xf9fChm1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C27C4CEED;
	Wed, 20 Aug 2025 20:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755720685;
	bh=XlLru7y5MSGajiGaryGBmyIhYBKNRiyhFMJDtDYqXFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xf9fChm1DfBhhD6/sVTENIG8BYm7MZpXmgK/5QplNuwnilKKFigI+BP9K6R9BmxQk
	 gTQoKOycIb9pOSX8gcP71ISf8Ol5LoxWyj/TrSAfsvjHP6a6chiD6jL4Tx6QvA66d9
	 gxaXaAnqRTsVtgZ1maHx+Lscce0GN2SIyKazv9VpagLMrBni8f/W4laSqt4QQ+Of4j
	 1Lsujyp5LzZj2MnBa7EVHERxAszofGNPunMPexh73UZxjb6Hx7MbAWK5eu8rpiWlYA
	 onjUSlE7odwo9uGgMAqYW3cqhIeVHZd0dynhkAIbuuW0uiEIcV3wCwIeSxt19NdJ/g
	 g0JIRpBFSd7pA==
Date: Wed, 20 Aug 2025 21:11:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 06/11] dt-bindings: usb: Document Renesas RZ/G3E USB3HOST
Message-ID: <20250820-onyx-salad-c5c96f6bd480@spud>
References: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
 <20250820171812.402519-7-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p836dbU6yWGHxN/q"
Content-Disposition: inline
In-Reply-To: <20250820171812.402519-7-biju.das.jz@bp.renesas.com>


--p836dbU6yWGHxN/q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 06:17:53PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Document the Renesas RZ/G3E USB3.2 Gen2 Host Controller (a.k.a USB3HOST).
> The USB3HOST is compliant with the Universal Serial Bus 3.2 Specification
> Revision 1.0.
>  - Supports 1 downstream USB receptacles
>      - Number of SSP Gen2 or SS ports: 1
>      - Number of HS or FS or LS ports: 1
>  - Supports Super Speed Plus Gen2x1 (10 Gbps), Super Speed (5 Gbps),
>    High Speed (480 Mbps), Full Speed (12Mbps), and Low Speed (1.5 Mbps).
>  - Supports all transfer-types: Control, Bulk, Interrupt, Isochronous, and
>    these split-transactions.
>  - Supports Power Control and Over Current Detection.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> +---
> +$id: http://devicetree.org/schemas/usb/renesas,rzg3e-xhci.yaml#

> +    const: renesas,r9a09g047-xhci

How come these don't match? I don't understand your naming scheme at
all, so idk which is even correct!

--p836dbU6yWGHxN/q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKYr6AAKCRB4tDGHoIJi
0omXAP0Wsz5yJ7xc5QAkTaaz6vWUAs8TZPxd7tTHdA5Iob7KbwEAj5sntbfoCFhw
9lpgPTDzmod7xdfet+P+7XWxZk+NSAI=
=bTnM
-----END PGP SIGNATURE-----

--p836dbU6yWGHxN/q--

