Return-Path: <linux-renesas-soc+bounces-10746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 788E09DB3FF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2024 09:45:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 019D51666EA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2024 08:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252781509A0;
	Thu, 28 Nov 2024 08:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="N8IzQ6n7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BB314EC5B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Nov 2024 08:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732783509; cv=none; b=qfdUr7C7fRBfiQuOjD8Cm0T0Xbf0ha7GQ/+0x4NcRL8DSZI7l56RaepPAffX5NsgvbO6C2rhF1wM35D4n3dO/1K8f+5LnqyiKZ5FXr6/cP3CVn6guttLodL6w9rUZBiTdoEMi/izioR1PpvS25206cm8adZQI0DSvGGkn+w5ajk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732783509; c=relaxed/simple;
	bh=AhRfrv3siM/DR9yQsa9Rr5TAj+IfnVuzXG15pSrwF74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARLpQo+no2bJHrHDVtHyj3wuJIpA83BUseLriTErQ8Qc/B4FPSzwPH9msChdjhKoGMG4NdcMy8oyqc8BgVnf9Tbvlf3nIPAbS+PbQQZi78IIPDa8hiFk5AEF1nbqx6LepWZ7FWpft4CgL3VYYqTUX6W1g93T9G3LSui0WZtmlZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=N8IzQ6n7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=YF41
	CJDZAtoyb4gv5mWq85SCtRp05EsttGDs2etKBMU=; b=N8IzQ6n7WfmyliGQ19/G
	K3gAsCDSb+zNfcliq+hE729jCWxR/P5lqcDofdbT9EtPIDa3BGgwHadEBEHK35Vb
	DJwsQMuckqD9eIDKHYewTuuzCf/DGiqkwmCuHvayfskJZCprJQdNTOk2dOA3NMWx
	EHW7v8g1L3HLPMJQHHTNvn5fRetqyxhdIrTC8jri0SrK3Okv/tZL9HpjAzVQJA6I
	vSzcJkSNI7IdQGlnJ5RU2Z/2oZX92NtX7Ll/4LTcOl/3QPoAGGere//aXnzTFxGO
	Fturw2JT3oweqpXUh+upC9VmFNfCcAX6VyPLQx52xJSD0Cxa6xSjZxuwSPXWpREv
	8A==
Received: (qmail 842162 invoked from network); 28 Nov 2024 09:45:01 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Nov 2024 09:45:01 +0100
X-UD-Smtp-Session: l3s3148p1@E54LGfUnyIhehhYU
Date: Thu, 28 Nov 2024 09:45:00 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: r9a06g032: add restart handler
Message-ID: <Z0gtjA3RCLzDaUX9@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
References: <20241107193145.20175-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdW1KpmsHEFUpKYNe96cEzUEEzGUXC52o4Fand6R+o9Y=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vKu7NAyhlgE4muqf"
Content-Disposition: inline
In-Reply-To: <CAMuHMdW1KpmsHEFUpKYNe96cEzUEEzGUXC52o4Fand6R+o9Y=A@mail.gmail.com>


--vKu7NAyhlgE4muqf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> > I got a RZ/N1D now. Before I start the real work, I need working
> > 'reboot' for fluent hacking :)
>=20
> Yes, we all do ;-)

Well, previous N1D developers didn't, it seems...

> > +       error =3D register_restart_handler(&clocks->restart_nb);
>=20
> You can simplify using devm_register_sys_off_handler(), cfr.
> drivers/power/reset/rmobile-reset.c.

Ok, will do, thanks for the pointer. One question, though...

>=20
> > +       if (error)
> > +               dev_warn(dev, "couldn't register restart handler (%d)\n=
", error);

rmobile bails out on error. I still think a warning is enough. What is
your preference?

Thanks and happy hacking,

   Wolfram

--vKu7NAyhlgE4muqf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdILYgACgkQFA3kzBSg
KbaQPA//aX4/ucUpzStzX47qvggxuYAqa9O7KJc5bRiSTYNAyEVM8EdQ9XJS7uqQ
yQAkwDj+9ulKKxAkcCUHaQxaHYVHN+Imnvwmwuo9/rMr5/DOf25jYwFdZPOiYXzH
5snlH5435CMl47YUetnULrfjZ5DI/FiRWCPTNKdJcHQYBBqnJpLlUKlXZEHRZ0qq
haqc8lLgmLb4vsppj5W9Us01DYwft5Cn3rZclVJstE/sJ8xkTJnYs8+O5qRF46vL
cNYEBInkR5a61dfybJ3X7ZRFPvEFYnZzd6sE4NFPtNN2pV5MGIZ5r0uAz1nEbM/R
TKVcfz2G25aul4vMWrInMfyitpK8xJhuVm35xs5L5f+9JR0rmzlX6UgBH4iw3QlU
xIcFFR7OTesWF580J3kPphSplHc3eWLQGSCyq01JWepltCTpvWUr3GiRvdWtIHAC
QzsLuVTUNHdHhJPkCcVOqnvLKVf0qa/Wmp+gwyfLh3Rpx5gDE3XJ/W23sm0/qbBK
plfOvi9EKKmoc9RAQAXd0QvkW37Cllasw79Xg80cGRcU0GOQ6O0kJWRkvN8XcVvR
+7pHnywGXm8Lq+Zp8099/0HOw9CmS/CaubZZTX3JDBPoVvx5dtx9NnUSWbE9n/eL
ejE1B20/ICwEi4V2AqvI4bWAnQdYjabrWfUYyjGiVDe8l5D5GWA=
=0H4A
-----END PGP SIGNATURE-----

--vKu7NAyhlgE4muqf--

