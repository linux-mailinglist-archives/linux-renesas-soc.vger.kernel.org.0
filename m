Return-Path: <linux-renesas-soc+bounces-16925-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7282EAB227C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 10:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE7134C0D6D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 08:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC0F1F1505;
	Sat, 10 May 2025 08:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BGmu8r2v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA921EA7D2;
	Sat, 10 May 2025 08:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746867283; cv=none; b=bN2ExptzkmG0t7IJjZOEREymBuipuI9uDTy7UvAcTUnRZm5PczqGJ/PsSPFKbjM6eOJzFKcDjfKijM1xND2Wwtaa+LHJ6lnVKkDJR6IHROSVfLCTgVOoM2euvF7ENlivunEFr4Aqn1Lr/fZDrUodm6K1al3Y1D8zqCzQG3opadM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746867283; c=relaxed/simple;
	bh=vvYWB5SwK5y1flfnSPXjO4/RKRc3K+qiUOstKgTTfMc=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=mP3NoALXVcZwMIuOhvkMTU0jcHqDHAZdqO2tH5P1snNqZdUt3+hb1DmGuDSfEyMMvgmMiAXZp3g5vjS03geubVCdQwFrjF4Pvxvc5w+S08/fOAgHx+Xp123mkTsGXdhJBMGFbFGckt+09O1EB2hgMTZsmoBGuhHxZE5NhjziBxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BGmu8r2v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD0D4C4CEE2;
	Sat, 10 May 2025 08:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746867283;
	bh=vvYWB5SwK5y1flfnSPXjO4/RKRc3K+qiUOstKgTTfMc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=BGmu8r2vmeu5qiSrnPewJ2qyvAJQO4tvODw1+/uM3lWLR4DMGu1vnHwlpNJeUXOJB
	 yto5k+SfY9DJZkY5IBBLIByccPXyy/ZswerCMMjOR0W+1ijsrO/F1o0JPjwP7RnPwi
	 kbl/Wopm25qydHz0TYHBot/MMl0+p0jhEATcqqNncv3ZamQtbfSrQ2icsY4hAfwynQ
	 nquzvdf9Z2c7rRpqv9V6Y5QrE3J9qTXZpY4k05Y2dLXA0RFL1NQPigCUv0l6D/uuE1
	 4Qx1CpK8Znl//ZOVHxR0KlAkm1n8ssYNV6wqenGpnhMlPT1ySXJABagzXCvQtE8vH3
	 kCpwp/N9bQmVw==
Message-ID: <d6c002809f9c851bd5e891be23c08d4f@kernel.org>
Date: Sat, 10 May 2025 08:54:40 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 10/22] drm/omap: dss: hdmi4: convert to
 devm_drm_bridge_alloc() API
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-10-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-10-b8bc1f16d7aa@bootlin.com>
Cc: asahi@lists.linux.dev, chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, platform-driver-x86@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Anusha Srivatsa" <asrivats@redhat.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Douglas Anderson" <dianders@chromium.org>, "Fabio
 Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Paul
 Kocialkowski" <paulk@sys-base.io>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

On Fri, 9 May 2025 15:53:36 +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
>=20
> Switching from a non-devm to a devm allocation allows removing the kfree()
> in the remove function and in the probe error management code, and as a
> consequence to simplify the code flow by removing now unnecessary gotos.
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

