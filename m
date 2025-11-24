Return-Path: <linux-renesas-soc+bounces-25090-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CDEC81A71
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 17:46:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 954143A3FFE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 16:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4EEB3168E0;
	Mon, 24 Nov 2025 16:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KrEWDBIw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1033161A9;
	Mon, 24 Nov 2025 16:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764002669; cv=none; b=SjJwT0NENR6qWAWD1RduQLALR/OVx/Cy/XJEpliC3j3vlA1qY+k5ZQpmtXmYM83T0SmFZ0ibsM/SQGyojGSorz7zxFU048zZCnHgt9YLVPoNTnIR5UypUJENDyUAK3HdXXV+fbF0CIHLJ1/Z1CG/1twiVd+YFa3MuBcQbAxH0LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764002669; c=relaxed/simple;
	bh=uSemw84f5ckyGShXecvyFgO27QOKWBIVsqm1RZd2KFA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=G9L18e4JEhwmUn8IT5mWOLEzqpvGzlXMdXJ+Kx5U6WgwBveDRg4E27rsmGD3axFWvEV+XXpP6roDzB/5/ITlpgsbn8Ch2uXRU9HDsrOf1LRlWjN6LTwmwxL3oifonXbjogI8p9KCpiBVpN8LGYEG0UvFGWGUqxNjLFpXnQe6Hl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KrEWDBIw; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 472BEC139B2;
	Mon, 24 Nov 2025 16:44:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B7547606FC;
	Mon, 24 Nov 2025 16:44:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1410710371A8F;
	Mon, 24 Nov 2025 17:44:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764002662; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8VxkXwHyVWJtMQb4rGcL9+DawEiYCDxx29eMOS81RRA=;
	b=KrEWDBIww4g7nDza6Zc7hbr+ZoXaAgKnm9t/c7uQL8DjmTM4Lqn6U4mOBDG5vMoUDsvrd2
	z/Sp/kXw6JnOSTYIFsmfxY3UrknEd6H/JIDub3AwK87pZ+UJrv5fYOmUNSbSYDq4WsP5v0
	oneufTmETBFZmFUh0DxP15w3p8E74Qylz6WR0Fur6qK4EEAxebJte+/MSikZrha0b/9Gls
	WRJzAXFmzZG7qJu0L63Dv+MuAQdNPhwTUxava0scvHSMJ7nqGhN0bidohpBwZuGxE/Vr0T
	7wEt+C6kFsdbn3+p0AzKRiI549ZbqiSwVxZK8aOtKlYFNJxrJuYIWVmjCUBcsA==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Nov 2025 17:44:09 +0100
Message-Id: <DEH2R1Q0XJJG.1NMESYMX9GMFL@bootlin.com>
Subject: Re: [PATCH 04/26] drm/bridge: make of_drm_find_bridge() a wrapper
 of drm_of_find_bridge()
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Jonathan Corbet" <corbet@lwn.net>, "Alexey Brodkin"
 <abrodkin@synopsys.com>, "Phong LE" <ple@baylibre.com>, "Liu Ying"
 <victor.liu@nxp.com>, "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Adrien
 Grassein" <adrien.grassein@gmail.com>, "Laurent Pinchart"
 <laurent.pinchart+renesas@ideasonboard.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
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
 <alim.akhtar@samsung.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
 "Anusha Srivatsa" <asrivats@redhat.com>
To: "Maxime Ripard" <mripard@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com> <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-4-0db98a7fe474@bootlin.com> <wxxjp7fmsnh2k4huvg2thmfi6kcszdphrag3zosrnykn7abeua@cdlywqj32jd7>
In-Reply-To: <wxxjp7fmsnh2k4huvg2thmfi6kcszdphrag3zosrnykn7abeua@cdlywqj32jd7>
X-Last-TLS-Session-Version: TLSv1.3

Hi,

+Cc Anusha

On Mon Nov 24, 2025 at 11:22 AM CET, Maxime Ripard wrote:
> Hi,
>
> On Wed, Nov 19, 2025 at 02:05:35PM +0100, Luca Ceresoli wrote:
>> of_drm_find_bridge() is identical to drm_of_find_bridge() except it does
>> not increment the refcount. Rewrite it as a wrapper and put the bridge
>> being returned so the behaviour is still the same.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> Kind of the same comment than on the TODO. Is it worth doing that patch
> when we could just remove it at the end of the series?

This series is not converting all users I'm afraid.

There are still some drivers to convert, but not a big deal.

The main user to be converted is drm_of_find_panel_or_bridge(), which is
very tricky, and in turn it is used by devm_drm_of_get_bridge(). We
discussed this in the past and the conclusion was a rework of the drm_panel
lifetime was needed to be able to properly replace
drm_of_find_panel_or_bridge().

A drm_panel rework had started very well with devm_drm_panel_alloc() that
got upstreamed by Anusha, but I'm not sure if it has made further progress
after that. So AFAICT the plan is still "People will gradually switch to
the new API over time", and the deprecated of_drm_find_bridge() will be
removed after that.

Does it still make sense to you?

Maxime, Anusha, are you aware of any steps forward about dynamic panel
lifetime, after devm_drm_panel_alloc()?

>> @@ -1460,19 +1460,11 @@ EXPORT_SYMBOL(drm_of_find_bridge);
>>   */
>>  struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>>  {
>> -	struct drm_bridge *bridge;
>> -
>> -	mutex_lock(&bridge_lock);
>> +	struct drm_bridge *bridge =3D drm_of_find_bridge(np);
>>
>> -	list_for_each_entry(bridge, &bridge_list, list) {
>> -		if (bridge->of_node =3D=3D np) {
>> -			mutex_unlock(&bridge_lock);
>> -			return bridge;
>> -		}
>> -	}
>> +	drm_bridge_put(bridge);
>
> And if it does make sense to keep that patch, we should add a comment
> here to document why we are doing this.

OK, what about:

/**
 * We need to emulate the original semantice of of_drm_find_bridge(), which
 * was not getting any bridge reference. Being now based on
 * drm_of_find_bridge() which gets a reference, put it before returning.
 */

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

