Return-Path: <linux-renesas-soc+bounces-16974-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 645CFAB3647
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 13:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF6A6189F616
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 11:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30A1274FCF;
	Mon, 12 May 2025 11:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uhykW5tW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74818259CBE;
	Mon, 12 May 2025 11:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747050808; cv=none; b=D34THRyVroN0LWkZ4WjVg5R2ue1l7hfq1az9l+6WOuaNV+vEz4mosFQQhvDCDq2q2Utl1hEEryXgQ9Znabhcs+cptNRS2KYsu9+yWgwrHUbfgRQWrVk2zOhciGOsOLDfd+xERLD2Wx3LaojS+GEGqKNqAHgVWccqRq7HcUR3RYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747050808; c=relaxed/simple;
	bh=XRTRdFsjTIvQFPCYdsS7RtuGeazpj8HDdc2C/0Tr0+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NBfoSUlVfpDNFVzvOBKdAjkq+hgJkgTB6/s+3+Gb8PDhKqHC9bFRjU2dsm7dUWdHzGGld75n1LiM6DNGAridbK80ovJfMx5Vgx+3eVXYfbP5lYAjouzAwLLtu46PbJ/uMBDZhmnaorcavtY83eM+8FidVBLhSntNaNbncY8Jt9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uhykW5tW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FBD1C4CEE7;
	Mon, 12 May 2025 11:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747050808;
	bh=XRTRdFsjTIvQFPCYdsS7RtuGeazpj8HDdc2C/0Tr0+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uhykW5tWkylsMRnTtM4JyB85xGedLRJaWdAGBR7SS6gscZl1OaRFbhfhwIQYpna1U
	 1YhecEAWlQutPONxvc/+ZDIyHIoZzBci0wwJsLTb9YqoCswKOD41ANXLtE5cKWpJJb
	 fRgFHktHPiJnsPQ8rmXju3B+58MLO8fz/I1Vcos1Q3g0wGjaVD7NoeF+EB24qQgobw
	 /6U1kLuFYWgNG/3VS/HxZc7dP2CiznjHRZ0QDHE5YSthWRjjpikOMFqd2i1K4KwH/n
	 yVHAeJRX1JbdWYZ9ONTt61IhB8x4BCvk/52FoeTNiDMzM+MPlQaVEb6rNOR6Ds221/
	 R3EsBllOXQFKw==
Date: Mon, 12 May 2025 12:53:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Ben Zong-You Xie <ben717@andestech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 1/2] dt-bindings: cache: add specific RZ/Five
 compatible to ax45mp
Message-ID: <20250512-unbundle-outgoing-92aeed9c60f4@spud>
References: <20250509-sapling-exhale-72815a023ac1@spud>
 <20250509-dwindle-remold-98b3d03d0631@spud>
 <CAMuHMdVWznEm4Kg-MvgCT5+cBtdwGi9YrzFK6mBaoPJ+VK8S+Q@mail.gmail.com>
 <20250512-disaster-plaster-9dc63205cd6e@spud>
 <CA+V-a8sJUsNsF+AT1v3ySLiH9RGwDukMHHOC44JuV4JE3YKEpg@mail.gmail.com>
 <CAMuHMdWcfH7RfYnX+1vx6zFo83oGAW25kSAH0fW8Nb_LQ4PV_w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RsJS8sFLG1dSwYiq"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWcfH7RfYnX+1vx6zFo83oGAW25kSAH0fW8Nb_LQ4PV_w@mail.gmail.com>


--RsJS8sFLG1dSwYiq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 01:05:13PM +0200, Geert Uytterhoeven wrote:
> On Mon, 12 May 2025 at 12:05, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Mon, May 12, 2025 at 10:59=E2=80=AFAM Conor Dooley <conor@kernel.org=
> wrote:
> > > On Mon, May 12, 2025 at 11:01:26AM +0200, Geert Uytterhoeven wrote:
> > > > On Fri, 9 May 2025 at 17:39, Conor Dooley <conor@kernel.org> wrote:
> > > > > From: Conor Dooley <conor.dooley@microchip.com>
> > > > >
> > > > > When the binding was originally written, it was assumed that all
> > > > > ax45mp-caches had the same properties etc. This has turned out to=
 be
> > > > > incorrect, as the QiLai SoC has a different number of cache-sets.
> > > > >
> > > > > Add a specific compatible for the RZ/Five for property enforcemen=
t and
> > > > > in case there turns out to be additional differences between these
> > > > > implementations of the cache controller.
> > > > >
> > > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-ca=
che.yaml
> > > > > +++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-ca=
che.yaml
> > > > > @@ -28,6 +28,7 @@ select:
> > > > >  properties:
> > > > >    compatible:
> > > > >      items:
> > > > > +      - const: renesas,r9a07g043f-cache
> > > >
> > > > This name looks a bit too generic to me, as this is not a generic
> > > > cache on the R9A07G043F SoC, but specific to the CPU cores.
> > >
> > > So "reneasas,r9...-cpu-cache"?
> >
> > Maybe "renesas,r9a07g043f-riscv-cache" ?
>=20
> "renesas,r9a07g043f-ax45mp-cache"?
>=20
> There don't seem to be many vendor-specific derivatives of standardized
> caches, except for "brcm,bcm11351-a2-pl310-cache".

The sifive stuff is all "vendor,soc-cache" into "sifive,ccache" but
there's little ambiguity about there being an arm version of the same
soc there. I don't mind the "renesas,r9...-ax45mp-cache" one you
suggested, feels better than "riscv" to me.

--RsJS8sFLG1dSwYiq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCHhMwAKCRB4tDGHoIJi
0lJdAQDZmT6/q6Y+3Bxx5FSNDxRX2GP522P/d6ovCDdXuDAXKQEAtZHf0hmuuKUK
Qg/Xu5NA7V10fSgeZavhNiZEaWlFdgI=
=4rqL
-----END PGP SIGNATURE-----

--RsJS8sFLG1dSwYiq--

