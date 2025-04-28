Return-Path: <linux-renesas-soc+bounces-16415-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D374AA9F3FC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 17:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 489243A414F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 15:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5882797A7;
	Mon, 28 Apr 2025 15:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cTAHqyDf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4C627978C;
	Mon, 28 Apr 2025 15:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745852461; cv=none; b=IT/YkFExOTgjBR2Zo+b0h/VIsC1H93XyIbAreng7y0KWjIEQfhQe4DdXTs4wpeMudzYmBdcLU7quHxc7mJYqsve5RGptPJ7Th1MoRqvgeVTTbCu0Ho2l2W4o0Xb7qp4QBJWoheRnmpmGR2iBWH2f/jwgLVwBCIktbGzYnvks5MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745852461; c=relaxed/simple;
	bh=Jj0NuGJcZPP++kkBPoUGzVvz6UYG/ryJu2VBn3xv4s4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pEhKuh0NXoy2s6cdsGRX7/QxRN+t2ZXDIVRH0A22Poc44RXAF6Bf4aeSG+5y/uelFX/Ak0kI/kDt+Z2NpO0whAVExvufTcJ13sFp24EK4q3VCgWWbtkc6/J1Xuih3/27C1JimCyP6hq7HjYB399FMQd+cp2yplUs//cIpC7sfpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cTAHqyDf; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F84F4397F;
	Mon, 28 Apr 2025 15:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745852455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l/KM50XoeWonitoxoMaOHFeoOtZjamWkVO4Sfztxz2s=;
	b=cTAHqyDfWqZQRajnA0jCJJTRWgntMZ9qCGKU473NOxESwutCLvKkGP9L3GMlUIUf1TVfoJ
	rSml0e13bS9W5xL7vpWnRG/Gf8DwWyNIkXZ07glmnEui2hZC2Xoq/8/xjrvJp5r3ePSFuU
	njtoTq8LUpcrENa9NLXi3tWAr4COusan12TyNUvMZQZfaHrdfuVf/DcDoxsqC3HUZd6Oxa
	xFrGUT/PhDw09LZJgn+fTcnrJMlbI4kHX39u8mbqL16gwmh6HE2DuFmuNLvVbhBpuVI1WK
	hOs5l7kG8ZpIdaFhDwnEIRvdHjqsZaRpzN9lTpgipOlJKjv7cuiqF1qRk9Zf2g==
Date: Mon, 28 Apr 2025 17:00:45 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Andy Yan" <andyshrk@163.com>
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Douglas
 Anderson" <dianders@chromium.org>, "Chun-Kuang Hu"
 <chunkuang.hu@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Anusha
 Srivatsa" <asrivats@redhat.com>, "Paul Kocialkowski" <paulk@sys-base.io>,
 "Dmitry Baryshkov" <lumag@kernel.org>, "Hui Pu" <Hui.Pu@gehealthcare.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 "Adam Ford" <aford173@gmail.com>, "Adrien Grassein"
 <adrien.grassein@gmail.com>, "Aleksandr Mishin" <amishin@t-argos.ru>, "Andy
 Yan" <andy.yan@rock-chips.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Benson Leung"
 <bleung@chromium.org>, "Biju Das" <biju.das.jz@bp.renesas.com>, "Christoph
 Fritz" <chf.fritz@googlemail.com>, "Cristian Ciocaltea"
 <cristian.ciocaltea@collabora.com>, "Detlev Casanova"
 <detlev.casanova@collabora.com>, "Dharma Balasubiramani"
 <dharma.b@microchip.com>, "Guenter Roeck" <groeck@chromium.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Jani Nikula" <jani.nikula@intel.com>, "Janne
 Grunau" <j@jannau.net>, "Jerome Brunet" <jbrunet@baylibre.com>, "Jesse Van
 Gavere" <jesseevg@gmail.com>, "Kevin Hilman" <khilman@baylibre.com>,
 "Kieran Bingham" <kieran.bingham+renesas@ideasonboard.com>, "Liu Ying"
 <victor.liu@nxp.com>, "Manikandan Muralidharan"
 <manikandan.m@microchip.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Phong
 LE" <ple@baylibre.com>, "Sasha Finkelstein" <fnkl.kernel@gmail.com>, "Sugar
 Zhang" <sugar.zhang@rock-chips.com>, "Sui Jingfeng"
 <sui.jingfeng@linux.dev>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Vitalii Mordan"
 <mordan@ispras.ru>
Subject: Re: [PATCH v2 01/34] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
Message-ID: <20250428170045.5ca315ce@booty>
In-Reply-To: <656e493e.a551.1967c6d0c53.Coremail.andyshrk@163.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
	<20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
	<656e493e.a551.1967c6d0c53.Coremail.andyshrk@163.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieduvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepieelpdhrtghpthhtoheprghnugihshhhrhhkseduieefrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrn
 hgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

Hallo Andy,

On Mon, 28 Apr 2025 20:44:03 +0800 (CST)
"Andy Yan" <andyshrk@163.com> wrote:

> Hi ,
> 
> At 2025-04-25 02:59:08, "Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:
> >devm_drm_bridge_alloc() is the new API to be used for allocating (and
> >partially initializing) a private driver struct embedding a struct
> >drm_bridge.
> >
> >For many drivers having a simple code flow in the probe function, this
> >commit does a mass conversion automatically with the following semantic
> >patch. The changes have been reviewed manually for correctness as well as
> >to find any false positives.
> >
> >  @@
> >  type T;
> >  identifier C;
> >  identifier BR;
> >  expression DEV;
> >  expression FUNCS;
> >  @@
> >  -T *C;
> >  +T *C;
> >   ...
> >  (
> >  -C = devm_kzalloc(DEV, ...);
> >  -if (!C)
> >  -    return -ENOMEM;
> >  +C = devm_drm_bridge_alloc(DEV, T, BR, FUNCS);
> >  +if (IS_ERR(C))
> >  +     return PTR_ERR(C);
> >  |
> >  -C = devm_kzalloc(DEV, ...);
> >  -if (!C)
> >  -    return ERR_PTR(-ENOMEM);
> >  +C = devm_drm_bridge_alloc(DEV, T, BR, FUNCS);
> >  +if (IS_ERR(C))
> >  +     return PTR_ERR(C);
> >  )
> >   ...
> >  -C->BR.funcs = FUNCS;
> >
> >Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

[...]

> >diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> >index 5e5f8c2f95be1f5c4633f1093b17a00f9425bb37..9b1dfdb5e7ee528c876c01916c9821d550cad679 100644
> >--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> >+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> >@@ -1045,9 +1045,10 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
> > 		return ERR_PTR(-ENODEV);
> > 	}
> > 
> >-	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
> >-	if (!hdmi)
> >-		return ERR_PTR(-ENOMEM);
> >+	hdmi = devm_drm_bridge_alloc(dev, struct dw_hdmi_qp, bridge,
> >+				     &dw_hdmi_qp_bridge_funcs);
> >+	if (IS_ERR(hdmi))
> >+		return PTR_ERR(hdmi);  
> 
>            This should return hdmi or ERR_CAST(hdmi);

Indeed, thanks!

My coccinelle patch is clearly not clever enough. I'll see whether I
can fix it, otherwise I'll handle these 3 special cases manually, along
with another similar one (imx/imx-legacy-bridge.c) I just spotted after
your report.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

