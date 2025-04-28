Return-Path: <linux-renesas-soc+bounces-16417-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6774FA9F465
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 17:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B64D53BD4A2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 15:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A54382798FE;
	Mon, 28 Apr 2025 15:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ITQM04VD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C054732C85;
	Mon, 28 Apr 2025 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745853926; cv=none; b=UxRKBgusT5KIkvtTu2RiqQ80sKMZpSlYZzt0Fmtszr96ZH+AlOQBK9/1ay1cQISPQGj/6UJTb7rSAGfLXfnF9uUPSW5ntlXC/NssEYTJ8syTaPfaDaSHcyEEvJg/qJEaxdBpsCV9xx9eyUeOhyWk410Yw1F1u32NjPSKC3JDczk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745853926; c=relaxed/simple;
	bh=Xcrk4o5uUZCz5s9RbRVudt29ZK4/zNQEzvkDvZ18brc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hiYQUvRg4iLcRpcjVnYwGUDisCl51J6rZ76Xs1h7gWRo81qAvQKad108V8ZONa4DMrlcjTjnJAJcnKah86U+C4+uGZ6F/zPH/+fpWkee45o6K5UWhT8aGjIYtqPfbfIowB0gWDXtj8sTkkf8ipw7LgM6G/Ra1eHv9x9WpGRKCYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ITQM04VD; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id F0B9743A20;
	Mon, 28 Apr 2025 15:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745853921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FX+DfdPDJS9a13kDKGGrEeAGO5yF0YwMtgsA/rRk1q8=;
	b=ITQM04VDt7fmcwJTpA470GvqYREg4UjmD+xWVApNtZqUgju3zc+SRsOlAtKcvyzml93ThI
	ZVoJC8eZI5CUSlNxPC4kwRkJxawNCdyGqeTorPOUHxrX1lPTZ81RA0M/RfJNOqEvcIoUhi
	JXzbKBaR2YvMkoD3fx4iU/xrxk1zIr+vPkqYEAYwCibsJaoY3DG5Y+n6hxrC3I0MG2uOM4
	jlCXqz4AtP5/rUv3oZgL+QSKF0e0t8DEQBQVj14MPDTQTYjchVADFjlK7Nn9PBnXHcFBK4
	F8Ymwmx488BTPEZGJjSU6yObmG719uE1WXvFtIhqNk94OF58i7ce1a6myz1S1g==
Date: Mon, 28 Apr 2025 17:25:16 +0200
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
 Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, Paul
 Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui
 Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 chrome-platform@lists.linux.dev, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 34/34] drm/bridge: panel: convert to
 devm_drm_bridge_alloc() API
Message-ID: <20250428172516.79058e22@booty>
In-Reply-To: <20250428-wild-condor-of-defiance-cadf60@houat>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
	<20250424-drm-bridge-convert-to-alloc-api-v2-34-8f91a404d86b@bootlin.com>
	<20250428-wild-condor-of-defiance-cadf60@houat>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddviedufedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeekpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrn
 hhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

Hi Maxime,

On Mon, 28 Apr 2025 13:39:23 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> On Thu, Apr 24, 2025 at 10:05:49PM +0200, Luca Ceresoli wrote:
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
> 
> This looks fine, but we need a TODO entry to clean this up later on, and
> a comment on devm_drm_put_bridge that this is inherently unsafe and
> must not be used.

Ah, I see, OK.

Quick draft:

 /**
  * devm_drm_put_bridge - Release a bridge reference obtained via devm
  * @dev: device that got the bridge via devm
  * @bridge: pointer to a struct drm_bridge obtained via devm
  *
  * Same as drm_bridge_put() for bridge pointers obtained via devm functions
  * such as devm_drm_bridge_alloc().
+ *
+ * This function is a temporary workaround and MUST NOT be used. Manual
+ * handling of bridge lifetime is inherently unsafe.
  */

and:

-	devm_kfree(panel_bridge->panel->dev, bridge);
+       /* TODO remove this after reworking panel_bridge lifetime */
+	devm_drm_put_bridge(panel_bridge->panel->dev, bridge);
 }

Does it look good enough?

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

