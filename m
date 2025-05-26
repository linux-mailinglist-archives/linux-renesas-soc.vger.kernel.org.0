Return-Path: <linux-renesas-soc+bounces-17479-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35114AC3A85
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 09:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9825171BA2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 07:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E731DED57;
	Mon, 26 May 2025 07:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ERsZFnNG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E435BF9D9;
	Mon, 26 May 2025 07:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748244041; cv=none; b=thq+XN7yLTFYgC428Kwkh6sAgQNV8izgH372vMlDoGf/8XSGbcCnhEcZ3E5XGNslPnOxIN3dJ74E1fWUBRDAritlZoZeGfmOQT1+79A+Dy4hps0omzEo3sen2yqHGeHhODTGS6xoo4W+vaaYjE8aop43m+ZrHj45kHnz6Vj2rE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748244041; c=relaxed/simple;
	bh=E7nsl7EWs55+/uUhfc7iqd4zyB1Z1lv1eOZEgqQ0ZBI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eD154JLeQPwa+KzKGaJc94uFlLAYtljoMRo4Nduvf+4tGjcJKlvw90nT4VxMlMdSAXhYEcyBWBA5HZ6Eb/k5HjKwtQnyEPwg7bTN++3SkB6sLhAOwKNosaqwp8x/mDiUMbkQH0P9ofTsxYOL9QoCfiP5OytR954dMh2g3aLtV5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ERsZFnNG; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 16875442B5;
	Mon, 26 May 2025 07:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748244030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QLkd7DkuwItmUeCsro4GRU7KY1n+af+fkKCtRJvc72M=;
	b=ERsZFnNGGx1taTjFML/F7g48As15TWrVqpm7AQM6ITdhjMQXPkfTl1YTY624dt2A61ojKn
	C4GrIy3LvMnZuQ3f48MHbrAItO9yt2FMHAqBFQBNWnAd4H+GlbFkLp+0Q5jpHR5ME8BtSC
	rLb2TykZsJeBxh/2UPnUC+byagvOBWEHs+mzz5buaw+VAmwRzWbNg55alaA49c/WX7dEK/
	fsh2zNr1ZhqaGyMrCEJNSdr/QBQDpvqqwK5PYQ+P4KU7TlWYdbGXAPWQsVfUnDZH7GHJxL
	bRcPS+1N1hdPuMOBL2LrEIz8HJMPOUVPD7+c3bsfVFBouRX3auSsw6Kbri6nhA==
Date: Mon, 26 May 2025 09:20:24 +0200
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
Message-ID: <20250526092024.48cae4ae@booty>
In-Reply-To: <67252c36-8b31-4c40-9d89-4f502da4a087@nxp.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-30-8f91a404d86b@bootlin.com>
 <553d62ed-976a-4e17-9678-cdc3d40ce4a7@nxp.com>
 <20250430112944.1b39caab@booty>
 <f71d18d2-4271-4bb9-b54f-0e5a585778f3@nxp.com>
 <20250506224720.5cbcf3e1@booty>
 <67252c36-8b31-4c40-9d89-4f502da4a087@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduieeltdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgfeetieeutdeifefggfegheelgeefiefgffeifeeujeehkeffgeehhfevfefhjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhfrhgvvgguvghskhhtohhprdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeelpdhrtghpthhtohepvhhitghtohhrrdhlihhusehngihprdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkh
 hhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Liu,

On Thu, 22 May 2025 11:01:13 +0800
Liu Ying <victor.liu@nxp.com> wrote:

> On 05/07/2025, Luca Ceresoli wrote:
>=20
> [...]
>=20
> >> After looking into this patch and patch 31(though I've already provide=
d my A-b)
> >> more closely, I think the imx8qxp_pc and imx8{qm,qxp}_ldb main structu=
res
> >> should have the same life time with the embedded DRM bridges, because =
for
> >> example the clk_apb clock in struct imx8qxp_pc would be accessed by the
> >> imx8qxp_pc_bridge_mode_set DRM bridge callback.  But, IIUC, your patch=
es extend
> >> the life time for the embedded channel/bridge structures only, but not=
 for the
