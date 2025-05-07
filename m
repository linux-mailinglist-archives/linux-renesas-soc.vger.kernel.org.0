Return-Path: <linux-renesas-soc+bounces-16761-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F68AAE2BA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 16:25:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 224B5171FA2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 14:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0906128B7C3;
	Wed,  7 May 2025 14:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="adYesO7D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8162628A3E4;
	Wed,  7 May 2025 14:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746627207; cv=none; b=nROzYsvtxVTGYRvrKaPjKC3xeuHgcrNtEkrecUXV5ndw6d2bjvLJZI7/BFckBxPyoGlmSFFSKpghe1T05BNmxrhNzozQPc0nG2fTciIyA3X/5ORREMPutVCUctM87jTGqMHMSdRWBtRQLYXnOjZ0rnO9V3COrXebmi5tHBRKg1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746627207; c=relaxed/simple;
	bh=wRvDEyGE8SyLT4eXm8S/vOTb1xNAByubplY2t+C38K8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kLbr/8CNpTmpgE7XJGmfeedCJyH6E/En/6Gb7bgFl6PBJMC+UAasFlJ6vBSlWa1LG9dAQ6fN0TD0gcZJbSQBGA1jvvH6PNaygFZfCspTOISmZEJVHJCVNOJc0uPyxogvvZTgOvW1T6YxoHgNmllE9SrtigE6skOVb4/dhne5rRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=adYesO7D; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7A8943A17;
	Wed,  7 May 2025 14:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746627197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZUkZFmqLpaya2SvixZMFXiK5vMoC/WgZVFpr9qlTBnY=;
	b=adYesO7D1P7ynosW29lwbsjTgJFaCmVyHEon+flnFOa0BvpYbgiRnF+Xmpud0uAtagWCKR
	3oskQarIGt0LOBcEzJnasoloDFldQLXTPGfiIhzFPFxQ44Bv9OhNB8OfgtRyxM7+9P43cR
	EkU5M3wIV4eMfygkH8Z49lCMg02BGC3HtUgDaN8q7xI8pIpFMVELZovDj9NLGU/agK2QHw
	g3CUt2Har990IGmx7V543phmv8Wv4XvzKKsAS8THOhfgcNBUADs19379Lxd8e7/I43vGMD
	r3WqKePwg6IikvuHOAtVe8FiAWFIlf69nPFcMS8m4pDVEx1m0DuHF1UEztkH0g==
Date: Wed, 7 May 2025 16:13:11 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan Teki
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
Subject: Re: [PATCH v2 30/34] drm/bridge: imx8qxp-pixel-combiner: convert to
 devm_drm_bridge_alloc() API
Message-ID: <20250507161311.6e434f2f@booty>
In-Reply-To: <430d497d-45a1-436d-91fd-635854f80c9f@nxp.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
	<20250424-drm-bridge-convert-to-alloc-api-v2-30-8f91a404d86b@bootlin.com>
	<553d62ed-976a-4e17-9678-cdc3d40ce4a7@nxp.com>
	<20250430112944.1b39caab@booty>
	<f71d18d2-4271-4bb9-b54f-0e5a585778f3@nxp.com>
	<20250506224720.5cbcf3e1@booty>
	<a1abf31a-7a4a-4f8d-bf48-6b826aa01197@nxp.com>
	<20250507091244.32865a71@booty>
	<430d497d-45a1-436d-91fd-635854f80c9f@nxp.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejtdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeljeejuddvudetffdtudelfedugfduledtueffuedufefgudegkeegtdeihedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefledprhgtphhtthhopehvihgtthhorhdrlhhiuhesnhigphdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhto
 hepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Liu,

On Wed, 7 May 2025 18:16:28 +0800
Liu Ying <victor.liu@nxp.com> wrote:

[...]

