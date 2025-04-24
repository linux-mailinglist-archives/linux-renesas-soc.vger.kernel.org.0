Return-Path: <linux-renesas-soc+bounces-16323-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13037A9B1EC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 17:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07E071B827F4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 15:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127421A3BA1;
	Thu, 24 Apr 2025 15:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FtyAuiP8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D0E14F9EB;
	Thu, 24 Apr 2025 15:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745507928; cv=none; b=f67fAfih1sdbHwMUc6y+fhvn9WjZc5GMju2eJ4Q3DmdjvXHzfHulkSrjpaVgEUz5RZk56VwSfMtz709VCcJa/JjcOK+qpU3wAjhLspGc3XUVENOqNmdKKtx8/flAjSuG1riWl3tI7Eo6/c/99iqIfjuRiEPaO1++huZr4FHxIs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745507928; c=relaxed/simple;
	bh=Cfwo3zn+LUVCR2Nba2kjhqU4b8JvbapZ+dJDwNIQvR0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EpAfHHM/cZW7QZDcODT5v0gXgGQUq9JGpQnUL0jhw5qEFqJ3uxspALMaQT6hra1eHfVdreNJzdhQRVZRFYMCvUXs+zH/Rs2a3P1+iZzGqNOQmTdRiApqYiXlpAcvye58xJPlbxrLFaQhvgd6N4CLZtLGe84wVeDr+SCL2c+w8Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FtyAuiP8; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4481743B2E;
	Thu, 24 Apr 2025 15:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745507923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8IVmwrk7aGTZcp/7NN8zrGIfqqXduX0J3M9hpB/pHPA=;
	b=FtyAuiP8ARUUv2xs4PPtC4FuRrb5XYgrq7nTPDnp6BcGNmDvjt3hiUhZJ4gakGWOTMm285
	izxLY19qRdbJgJHFDSKAmWuF147STQIQIY3Vvwl7qEaG7qJvaXjNpLiY9Vfya0P+MRrZDU
	AaSSvmPNKnk2zfXYGcIo6csHPDBpesNfnl+mfWjAWossSdTGC2MKU8egwvpd6GBwyGo54M
	fRZ/GwgbtAhX6Rj0x9SRnbLCNylZJ2rKp10NgYWNfJY6XoWyZWuZlAVflEcsvXYf2Mdzcj
	OQ1uc5DdEPbXp2iO9ebp0rO3bbg1DWD4/1SRv2zche6VhM3c2W8AAxGm0SHemw==
Date: Thu, 24 Apr 2025 17:18:38 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson
 <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Anusha Srivatsa <asrivats@redhat.com>, Paul
 Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>,
 =?UTF-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Hui Pu
 <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 34/34] drm/bridge: panel: convert to
 devm_drm_bridge_alloc() API
Message-ID: <20250424171838.21a95d80@booty>
In-Reply-To: <20250408-thankful-husky-of-weather-355cae@houat>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
	<20250407-drm-bridge-convert-to-alloc-api-v1-34-42113ff8d9c0@bootlin.com>
	<20250408-thankful-husky-of-weather-355cae@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeelkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedtpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrn
 hhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

Hi Maxime,

On Tue, 8 Apr 2025 17:51:08 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> Hi,
> 
> On Mon, Apr 07, 2025 at 05:27:39PM +0200, Luca Ceresoli wrote:
> > This is the new API for allocating DRM bridges.
> > 
> > The devm lifetime management of this driver is peculiar. The underlying
> > device for the panel_bridge is the panel, and the devm lifetime is tied the
> > panel device (panel->dev). However the panel_bridge allocation is not
> > performed by the panel driver, but rather by a separate entity (typically
> > the previous bridge in the encoder chain).
> > 
> > Thus when that separate entoty is destroyed, the panel_bridge is not
> > removed automatically by devm, so it is rather done explicitly by calling
> > drm_panel_bridge_remove(). This is the function that does devm_kfree() the
> > panel_bridge in current code, so update it as well to put the bridge
> > reference instead.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

[...]

> > --- a/drivers/gpu/drm/bridge/panel.c
> > +++ b/drivers/gpu/drm/bridge/panel.c
> > @@ -287,15 +287,14 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
> >  	if (!panel)
> >  		return ERR_PTR(-EINVAL);
> >  
> > -	panel_bridge = devm_kzalloc(panel->dev, sizeof(*panel_bridge),
> > -				    GFP_KERNEL);
> > -	if (!panel_bridge)
> > -		return ERR_PTR(-ENOMEM);
> > +	panel_bridge = devm_drm_bridge_alloc(panel->dev, struct panel_bridge, bridge,
> > +					     &panel_bridge_bridge_funcs);
> > +	if (IS_ERR(panel_bridge))
> > +		return (void *)panel_bridge;
> >  
> >  	panel_bridge->connector_type = connector_type;
> >  	panel_bridge->panel = panel;
> >  
> > -	panel_bridge->bridge.funcs = &panel_bridge_bridge_funcs;
> >  	panel_bridge->bridge.of_node = panel->dev->of_node;
> >  	panel_bridge->bridge.ops = DRM_BRIDGE_OP_MODES;
> >  	panel_bridge->bridge.type = connector_type;
> > @@ -327,7 +326,7 @@ void drm_panel_bridge_remove(struct drm_bridge *bridge)
> >  	panel_bridge = drm_bridge_to_panel_bridge(bridge);
> >  
> >  	drm_bridge_remove(bridge);
> > -	devm_kfree(panel_bridge->panel->dev, bridge);
> > +	devm_drm_put_bridge(panel_bridge->panel->dev, bridge);
> >  }
> >  EXPORT_SYMBOL(drm_panel_bridge_remove);  
> 
> I'm fine with it on principle, but as a temporary measure.
> 
> Now that we have the panel allocation function in place, we can just
> allocate a bridge for each panel and don't need drm_panel_bridge_add_*
> at all.
> 
> As I was saying before, it doesn't need to happen right now, or before
> the rest of your work for hotplug goes in. But this needs to be tackled
> at some point.

I totally agree this needs to be handled eventually, and also to get
there in steps.

The current status of this driver is not ideal, so I paid attention to
not make it unnecessarily worse when writing this patch. Do you think
the current patch is OK for the next step? I'm going to send v2 in a
few hours, so don't hesitate to mention any improvements you deem
necessary.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