> >> main structures.  What do you think ? =20
> >=20
> > I see you concern, but I'm sure the change I'm introducing is not
> > creating the problem you are concerned about.
> >=20
> > The key aspect is that my patch is merely changing the lifetime of the
> > _allocation_ of the drm_bridge, not its usage. On drm_bridge_remove()
> > the bridge is removed from its encoder chain and it is completely not
> > reachable, both before and after my patch. With my patch it is not =20
>=20
> drm_bridge_remove() only removes a bridge from the global bridge_list def=
ined
> in drm_bridge.c.  drm_bridge_detach() is the one which removes a bridge f=
rom
> it's encoder chain.  It looks like you wrongly thought drm_bridge_remove()
> is drm_bridge_detach().

Indeed my sentence was inaccurate, sorry about that.

> So, even if drm_bridge_remove() is called, the removed
> bridge could still be in it's encoder chain, hence an atomic commit could=
 still
> access the allocated bridge(with lifetime extended) and the clock_apb clo=
ck
> for example in struct imx8qxp_pc could also be accessed.  That's why I th=
ink
> the main structures should have the same lifetime with the allocated brid=
ge.

As the long-term goal is to allow bridges to be hot-removable,
decoupling the lifetime of the various components is a necessary step.
Definitely it will open other issues, and especially the removal during
atomic updates. This has been discussed already, and there is a
proposed plan to handle it.

First, here is the grand plan (mentioned in the v3 cover letter):

 1. =E2=9E=9C add refcounting to DRM bridges (struct drm_bridge)
 2. handle gracefully atomic updates during bridge removal
 3. avoid DSI host drivers to have dangling pointers to DSI devices
 4. finally, let bridges be removable (depends on 1+2+3)

We are now at step 1. Your concern, as I understand it, will be
addressed at step 2. Bridges won't be removable until step 4, so the
current changes are not introducing a misbehavior but rather preparing
the ground with all the necessary infrastructure changes.

Step 2 was discussed in the past [0], and the idea proposed by Maxime
is to introduce a "gone" or "unplugged" flag and drm_bridge_enter() /
drm_bridge_exit() functions. The principle is the same as struct
drm_device.unplugged and drm_dev_enter/exit().

In a nutshell the idea is:

 - drm_bridge.unplugged is initialized to false
 - drm_bridge_enter() returns false if drm_bridge.unplugged =3D=3D true
 - any code holding a pointer to the bridge (including the bridge driver
   itself) and operating on the bridge (including removal) needs to do:
     if (drm_bridge_enter()) {
         do something;
         drm_bridge_exit();
     }
 - when the bridge is removed, the driver removal function sets
   dev_bridge.unplugged =3D true

The "do something" above includes any access to device resources,
including clocks (and clk_apb).

In other words, two pieces of code can not access the bridge structure
at the same time. This includes bridge removal VS any atomic operations.

Do you think this addresses your concern?


For you to have a better picture of the path, here's an additional
clarification about drm_bridge_attach/detach() and
drm_bridge_add/remove(). As part of step 1 of the grand plan, both of
them will drm_bridge_get/put() the bridge, so that no bridge is freed
if it is either in the global bridge_list or in any encoder chain.

Patches for this are already approved by Maxime [1][2]. They cannot be
applied until all bridge drivers have been converted to the new
devm_drm_bridge_alloc() API, so they depend on this series to be
completely applied. We are getting pretty close: as of now the entire
series has been applied except for this and another driver.

[0] https://lore.kernel.org/all/20250129125153.35d0487a@booty/t/#u
[1] https://patchwork.freedesktop.org/patch/643095/
[2] https://patchwork.freedesktop.org/patch/643096/

Best regards,
Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

