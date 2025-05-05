Return-Path: <linux-renesas-soc+bounces-16691-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17111AA975B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 May 2025 17:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C95F3A6AD0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 May 2025 15:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB90425DD01;
	Mon,  5 May 2025 15:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IsYdCFfo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C034125DCF0;
	Mon,  5 May 2025 15:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746458437; cv=none; b=SfOo9zjgPPxR3YbW0npFR6qCdMI7zIZwmrBN50ygtBz2i71qugRZYpx17OgwlMn+6ioPeZPDosnPUzsSdBr7ZoEh+uk55j1klEbWC4EH8hre3d6b6mdBDYQNrUCQaETuzhh/Odz5m1IskNI97I0sc83JMUJvYBuqnbdF/0o59/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746458437; c=relaxed/simple;
	bh=D5Leh3G4aTBuCxDXyMcG1WOmnl8u7g/BYtrATwoG8R8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eWJHRh1IVvESHiAhiOZrnhlseamK9t+gYcXMplADbXENqm+mXnG6jAdlukSIy+7AD8GVK8XeLVmbkccrOiH3+y9L1cjYmEl87vv5LvNmsnGNy5QsQPAt1zPgmf7e2o5oYTGnFyM+akT45apqxm703/i80d4Ru//4vljr5rEcj8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IsYdCFfo; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 389214398E;
	Mon,  5 May 2025 15:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746458432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u9TG3OmSzS8fUS1eTfStK5VQAKwBeZ4see00hs7EtDk=;
	b=IsYdCFfoHd/qOi+gYYbWTZx9rAYgOwGSN0Eo0YXJnG9B/edlJPMStRCvc+FLKq4wqI/fPT
	1o0tp81lbGpBiMxcF7EkxBNQLTJ4AW8TE1s3h+3Ao+ryG1FR1N7lvwzYWEpMgHLMK1rp98
	XLYJTZyxXDkzfobqUvTulr2czf0EOlP64GFNT5AXkWvxB73odvQWCI/huAFffxIc01O/x+
	jInLvozRhnoxnrD5dAmxc9jlW2nmyCQlvuE4hqgOHFPF/9cYlCwYazKn2p5pp5dpHdAi5j
	SFvCWFSAfDRERL7wOxHamZgj6g3QGMXJO/fr/76NFpGY1qnmq1cAlxnaFpAo5A==
Date: Mon, 5 May 2025 17:20:27 +0200
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
Message-ID: <20250505172027.25af7721@booty>
In-Reply-To: <20250505-beneficial-fossa-of-weather-67c676@houat>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
	<20250424-drm-bridge-convert-to-alloc-api-v2-34-8f91a404d86b@bootlin.com>
	<20250428-wild-condor-of-defiance-cadf60@houat>
	<20250428172516.79058e22@booty>
	<20250505-beneficial-fossa-of-weather-67c676@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkedugeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeljeejuddvudetffdtudelfedugfduledtueffuedufefgudegkeegtdeihedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefkedprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhto
 hepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com

On Mon, 5 May 2025 08:23:26 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> On Mon, Apr 28, 2025 at 05:25:16PM +0200, Luca Ceresoli wrote:
> > Hi Maxime,
> > 
> > On Mon, 28 Apr 2025 13:39:23 +0200
> > Maxime Ripard <mripard@kernel.org> wrote:
> >   
> > > On Thu, Apr 24, 2025 at 10:05:49PM +0200, Luca Ceresoli wrote:  
> > > > This is the new API for allocating DRM bridges.
> > > > 
> > > > The devm lifetime management of this driver is peculiar. The underlying
> > > > device for the panel_bridge is the panel, and the devm lifetime is tied the
> > > > panel device (panel->dev). However the panel_bridge allocation is not
> > > > performed by the panel driver, but rather by a separate entity (typically
> > > > the previous bridge in the encoder chain).
> > > > 
> > > > Thus when that separate entoty is destroyed, the panel_bridge is not
> > > > removed automatically by devm, so it is rather done explicitly by calling
> > > > drm_panel_bridge_remove(). This is the function that does devm_kfree() the
> > > > panel_bridge in current code, so update it as well to put the bridge
> > > > reference instead.
> > > > 
> > > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>    
> > > 
> > > This looks fine, but we need a TODO entry to clean this up later on, and
> > > a comment on devm_drm_put_bridge that this is inherently unsafe and
> > > must not be used.  
> > 
> > Ah, I see, OK.
> > 
> > Quick draft:
> > 
> >  /**
> >   * devm_drm_put_bridge - Release a bridge reference obtained via devm
> >   * @dev: device that got the bridge via devm
> >   * @bridge: pointer to a struct drm_bridge obtained via devm
> >   *
> >   * Same as drm_bridge_put() for bridge pointers obtained via devm functions
> >   * such as devm_drm_bridge_alloc().
> > + *
> > + * This function is a temporary workaround and MUST NOT be used. Manual
> > + * handling of bridge lifetime is inherently unsafe.
> >   */  
> 
> That part looks good to me
> 
> > and:
> > 
> > -	devm_kfree(panel_bridge->panel->dev, bridge);
> > +       /* TODO remove this after reworking panel_bridge lifetime */
> > +	devm_drm_put_bridge(panel_bridge->panel->dev, bridge);
> >  }
> > 
> > Does it look good enough?  
> 
> That too, but I was talking about an entry in
> https://www.kernel.org/doc/html/latest/gpu/todo.html

Ah, sure!

I queued this for v3, if you have better suggestions don't hesitate to
let me know:

-----8<-----

Remove devm_drm_put_bridge()
----------------------------

Due to how the panel bridge handles the drm_bridge object lifetime, special
care must be taken to dispose of the drm_bridge object when the
panel_bridge is removed. This is currently managed using
devm_drm_put_bridge(), but that is an unsafe, temporary workaround. To fix
that, the DRM panel lifetime needs to be reworked. After the rework is
done, remove devm_drm_put_bridge() and the TODO in drm_panel_bridge_remove().

Contact: Maxime Ripard <mripard@kernel.org>,
         Luca Ceresoli <luca.ceresoli@bootlin.com>

Level: Intermediate

-----8<-----

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

