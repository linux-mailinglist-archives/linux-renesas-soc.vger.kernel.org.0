Return-Path: <linux-renesas-soc+bounces-7728-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDBC947C8E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2024 16:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B205282001
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2024 14:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFAA139CFF;
	Mon,  5 Aug 2024 14:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IaOjWVR4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DA2136658
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Aug 2024 14:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722867021; cv=none; b=IVB3CsH1iyle77crnMQVO10f+KIq78VG2Sf/33RhpIv6+8wEBJsOvl/HHhlYuKOZL/8Jgz9TfEr0eEF7WoDFMhmUwLI/aqDLaQ9FZCDvcUZOjPh42KxYYSFDbtw4C8uiq4qXcXh35hn8kt/rh1IESPCF0d25+9t6yOUoyjbhyWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722867021; c=relaxed/simple;
	bh=CRk+WSvg+8ew6Axl9UsveI8a1vmiJxVs2T0r9Dd2K6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bzpNS6jIYYFWIBO29FvauosFKMKA/kJCmFs9B/oixe4Qs8y2irSTRkxUl1TBjRGdv4P0w+NaDJVXpAPQ5bB33pQp12Et3gsZddlxQjK5dBtd6oXrNiRn+cxClve97oObifhSZEThKfjgdFL2SVuOze7E3ebGmgqUkfchPvx3OV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IaOjWVR4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=VC7W
	KpuwekykfBr8ihdjN8Kp943rQ0vp+Rxzc1f6dM4=; b=IaOjWVR4dCjLxNxJihk4
	8UG0Q0HrzC69VPZNP0QdivZuHbUesoL1qKJj7otmMAMZovNP0FDhWci5noO5veaV
	gRNh5BfTw8ClwNA2mrE/ditz7Ji1c+qgrzn8ra+HgAaoFIbdcws4iWqUhNxa/wuE
	8uzPeAIHELZtA5wbas4yJee2xmaEM2ZAb+bubV6Wg5mrr90yWH5RoK5VLjgOcXWE
	gJAf0tRV80nfD2HeHQBEVC4bE8iAVks0x+jeTHGC0sd1RFoflm+57a6/OvXXetub
	gqR4mVLuUD4sp/NOHu8cwURS+tEjbzpyLSTa0LoD4+h33yroQ1fr0cfQ0eqb5v78
	+w==
Received: (qmail 2002488 invoked from network); 5 Aug 2024 16:10:14 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Aug 2024 16:10:14 +0200
X-UD-Smtp-Session: l3s3148p1@vMFdPPAeYskgAwDPXxLGAIH3oZkcU6AS
Date: Mon, 5 Aug 2024 16:10:13 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 3/3] mmc: renesas_sdhi: Add RZ/V2H(P) compatible string
Message-ID: <ZrDdRZOdXv4c6-P8@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240724182119.652080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240724182119.652080-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="06jFUOUZfUFs2FzP"
Content-Disposition: inline
In-Reply-To: <20240724182119.652080-4-prabhakar.mahadev-lad.rj@bp.renesas.com>


--06jFUOUZfUFs2FzP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2024 at 07:21:19PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> The SD/MMC block on the RZ/V2H(P) ("R9A09G057") SoC is similar to that
> of the R-Car Gen3, but it has some differences:
> - HS400 is not supported.
> - It has additional SD_STATUS register to control voltage,
>   power enable and reset.
> - It supports fixed address mode.
>=20
> To accommodate these differences, a SoC-specific 'renesas,sdhi-r9a09g057'
> compatible string is added.
>=20
> Note for RZ/V2H(P), we are using the `of_rzg2l_compatible` OF data as it
> already handles no HS400 and fixed address mode support. Since the SDxIOVS
> and SDxPWEN pins can always be used as GPIO pins on the RZ/V2H(P) SoC, no
> driver changes are done to control the SD_STATUS register.

Okay, so you mux the pins as GPIOs and leave SD_STATUS alone. Smart
move.

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

For the record:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--06jFUOUZfUFs2FzP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaw3UEACgkQFA3kzBSg
KbajIQ//cfYfi1vC75daca5woTDJICrAM8gVdOmFDa8hFFc0LKwgUQFYiWu6CjOE
VPyCunnEM0YxAHOgc4pmBfysESH/qPnd78wLKDmFxabr8FUGGbRPxsM9nvNC/mlp
Of5A2RSMayNAz+s15fcMwhZJT2V3U4rCDHVK+iZPjJ3Opfx5CzNta7aRVlvWBJC/
dmX7Sh4g1RDsJ+52VVX4hPXOFjEoZSwFeRv68kBvXkXhGu8He8Z+kE3oe1N/uBwb
mcML9RQQgH+pNHirTZPpMvyPtnQizCt6qEbWcQ5cIDkV1uGiZ/lIaztNIayB6zIu
izS7YDVNWRsjvHERsGQz14XgphDFhDlHTnxcDThGtd4brt3GB1twsf5wuD6fnQO7
vnQJnFHrgb7LoJqdg9v01NkoJ+7WSryPez2puxPGhWEQzGWBsThjsTQnsmnAXzcr
Iy8tE66/sJUYWDjsZEMHKgaPnRlrUl6BYGIDSWRO7jCqGfi7bCc6iLh2/m1wN7Wi
iqgd0grWq75DCxz2UVEZX/Zk2mhv7430QB34q1iRDErRu07UsM/+T3SoRafQtgFw
CEOog9Hn4IIlNubE93JlJ7O4DBDb5ugc4Ogs8LSa7NURXix9vC4XcUGZmPLTetVA
Ngtyhv7vfRplIR4Pu5HN08vLgz9QiS5cXx3rUW3g5hhHruOYI1o=
=pRex
-----END PGP SIGNATURE-----

--06jFUOUZfUFs2FzP--

