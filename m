Return-Path: <linux-renesas-soc+bounces-16930-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF49AB22A7
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 10:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF8087A7543
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 08:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ADF21F153E;
	Sat, 10 May 2025 08:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rhVEDlov"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F093C1BC073;
	Sat, 10 May 2025 08:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746867435; cv=none; b=HMu3I5Tzgrxfgw4ajV6Gkx+WSpIUYxhBiSu91Ue1584OeC8M6EycLVQg+Er8LTyb3GMMHW89GDS78ydAMW7JeRpP/FgJs04gz8O2me9qL201rPBRZcw1b8G14fKiOSU4WItAHRT3m5F9dnAkVdOMw9q2/GMi3/K8+E4Ry1j8TYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746867435; c=relaxed/simple;
	bh=qVqQPbhYwA9CnEWX7OYZ4feEjaspab26r13ottr7JkE=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=DyZfTB6QgmZVUOuQa/c8fR931Hg/I5/xOHn9w4Fw9Qv3umTJghkaQLJkMtfwoakL6Vnl9A0XLkZT5hFibfpmLeCdk0h+rpH3DNxCez8zYpiZRd/DLHYuKN4SH8pGigcYYJF1aJmmNE1dcrKGs21I7JIWo5Bne0T2vGEaJWnYHHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rhVEDlov; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA6BC4CEE2;
	Sat, 10 May 2025 08:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746867434;
	bh=qVqQPbhYwA9CnEWX7OYZ4feEjaspab26r13ottr7JkE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=rhVEDlov9L+J/r108NFtXKxeB4Pdlq7LP7iEEVZptGdLYzku0Bbmh1m1tvQBo7nEp
	 wDKYBpOeab+wcGAYTRXEb7zypfMas/HEeqG8wIkhUsv8ZM5S35Aa8G18k1eattrowv
	 CtZ0iaNEDT50f7W+bNUjDL54h+N7lX1iCZsqyUb2y6dFLzuWELt+CxYUY/ZUg6lSpf
	 bJ625ZD91408z4uBsWHbe8T4/xEvzVun354YFwfd+Ch4lJfWuCJeonn/JsIEcE5waz
	 xGDNV83Jpuk6dW4Z02RWrtD1RLj/grawNxsIk4mBJylMFNkBXNuHij3Fltg1czl9J1
	 sacUKeF0HCs9A==
Message-ID: <b9d480ecdb95f59b7e9f0af7694800ef@kernel.org>
Date: Sat, 10 May 2025 08:57:11 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 16/22] drm/sti: dvo: convert to
 devm_drm_bridge_alloc() API
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-16-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-16-b8bc1f16d7aa@bootlin.com>
Cc: asahi@lists.linux.dev, chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, platform-driver-x86@vger.kernel.org, "Alain
 Volmat" <alain.volmat@foss.st.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Anusha
 Srivatsa" <asrivats@redhat.com>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Douglas
 Anderson" <dianders@chromium.org>, "Fabio Estevam" <festevam@gmail.com>, "Hui
 Pu" <Hui.Pu@gehealthcare.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Paul Kocialkowski" <paulk@sys-base.io>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Raphael Gallais-Pou" <rgallaispou@gmail.com>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

On Fri, 9 May 2025 15:53:42 +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
>=20
> This driver allocates the DRM bridge separately from the main driver
> private struct, which prevents using the new devm_drm_bridge_alloc()
> API. Simplify the code by replacing the struct drm_bridge pointer with an
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

