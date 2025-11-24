Return-Path: <linux-renesas-soc+bounces-25051-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 104A3C7FD29
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 11:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D08A14E2D0E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 10:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E41152F9DA0;
	Mon, 24 Nov 2025 10:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HB5Zq7JW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A398522B594;
	Mon, 24 Nov 2025 10:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763979308; cv=none; b=hLhppldLRaWfRc+4fjXIT+x3YcP4FoYCeQGYsLVUitKuhZ5ajeoOE0h9uWNr/timsxUKCDqWf9FP6/vFVL9dY4dkGFn8YnDZrmHJj5RxnBi47ayp4zICvDP86EhHBEHk0Mrq8lOG4mNuPokQOSGGr1acXL9jSXAH+dEH04oM0cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763979308; c=relaxed/simple;
	bh=g1TQ7XQeyLBDzYywTEPn9VRhpmBOP26943Ft+LrFK/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLvYfFBIR1d9xgZZwdZfCvw4VbyvuKzvIKXTMADPQogX3CchdFjFLL7ESOyfqV0bWXpsY/KEgYZXJ662/BLUd57gP7Qt3jZgj7tMMF97iFDaSUo0UYPwxxfwhLFWMBPyzFTazIqPwIjCZyIqfANaavz38CuLC+7jGlMnWHQzSNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HB5Zq7JW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A02B6C4CEF1;
	Mon, 24 Nov 2025 10:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763979307;
	bh=g1TQ7XQeyLBDzYywTEPn9VRhpmBOP26943Ft+LrFK/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HB5Zq7JW2S0TfMR6GDL9y7IDj8+deKZELHKXeCfIUS212rSE2rluo8wGoHYm08aSm
	 WSGXttii+tApWtA05NuNkOyVRm7663jQ+m5zYtqfPSJjGQ+69J7fv2T14T1EbDZtp/
	 3hhBDojX5wbGPtvrDdFlDZio+EeyQd3utbr7xlpnTmhLdNAYEr5OKxXuoTg7q53Lsq
	 vcFxgcQTKFPCDkM21aY3ignoCPtrahq18wVqeGZWA5GKg8iqLYw+pwVZGATKXxkmcx
	 7XDwPDUT3rkdd+1lW5NFGajpEwyxPDJBliJOMdQ+UTmOeSQtzIl/0RPN9vZIIka+6D
	 N3+rAJn8zEiRQ==
Date: Mon, 24 Nov 2025 11:15:04 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Alexey Brodkin <abrodkin@synopsys.com>, Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	Edmund Dea <edmund.j.dea@intel.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 01/26] drm/bridge: add drm_of_find_bridge()
Message-ID: <pv56bl4p7lfflloocozxaeufd6udkk3jhehrtne65cidrvlfwn@wvrkw6mjmhwp>
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
 <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-1-0db98a7fe474@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="twk7wjh5xuvkmppn"
Content-Disposition: inline
In-Reply-To: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-1-0db98a7fe474@bootlin.com>


--twk7wjh5xuvkmppn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 01/26] drm/bridge: add drm_of_find_bridge()
MIME-Version: 1.0

Hi,

On Wed, Nov 19, 2025 at 02:05:32PM +0100, Luca Ceresoli wrote:
>  #ifdef CONFIG_OF
> +/**
> + * drm_of_find_bridge - find the bridge corresponding to the device node in
> + *			the global bridge list
> + * @np: device node
> + *
> + * The refcount of the returned bridge is incremented. Use drm_bridge_put()
> + * when done with it.
> + *
> + * RETURNS:
> + * drm_bridge control struct on success, NULL on failure
> + */
> +struct drm_bridge *drm_of_find_bridge(struct device_node *np)

So the convention we've mostly had was that the first argument would
define the prefix, ie. if we pass a drm_* pointer, the prefix is drm, if
we pass a device_node pointer, then the prefix is of.

Considering that convention, of_drm_find_bridge would be the ideal
candidate, but we can't use that obviously. What about
of_drm_find_and_get_bridge, or of_drm_get_bridge?

Maxime

--twk7wjh5xuvkmppn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaSQwIwAKCRAnX84Zoj2+
djjOAX4ybr+wl/+UOcOA2rBeNLXe/Z1dp5/tGgSDwtWjMs40Yd6/Hb5lNtxsjj1I
6JoUoYYBgOFk70NFGGvi/mntXPXv6z3+wX+3vJ0TwGXmq/4KlMMLzOWyZ4+KUGTS
PkzNnQ7Vlw==
=S5GV
-----END PGP SIGNATURE-----

--twk7wjh5xuvkmppn--

