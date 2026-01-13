Return-Path: <linux-renesas-soc+bounces-26679-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 658F5D19FF0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 16:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DFF09300A929
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 15:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF893308F28;
	Tue, 13 Jan 2026 15:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XtJCt6/f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C6C2E6CA5;
	Tue, 13 Jan 2026 15:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768319148; cv=none; b=ZKo5GvTijx41jBtN9p6LvFMsMoBplIgXCbprE4pJBBzzB6TrowIVWEKsdmfDCf+FdUaDPtRk8Xh6WTBMhf94D0IpHI4yrG7Za9trzuC4T87ZW3Jy3fyWAY4A98NTxEUO3PQWsPX2601KqJLdKxOJWCMYf1vFC1a0YKAj83WbtuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768319148; c=relaxed/simple;
	bh=2ch8B9+IkqJucpdXMmNhvo6UgJALlKVnnk9xuC8jxlE=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=AtxJZFsVPcYe15VnN4r4VHTvbYiTKb3oI/Y/7VuuHcoRGD8NAYW/hTQ9qm+JQIqVbnRyEFUPqsXPXW+CEjwHgTcOVCwUe+EFIootxYb8l2WP1PI60wqKggv/qe2AaMCS+BqdfrswyolHZ0NPix+xgWaOmT4fPQwOXgS8Rdp1QWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XtJCt6/f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC128C116C6;
	Tue, 13 Jan 2026 15:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768319148;
	bh=2ch8B9+IkqJucpdXMmNhvo6UgJALlKVnnk9xuC8jxlE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=XtJCt6/f8JYUn2CLu/erh/doXfMoxX7ZrozSK7JW7KeqTm+7LSqDg8FiYqPJkcf4C
	 DVHV/56otjZS53EKRPfR+0KHivlNsJ7g291+jwtXa3LY4w4+hezAuZfDLy+1hPiClI
	 d5wUYi1Kgli7Ymsht2tOQfGuiJ9sPkVdCOklqac4exe5UB48gwo/kxrUX5sgS5+0hy
	 5NUksS1pD243HRTbOKYIMuc3Bo40eUzPAGId2aXPSpMEfpT1EKQ5I2s7jRmNrjwyGX
	 AeE93s1SZTYQGhz4NrNeY1g468p5+O4IWUyT2+0Jw3VxHYd8DR6Wm6fwPx29jXhoq/
	 1BdTJTSEm3EKg==
Message-ID: <10da6c5fdd68c71babd985ae97e09673@kernel.org>
Date: Tue, 13 Jan 2026 15:45:45 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 5/6] drm/exynos: hdmi: convert to
 of_drm_find_and_get_bridge()
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-5-8d7a3dbacdf4@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-5-8d7a3dbacdf4@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Inki
 Dae" <inki.dae@samsung.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Kevin
 Hilman" <khilman@baylibre.com>, "Kieran Bingham" <kieran.bingham+renesas@ideasonboard.com>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Kyungmin Park" <kyungmin.park@samsung.com>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Laurent Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Magnus Damm" <magnus.damm@gmail.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Robert Foss" <rfoss@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Seung-Woo Kim" <sw0312.kim@samsung.com>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tomi
 Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

On Fri, 9 Jan 2026 11:02:54 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
>=20
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