> >>>> After looking into this patch and patch 31(though I've already provided my A-b)
> >>>> more closely, I think the imx8qxp_pc and imx8{qm,qxp}_ldb main structures
> >>>> should have the same life time with the embedded DRM bridges, because for
> >>>> example the clk_apb clock in struct imx8qxp_pc would be accessed by the
> >>>> imx8qxp_pc_bridge_mode_set DRM bridge callback.  But, IIUC, your patches extend
> >>>> the life time for the embedded channel/bridge structures only, but not for the
> >>>> main structures.  What do you think ?    
> >>>
> >>> I see you concern, but I'm sure the change I'm introducing is not
> >>> creating the problem you are concerned about.
> >>>
> >>> The key aspect is that my patch is merely changing the lifetime of the
> >>> _allocation_ of the drm_bridge, not its usage. On drm_bridge_remove()
> >>> the bridge is removed from its encoder chain and it is completely not
> >>> reachable, both before and after my patch. With my patch it is not
> >>> freed immediately, but it's just a piece of "wasted" memory that is
> >>> still allocated until elsewhere in the kernel there are pointers to it,
> >>> to avoid use-after-free.
> >>>
> >>> With this explanation, do you think my patch is correct (after fixing
> >>> the bug we already discussed of course)?    
> >>
> >> I tend to say your patch is not correct because we'll eventually make sure
> >> that removing a bridge module is safe when doing atomic commit,  
> > 
> > I think your sentence can be rephrased as "your patch is correct with
> > the current code base where bridges are not (yet) removable, but there
> > will be a problem when they start to actually be removable".
> > 
> > Is my understanding correct? If it is, I agree on that sentence.  
> 
> Nope, I meant your patch should align the life times of the main structures
> and the DRM bridges, for the sake of the kinda long term goal - remove bridge
> driver module safely when doing atomic commit.

Again, I don't think there is any bug introduced by this patch (once
the NULL ptr deref bug we already discussed is fixed). No bridge can be
removed as of now, with or without this patch.

You concern that this patch would make things more complex in the
future, when bridges will actually become removable and they could be
during atomic updates. But about this...

> > The work to have removable bridges is massive and non-trivial, so it
> > will need to be tackled in steps. The grand plan [0] is:
> > 
> >  1. add refcounting to DRM bridges (struct drm_bridge)
> >  2. handle gracefully atomic updates during bridge removal
> >  3. avoid DSI host drivers to have dangling pointers to DSI devices 
> >  4. finish the hotplug bridge work, removing the "always-disconnected"
> >     connector, moving code to the core and potentially removing the
> >     hotplug-bridge itself (this needs to be clarified as points 1-3 are
> >     developed)  
> 
> I'm busy with internal things these days and cannot look into the grand
> plan and steps closely, sorry about that.

...I'll wait until you have time to look into that more closely. There
is just no way to understand this whole topic without some dedicated
attention, which takes time unavoidably.

In the meanwhile I am going to send v3 soon with the known bug fixed,
so the best version is available to continue this discussion.

> > I am at step 1 right now. Removal during atomic updates is step 2,
> > ideas about how to implement that are already being discussed [1],
> > there's a practical plan proposed by Maxime with the goal of reaching
> > removable bridges without breaking things along the path.
> > 
> > [0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/
> > [1] https://lore.kernel.org/all/20250106-vigorous-talented-viper-fa49d9@houat/
> >   
> >> which means
> >> the main structures should have the same life time with the DRM bridges.  
> > 
> > The word "lifetime" mean two things for bridges:
> > 
> >  * the time span during which memory is allocated for a struct
> >    drm_bridge (along with the embedding struct)  
> 
> Note that with your patch set the imx8*-ldb drivers and this bridge driver
> won't allocate the DRM bridge along with the embedding struct.

By "embedding struct" I mean the struct imx8qxp_pc_channel that embeds
the struct drm_bridge. Sorry, I realize my wording was ambiguous.

> This makes
> me worry, because maybe these drivers are the only "special" ones in this
> patch set and I don't want them to be "special" after your patch set is
> applied.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

