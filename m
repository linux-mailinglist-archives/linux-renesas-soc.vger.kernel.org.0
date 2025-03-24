Return-Path: <linux-renesas-soc+bounces-14743-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4407A6D737
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 10:26:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 072A03AA740
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 09:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B8225D909;
	Mon, 24 Mar 2025 09:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VgCCbMV8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C3418FC80
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 09:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742808363; cv=none; b=uvHa0lCAhJiNbZlXZ892lrw6Fd1HFZyn/lODof/GWKU7CnF/3ZhsOSIXTax+KiRsARsN3jxmFFNDD6xBysGUAlGubqskkCtGFcUZMK95+174/N6CtWAfMfO7y0XF5jn9OtIoRKj2It7ZrYuiGaSMQt2h/i9g9/IAZhu47XD2mI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742808363; c=relaxed/simple;
	bh=bXzWlcGSjsEWQ68IzFcnBpij2zd/PeSHOnwycoVjz/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CXF9CEqCB5WinVEzUHhY4aRGbGqm/aoc2yiapeIKya6D2Bm10hayddGQDO0QDzxwzflM6QS6oPhWjXa9VCjPndN+6o6AYXautSa3KGNyfIcqCI4OtK+94tFYY9DjJ2p3lGHjASyZJBE03YpUude6J16nvoIKwOTXxCx65//KDLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VgCCbMV8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=1Be7
	wSq5LewJPH8TYYO4ZF9M8T/CeCfoqvhmc0odLmE=; b=VgCCbMV8Aujq2mm0vQCi
	dwnvQn+4Asxa9MbZJ/uEWabOyAef150pnzY8QumOUzaTmAGtin5W4AV4Kx4dp8Ui
	pXfcQUlSctbWotuEZZTFu+Z8mAtGf2uwPxYf2Vm7C3JML/jI3kXtDGioG7P+EAg6
	NomuaDH73ZN7ZqGc/AB7HjL4hktG5lQEENeHN84nUUIn+ZB50X98ehf3QAGOfZOF
	Vc0+srxApze0i15jT64ZuW1/bZB+ywI6iBvhj+lfrmMUJvOm/8IHuTjlDezqENtP
	+RH9zPzIACoqzsif5dG7wYBKHURH77RjnY43+hHdjfFrgOGc5CU6AQRWrAolRhby
	7A==
Received: (qmail 2478914 invoked from network); 24 Mar 2025 10:25:49 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Mar 2025 10:25:49 +0100
X-UD-Smtp-Session: l3s3148p1@rhqNMBMx7lZtKPH/
Date: Mon, 24 Mar 2025 10:25:48 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org, paul.barker.ct@bp.renesas.com,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v4 08/13] serial: sh-sci: Introduced function pointers
Message-ID: <Z-ElHPod77Py1DPH@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org, paul.barker.ct@bp.renesas.com,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
References: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
 <20250306152451.2356762-9-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DND0bWGSWizbPD8t"
Content-Disposition: inline
In-Reply-To: <20250306152451.2356762-9-thierry.bultel.yh@bp.renesas.com>


--DND0bWGSWizbPD8t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 06, 2025 at 04:24:42PM +0100, Thierry Bultel wrote:
> The aim here is to prepare support for new sci controllers like
> the T2H/RSCI whose registers are too much different for being
> handled in common code.
>=20
> This named serial controller also has 32 bits register,
> so some return types had to be changed.
>=20
> The needed generic functions are no longer static, with prototypes
> defined in sh-sci-common.h so that they can be used from specific
> implementation in a separate file, to keep this driver as little
> changed as possible.
>=20
> For doing so, a set of 'ops' is added to struct sci_port.
>=20
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Okay, the discussion about the general approach convinced me that we can
go this road. I will not do a line-by-line review of these patches, but
just check that it looks good to me in general. This patch here merely
shuffles code around and adds some inderection. If it works, it seems
good enough for me and we can improve on it incrementally:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

