Return-Path: <linux-renesas-soc+bounces-17267-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4A8ABDFC8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 18:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D45BD7A8CC9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 15:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 107B0265CAA;
	Tue, 20 May 2025 16:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQDsY2hH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B8E267F73;
	Tue, 20 May 2025 16:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747756817; cv=none; b=BxABIa/bqkjctDbTDXWMVhUdunnii26AmIoqAh+JtioIgPQlzlmwcIkijA5iRD45XVr419xZ2DzVcaUrT/b9FXS1YRib99yVjx+didrdz3Gq9NHlGHTTzDNCFF2kE7QzsHIsHesQienA5nGb7XbcnuhyyNRBbxvwgZMyN/Jm4DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747756817; c=relaxed/simple;
	bh=NIKYYPe3EmOSzVPiSBtsF5ApdyDmuYMiB1qW2RbeOtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/pnXnfo1EvF9c92z+m7IMeSEjlR6qzgFCG/4bYveUrJQvKpgwaQ5ocmC24OXiZJKYmziWWofdPxXk1rfPOvBz/8UJV5yGQG6Z3uqqt0eEkqA9XMPbLoY5rDFoQ6Bxkl43NiWgfjgp4GMJ+XKclag58Gw/UP92YepnL3XQgI4Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQDsY2hH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78FE8C4CEE9;
	Tue, 20 May 2025 16:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747756817;
	bh=NIKYYPe3EmOSzVPiSBtsF5ApdyDmuYMiB1qW2RbeOtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nQDsY2hHVinQBaPnK5GMtLsl9eV1WR0v1BmAezlOZaNDySAj9m4rkCeN5P8TqCsgc
	 OJwqHx+iISjVOadEY5fSiDW9ex+5NrZO7UQzog8sQfJhK8Irb2RrTM4oX7rG6YewMf
	 z0Ty+gyXatVRR9zXy9RuRqpIWiiq2abMIGQSxWCVCml6nsgwJ60Q38WWqkPv0Sp3e3
	 ixVVEsjqTB2fBzdKuC+q/ZPK/XRzUyPNyqptwaJZURqhhcQ3/fsUbnWgU5cF/jQGeV
	 aaoUZnSX23de6yVYOfRmmQey7kA88la+dcen7wMJqNDh7Uk+U+3YmxzOWtA1Hqm+Sc
	 0K1w61q12t6Gg==
Date: Tue, 20 May 2025 17:00:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: display: bridge: renesas,dsi: allow
 properties from dsi-controller
Message-ID: <20250520-lens-dizziness-4d098c031b10@spud>
References: <20250520151112.3278569-1-hugo@hugovil.com>
 <20250520-fidelity-mooned-5d4262d0a7ef@spud>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KX0eqYpyQaNdsuzX"
Content-Disposition: inline
In-Reply-To: <20250520-fidelity-mooned-5d4262d0a7ef@spud>


--KX0eqYpyQaNdsuzX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 04:58:12PM +0100, Conor Dooley wrote:
> On Tue, May 20, 2025 at 11:11:12AM -0400, Hugo Villeneuve wrote:
> > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> >=20
> > Allow to inherit valid properties from the dsi-controller. This fixes t=
he
> > following warning when adding a panel property:
> >=20
> > rzg2lc.dtb: dsi@10850000: '#address-cells', '#size-cells', 'panel@0' do=
 not
> >     match any of the regexes: 'pinctrl-[0-9]+'
> >     from schema $id:
> >         http://devicetree.org/schemas/display/bridge/renesas,dsi.yaml#
> >=20
> > Also add a panel property to the example.
>=20
> I don't think adding the example should be in the same patch as a fix.

Or am I misunderstanding, and this is a new type of usage, rather than a
fix?

--KX0eqYpyQaNdsuzX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCynCwAKCRB4tDGHoIJi
0mUqAQDwvTMEhM3RPqXtrZBVjKFOWgbEhyAZdZMRK5tkQ1gUYAD8D4/MXSTv0OwH
7fZFnceSin+yW2XBYbBiVF/XJ4fbBg8=
=VoS0
-----END PGP SIGNATURE-----

--KX0eqYpyQaNdsuzX--

