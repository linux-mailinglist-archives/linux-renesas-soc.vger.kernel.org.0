Return-Path: <linux-renesas-soc+bounces-26374-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0725CFF978
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 07 Jan 2026 19:57:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8622230650A4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jan 2026 18:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38893A0B2E;
	Wed,  7 Jan 2026 17:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qjl+IH9e"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A18A3A0B17;
	Wed,  7 Jan 2026 17:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767805403; cv=none; b=n9/jQG0+rZ22EvDoSFYuG707zJqA+vOxij5idWGaOQk2KvTXZNthtCPqRRxJ9IdlYcM0TU47wSjsOOefAUbXph4RPS/+7jFg27xBNDaJnn2kFPG5q26soRRXdfvAh8jf7An+huiaL+O/mrPBZBUDypEtL8BEg4bTjurqC7zsNns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767805403; c=relaxed/simple;
	bh=oL8OL55SBSSa/kcNiHr9aDvahiZID2IDb22M/LLl2lw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=J4IIdxu4dEULfrwVA1Vs4+8jUYLewEUqi8ny43P7Vj+TOeLQTa6nVJaRL0HAyqXmfpUnNnnRB1brfV7MmaDoNLOyoBBFvptBSrcOnnIPZxZlJIV9kWJLKCpxUbFBZWRhKhaRkAiDDTKB39anIpzkxtaSjo70v419XMZl8hZk9cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qjl+IH9e; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DCDAE1A26DF;
	Wed,  7 Jan 2026 17:03:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A6BA7606F8;
	Wed,  7 Jan 2026 17:03:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E9A49103C821A;
	Wed,  7 Jan 2026 18:03:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767805397; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vT259SsZbBCgS5jej5uTjBYNLE5xMiwzYalV9DvjFlw=;
	b=qjl+IH9e6WT/WJbluQMom7WhOSZz91qsguJk+YcCF1ezNfyjR88kSE3TKuk68Dg37xmHw6
	XCEK9Mppq0OQq3vc09h0WDsUQxgQoZKm+M/+U+3MgdY0Eb/MK9G6UG+ZlB8NXiAEBbZ6Pi
	xP9Oxci+bX3nmJSR9oU2MukZpebnHYoGLphjaIxE7AW3mpS/83hzxfcjIax6cip9cRD7lZ
	Uex/OGHArOy4i/tiS6i8OdbUklSoD4vZR2GIC0hRgcGA3SbizduiTm0dV2HMFCrUGQiGZt
	cUleZVAvrJ72aqzu/SfKPKbcZV9e9srbSuH73i8GFot6Kr2H131NFf/nJYQ26g==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jan 2026 18:03:05 +0100
Message-Id: <DFIIPIQDRAXW.3FOJY73IY5UZ9@bootlin.com>
Subject: Re: [PATCH 3/6] drm/imx/dw-hdmi: convert to
 of_drm_find_and_get_bridge()
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
 <linux-mediatek@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>
To: "Philipp Zabel" <p.zabel@pengutronix.de>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Kevin Hilman"
 <khilman@baylibre.com>, "Jerome Brunet" <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Inki Dae"
 <inki.dae@samsung.com>, "Seung-Woo Kim" <sw0312.kim@samsung.com>, "Kyungmin
 Park" <kyungmin.park@samsung.com>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>, "Laurent Pinchart"
 <laurent.pinchart+renesas@ideasonboard.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-0-ef48a517828e@bootlin.com> <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-3-ef48a517828e@bootlin.com> <3e87a26d067de694273daaf011a50f1a2e7718f1.camel@pengutronix.de>
In-Reply-To: <3e87a26d067de694273daaf011a50f1a2e7718f1.camel@pengutronix.de>
X-Last-TLS-Session-Version: TLSv1.3

Hello Philipp,

On Wed Jan 7, 2026 at 5:34 PM CET, Philipp Zabel wrote:
> On Mi, 2026-01-07 at 17:22 +0100, Luca Ceresoli wrote:
>> of_drm_find_bridge() is deprecated. Move to its replacement
>> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure i=
t
>> is put when done.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> ---
>>  drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c b/drivers/gpu/drm/i=
mx/ipuv3/dw_hdmi-imx.c
>> index 07e5f96202d4..95f629d97bce 100644
>> --- a/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
>> +++ b/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
>> @@ -241,7 +241,7 @@ static int dw_hdmi_imx_probe(struct platform_device =
*pdev)
>>  	if (IS_ERR(hdmi->hdmi))
>>  		return PTR_ERR(hdmi->hdmi);
>>
>> -	hdmi->bridge =3D of_drm_find_bridge(np);
>> +	hdmi->bridge =3D of_drm_find_and_get_bridge(np);
>>  	if (!hdmi->bridge) {
>>  		dev_err(hdmi->dev, "Unable to find bridge\n");
>>  		dw_hdmi_remove(hdmi->hdmi);
>
> The component_add() error path below this is missing a
> drm_bridge_put().

Right! Thanks for reviewing, fix queued for v2.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

