Return-Path: <linux-renesas-soc+bounces-6996-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4F392427E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 17:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CE231C20EBB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 15:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD831BBBF7;
	Tue,  2 Jul 2024 15:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tuFDZ6dZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45FA16C69A;
	Tue,  2 Jul 2024 15:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719934553; cv=none; b=G92fKu/x3Iw5/JhcWDB5ldpbT79eUuw23p8r0Z6vlBAhGQ6JQuQn7fsybaqp+/kyn7K+qLy1Y+2Xb5upY5lxwJi/re2GUo6ASIjad1NI2A4ylZwxqYJxJMfiEJRkxfC+TITM1mSrx6zazbhaucUuxjQ15zZBUVC26xHSQHOXnLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719934553; c=relaxed/simple;
	bh=d0r/U78nJwjF0PuDIicF8GoEeZ39FyO/cI638TFlymc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FVOlImhkofzRzij/+tdsxVib6342tdtYELK/w+pmyEL9hoZCbNrozQNrHFxgr7pXzgTqRVtfFs8Txton/S94Tmidt6je+VRvnd7TwR/3iEyiiTSTRqg83UgZ5CaUW36poPOcQ/kgNcJ8QxI+k/6Vx6UAeiOkcVzPXjQ0xatQBgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tuFDZ6dZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6C1CC116B1;
	Tue,  2 Jul 2024 15:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719934553;
	bh=d0r/U78nJwjF0PuDIicF8GoEeZ39FyO/cI638TFlymc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tuFDZ6dZyskkQpmod2NndktGYwtlhSN0XhHu5sooRPMRGGHNT9AAzp3ZWXJvonhrX
	 1bw/V1+4khFF2pdS0gTmWgKaVNatEH8EnGbmyYycEbQ4lyfnZIqUyKKfANV00Xsj1S
	 O8UMol1TtObXQrltAlV+/m3efNe3zLIL2nr31yBSoUcC5dJMT4KUCXTbUbTF2nDlKC
	 GPHOAD+wSLmpMDRstRPK005YnE9jip4EUgTyUUWvQJP1oJkLVcnHfR6ZqNKTLPfICj
	 Cw4OJ47YBysCbys70csxtbS5XabPywof97biJdY4cvS+Zzplel3Nzfwqp0SJN5jCbN
	 aiMCEJ/QDeyRg==
Date: Tue, 2 Jul 2024 16:35:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>
Subject: Re: [PATCH 3/9] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G2UL DU bindings
Message-ID: <20240702-flattery-statue-474590da5a20@spud>
References: <20240702094630.41485-1-biju.das.jz@bp.renesas.com>
 <20240702094630.41485-4-biju.das.jz@bp.renesas.com>
 <20240702-choking-glitch-d97191325ac7@spud>
 <TY3PR01MB1134627D95970A6B463AC870B86DC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xNnmU3os9sSSmAJ4"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB1134627D95970A6B463AC870B86DC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--xNnmU3os9sSSmAJ4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 02, 2024 at 03:33:17PM +0000, Biju Das wrote:
> Hi Conor,
>=20
> Thanks for the feedback.
>=20
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: Tuesday, July 2, 2024 3:51 PM
> > Subject: Re: [PATCH 3/9] dt-bindings: display: renesas,rzg2l-du: Docume=
nt RZ/G2UL DU bindings
> >=20
> > On Tue, Jul 02, 2024 at 10:46:13AM +0100, Biju Das wrote:
> > > Document DU found in RZ/G2UL SoC. The DU block is identical to RZ/G2L
> > > SoC, but has only DPI interface.
> > >
> > > While at it, add missing required property port@1 for RZ/G2L and
> > > RZ/V2L SoCs.
> >=20
> > A new required property is an ABI break, it deserves more of an explana=
tion than "in passing..."
>=20
> RZ/G2L LCDC documents both port@0 and port@1 that is described here in [1]
>=20
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/t=
ree/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml?h=3Dnex=
t-20240702#n59
>=20
> Unfortunately missed to add port@1 as required property.
>=20
> Currently there is no user for the DPI interface and there is
> no DPI interface support in display driver. So, there is nothing
> for ABI breakage.
>=20
> I will mention in the commit description that
> "currently there is no user for the DPI interface
> and hence there won't be any ABI breakage for adding
> port@1 as required property for RZ/G2L and RZ/V2L SoCs".

That seems reasonable. You can add my Acked-by with that wording update.

Thanks,
Conor.

--xNnmU3os9sSSmAJ4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoQeUwAKCRB4tDGHoIJi
0naNAP4yj6xiuixYXi1I6TrPMzMRCMcItq9sA/e8yk7LfX9MAAEA55lAxEvKtcmh
sbWuK1YJ7V5yc/rgxZRGF+eT+7uovQU=
=MINL
-----END PGP SIGNATURE-----

--xNnmU3os9sSSmAJ4--

