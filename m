Return-Path: <linux-renesas-soc+bounces-17212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD708ABC1DB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 17:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7038188FBBC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 15:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406712857D5;
	Mon, 19 May 2025 15:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HHmF9q4l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152EC27511A;
	Mon, 19 May 2025 15:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747667568; cv=none; b=mlLu1lLV1oJW415dnCsuAATedFYKUudeAYmGEPmsRumABrvw/sBszmSwdAzjW7wnjg8vgW0ymWT7+XZq5GnFdZKR00wtkvgOTKqguxH7LN5gj5UCQh6g1XGmuCei0eKwzk3bIlDFor5/o+d4aznaOSNUQJiD1Mxyxt3elrmsAPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747667568; c=relaxed/simple;
	bh=SkiGJlLmwWrIeT59E68+X2AL+DOeQuSZ8tAHUGC/ssg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CFrmU5EaH6AsuQGt8T8uJDp8HOxaQ7gra/V+7eUEIN0ud9bacz2PinJitkgvtkw0fqrhGFe/6qYCR0Im/fxHebl+6y8MSF3xsN419g4YGJ980dKxzV6lU2MJod/POVLYlz5DoMjlJJJTaD9Ziu6Jplk+24oSOVXOfk5I8Eozf/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HHmF9q4l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99960C4CEE9;
	Mon, 19 May 2025 15:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747667567;
	bh=SkiGJlLmwWrIeT59E68+X2AL+DOeQuSZ8tAHUGC/ssg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HHmF9q4lNN/sFfmrTADP8R/WO8VdA+K2oV9AtUsKaMLYAhTJH33gTLwnh5IGWA5iF
	 O3X9MsPOpMaec6OH+KlZzxVXHyrXEret+oivJa6dcaYBpX+nzD9e3b68h8gP7EHtx4
	 DWnFgIpMH2mBXxpTSpK9HYLTJgwRSdNdb4l+zEd+Q5v7eqVlHwkTGbMjHNzL4YZnnW
	 EN/NC6nTovg5DGDsv+gsp3+kXDuQAuc5W0j0hF79WrWH0b1qmV+WBCr4dDdOCe/V6N
	 HRNiBbxwN3GgaSQNBfezI1I5hQ4RzoliAoylnUSd4iJi0odjnBXZR4e9u+P5BzbjRh
	 5NYymZ+eFNKrQ==
Date: Mon, 19 May 2025 16:12:42 +0100
From: Conor Dooley <conor@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: timer: renesas,ostm: Document RZ/V2N
 (R9A09G056) support
Message-ID: <20250519-prepaid-exact-79cd35658c59@spud>
References: <20250515182207.329176-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250515182207.329176-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250516-unpaid-reexamine-922bbecd4cbb@spud>
 <CA+V-a8v64jcDhdtSvqE4UTuCnL9mvjXOwtKyiZJQUeEtLmMFNA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="muECFG8tm0x08w4t"
Content-Disposition: inline
In-Reply-To: <CA+V-a8v64jcDhdtSvqE4UTuCnL9mvjXOwtKyiZJQUeEtLmMFNA@mail.gmail.com>


--muECFG8tm0x08w4t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 05:38:24PM +0100, Lad, Prabhakar wrote:
> Hi Conor,
>=20
> On Fri, May 16, 2025 at 3:21=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Thu, May 15, 2025 at 07:22:06PM +0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Document support for the Renesas OS Timer (OSTM) found on the Renesas
> > > RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to that on
> > > other RZ families, so no driver changes are required as `renesas,ostm`
> > > will be used as fallback compatible.
> > >
> > > Also update the bindings to require the "resets" property for RZ/V2N
> > > by inverting the logic: all SoCs except RZ/A1 and RZ/A2 now require
> > > the "resets" property.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > v3->v4:
> > > - No changes in this version.
> > >
> > > v2->v3:
> > > - Added Acked-by tag from Conor.
> >
> > But v3 -> v4 doesn't mention why it was dropped?
> >
> Sorry I missed adding it. Please can you re-ack it.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--muECFG8tm0x08w4t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCtKagAKCRB4tDGHoIJi
0mUGAQCm94wanZRqJPVRMl4qsTXCeaa0De8Wpjwqwga+3HUwlwEA98mVAvFIb1KW
lM6AR7Q1eJFIFIE7BW5Z3o5Z3dVlNAE=
=xE4v
-----END PGP SIGNATURE-----

--muECFG8tm0x08w4t--

