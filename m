Return-Path: <linux-renesas-soc+bounces-16674-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BD1AA8C3F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 May 2025 08:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A4331728DB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 May 2025 06:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E79B1BD01F;
	Mon,  5 May 2025 06:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="koamshTJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F251B3F3D;
	Mon,  5 May 2025 06:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746426210; cv=none; b=j+8XNFp0Z+vFmOxQf+VXF9yJth1pSH5lzAdcIjm6xDFABa0e92QcysmbQ05Fufd4ysRnedSegK6bb1y3T4gdXADFsw+T/G+QF4k3nOUS5+bDIz43g/kdY5FrHzi4lUcUazt3pNp1Ls0WFkT0ileetQu18kapoF/sJ1Fjw+TLc+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746426210; c=relaxed/simple;
	bh=blz46dfKcTkqUU1mdHuxtQzWM8gPcsEOF9yJwSPZQjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WL6b36FCJTB8qWp9zY0SMsz9ioQJ3xEqxrfvskUQDBDbeLnV/qLcfFxVP4IN88WglI23yE3WLmsrgpkoEWGnGKBseA3NHBKmhDIfBodXOilxFQZZoEgK6//UDbfd8mnYsd3kH4B+ApIahIob46N+SW0VGSH83xhQ33uGRNzCZVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=koamshTJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076EFC4CEE4;
	Mon,  5 May 2025 06:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746426209;
	bh=blz46dfKcTkqUU1mdHuxtQzWM8gPcsEOF9yJwSPZQjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=koamshTJSZ1WF/eCcwZGiyDpkwsaCADLfvS3QwjV5PotkB/YOwWC8XyuJVSsdLCIk
	 /4Jtd7bMz2vmYsMNWmf/X4Sis4kqCPIcH2Wo9nzKbUDCdEWEjPm99kDdRKffgOIfVC
	 GO8aK9v8GOt73LRnb9Tey6JAPxRlvzcCyhCmmdVLeIQZNUJGxNU4jtNLGVqIHj+dbm
	 MEpwGnq7vCW5rHYuMgB1xOP/tAAjfa3OIH4mb6zlf/o2UpzxgLckv3VDuOX+zXChXs
	 TEqMARo/LYFzdXeUg1+VrFmrPwI3ZjNDFpR2bMvYWKsJuqvZsxTYKkHx5l6dtCp9Kp
	 s2eAL5PrUzyBg==
Date: Mon, 5 May 2025 08:23:26 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Douglas Anderson <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 34/34] drm/bridge: panel: convert to
 devm_drm_bridge_alloc() API
Message-ID: <20250505-beneficial-fossa-of-weather-67c676@houat>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-34-8f91a404d86b@bootlin.com>
 <20250428-wild-condor-of-defiance-cadf60@houat>
 <20250428172516.79058e22@booty>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="fxb23j2izsboyssh"
Content-Disposition: inline
In-Reply-To: <20250428172516.79058e22@booty>


--fxb23j2izsboyssh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 34/34] drm/bridge: panel: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0

On Mon, Apr 28, 2025 at 05:25:16PM +0200, Luca Ceresoli wrote:
> Hi Maxime,
>=20
> On Mon, 28 Apr 2025 13:39:23 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > On Thu, Apr 24, 2025 at 10:05:49PM +0200, Luca Ceresoli wrote:
> > > This is the new API for allocating DRM bridges.
> > >=20
> > > The devm lifetime management of this driver is peculiar. The underlyi=
ng
> > > device for the panel_bridge is the panel, and the devm lifetime is ti=
ed the
> > > panel device (panel->dev). However the panel_bridge allocation is not
> > > performed by the panel driver, but rather by a separate entity (typic=
ally
> > > the previous bridge in the encoder chain).
> > >=20
> > > Thus when that separate entoty is destroyed, the panel_bridge is not
> > > removed automatically by devm, so it is rather done explicitly by cal=
ling
> > > drm_panel_bridge_remove(). This is the function that does devm_kfree(=
) the
> > > panel_bridge in current code, so update it as well to put the bridge
> > > reference instead.
> > >=20
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com> =20
> >=20
> > This looks fine, but we need a TODO entry to clean this up later on, and
> > a comment on devm_drm_put_bridge that this is inherently unsafe and
> > must not be used.
>=20
> Ah, I see, OK.
>=20
> Quick draft:
>=20
>  /**
>   * devm_drm_put_bridge - Release a bridge reference obtained via devm
>   * @dev: device that got the bridge via devm
>   * @bridge: pointer to a struct drm_bridge obtained via devm
>   *
>   * Same as drm_bridge_put() for bridge pointers obtained via devm functi=
ons
>   * such as devm_drm_bridge_alloc().
> + *
> + * This function is a temporary workaround and MUST NOT be used. Manual
> + * handling of bridge lifetime is inherently unsafe.
>   */

That part looks good to me

> and:
>=20
> -	devm_kfree(panel_bridge->panel->dev, bridge);
> +       /* TODO remove this after reworking panel_bridge lifetime */
> +	devm_drm_put_bridge(panel_bridge->panel->dev, bridge);
>  }
>=20
> Does it look good enough?

That too, but I was talking about an entry in
https://www.kernel.org/doc/html/latest/gpu/todo.html

Maxime

--fxb23j2izsboyssh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaBhZWgAKCRAnX84Zoj2+
dmbVAX4gMY0F9VXdFsIIKKBjn5Ev2tMwW+uv6doEaqoNJIEat9dVa/bvOYl9n6tm
ZNZ29HABeQEtltAKrypsuFB4FFzNPiZADC9MB5moran2psvsF2a1chXqCjrK2xyp
FQXpVqx4qw==
=pRS+
-----END PGP SIGNATURE-----

--fxb23j2izsboyssh--