That means, though, that testing this series on a variety of SoCs is
especially important and I'd like to get confirmed that you did these
tests on SCI variations which are available on RZ hardware. According to
my research it would be those:

	[SCIx_SCI_REGTYPE]
		/* RZ/Five, RZ/G2UL, RZ/V2L */
		.compatible =3D "renesas,sci",

	[SCIx_RZ_SCIFA_REGTYPE]
		 /* The "SCIFA" that is in RZ/A2, RZ/G2L and RZ/T1 */
		.compatible =3D "renesas,scif-r7s9210",
		.compatible =3D "renesas,scif-r9a07g044",

	[SCIx_RZV2H_SCIF_REGTYPE]
		 /* RZ/V2H */
		.compatible =3D "renesas,scif-r9a09g057",

	[SCIx_SH4_SCIF_BRG_REGTYPE]
		/* a lot of RZ, too */
		.compatible =3D "renesas,rcar-gen1-scif",
		.compatible =3D "renesas,rcar-gen2-scif",
		.compatible =3D "renesas,rcar-gen3-scif",
		.compatible =3D "renesas,rcar-gen4-scif",

	[SCIx_HSCIF_REGTYPE]
		/* R-Car Gen2-5 */
		/* a lot of RZ */
		.compatible =3D "renesas,hscif",

Please double check that I did not make a mistake. I'd think Geert tests
these on in his board farm anyway:

	[SCIx_SH4_SCIF_REGTYPE]
		/* landisk */
		.compatible =3D "renesas,scif",

	[SCIx_SCIFA_REGTYPE]
		/* R-Car Gen2 */
		.compatible =3D "renesas,scifa",

	[SCIx_SCIFB_REGTYPE]
		/* R-Car Gen2 */
		.compatible =3D "renesas,scifb",

	[SCIx_SH2_SCIF_FIFODATA_REGTYPE]
		/* RZ/A1 */
		.compatible =3D "renesas,scif-r7s72100",

We maybe can get hold of the next board. I will figure this out
internally (not super important for this series, but nice to have):

	[SCIx_SH4_SCIF_NO_SCSPTR_REGTYPE]
	/* SH Ecovec */
	arch/sh/kernel/cpu/sh4a/setup-sh7723.c: .regtype        =3D SCIx_SH4_SCIF_=
NO_SCSPTR_REGTYPE,

That leaves some older SH boards out of the loop, but I think this is
OK. A quick research didn't let me obtain boards for these anymore.

So far, so good? Comments?

Happy hacking,

   Wolfram


--DND0bWGSWizbPD8t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfhJRgACgkQFA3kzBSg
KbbSKw/+N9OsSyV34D6J2L74Th3KIV/2RufjZwsHsg5WtBK/OIZAT2k6PRV7Yr7k
0Agmr+1pDDtLo7eiHlMJZhlbWuGnEhyIwBryrrmSxgwbWo/6NSDJANMVHnGJa7mc
MJLofQQMd/6oYTt7xf/o34eMb5E78WGMvG7Qr7AhURJo40tCXB1OTunSk8QOBa7Y
MfGpSwGSHClvNUzJZLI6rxOe4Ow+blhaBv0nUNa6r2FjmT8S3yUr7l+DSr7hnkCK
/IGFLlfIbK3YJ9jmoPYRBJl07Gmqhlz34IcihZKLm6DygU6gIWoFAEY9O/5e9I9U
CUAZBkOF9FsuMnGhbWGaguUOPBWbCPpkuvs8bccNkrZtqsmLy5MPfQ3EthEVq7BR
ArNZOGRl8+SiVrAyAZKcZYouDdTauHKzhJF6aWypJrZa7KaHjCh4N2fWyYEoH2Yc
LzMUVUotTRTWTU4aghHbicp+ym7kSNbH5tE9OhSH2zqsmwapISTbA/230c6eaiFs
p0J4BwDFJHyZfZTfwaCvyVJzJlMpSKWmfIZCtKFPoivPIQi1LMc3/vsxw3GJZgtf
t2kewY7Uca3PhCj9HuyJG/tLp3xSwMR/hGLeiBcr9dP7ov2V+D93p2oVmxItXRyb
tCU5WViobu5CiWHTKmMjWoFFuJ54HJMDTungXxbfqmGoI61kCXQ=
=mLXO
-----END PGP SIGNATURE-----

--DND0bWGSWizbPD8t--

