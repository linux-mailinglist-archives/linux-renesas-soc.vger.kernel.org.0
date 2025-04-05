Return-Path: <linux-renesas-soc+bounces-15417-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 976CEA7CB00
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Apr 2025 19:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 684F6172CC5
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Apr 2025 17:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43DC31474CC;
	Sat,  5 Apr 2025 17:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jodN/pIo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C931C68F
	for <linux-renesas-soc@vger.kernel.org>; Sat,  5 Apr 2025 17:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743874267; cv=none; b=tXn6z7gZuF4hFkb8+Hwlwm0i5NGPf+tvgnpSl4pR0XD5+SsW0QvdErO/4SBjoxQuETLMBlYk//mhUXRjdhCJGUVn6W4wPCHHxxprLVrapkn1C+eKiiHz9l0ejusLZV7gbWEtN1iUOae8kfcMm5yGweK0h7o1rKo3TmCgKnLbD1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743874267; c=relaxed/simple;
	bh=rIhwcxPd2cxp8dRHI7A1y88SCNyUyk0Vxv1LwRO+ytY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+N01yh0EikxpuHtcPyCJCRX+rFpOQBYe+01KWF+8Kk9fzKix5DPUEAwTvuugXrZqlOFRepWsI3r3tRblmgYRmoy1M0GYPAy5+h7FPvyiPFdLDWUnw9WUNwhQuXYZiWUw49sTfxl74GaAqMsCBCmyCDhagNPjSEnw9qN6H1jxbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jodN/pIo; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=QU2L
	hyDm7ZN+LndAt52NkDLC90jyX62wBlIqlPp9Ti0=; b=jodN/pIodPsO1z8eEquZ
	kWzBLiHSuIFTuzLPMCTiuPjnOW7OAfzKlGWKQEeAhv5pOlPYWLDoxRgygHmYjYD3
	tyjou5VOzPHriM15loIGR8L+NLFcZlTgxtgAQ/9Wa1T7hMLMLYgiIQi+RdfKoV05
	SN1d4dfdA4HDVanQwf4DxyIR4n51Spx8G8Num+0afVMP2aBXoXWXjIQSVtPrw8Rt
	w8hNF3j48sJsnCROYbxoc2KeMH3uHi+I2085q0eKyVLNJvPCgcdgzkgQjA9nvpIB
	XixLjdvASkdReoesMYY6CwCt9xCvkIzOSj3StI2M5OGpBlZulMArlgkzb9J1010U
	5w==
Received: (qmail 3191545 invoked from network); 5 Apr 2025 19:30:54 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Apr 2025 19:30:54 +0200
X-UD-Smtp-Session: l3s3148p1@Q2R7XQsyoIgujnsA
Date: Sat, 5 Apr 2025 19:30:54 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: mmc: arasan,sdhci: Add Renesas RZ/N1D
Message-ID: <Z_FoztY6-E5qdDse@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org
References: <20250402093019.5639-2-wsa+renesas@sang-engineering.com>
 <20250404160547.GA1521768-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BFVwm6d4lRMoywz+"
Content-Disposition: inline
In-Reply-To: <20250404160547.GA1521768-robh@kernel.org>


--BFVwm6d4lRMoywz+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +    items:
> > +      - const: int
> > +      - const: wkup
>=20
> The standardized name is 'wakeup'.

I guess this overrides the naming in the datasheet. Will update!


--BFVwm6d4lRMoywz+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfxaMoACgkQFA3kzBSg
KbYnow//YbLOFUr/VHl2OMan3dvt3mkJaftIYTTUdvbS68nc+OqtfRyPnO/yfL9K
Ee7IWkv1j2VylXndY3yNYGG96od/DMMHAd3ArEM5aGyeGIrbwcHPzNqO3WwXepuR
no96a1ceGuPSVm/vezndBa62yv9WQy9blH8RMBB1cIVuZjVwgnOWP0WUKH72+XnJ
IO4sn4WBiPqYytF4t0cJ3JsI5O7e4n7/0JEcaEBYOWzD3Ncz1sXeTHsrC1TzpGCh
gMiW/U83Wv4sOZ74J4Udt2Fr+hB99XNuRyUDb34GLT6cyr9jICGEsnLGcLkv2YV7
P+mNWgEme1XaxDI19arYkSQKbWe+l2w3j6q4ssEplBn4mUiNunKqPV3AdqH4L0yK
jQCwrVvZWQUNsGvLXyLYMblsuZ53CnVWcEP+EQtEBnemH1itpUi6G3WAjjcQKj31
QEUD6M2PTl/CWChQnFaKcKZnRaIN+5Yw/8TeHIWg5GLwZrRTDfPU8tdQeXH6GXe+
Llgd4jUc9LKAkigJUJ9khjwXF/0udNBayt3BCmfIAl9aiHkFL0EwQ9TK/KFybF7x
kkpvJP3Yx88Uyf5wa65b/ueVMeDv+N1yFxMU7FRln8jCFGaSO4gaG2B7hYXFFp6W
aYl2C6GWAXIWKFwKIS10fivaIeoMVL5DriWssmaCmqUU1SRwMLk=
=lljL
-----END PGP SIGNATURE-----

--BFVwm6d4lRMoywz+--

