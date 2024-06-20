Return-Path: <linux-renesas-soc+bounces-6525-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA7690FFE8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 11:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9A0F1F23C01
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 09:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8624319FA72;
	Thu, 20 Jun 2024 09:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="NHthte7V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7297515A866;
	Thu, 20 Jun 2024 09:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718874403; cv=none; b=ZLyYLKVgppmDG/W9zJ6sfRnacw3a34PX1BUFtWANjI+C+8oukO4elQLkw+Uwa2VVhlz26Uf21aN2QqTizMyecRc1RULNJnmRYIaWBAq7HdaLWoJK0XBaYg44b5jGSjhH2Il52rFFaTdKAo+ACesNLH3PSwQLILHasZ7L27wRHK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718874403; c=relaxed/simple;
	bh=6OdRD2Pmm+sZS+ESufv2ZHXmu0fdy1yV7iYkfgMQM0Y=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVq2rhzG1ajVTkLu8+gZGkD/lplYzoNAtKf3s0uqClTrUpW8PgV/Pvx6+q/GsArDVtagnkS2nbPTEzYIz5Ty+uQnhP9XPgVOBJBN3YK3lV/53JPgHmy6Irn/u6WR/MnsyBXxj17m8NNzSoc6wkZTFMworobfhdW3g/eatz4AiLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=NHthte7V; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718874402; x=1750410402;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6OdRD2Pmm+sZS+ESufv2ZHXmu0fdy1yV7iYkfgMQM0Y=;
  b=NHthte7VkM3tcQashrpOETf+kT9wst0mJNpbZFKNuFREethwRGnrxeaW
   2BjX+Je9fy1ffL8lri50QD4dyFqvF6ZbOnu/+YfCGmESSha+c1p3Vgx/p
   ukIa6FowjPrInxW278MLA7ZXKCteK21g9mbvma6mEB5e4RKWfz1HgyhW/
   BqZuvdWmldIhAYRQsIC4RnkoGvAH0FWAfBNIwMR9h5lRV9ngzU+6iqq1k
   q5C/ZqmR0KJei1QTFcngSeUbuFlvlCVD72//Ubu5zPBkz8cvFH2fy1YXG
   4Y+xhy+ETbdKnOkhl5atOKdJsIglNa5x+vJC6HWgUZzEhHk1dyPwkGuXs
   g==;
X-CSE-ConnectionGUID: MipQqjeITk+QAbwOg52+7w==
X-CSE-MsgGUID: if95YIMwRPCXshVsCewx1A==
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="asc'?scan'208";a="259150357"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Jun 2024 02:06:40 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 20 Jun 2024 02:06:38 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 20 Jun 2024 02:06:37 -0700
Date: Thu, 20 Jun 2024 10:06:18 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Marek Vasut <marek.vasut@mailbox.org>, Conor Dooley <conor@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH] dt-bindings: clock: rcar-gen2: Remove obsolete header
 files
Message-ID: <20240620-paver-fidgeting-70946d975eac@wendy>
References: <d4abb688d666be35e99577a25b16958cbb4c3c98.1718796005.git.geert+renesas@glider.be>
 <20240619-explain-sip-97568f8ac726@spud>
 <43a57696-eb4f-4ae3-970a-cee0640baa17@mailbox.org>
 <CAMuHMdV2M6zKwy=Qqv4XR1Zjz4yRGWcp_EYO2d68DUyLp2O1Cw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IDCVNyGcpbFD7Skf"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV2M6zKwy=Qqv4XR1Zjz4yRGWcp_EYO2d68DUyLp2O1Cw@mail.gmail.com>

--IDCVNyGcpbFD7Skf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 10:30:25AM +0200, Geert Uytterhoeven wrote:
> Hi Marek, Conor,
>=20
> On Wed, Jun 19, 2024 at 9:17=E2=80=AFPM Marek Vasut <marek.vasut@mailbox.=
org> wrote:
> > On 6/19/24 7:48 PM, Conor Dooley wrote:
> > > On Wed, Jun 19, 2024 at 01:22:46PM +0200, Geert Uytterhoeven wrote:
> > >> The clock definitions in <dt-bindings/clock/r8a779?-clock.h> were
> > >> superseded by those in <dt-bindings/clock/r8a779?-cpg-mssr.h> a long
> > >> time ago.
> > >>
> > >> The last DTS user of these files was removed in commit 362b334b17943=
d84
> > >> ("ARM: dts: r8a7791: Convert to new CPG/MSSR bindings") in v4.15.
> > >> Driver support for the old bindings was removed in commit
> > >> 58256143cff7c2e0 ("clk: renesas: Remove R-Car Gen2 legacy DT clock
> > >> support") in v5.5, so there is no point to keep on carrying these.
> > >>
> > >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > If U-Boot is not using them,
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > (and if it is, another task for Marek I guess!)
>=20
> Good point!
>=20
> U-Boot does have include/dt-bindings/clock/r8a779?-clock.h, despite
> never having used them.  The unused headers and the corresponding
> r8a779?.dtsi files were introduced together, in the various "ARM: dts:
> rmobile: Import R8A779[0-4] DTS from Linux 4.15-rc8") commits in U-Boot
> v2018.03, i.e. after the conversion to the CPG/MSSR DT bindings.
>=20
> > U-Boot is using upstream DTs on R-Car via OF_UPSTREAM, so whatever
> > happens in Linux also happens in U-Boot since 2024.07 ... with slight
> > sync delay . I don't expect much breakage.
>=20
> So the obsolete headers will be removed automatically from U-Boot
> soon, too?

Not if it is is include/dt-bindings/, only if it is in
dts/upstream/include/dt-bindings AFAIU.

--IDCVNyGcpbFD7Skf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnPxCgAKCRB4tDGHoIJi
0iSDAP49ObkBfOyC1JWCyDJI0TEYS6St3ujvkDEoRB5D3w6spgD+JbRoosjAT5qc
7Il1G9/QIwCPlyaKyEdi7xNV3awjCwc=
=bHeT
-----END PGP SIGNATURE-----

--IDCVNyGcpbFD7Skf--

