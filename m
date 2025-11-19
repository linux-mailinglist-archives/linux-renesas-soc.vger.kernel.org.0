Return-Path: <linux-renesas-soc+bounces-24821-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A022BC6F4C0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 15:32:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id A24DC2EF93
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 14:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C529364EA3;
	Wed, 19 Nov 2025 14:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="va03Afus"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECE436921A;
	Wed, 19 Nov 2025 14:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562604; cv=none; b=Sl5tX5pnOTHY1j+o7AJOwsCknGiP38TbMwrGbkTGCkrXLleRKaEH/ysunh1Liq2c+9TjXyamvyRC1yktYDMZoE4T0LQV3XsbjRS+C2G9wFHCYbw+si4sibdCjIt7WfBxTY95BgL6JEOKmpObswzv0IrMGs5YoMt2/mCc2d/9bPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562604; c=relaxed/simple;
	bh=qjVTFOqFcipKEErA3/3zuHkUILncaSkQ1fFgcvBSkcM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=eWkDc3CP0AYuG64O3G5ZhsaVkDfX1Acdc5rlUnLsTGOc4g3jlTniw2Ro4MdwezOqh6oW0vPjCvNOU2Vzx2zVciMn3hZB6nQp2eU9IaUCxipEr9ad9hCF0TCZh2wCZxdbdsyUq6NGsR4Bz+qO4zeU/Wn0sV4byC6XlfvMyvIZwiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=va03Afus; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 88B6A1A1BE0;
	Wed, 19 Nov 2025 14:29:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4EBDA60699;
	Wed, 19 Nov 2025 14:29:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47D9A10371A62;
	Wed, 19 Nov 2025 15:29:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763562595; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aNWIMTkg7carQ7ceMaLkx51XDav1UOHz9uWadTfuDGE=;
	b=va03Afusn2H4yyrQf+VLVDWCgnp+7P85I5wMNM1SsdqWvvK0O+9nBTgh1jq8sVzJlnF4hw
	YjIUEWbej3jIPnCjZQewihe/jOj41J6/80am0kQ4uTdRaSd2WJkxlPawpmA5X+wsFLDRVo
	JuHZpuZEMpRYC2Cbbzqh90ViTsFZ/Oj3NiCao2Zznyn6tTRP8iPhC1ok3lmlA5yZ5DeE+q
	zDD2yi6ejRlVxJ0cf6eDN/ZhkrDcnX5pn4Saod8WNoTXZQmU89Ysrs5PtHZgxsN0zMPevf
	PxFRxHYzTFuCoGm+y2E8UWjWpMVWyiPHkDt4Vta67Gcr7d8wW61R+ta1RdnmkQ==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 15:29:43 +0100
Message-Id: <DECQREI2GFCG.27I1BBCKPJMFG@bootlin.com>
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jonathan Corbet"
 <corbet@lwn.net>, "Alexey Brodkin" <abrodkin@synopsys.com>, "Phong LE"
 <ple@baylibre.com>, "Liu Ying" <victor.liu@nxp.com>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Adrien Grassein" <adrien.grassein@gmail.com>,
 "Laurent Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Tomi
 Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Kevin
 Hilman" <khilman@baylibre.com>, "Jerome Brunet" <jbrunet@baylibre.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Chun-Kuang Hu"
 <chunkuang.hu@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Anitha Chrisanthus"
 <anitha.chrisanthus@intel.com>, "Edmund Dea" <edmund.j.dea@intel.com>,
 "Inki Dae" <inki.dae@samsung.com>, "Seung-Woo Kim"
 <sw0312.kim@samsung.com>, "Kyungmin Park" <kyungmin.park@samsung.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 01/26] drm/bridge: add drm_of_find_bridge()
X-Mailer: aerc 0.20.1
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com> <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-1-0db98a7fe474@bootlin.com> <35bda203-8c15-4219-a231-1379f909229f@bootlin.com>
In-Reply-To: <35bda203-8c15-4219-a231-1379f909229f@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

Hi Louis,

On Wed Nov 19, 2025 at 3:22 PM CET, Louis Chauvet wrote:
>
>
> On 11/19/25 13:05, Luca Ceresoli wrote:
>> of_drm_find_bridge() does not increment the refcount for the returned
>> bridge, but that is required now. However converting it and all its user=
s
>> is not realistically doable at once given the large amount of (direct an=
d
>> indirect) callers and the complexity of some. Also, "of_drm_find_bridge =
is
>> oddly named according to our convention and it would make more sense to =
be
>> called drm_of_find_bridge()" (quoted from Link: below).
>>
>> Solve both issues by creating a new drm_of_find_bridge() that is identic=
al
>> to of_drm_find_bridge() except it takes a reference. Then
>> of_drm_find_bridge() will be deprecated to be eventually removed.
>>
>> Suggested-by: Maxime Ripard <mripard@kernel.org>
>> Link: https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0=
a18ad@houat/
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

...

>> +struct drm_bridge *drm_of_find_bridge(struct device_node *np)
>> +{
>> +	struct drm_bridge *bridge;
>> +
>> +	mutex_lock(&bridge_lock);
>> +
>> +	list_for_each_entry(bridge, &bridge_list, list) {
>> +		if (bridge->of_node =3D=3D np) {
>> +			mutex_unlock(&bridge_lock);
>
> It seems a bit strange to unlock the mutex just before the
> drm_bridge_get, is it expected?

Ouch. No, it's not expected, it is a very silly mistake. Thanks for
noticing.

> If no, I think you can use scoped_guard(mutex, &bridge_lock) to avoid
> messing with mutex_unlock, IIRC, scoped_guard will unlock the mutex just
> after the return, so in your case, just after the drm_bridge_get.
>
>> +			return drm_bridge_get(bridge);
>> +		}
>> +	}

My intent was to keep the function as similar as possible to the original
one, thus I just added a drm_bridge_get(), but that is of course wrong.

So these lines should instead have been:

	if (bridge->of_node =3D=3D np) {
		drm_bridge_get(bridge);
		mutex_unlock(&bridge_lock);
		return bridge;
	}

But indeed scoped_guard() is much cleaner and less error-prone, so I'm
probably going to use it in v2.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

