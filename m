Return-Path: <linux-renesas-soc+bounces-16918-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 049ADAB2237
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 10:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4065F1BC02CC
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 08:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34BBC1EE035;
	Sat, 10 May 2025 08:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cf25X2Dl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC901E5B63;
	Sat, 10 May 2025 08:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746866641; cv=none; b=EDQgrJdSgy+nnAXT1DMuIDzfUgymOC4pMaOT3sF4RiQLSu+v2J+zAJVlyZkTdtlXA+okFg6eZ1vBIeFKMSEBmnVR/zzfNd4sjm5XsBbhQcVqvIXgg7EFeXlTmjq2tiz5lRc+BMMLXOJUH44+FNxjlvI1UMOWsrP3r8IZwrCQ+zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746866641; c=relaxed/simple;
	bh=iZP0INqkNVJuqSHAtR4h42xNc68rjVjaWzE+UVHVyVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CI2wPqskOe4N3XGv3uOu2B+6h5X5/ccLggka68IQUfJlNTcsOsK77hFlRrjvQz69xieYpkARCkSDKuO6HNTM014Twe/4W5sZK22AkVqTE4+cKjf3WC/yoc2xPRba3sLonw68294fFjRacKGsGiXP7i+5Q29Y7mqo/xadJ1jJmOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cf25X2Dl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83328C4CEE2;
	Sat, 10 May 2025 08:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746866640;
	bh=iZP0INqkNVJuqSHAtR4h42xNc68rjVjaWzE+UVHVyVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cf25X2DlYFqigNEHaUMVIeSZvZx5mMBMfSzlXZh6IR3yRDGG2JP2se3Xi0GUaRRXC
	 RHAswulPL2o/Pu8CqhMFklkb261bJF7PuKzyTJBFfoQdYMudvn0NQ9MppKC/GoKCMT
	 UxAlc4FeAi19ZF/qEhl2UFsXIhG5PhmX9ubf5wzszMnkQOKxcWJCVDZnJg851wO8U0
	 kTWLIRMy5T1VyNl3f9SWXtOcnJjxbEyqha7GSa79N+AqWLSkNuhVXOE0FS2oMO1JRZ
	 VThrHCnZwR6Rq0g0ELeJB3Pa5IH9mLfbpSLf18puH5eXsNJlQWdWUJPMr/VfA4P9d1
	 m0M5pmefqYnvQ==
Date: Sat, 10 May 2025 10:43:56 +0200
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
	linux-stm32@st-md-mailman.stormreply.com, "Rob Herring (Arm)" <robh@kernel.org>, 
	Hsin-Te Yuan <yuanhsinte@chromium.org>, Jani Nikula <jani.nikula@intel.com>, 
	Pin-yen Lin <treapking@chromium.org>, Sui Jingfeng <sui.jingfeng@linux.dev>, 
	Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v3 03/22] drm/bridge: anx7625: convert to
 devm_drm_bridge_alloc() API
Message-ID: <3cccwtayrisa4x6gn4wvmd3unabionun7va3qlh7cmfxf4ukqd@vgwai2ralai7>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-3-b8bc1f16d7aa@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="42gmp23z7tcowblp"
Content-Disposition: inline
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-3-b8bc1f16d7aa@bootlin.com>


--42gmp23z7tcowblp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 03/22] drm/bridge: anx7625: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0

On Fri, May 09, 2025 at 03:53:29PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

--42gmp23z7tcowblp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaB8RzAAKCRAnX84Zoj2+
dln/AX40pKuqkRhkQVs6JCH/aLBJ1p4FH2jOlqJApLLs496lo7sUBly+1PuPiI35
tNCYL7gBgKXxlSu1iZTnQQ03NSmiS7pU7xW+Lr1Yp4YkNPcG6zX8UJqs8WwQCQyQ
xhT5uOOImg==
=3aXy
-----END PGP SIGNATURE-----

--42gmp23z7tcowblp--

