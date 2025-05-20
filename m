Return-Path: <linux-renesas-soc+bounces-17269-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C788CABDFE4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 18:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94DFE7B6C14
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 16:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE6E267F79;
	Tue, 20 May 2025 16:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qR5/y/Oo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A006B35893;
	Tue, 20 May 2025 16:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747757041; cv=none; b=kctHII1E0MLAqRDii2dGbS5jAiYG5guxNP59CcOptiGT8IUwvbXTm8Y4CR0OlL9EgRMDFzWZTD9Pugrq3lox+wepN4xscpjvXI2d1jM/6elJUV1WJFSAgiyF4MqXgZn0l75TfikS+B4XwEnqrAY6uijiHTn37iKCLavbalDLD0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747757041; c=relaxed/simple;
	bh=6mBuWVdazhthev+3GPquL4EBApLGjTcl0YN+QuZ9GkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rXrVXX1hlFj2JFlNX7u6yX7aWGJ8w+PAJV7tdiiycvG/5irK85+vy+dSZ4BLep/z4TjFueUy4AfuE8B2hs0xgsVXbJBbitH7Sy4xZBWLFTDvl3kFXqEt60dcRgzS5rUfgbrqido0wajc4Y/KtOt/j/8JApnBcdkOngVxzovtptg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qR5/y/Oo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DFE9C4CEE9;
	Tue, 20 May 2025 16:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747757041;
	bh=6mBuWVdazhthev+3GPquL4EBApLGjTcl0YN+QuZ9GkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qR5/y/OoDvhsNZGQUznIP2NV/CFi7vMBprjxGkoA3ZQXHAWp9cAAc4jHIT/vTNfPK
	 qXNPT5Urb4zfVDkUe4Na33bDi4XFLOopzzJs6y4FnVQPJx6XBp5XYQ+0JVWJl+7ICF
	 ipNmKQv29R/qQQYNIvdbGmfH0v+W1q+tlLpVksmL8o4r0CDD99xiTCJ/2euY8r7Py1
	 J07VYZ2odnf3u0gkSjip1kzUKGi5wWl9SxUldqw0amPi6zn7zoEIPo/1mkcTHnPxL7
	 R4tGJq0cNt4fJFqymEvSpn/Tu12YoedpZDpMLAfNrnB3p5qx6gUCyJ0CS8/VQ6BFKR
	 1ZimGJSiE+JXg==
Date: Tue, 20 May 2025 17:03:55 +0100
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
Message-ID: <20250520-pluck-exhume-a3973899bf92@spud>
References: <20250520151112.3278569-1-hugo@hugovil.com>
 <20250520-fidelity-mooned-5d4262d0a7ef@spud>
 <20250520-lens-dizziness-4d098c031b10@spud>
 <20250520120225.fe7983a91ad1452b734d42fa@hugovil.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jEz/NuChb6ALuzUC"
Content-Disposition: inline
In-Reply-To: <20250520120225.fe7983a91ad1452b734d42fa@hugovil.com>


--jEz/NuChb6ALuzUC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 12:02:25PM -0400, Hugo Villeneuve wrote:
> On Tue, 20 May 2025 17:00:11 +0100
> Conor Dooley <conor@kernel.org> wrote:
>=20
> > On Tue, May 20, 2025 at 04:58:12PM +0100, Conor Dooley wrote:
> > > On Tue, May 20, 2025 at 11:11:12AM -0400, Hugo Villeneuve wrote:
> > > > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > > >=20
> > > > Allow to inherit valid properties from the dsi-controller. This fix=
es the
> > > > following warning when adding a panel property:
> > > >=20
> > > > rzg2lc.dtb: dsi@10850000: '#address-cells', '#size-cells', 'panel@0=
' do not
> > > >     match any of the regexes: 'pinctrl-[0-9]+'
> > > >     from schema $id:
> > > >         http://devicetree.org/schemas/display/bridge/renesas,dsi.ya=
ml#
> > > >=20
> > > > Also add a panel property to the example.
> > >=20
> > > I don't think adding the example should be in the same patch as a fix.
> >=20
> > Or am I misunderstanding, and this is a new type of usage, rather than a
> > fix?
>=20
> Hi Conor,
> it is more like a new type of usage.

Then it's fine.

--jEz/NuChb6ALuzUC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCyn6gAKCRB4tDGHoIJi
0jQ4AP0RW9bfV+NMEX8LXYSuMxON1iJdXzMLIyDbjSdzUaPwjwD/V+dUbxivv0Du
Bkqix57bQc+UKOHdNbx4wcY1IsLy3wg=
=UZZq
-----END PGP SIGNATURE-----

--jEz/NuChb6ALuzUC--

