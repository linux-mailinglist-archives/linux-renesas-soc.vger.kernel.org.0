Return-Path: <linux-renesas-soc+bounces-26370-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9BDCFEFEF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 07 Jan 2026 18:06:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9097034DF8DB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jan 2026 16:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D731A33D6D4;
	Wed,  7 Jan 2026 16:35:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58A734B683
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Jan 2026 16:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767803757; cv=none; b=aiAckI4XC5BLoZ/ZHMlDO3ZxNl9QD0sdQATf1hi+W5dWLBAA41Ezk/9gEDiT53akA5CV22UBvQxzrHz6CVPo2a4Blz5qZZ74JbEL4RmN2War/sS+RZLl1ekzbfVUHivp+fxl1fEY18R/MDv6aZihnDdjs/e3Mj199hOf++mm/6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767803757; c=relaxed/simple;
	bh=yC2qUt7wZKmS3DlpkjBPpZ4qRub4TkildmRqmEcpTlw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E1DUiP3eDSCfGUEa9eUs5+j1fZpEB2tAqYuchNS3oE3vPamzkH/gkl5aLOnmUF4x6qNSXQevaFdyzjOa87byzuKU8uZQiOWEiXGaTB4Do8WNbb9j8BESRDEaUCnx8dcWYmfl2fghQkLU4IYCaLnOefLFiqFn1Z4hGFNZfFLXLsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdWUn-00061q-3g; Wed, 07 Jan 2026 17:34:53 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdWUh-009XX9-1v;
	Wed, 07 Jan 2026 17:34:47 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdWUh-00000000FuG-1qqY;
	Wed, 07 Jan 2026 17:34:47 +0100
Message-ID: <3e87a26d067de694273daaf011a50f1a2e7718f1.camel@pengutronix.de>
Subject: Re: [PATCH 3/6] drm/imx/dw-hdmi: convert to
 of_drm_find_and_get_bridge()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Andrzej Hajda	
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman	 <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl	
 <martin.blumenstingl@googlemail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam	 <festevam@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>, Inki
 Dae <inki.dae@samsung.com>,  Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski	
 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Laurent Pinchart	
 <laurent.pinchart+renesas@ideasonboard.com>, Tomi Valkeinen	
 <tomi.valkeinen+renesas@ideasonboard.com>, Kieran Bingham	
 <kieran.bingham+renesas@ideasonboard.com>, Geert Uytterhoeven	
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
	 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Date: Wed, 07 Jan 2026 17:34:47 +0100
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-3-ef48a517828e@bootlin.com>
References: 
	<20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-0-ef48a517828e@bootlin.com>
	 <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-3-ef48a517828e@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org

On Mi, 2026-01-07 at 17:22 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c b/drivers/gpu/drm/im=
x/ipuv3/dw_hdmi-imx.c
> index 07e5f96202d4..95f629d97bce 100644
> --- a/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
> +++ b/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
> @@ -241,7 +241,7 @@ static int dw_hdmi_imx_probe(struct platform_device *=
pdev)
>  	if (IS_ERR(hdmi->hdmi))
>  		return PTR_ERR(hdmi->hdmi);
> =20
> -	hdmi->bridge =3D of_drm_find_bridge(np);
> +	hdmi->bridge =3D of_drm_find_and_get_bridge(np);
>  	if (!hdmi->bridge) {
>  		dev_err(hdmi->dev, "Unable to find bridge\n");
>  		dw_hdmi_remove(hdmi->hdmi);

The component_add() error path below this is missing a
drm_bridge_put().

regards
Philipp

