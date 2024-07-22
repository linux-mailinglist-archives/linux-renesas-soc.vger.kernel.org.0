Return-Path: <linux-renesas-soc+bounces-7407-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E8C938E02
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 13:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFAC61C21172
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 11:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5550A1684A6;
	Mon, 22 Jul 2024 11:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="cUYoOc9n"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C3F1C2E;
	Mon, 22 Jul 2024 11:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721647343; cv=none; b=sfaYwEUiZ3L+GItO5mjMAXZ9ptd9Du26JGH4pck06b3zr5kcg57pkxflsOeSAMzE9VuPOZTG3YsyTuh26H7GDonTE6CUCOt4zz1arRO/mvGLra1zOKpDPnIjS3uaAtzTvOmRF6AptgthYkKN1F9NTncY+433MI9unf1SiGUlAek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721647343; c=relaxed/simple;
	bh=TSjluSvqQ3OxAtecfmW9t01oCs4V2LAnNclER/7fRvQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=amOXDAM9DHVq7p9Gf4TkdL83HGp73lyySQmxru+O+spU1zEtfZGTvhYIGU0o0y9hOsQOdibTHP1kMzmGH8qqtYjHYI58ui+3IVhTPgUg/BX9bKBVGVWnOuvG2fuqHPJlyOsRopMNBvd5xqb2n0m2Uo1Tc2gVYnreFK4h/nnM6N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=cUYoOc9n; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721647341; x=1753183341;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TSjluSvqQ3OxAtecfmW9t01oCs4V2LAnNclER/7fRvQ=;
  b=cUYoOc9nF+QnNyVYPp3K3AFgOVGJ1bB9jxsSb6ydW4L0KGmxEsN9LUn3
   enk8os9N1DT2I/TuV/ywnmSsBS1KSUF7itqhgMaEtUmFELC5bBX0o4Mmg
   S175HbQdYh+ChcSv8/9KyiVHvj++gFNfSjCtvsE4jpyn8x5O9eF2PtH/x
   ptTI/23tC833Tu+FvVw9v1HGPguE1NE/6RXsNqnnb5m3RVJOGIc50AIA0
   SL2AvHpVvp7HKQeJ1ZaLBe1mgLqoHo28Hb652b6UnqKcJ0vz/kI7HD2CD
   SqwokPP4boZip3rNXVU2Bd1Jqt3uaFInMCGW0mrvX2UZEBqK3WeksHyxx
   Q==;
X-CSE-ConnectionGUID: 88n3YL8ETjOgZf2mQfcPfQ==
X-CSE-MsgGUID: f0NRyWKWTPmVCxK0TqFeIA==
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="asc'?scan'208";a="260412435"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Jul 2024 04:22:14 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jul 2024 04:21:33 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 22 Jul 2024 04:21:31 -0700
Date: Mon, 22 Jul 2024 12:21:07 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] RISC-V: run savedefconfig for defconfig
Message-ID: <20240722-unlovely-snowflake-75e44dfd22fa@wendy>
References: <20240717-shrubs-concise-51600886babf@spud>
 <CAMuHMdXc_VPRLg1N_uCerXzzntJ23pq6m3Jb5eSPVZjxuXjHAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zjetONaQtH1+epJ3"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXc_VPRLg1N_uCerXzzntJ23pq6m3Jb5eSPVZjxuXjHAg@mail.gmail.com>

--zjetONaQtH1+epJ3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2024 at 01:05:10PM +0200, Geert Uytterhoeven wrote:
> Hi Conor,
>=20
> On Wed, Jul 17, 2024 at 3:29=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > It's been a while since this was run, and there's a few things that have
> > changed. Firstly, almost all of the Renesas stuff vanishes because the
> > config for the RZ/Five is gated behind NONPORTABLE. Several options
> > (like CONFIG_PM) are removed as they are the default values.
> >
> > To retain DEFVFREQ_THERMAL and BLK_DEV_THROTTLING, add PM_DEVFREQ and
> > BLK_CGROUP respectively.
> >
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Thanks for your patch!
>=20
> Perhaps we should add an rzfive_defconfig?

I dunno, do we want (potentially a bunch of) platform specific
defconfigs? I'd sooner delete the ones that we have than add more!
I would suggest to just turn on NONPORTABLE, but that isn't a solution
given that the RZ/Five support requires turning off Zicbom. Ultimately I
think it is Palmer's decision whether we add a defconfig for the
platform - it is a bit of a special case given the aforementioned
incompatibility.

--zjetONaQtH1+epJ3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZp5AowAKCRB4tDGHoIJi
0jaMAQDj/lao31dpASHfsg/s6LHzh/a6KomgsOZaKsJPBnapZwD+Jl94C1zmK7X7
i36INAHW9SWtJmxl0iJFRZEYtv30zwo=
=gdzg
-----END PGP SIGNATURE-----

--zjetONaQtH1+epJ3--

