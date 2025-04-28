Return-Path: <linux-renesas-soc+bounces-16399-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE434A9EF7A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 13:41:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 843AD1A80CA0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 11:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E710D2673AF;
	Mon, 28 Apr 2025 11:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kv5vEYW7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88B2265CC8;
	Mon, 28 Apr 2025 11:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745840366; cv=none; b=nO5hLtzilMOgNnWaA9HymfvPm0n20JRinfBovyl9/eDz36tbHOJIgSGXtQ5Un2YlOwrec/ysEquB+jKXWr9prys55WlArPQJFNYTOe6XYHYU4Q+9aiZLTEb6bdc7W5oNx5+6Hv9ctnG+WZSIHmmsxp0FgRSW2FB0P7ES5AlCuo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745840366; c=relaxed/simple;
	bh=Ej44d3HYVlonJrSjsWIukJSaPhl3M6jkQ+SB3SSTJ0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XHBVB0XD1xPnnsMAHWFacW9iOQ+huAgwahL3oTLIWEqtxO1VlwMMVH1nkfUsNmPoyyfIqK3GjsPsMjAQuQd5aV4me06O+/x+gvl/84t1dT4RZ5tSX7EmvpJDWSA3AjKvTl1pSLMUaZA+2VuMep3qJIauNDb++5/z4t7CYaEdFV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kv5vEYW7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B08E5C4CEE4;
	Mon, 28 Apr 2025 11:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745840366;
	bh=Ej44d3HYVlonJrSjsWIukJSaPhl3M6jkQ+SB3SSTJ0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kv5vEYW72D5xWIDAHxidcS9oCPJI44A8/ATQTf4ndN6qOsRqnp47tGXt9HvXJ/fQX
	 3iRGABjyVGdhzFevrJ/SKs1Tn/HzL+ntZXhZ5I1oZh84TTNujKuXIYiSDMBZKDmg+y
	 AZfXDlw/mqs0mSwnN/keOFUJawtzrADt0D2HQYrOGgjrUXRSD84c7R7w7ycC/jTcSm
	 x5DFNVaWHIOalypJx7V9K0lMtgehomF12uxSSBqBSLV7GPuCCodkBNURuekRYK6SrF
	 nsCQ8roU5zy+dQ7EL1D9afZHfQm0EFsh/r0zRlmzrK5FfE/2zo1iP9Ttr0hP07NjcV
	 75neqPgVXdgzA==
Date: Mon, 28 Apr 2025 13:39:23 +0200
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
Message-ID: <20250428-wild-condor-of-defiance-cadf60@houat>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-34-8f91a404d86b@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="xfc7ogpscqj7tsh5"
Content-Disposition: inline
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-34-8f91a404d86b@bootlin.com>


--xfc7ogpscqj7tsh5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 34/34] drm/bridge: panel: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0

On Thu, Apr 24, 2025 at 10:05:49PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
>=20
> The devm lifetime management of this driver is peculiar. The underlying
> device for the panel_bridge is the panel, and the devm lifetime is tied t=
he
> panel device (panel->dev). However the panel_bridge allocation is not
> performed by the panel driver, but rather by a separate entity (typically
> the previous bridge in the encoder chain).
>=20
> Thus when that separate entoty is destroyed, the panel_bridge is not
> removed automatically by devm, so it is rather done explicitly by calling
> drm_panel_bridge_remove(). This is the function that does devm_kfree() the
> panel_bridge in current code, so update it as well to put the bridge
> reference instead.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

This looks fine, but we need a TODO entry to clean this up later on, and
a comment on devm_drm_put_bridge that this is inherently unsafe and
must not be used.

Maxime

--xfc7ogpscqj7tsh5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaA9o4wAKCRAnX84Zoj2+
dte3AX9ZTgylvSMOA8QF8MhOvEEJnfPIVewZiCH2yJknukV+y7S53MU2E4s0YFaN
fsm4AaQBgIRYfqhWPjcnqXHC20V8llKYAK0QvK8ijj3k2G8LjbRoIfmGL11UOfGM
QmUfHGyQeA==
=AGTY
-----END PGP SIGNATURE-----

--xfc7ogpscqj7tsh5--

