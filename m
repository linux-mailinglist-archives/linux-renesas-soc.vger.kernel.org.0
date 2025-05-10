Return-Path: <linux-renesas-soc+bounces-16917-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5552AB222D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 10:43:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 240D21BC02BF
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 08:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB43D1EE035;
	Sat, 10 May 2025 08:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="prhhrjtH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8134838B;
	Sat, 10 May 2025 08:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746866591; cv=none; b=DEoeUS9MQ1FcZd+EWC15qrqr2W6w7CLgmCocqPLJySIWmobz+aL7Izqp3RzRbDD7nRPiBRqXxGLjqZ1UIXG0AvlKownuFxcZIIjqExGpxVrY/gCgbSAB2/Mi5+KtB5G6qloOgrTMFnBtAml2ivCWK4H2uYTeSNMQ/qoUT5jLqQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746866591; c=relaxed/simple;
	bh=51h4v8E5HX2Z8DyPqAO8YziaTFLpGy++tmZ/wKkW2Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XuBS2DgSLxjxBl1FhFllFcPcNi6+qh7r31DJzMStAN/KircV1GPVav5cuDlLrySvU14C6x1KsX/JLX24kcZ9cGD2hto4rLj4ZRdA7ZfeLgeuq8cyld+14ma7SGJFQogZbG0umw9daIBpvwYOFd/w2AZDSuoAi+koxedMItH6A18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=prhhrjtH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D826C4CEE2;
	Sat, 10 May 2025 08:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746866589;
	bh=51h4v8E5HX2Z8DyPqAO8YziaTFLpGy++tmZ/wKkW2Gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=prhhrjtHTVZYa3NMgzkMx+yFeyGv1Ej7LXkKMfvn1HLib+GZltXt9dN5b0c8pVobc
	 l0CFWH7xTMtVvBfeDBFl4X6BDG0P/7zTIzoGnlc77ycReUUSv6f0NgRhI2cECWcVPf
	 T8mI/UBfT7yHnl1ucVKnxSiaz6ZvgjeybFnw5F4W3uiWBHHbBRSJEWx28KADwICKEn
	 lEwq9Bb3VNf0SMsbsChFhvDwm4efl+wZ9phFvexc78Mn+urduaxTdOaAv8FiLkhXKV
	 7IEV46qEV2F2DgepGhgs7Iw1LgX/vj7RmbML/FBsbd3npas6/eVE8OvUk0VGHYZAY2
	 FilpEGUzfwuqA==
Date: Sat, 10 May 2025 10:43:04 +0200
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
	linux-stm32@st-md-mailman.stormreply.com, Manikandan Muralidharan <manikandan.m@microchip.com>, 
	Adam Ford <aford173@gmail.com>, Adrien Grassein <adrien.grassein@gmail.com>, 
	Aleksandr Mishin <amishin@t-argos.ru>, Andy Yan <andy.yan@rock-chips.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benson Leung <bleung@chromium.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Christoph Fritz <chf.fritz@googlemail.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Detlev Casanova <detlev.casanova@collabora.com>, 
	Dharma Balasubiramani <dharma.b@microchip.com>, Guenter Roeck <groeck@chromium.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jani Nikula <jani.nikula@intel.com>, Janne Grunau <j@jannau.net>, 
	Jerome Brunet <jbrunet@baylibre.com>, Jesse Van Gavere <jesseevg@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Liu Ying <victor.liu@nxp.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Phong LE <ple@baylibre.com>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
	Sugar Zhang <sugar.zhang@rock-chips.com>, Sui Jingfeng <sui.jingfeng@linux.dev>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Vitalii Mordan <mordan@ispras.ru>
Subject: Re: [PATCH v3 02/22] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
Message-ID: <4yeqvg3wnlr2bhb54zutgqpkehrodat5w5x4rr5qjlrc2ts3pz@gr2iosycclpl>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-2-b8bc1f16d7aa@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="mseix42f6fruwdv3"
Content-Disposition: inline
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-2-b8bc1f16d7aa@bootlin.com>


--mseix42f6fruwdv3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 02/22] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
MIME-Version: 1.0

On Fri, May 09, 2025 at 03:53:28PM +0200, Luca Ceresoli wrote:
> devm_drm_bridge_alloc() is the new API to be used for allocating (and
> partially initializing) a private driver struct embedding a struct
> drm_bridge.
>=20
> For many drivers having a simple code flow in the probe function, this
> commit does a mass conversion automatically with the following semantic
> patch. The changes have been reviewed manually for correctness as well as
> to find any false positives.
>=20
> The patch has been applied with the explicit exclusion of bridge/panel.c,
> handled by a separate patch.
>=20
> After applying the semantic patch, manually fixed these issues:
>=20
>  - 4 drivers need ERR_CAST() instead of PTR_ERR() as the function calling
>    devm_drm_bridge_alloc() returns a pointer
>  - re-added empty lines and comments that the script had removed but that
>    should stay
>=20
>   @@
>   type T;
>   identifier C;
>   identifier BR;
>   expression DEV;
>   expression FUNCS;
>   @@
>   -T *C;
>   +T *C;
>    ...
>   (
>   -C =3D devm_kzalloc(DEV, ...);
>   -if (!C)
>   -    return -ENOMEM;
>   +C =3D devm_drm_bridge_alloc(DEV, T, BR, FUNCS);
>   +if (IS_ERR(C))
>   +     return PTR_ERR(C);
>   |
>   -C =3D devm_kzalloc(DEV, ...);
>   -if (!C)
>   -    return ERR_PTR(-ENOMEM);
>   +C =3D devm_drm_bridge_alloc(DEV, T, BR, FUNCS);
>   +if (IS_ERR(C))
>   +     return PTR_ERR(C);
>   )
>    ...
>   -C->BR.funcs =3D FUNCS;
>=20
> Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com> # micro=
chip-lvds.c
> Reviewed-by: Douglas Anderson <dianders@chromium.org> # parade-ps8640
> Tested-by: Douglas Anderson <dianders@chromium.org> # parade-ps8640
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--mseix42f6fruwdv3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaB8RkwAKCRAnX84Zoj2+
dqBFAX9RE+B2jnCUcuUtKcNCTEZ8xNW143YQNM29MIx0Gy045sZ9DXgGmQ1PKcXr
ax3IB2MBgKY7iHiKzY5LSG5f4DqrX/bF/QZAFTTE5/6Clb0TVt4RVPOdxBLJPjrA
ibmLC8e5mA==
=lhGP
-----END PGP SIGNATURE-----

--mseix42f6fruwdv3--

