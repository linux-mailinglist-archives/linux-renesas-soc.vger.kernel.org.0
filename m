Return-Path: <linux-renesas-soc+bounces-26389-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AABA5D019CF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 09:45:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 376A93305F1D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 08:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C9B3A89DF;
	Thu,  8 Jan 2026 08:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gcK59WjK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29D93A9DB7;
	Thu,  8 Jan 2026 08:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767859991; cv=none; b=SAzH5qj0r1tvjqRfhp6rjWNokC86G7eZ//gJFYroPrBH2VyQu4tPlfq+1j/s/dVoSHhVNCIwS3g/0u4Vz6zYT/QJDJb7vF7OMtzBPyd+o/B6ejCCmhMiMMcLAsp4tcZpfaQaxsQj0BEiU0nmIKNSiyWlS+5U8sYTxBQQzdEWPeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767859991; c=relaxed/simple;
	bh=zKx0mVwbH19vuBhzvaR+1yZmiHRKxSzYZXrkt7qWcIc=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=Tqlqggfc5iB/2FpHRltes7iIJ7K+mqfPzEGpG8FYP/2gPh311SKZCvzUwmi6K1MuSDW20n2qvzJFQL+xhcCaAaQl/Cbi7A2taMTNrLSh/RUGzAWB/FZV9OoEU6xBWnr8LdzLwrvAorA5qTYGRbFXJVXDdS8j3ysrYwIFz3Aiur4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gcK59WjK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A5DC116C6;
	Thu,  8 Jan 2026 08:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767859990;
	bh=zKx0mVwbH19vuBhzvaR+1yZmiHRKxSzYZXrkt7qWcIc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=gcK59WjK6IwUT12wechfhjhX6s021QUj4wR7GFRWe/KHrOOI3w1Ng2AHChaciqJyk
	 84J6i7OP5B4eBbukfnRtk1mcnlTmicyXHcH7d0B9Y/9fuds5G/84Wn4KhDPu2V3C5n
	 YIwklbf//9x22qXMeYp3ZifHW1tJ9vP/hnDRZWAWI6eJSoCAc3he9cRGeMO+K+ekpt
	 k/mfqIsnh1JOoXYQOxoEstfHecTbd+Zr+ysnpOT3EVU2FrT6Rv5yiDCo50IQDk6XCJ
	 BL3RXp8kntOF+PxwjWBcAcQRUuEIn8irecdDRYyHoZUz6lztsTu4W1kjoHK9/xo2TT
	 umoQWDPjU5gpw==
Message-ID: <3d61916afc22b4ef596cee46473a29dd@kernel.org>
Date: Thu, 08 Jan 2026 08:13:07 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 2/6] drm/meson/dw-hdmi: convert to
 of_drm_find_and_get_bridge()
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-2-ef48a517828e@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-2-ef48a517828e@bootlin.com>
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

On Wed, 7 Jan 2026 17:22:00 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
>=20
> dw_hdmi->bridge is used only in dw_hdmi_top_thread_irq(), so in order to
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

