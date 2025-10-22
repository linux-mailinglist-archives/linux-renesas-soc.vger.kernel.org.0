Return-Path: <linux-renesas-soc+bounces-23406-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B77BFA6AD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 09:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10BE03A32A1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 07:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6B12F39DD;
	Wed, 22 Oct 2025 07:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Q6JsdRRV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB142F362A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 07:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761116510; cv=none; b=RaC3lpIMFEhDXwg2hthyEoOR0YhpbVoZ6IGT/yoloIm/2QOVmLH1h6dWN0miSK3gijnOOve0/yLfA7ZALu6vt9iYsnFNgQ0ymQ0ks943TxDZfiTK2H7HSvFSWKD0Z8CuRm2LthbyB8TyojY9AyGO9KSvykGB36ZvNUcWSYuxnyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761116510; c=relaxed/simple;
	bh=xYBzTkkDJCWTjFk+vwV4Ph9IB+akx3BABNKVQ1En2YI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uq5e1KDPLimJKEjOpD3I+WOgOLjSA4HgVrLGlkLNIxIzJJyMX6n8Y41l2P6GJgwNdLZlQysoxYyi6d+3Ql9ph4Y54SbqDUQ+8/InuDRVsl46keAcFcwoZqkbN9OMFRVjPOpVlKyxh+mHqmd54t0A40dxAybELGVtUfVjoKB7o/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Q6JsdRRV; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=rll3
	M1pGAWsrf5pLEqz7xhA2M7kxNOl+FsQ+039H8pQ=; b=Q6JsdRRVhMs7Ev+Igivp
	WiT75oMtxUmwMyHutTvMnvkSgEPBxDsb7sncUZSLSkgS9kfq0weUdMkEgjRhnWNO
	UJ/eAe19UP/ZSEFl0PkHOKsIA/sciMPuXo22UkjWuIdCk4KTlDTcqBlgNnat9nLE
	Bij3ovwWaPpreONLe+RFy9/DQ+rw9wj8R5+jJWkzukBY1+Be+fHOEmwUOIXSQh7v
	5FAntYnW8dSu5q4g+6EbWHfdM/azRwhAcJGlL708TJxcdSV75+F4AD3Xcsu0ut9X
	7Y6f+kEFB2HQbDbo3TN5ELvSTvSiW9+n2heK3UkbBib/pD7Nyj3PoUvL4eagA5WY
	9w==
Received: (qmail 1724248 invoked from network); 22 Oct 2025 09:01:38 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Oct 2025 09:01:38 +0200
X-UD-Smtp-Session: l3s3148p1@YABF47lBq3ttKPJN
Date: Wed, 22 Oct 2025 09:01:37 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: don't reserve SWDT
Message-ID: <aPiBUaTQZcFK8UF_@shikoro>
References: <20251017115123.3438-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdUCSRKAbD=DfJxfFGpfKTRkt=a2BO+HnwTqALBeeECOkA@mail.gmail.com>
 <aPaSF2lokJ748cTx@shikoro>
 <CAMuHMdXv_R6POTQe=MEcEOraKhjhzwrW5skkWnzgvijF2qAykw@mail.gmail.com>
 <fba13116-2495-49a3-a1b5-2eecb33bb448@mailbox.org>
 <CAMuHMdUP_bH5WW3=3J1H=6SocKzQXPdP7PFfYDrgaj4EhYTaYQ@mail.gmail.com>
 <0e81437f-a13f-4605-b7f7-6e6640411f30@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="91kMum7yq5u02O6O"
Content-Disposition: inline
In-Reply-To: <0e81437f-a13f-4605-b7f7-6e6640411f30@mailbox.org>


--91kMum7yq5u02O6O
Content-Type: multipart/mixed; boundary="GYrNZo38pT6+z9Vn"
Content-Disposition: inline


--GYrNZo38pT6+z9Vn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marek,

sorry for the late reply. I am on holiday this week with only limited
time for work and net access.

> I think this can be tested on Sparrow Hawk easily , with and without TFA.
> Wolfram, how do I test the SWDT ?

