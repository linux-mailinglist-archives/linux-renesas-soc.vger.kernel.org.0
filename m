Return-Path: <linux-renesas-soc+bounces-26398-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EF5D0218B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 11:21:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B04B83008E9A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 10:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5293B95FD;
	Thu,  8 Jan 2026 10:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZZyzgQ6M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75BF3B95E0;
	Thu,  8 Jan 2026 10:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767867240; cv=none; b=hY8B5iWZ5kL5FdutX4kZfr6jyQMBSDZLt3lndYVA4E4XLAgGwflo0W200tr427d++QU6+KqBFNI0VOAGzuyJY+J01OYX9qhWUvfyEheHRlFW0y4OqWTRW6Z+H41rXShte8Wh9sya3XJm2TjTpcoRS3Kq9MBT02Yi7Pf+4c350rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767867240; c=relaxed/simple;
	bh=NcceqwipxLHqnW2SLk553bX3Nibm3gYRYwZL21IRn0c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=VL3GP665e9LMg9YwB2BTA+sZ4OP46Is5wV+Fy4Xeoujru9uFcq38SRKG7ry3WFJZxl1lNOtVM2d91NL5IeiBGF927rZiQWOahzl84yApX++x+8/3bgb7/SQzSihHaYB5D+RZCoMS5NdhDpF9t6+XYDgwajWqUNSXiCp9iMA8PuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZZyzgQ6M; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8C9C3C1ECB2;
	Thu,  8 Jan 2026 10:13:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 67284606B6;
	Thu,  8 Jan 2026 10:13:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 67281103C880E;
	Thu,  8 Jan 2026 11:13:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767867225; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oktYwHpBxwEHcRdG+441TRw1haM/iQZSRwVoxeIKxoE=;
	b=ZZyzgQ6MhWJyRaP/AtUlqfOLAs4SdmGpIbrTgke2e9hMzTVnklegqCUfH8QRCn5O6RABoj
	16WnFZasjj07Z4qzlbvRLkvzc2VVEUrg/PHo/0hVGUvCveJoVMaKNXpF33qlmGO3FehhOf
	k7pfb4T0ys97YT7G8i9diw0OFkt8LkWxEl7ROtseRInXV4+MdbzVUcQO+WCebz50Eut4hk
	N211JQ6oSlZbRFWPNyySKeXJAaetMVLV8ifWRu/QK0qxRKoWEHucX05hpurrxyD91ZMn27
	K3uokXirBg+StnQE60kwcRSzgmtPXJN8KxmDnZ6moWwxpHk0yjZsOiEyjdf8kA==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jan 2026 11:13:33 +0100
Message-Id: <DFJ4MHZJ1DTL.10AMTN5NW6VGS@bootlin.com>
Subject: Re: [PATCH 5/6] drm/exynos: hdmi: convert to
 of_drm_find_and_get_bridge()
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Kevin Hilman" <khilman@baylibre.com>, "Jerome Brunet"
 <jbrunet@baylibre.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Inki Dae" <inki.dae@samsung.com>, "Seung-Woo Kim"
 <sw0312.kim@samsung.com>, "Kyungmin Park" <kyungmin.park@samsung.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Laurent Pinchart"
 <laurent.pinchart+renesas@ideasonboard.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
 <linux-mediatek@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>
To: "Maxime Ripard" <mripard@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-0-ef48a517828e@bootlin.com> <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-5-ef48a517828e@bootlin.com> <20260108-acoustic-groovy-shark-1c6850@houat>
In-Reply-To: <20260108-acoustic-groovy-shark-1c6850@houat>
X-Last-TLS-Session-Version: TLSv1.3

Hi Maxime,

On Thu Jan 8, 2026 at 9:14 AM CET, Maxime Ripard wrote:
> On Wed, Jan 07, 2026 at 05:22:03PM +0100, Luca Ceresoli wrote:
>> of_drm_find_bridge() is deprecated. Move to its replacement
>> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure i=
t
>> is put when done.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> Why can't we use next_bridge for this one?

Because this device is not a bridge, so we have no struct drm_bridge.

>> ---
>>  drivers/gpu/drm/exynos/exynos_hdmi.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exyn=
os/exynos_hdmi.c
>> index 01813e11e6c6..bfcf2fa62fe1 100644
>> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
>> @@ -1779,7 +1779,7 @@ static int hdmi_bridge_init(struct hdmi_context *h=
data)
>>  		return -EINVAL;
>>  	}
>>
>> -	hdata->bridge =3D of_drm_find_bridge(np);
>> +	hdata->bridge =3D of_drm_find_and_get_bridge(np);
>>  	of_node_put(np);
>>
>>  	if (!hdata->bridge)
>> @@ -2096,6 +2096,8 @@ static void hdmi_remove(struct platform_device *pd=
ev)
>>
>>  	put_device(&hdata->ddc_adpt->dev);
>>
>> +	drm_bridge_put(hdata->bridge);
>> +
>>  	mutex_destroy(&hdata->mutex);
>>  }
>
> Same story than in your part 2 series, it should be dropped in destroy.

hdata->bridge is only used for drm_bridge_attach(), it won't be referenced
after that. So this is safe, unless I'm missing something.

Also as we don't have a struct drm_bridge (as mentioned above) we have no
bridge destroy. We have the encoder destroy, but that will never be called
on bridge hotplug.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

