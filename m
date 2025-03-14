Return-Path: <linux-renesas-soc+bounces-14395-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF135A61A04
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 20:02:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DF2C463387
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 19:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D174202968;
	Fri, 14 Mar 2025 19:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YLpwZDBg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDEA2AEE1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Mar 2025 19:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741978920; cv=none; b=o9Shi1gYLlZW4SzEP/Pyakc306eK86Z+EgCEVTnuXpDtABikPg5OgAdfT/vwZ/0DTUX/XbDCblYh3BQk51kTKusAfe6ZHB8Dg7A24GjmjpvoWfyCMw+VQzUOAIwkeA/juZqWG5fjB8Bj90dKSw8GaV/d1Wc8kLmVSPG8++AsGQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741978920; c=relaxed/simple;
	bh=zS+VIJjPhOlqAPHbDVyzgjWl85m3r5eFV1c/Tnbug5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=riLSKEGBpushk18x1p2WexoGllWEseBE2vZgE2Sq26q885WfKP8Ru+Uuf13wII4hKMYxsedsqmWnmpewZjaA1clJrDzOpMgzvwEB3aQpZR5MekqNU8PzwQkrpvjGFqbF+KS82PqMMyyvGV5wVhneY/2sRipRqpuF6/sPyFU+Udk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YLpwZDBg; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=zS+V
	IJjPhOlqAPHbDVyzgjWl85m3r5eFV1c/Tnbug5k=; b=YLpwZDBgF/VSqDMynIRm
	LJDJQiJypZ+nVqjD3C61y0f/+/7m9iRFAGS1FSY0kQcHLSps4z5NjG4D25ZI3/MK
	hTMTeNuP4JOGaE4IcjUiAnaeyqkuJUU6ap/LTXfocrOrcg1gmDLx+W1KWshnBmT2
	ULz4ztm95hEx5EqyZJNIB35NE8U3S2eXqqCeBczc+nlJGRJHuqsdjlhMgi5j3Hfg
	qEBa5L6WbKMhQ4l0r+/DD4JouZfW2ecHQLm/a60r2vWjfYuCjFTdnsR9vGHe5OQl
	bMIjbs7JUZQqZ5rXhPHA0Hup2MHuqt/XfI6d+HYZumjOPA3Xnj8ujWCXno5jk+gT
	Pw==
Received: (qmail 2137754 invoked from network); 14 Mar 2025 20:01:52 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Mar 2025 20:01:52 +0100
X-UD-Smtp-Session: l3s3148p1@FGpDElIwgI0ujnuL
Date: Fri, 14 Mar 2025 20:01:52 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Subject: Re: [PATCH v3] ARM: dts: r9a06g032: add r9a06g032-rzn1d400-eb board
 device-tree
Message-ID: <Z9R9IHyXK0TBcPZa@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
References: <20250314-rzn1d400-eb-v3-1-45c4fd3f6e01@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Txifhr+AlaUgRoBc"
Content-Disposition: inline
In-Reply-To: <20250314-rzn1d400-eb-v3-1-45c4fd3f6e01@bootlin.com>


--Txifhr+AlaUgRoBc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 14, 2025 at 07:56:29PM +0100, Thomas Bonnefille wrote:
> From: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
>=20
> The EB board (Expansion board) supports both RZ/N1D and RZ-N1S. Since this
> configuration targets only the RZ/N1D, it is named r9a06g032-rzn1d400-eb.
> It adds support for the 2 additional switch ports (port C and D) that are
> available on that board.
>=20
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
>=20
> [Thomas moved the dts to the renesas directory and declared the leds in
> each phy]
>=20
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Oh, cool! I will definitely test it next week. Thanks a lot!


--Txifhr+AlaUgRoBc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfUfRoACgkQFA3kzBSg
KbbnTA//UVMxsSokBVUsoucOsPcgopRUy4JIr/IfHjKqhD1z0GrjT6QVBeUhKV41
ddKB8oFb0voidl15RNyFgF2sfl2rGVmvz7QWob5FZeGYLoPrCJJ9BF2YxBachGYV
qxTtljqsYpmduFOV3U3xH9vZbSPbQNVS09aMHMMXUeKNArjwQG6HEnB0sA2N3nwp
8fMPL9yzrtXBOhmE+lNxCNn+Fq18Mw2r4H8VB3o2YlaHXFBp7l0cN/fG/NNe+eg+
st+VxbYtOo1u3U4NH923nCiXshz7VthEI5DPgCnB7dmY5zk5fX7rx3b13vRUyVzM
OkAtQv/383aoi6Imh6qibj8s8IAn2nbjmrRUOGBDAuSCUxed1YpeibOLx53fLnLm
UKlWpaeG4W8aOvBl9p6hyCF4inkShXxE996LK6fP1i9HNhhGfgXv8WHgNLE7/dcx
rXSY7xALjEBze8InOFA+9d/SqYlfdmnPMCGXMLufKLN76A601widsRNVNGuQbEPN
2TE8vOPy9B8A6OVjL3C6t2E1Ou1uIUIal1tZwCl6a20hq3zdfe17bxRzXvcjjAMz
6X0aDO9eMA5+WfQdIiNkwdZSkh3mN1BdveIz4pkm+JCLdAikvni75ngyOwuAaY1E
l+M7bV5ePvYFGoH0Ybtt3c6Q9das7shYbVzfHZ8B1zrYB+RWKME=
=bZxX
-----END PGP SIGNATURE-----

--Txifhr+AlaUgRoBc--

