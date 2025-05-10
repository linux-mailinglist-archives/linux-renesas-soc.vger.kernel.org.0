Return-Path: <linux-renesas-soc+bounces-16919-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 870A6AB2240
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 10:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 885877A93A4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 08:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735B51EF0BE;
	Sat, 10 May 2025 08:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W0Xl54h3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A6C1EA7EB;
	Sat, 10 May 2025 08:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746866672; cv=none; b=jkj8te5/eD7ZwN9WKsXr7tyE4waW7ANu6EcKzjtCYmsbHc25uWjlnp1H8XWpe9Hp8V/xfzkNPV5vDsEVAfMQFNq3xliM/avlXu7kQye2s6ocUbdrfR7khlwXNUBYP28BFwUuicOJmAmln0HoseLSrLnBjsmOiMRsub5lIRZ/sW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746866672; c=relaxed/simple;
	bh=+jzMMg+8qQHgg35V15goKA1QTUFHCDmPs4KrlKdhpME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLBjMaOG1IWj1nlKLYZMdG+KyXdbANtuuj+PUKDEku1I/R6YbUOR8+q6jFM3dK3DNrYBMS0Y0Tk7GmINLDGbwv3a7DytO3Lo5IZ6i0mYdgkcihKgxlJiCGOdsAyO5JQKPRRhPICaFF5Bz38vYum39pvyequEzX5cECYI90aiP1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W0Xl54h3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF10C4CEEB;
	Sat, 10 May 2025 08:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746866671;
	bh=+jzMMg+8qQHgg35V15goKA1QTUFHCDmPs4KrlKdhpME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W0Xl54h3KjjKFfTFEhHErwdQSHjucmw9GxgRfmYr5AHOE8RdJLUMfrlB+EL9szQ3g
	 wWJ6PvTy57+0j6UxvyxCZP+ogkCuUVr8EzuYAHe1D7jAq8AaVVtGH58OUz/K8cOTi+
	 1lhwI6ek1VZS7afqt3H/1UDAu/WND0BOvw4KdHy3XqqqpWQ+DcXgKRz6jNksLbRwiN
	 dvTIdOU2LvXm7sfvoiXIB8SdDKODR81RoQqtHeH2+l7huHS81Z62jyckBWAZzEaINS
	 9p+J9o3MAWYHHQha0YYwAAqmbno0ym1V4LqWfvYngjvWeDv1RJ6PVDrmITfAnni059
	 2gpVwDNGZp3PA==
Date: Sat, 10 May 2025 10:44:28 +0200
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
	linux-stm32@st-md-mailman.stormreply.com, Aradhya Bhatia <a-bhatia1@ti.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 04/22] drm/bridge: cdns-dsi: convert to
 devm_drm_bridge_alloc() API
Message-ID: <xf44dsvdlzwxuzxgsmysf62azyv7tvq7dqgy2ixpcw4sb3jifq@gvgpl5qjozld>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-4-b8bc1f16d7aa@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="5n64y2ueq77czjvz"
Content-Disposition: inline
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-4-b8bc1f16d7aa@bootlin.com>


--5n64y2ueq77czjvz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 04/22] drm/bridge: cdns-dsi: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0

On Fri, May 09, 2025 at 03:53:30PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--5n64y2ueq77czjvz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaB8R6wAKCRAnX84Zoj2+
duEOAYD5W8gO3mYzy/rzNOgxh+og+ZXDnXUK5Epp9vOFPU7ZJjHyo+4t6VnXTLBA
aRhwVKIBgNklbO9mFaRUYvyZAYKC4STPZvzgX7VRFZ+IUPjgiEFG3YFlCeRAP/yY
JptKD6dJQQ==
=9/Jk
-----END PGP SIGNATURE-----

--5n64y2ueq77czjvz--