1) enable the node in DT
2) apply the patch "[PATCH] soc: renesas: rcar-rst: keep RESBAR2S in default state"
3) apply the diff attached to this mail (untested but quite sure that's
   what i did a few days ago) which allows SWDT to reset
4) access it like any other watchdog. IIRC I did this to enforce a reset
   # watchdog -T1 -t3 /dev/watchdog1
   (with busybox watchdog)

I think that's it. It uses the same driver as the RWDT, so you probably
have this activated already.

Happy hacking,

   Wolfram


--GYrNZo38pT6+z9Vn
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="v4h_allow_swdt_to_reset.diff"
Content-Transfer-Encoding: quoted-printable

diff --git a/drivers/soc/renesas/rcar-rst.c b/drivers/soc/renesas/rcar-rst.c
index 0541990901fc..a78ea77dba16 100644
--- a/drivers/soc/renesas/rcar-rst.c
+++ b/drivers/soc/renesas/rcar-rst.c
@@ -12,7 +12,7 @@
=20
 #define WDTRSTCR_RESET		0xA55A0002
 #define WDTRSTCR		0x0054
-#define GEN4_WDTRSTCR_RESET	0xA55A8002
+#define GEN4_WDTRSTCR_RESET	0xA55A8000
 #define GEN4_WDTRSTCR		0x0010
=20
 #define CR7BAR			0x0070
@@ -117,7 +117,7 @@ static const struct of_device_id rcar_rst_matches[] __i=
nitconst =3D {
 	/* R-Car Gen4 */
 	{ .compatible =3D "renesas,r8a779a0-rst", .data =3D &rcar_rst_v3u },
 	{ .compatible =3D "renesas,r8a779f0-rst", .data =3D &rcar_rst_gen4 },
-	{ .compatible =3D "renesas,r8a779g0-rst", .data =3D &rcar_rst_gen4 },
+	{ .compatible =3D "renesas,r8a779g0-rst", .data =3D &rcar_rst_v3u },
 	{ .compatible =3D "renesas,r8a779h0-rst", .data =3D &rcar_rst_gen4 },
 	{ /* sentinel */ }
 };

--GYrNZo38pT6+z9Vn--

--91kMum7yq5u02O6O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmj4gU0ACgkQFA3kzBSg
KbaH4BAAjuRJJnIdLCeewNfEatsM73wse8E8huOHm70DJSIfeKTJzxbV4jQqNxtc
THY9gOJSQ0Wn7qFBn/PqvmcTJbpcempdV8Z5kRYXB5ITMTO9H7GsTqEUoP2ZwoUW
kmjlu35Sx4fZpNuPeAS9yRds0F4OsVvfgzMKHAZyO7AlbC5WARd0ZF+vuKvgrNoU
gQQZ6yT6d5tfBqdFfm3kOdO7FsTWQB3rV+ofCBYcofNHw4nGLT4ReIOe34GsCk1J
+XO9v4kjXAG2tdjI5hfoKvmWnhIwMZxOhUNWKcKFEsD+owxUs8kqecCpcHFLEu+9
uNT7Wp0/iFLfp1LaqFSnr/fsZ8HtbguFRDLIapwRYFYst5s18RH7ywdpXe6lpRJu
gidvOcGaTwM6KYefn+l+9KXyxhzOfjJ+VD+TrgKlPkWvAp6BQ8XxERnM7EA/5r28
RB0i+tNUJeZpg5lghOAA/Zdf91dCkS/+cX7yS14MagbEnWuNZSarUiWteFFNCtw5
TSquoIWEgoXbr3YvRimXO1sxJb7LpqPy4e+d3aJUICxskxuM1G28hrjN93nZ/vi0
nt07kkjaAefepGJvFSrg9i3Rt5fUu+OhdqMZxM/us77VzB8fXtHhIbdgo6/+wrm7
Z0C5OSqVEL2OZ5FAgWLbAfLVRciCgORDi1wjtGAm4w/hW9Ob9jI=
=zw1z
-----END PGP SIGNATURE-----

--91kMum7yq5u02O6O--

