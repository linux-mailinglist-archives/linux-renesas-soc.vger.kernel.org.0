Return-Path: <linux-renesas-soc+bounces-26388-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D94D01C63
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 10:16:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A828E30E1011
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 08:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C8139B4B1;
	Thu,  8 Jan 2026 08:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NoTm/hXL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87230399A58;
	Thu,  8 Jan 2026 08:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767859834; cv=none; b=Hdb2liEhSqBupEw0V6Gl5toaDKLvDuurEjFiyS08n/VMfATd3+vC5yecLi8R+UCFqqlkSj5V8rYdlu0Jn3xwfg27rfGx82BlKcsQpKFMyvr6t8tRh0LR8cqT3S7L3sHl0ZMM0CK+bu0R2O0YndwzvUx9f87LNotEXawN2UXkzQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767859834; c=relaxed/simple;
	bh=QyxVBielfRt7QoT2djRMAtoZYxObbBanp6fSs7b5E6M=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=ZH8OtxAO62Bvgt0ZtsyvM0s22Xz96A8e2mqRr8w7akKlPlTfsr6+iAVr945ZG7hsd15IIaMDBt1B0rHuFxLCf+WoWuzCQaKeanvfl1w9cdbJM3D3JmD1CvdYUOT40d9vhMgToc8NbxFbBI5EliFk0EF/owkKrRleTAHkw8C5MRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NoTm/hXL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 396F9C116C6;
	Thu,  8 Jan 2026 08:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767859832;
	bh=QyxVBielfRt7QoT2djRMAtoZYxObbBanp6fSs7b5E6M=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=NoTm/hXLit+bYrXYayh5ntXK2wAUkji9dEUrvFNEECrctoK7XqGErv9cYfyNer7a9
	 1eahUfLJ1h0wDZfcYkkk2ZVEP12XfWLk5mhwQD5yIaFSnVaf+usm4itXWj1YmCA11K
	 dc1dSJATno+oWOs5pjUjp/0OihvVmjGNTjSX/cTE1gB134O3kQMPsekHL4V093CsPO
	 lYZyEynMujMlPCXbdRWH4pfHUhQhX6cWHBVz+FpJ80dmAwWgoLtE9/bIfXQrIYrma2
	 5VpRgCR/j5W9I+C/+yUT+jcAy4qhClEwNAXmg+6wM16nFt0RrW6S/B1mVev8jeWuTd
	 gPV+bj8jVkz4A==
Message-ID: <41224d79e893e5460e01809df14b824b@kernel.org>
Date: Thu, 08 Jan 2026 08:10:29 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 1/6] drm/bridge: dw-hdmi: convert to
 of_drm_find_and_get_bridge()
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-1-ef48a517828e@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-1-ef48a517828e@bootlin.com>
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
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Magnus Damm" <magnus.damm@gmail.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Seung-Woo
 Kim" <sw0312.kim@samsung.com>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Tomi Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

On Wed, 7 Jan 2026 17:21:59 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done by using the drm_bridge::next_bridge pointer.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

