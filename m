Return-Path: <linux-renesas-soc+bounces-18578-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 450F7AE1732
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jun 2025 11:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7E393A45E8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jun 2025 09:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77B927FB14;
	Fri, 20 Jun 2025 09:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VFoufkfW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFA027FB12;
	Fri, 20 Jun 2025 09:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750410658; cv=none; b=m5TWL3zclouRf7UoyMLzDwwCAWS+x2nMxH30RAJMZe8hJHP+50j9BMHNU1rcHGVKx657gUPynZa6+eQfy8/nEWaubKYQVDiFiCEnGjyaGpYYo7v/9sGJfyIZo90zwBWkntJzNEKVWBYP0I/HVwKgz6eA2f2sLGJsdSU5AufQx8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750410658; c=relaxed/simple;
	bh=ubDse/6nWJd5Iv7Enf1Qe9halXvlhEPQotOXpmNQr8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aGxEslalpmUBPUUzZMBlVYHCT2REG5wcTilu3Fmj5KFk0qthEIRs/K7pWoIkjTckZ0nImNnRaBIYu1IZIXP63VN1cWsTo7OTh982WoR9EU3BVm9Qd3JEo6ngfbqtd/F8c+MPwePHBFI6vKVHoLj1uLQRxe8rusjC/gfsco66vYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VFoufkfW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC72C4CEE3;
	Fri, 20 Jun 2025 09:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750410658;
	bh=ubDse/6nWJd5Iv7Enf1Qe9halXvlhEPQotOXpmNQr8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VFoufkfWVmvGR4hpJY/Al8zDV+pMjqU8S5KnlZZKKJDa+rK9gYXqFeLUgp5fJIXxM
	 DTmr9OKNMcUw0wR9zJ9Jj28NicciZS5MKLx7yx2/iSBjP1WhedbgYAGGBU9JDigM3I
	 p8kPiHFdQTqSkjwqC2+wv5zvhrmodaZjLV18969Ze4x7EE4pF661yutbWN5h1b+fgw
	 e7+zaf/5B9peqzp23Ofqy4cJ6q/MgrPph2bvjYL7HoUE1+OEmUC4xWtxqXmfayoSjq
	 4ntOhmYVwaSkqYEbGgLL80n+jCAsLZAhdiA3vzi5modEq5+BSascCUngTnJslellWe
	 EZ69uAy38cQmw==
Date: Fri, 20 Jun 2025 11:10:55 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 01/16] drm/panel: get/put panel reference in
 drm_panel_add/remove()
Message-ID: <20250620-conscious-purring-ant-b0a64e@houat>
References: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com>
 <20250619-b4-of_drm_find_panel_part1-v2-1-0df94aecc43d@redhat.com>
 <20250620103353.5b43b86f@booty>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ayfn3kll3fl323i3"
Content-Disposition: inline
In-Reply-To: <20250620103353.5b43b86f@booty>


--ayfn3kll3fl323i3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 01/16] drm/panel: get/put panel reference in
 drm_panel_add/remove()
MIME-Version: 1.0

On Fri, Jun 20, 2025 at 10:33:53AM +0200, Luca Ceresoli wrote:
> Hello Anusha,
>=20
> On Thu, 19 Jun 2025 14:15:53 -0500
> Anusha Srivatsa <asrivats@redhat.com> wrote:
>=20
> > Take the panel reference and put it back as required.
> > drm_panel_add() and drm_panel_remove() add a panel to
> > the global registry and removes a panel respectively.
> > Use get() and put() helpers to keep up with refcounting.
> >=20
> > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
>=20
> This patch is good.
>=20
> I'd just point out that this must be applied only after all drivers
> have been converted to the the _alloc API, otherwise with the following
> sequence:
>=20
>   panel =3D devm_kzalloc();
>   drm_panel_init(panel);
>   drm_panel_add(panel);
>   ...
>   drm_panel_remove(panel); <-----
>=20
> at the drm_panel_remove() you'd have a warning:
>=20
>   refcount_t: addition on 0; use-after-free.
>=20
> So, if all panel drivers are converted:

Not all panels are yet:
$ rg -l drm_panel_init -- drivers/gpu/drm/panel/ | wc -l
20

Maxime

--ayfn3kll3fl323i3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFUlmgAKCRAnX84Zoj2+
dkiPAYCIte+2tBryJpZRpT6kkEN41Ec91k+s449YnA84pL1ey4OrFgVdTNOesLxw
e9unZSUBf2dd1SlD3wpyZKqM8nylg4Tzep9Jj6nmiEtL32rA/nKwRv5XVAdwV+o6
JgigwCZp3A==
=nfps
-----END PGP SIGNATURE-----

--ayfn3kll3fl323i3--

