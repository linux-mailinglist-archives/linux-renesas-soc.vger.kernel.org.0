Return-Path: <linux-renesas-soc+bounces-16679-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E95AA918A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 May 2025 13:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D4C91884FDC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 May 2025 11:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD455201032;
	Mon,  5 May 2025 11:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EOb3oUa1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113971B4139;
	Mon,  5 May 2025 11:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746443235; cv=none; b=qtYrETC40rU8hAl1yHDonVdpyPP5ZD+hLKkLkWJGaq3dZdG64ecxPV2Vj6OjTjnQn9I1TtPMEUmX1nWLPPL/IXBinPqG5rC45UsWqQsCjgZZMbkinB4ZjUhU27gyKfzLkW7eXSn0ZBGDCGY5D0EJR4+HtO75AjjoNbV6vXW+xvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746443235; c=relaxed/simple;
	bh=rO5eZh+9eYwMMDNioF2j933ze88msy7mSao8PLdGod4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZswEZYkLGuGD9T4o8p7BWLnTvoOid3ds2HkgrNoBIJv4SlQ7qo0KyMjp7s9WgXXSF5JxSx3fE2rto+DG/zpYy8+hWfxinDs/3cObzhYHZ5buZLrrfVWVce4cOLt/hbBWANlYgcMXanSuH88buBE6GV/+lF7jFAfxEnlo0JAra6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EOb3oUa1; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 433D443233;
	Mon,  5 May 2025 11:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746443223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4MhGsI2EbyH3hc3EXge2Ok/O3ysmCRWNeiIpRKl0bo4=;
	b=EOb3oUa1DKhQxgB28CR2wdYNZDkW5kb7zZ+egfQDcKeyUiJ+3s5hrBQEK32Laci8oYNbEM
	OF/6FJ81JC9ER9MCDPfm3DJKwHYwXvm9BFTaPpPRJkeu41eU3spHBce9bmliA0oBhYQ4ze
	AGnzKk/cFNK4Y5+5A5JlPp1NRYHjQhQRsnA5X075tHVNLg6fzWimigCoP/wbk9BZGNPFyy
	25st1+P47zeaWIOGIRg2XJ8un3lPPyWU24XEhUwgjQ6SYDxjHrCI4cq3aTiRtC60imY1yW
	ST70x6y44sWQ/Lz+O1QYqD7FEKTW135y6myH23veuat+2D3xlhpkPgCUnizCfQ==
Date: Mon, 5 May 2025 13:06:48 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Inki Dae <inki.dae@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: Maxime Ripard <mripard@kernel.org>, Louis Chauvet
 <louis.chauvet@bootlin.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
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
 linux-stm32@st-md-mailman.stormreply.com, Adam Ford <aford173@gmail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>, Aleksandr Mishin
 <amishin@t-argos.ru>, Andy Yan <andy.yan@rock-chips.com>, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>, Benson Leung
 <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, Christoph
 Fritz <chf.fritz@googlemail.com>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Detlev Casanova
 <detlev.casanova@collabora.com>, Dharma Balasubiramani
 <dharma.b@microchip.com>, Guenter Roeck <groeck@chromium.org>, Heiko
 Stuebner <heiko@sntech.de>, Jani Nikula <jani.nikula@intel.com>, Janne
 Grunau <j@jannau.net>, Jerome Brunet <jbrunet@baylibre.com>, Jesse Van
 Gavere <jesseevg@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Kieran
 Bingham <kieran.bingham+renesas@ideasonboard.com>, Liu Ying
 <victor.liu@nxp.com>, Manikandan Muralidharan <manikandan.m@microchip.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Phong LE
 <ple@baylibre.com>, Sasha Finkelstein <fnkl.kernel@gmail.com>, Sugar Zhang
 <sugar.zhang@rock-chips.com>, Sui Jingfeng <sui.jingfeng@linux.dev>, Tomi
 Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Vitalii Mordan
 <mordan@ispras.ru>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Hans de Goede <hdegoede@redhat.com>, Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>, Dmitry
 Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Rob Herring (Arm)"
 <robh@kernel.org>, Hsin-Te Yuan <yuanhsinte@chromium.org>, Pin-yen Lin
 <treapking@chromium.org>, Xin Ji <xji@analogixsemi.com>, Aradhya Bhatia
 <a-bhatia1@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Ian
 Ray <ian.ray@ge.com>, Martyn Welch <martyn.welch@collabora.co.uk>, Peter
 Senna Tschudin <peter.senna@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Herve Codina <herve.codina@bootlin.com>, Alim
 Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Bjorn Andersson
 <quic_bjorande@quicinc.com>, Marijn Suijten
 <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Helge Deller <deller@gmx.de>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mcanal@igalia.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Michal Simek <michal.simek@amd.com>
Subject: Re: (subset) [PATCH v2 00/34] drm: convert all bridges to
 devm_drm_bridge_alloc()
Message-ID: <20250505130648.22ec8716@booty>
In-Reply-To: <20250430-arrogant-marmoset-of-justice-92ced3@houat>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
	<174591887152.961603.7706063017853945511.b4-ty@bootlin.com>
	<832a9db0-cf8a-4d35-8a98-08053fbd6723@bootlin.com>
	<20250430-arrogant-marmoset-of-justice-92ced3@houat>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkedtleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeljeejuddvudetffdtudelfedugfduledtueffuedufefgudegkeegtdeihedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutdelpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehinhhkihdru
 ggrvgesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopehkhihunhhgmhhinhdrphgrrhhksehsrghmshhunhhgrdgtohhmpdhrtghpthhtohepshiftdefuddvrdhkihhmsehsrghmshhunhhgrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com

Inki, Kyungmin, Seung-Woo, Alim,

On Wed, 30 Apr 2025 10:08:14 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> Inki, Kyungmin, Seung-Woo, sorry for the mishap. Do you agree with the
> following patch, and it going through drm-misc?
> 
> https://lore.kernel.org/dri-devel/20250424-drm-bridge-convert-to-alloc-api-v2-14-8f91a404d86b@bootlin.com/
> 
> If not, we'll revert.

Did you have a chance to have a look at the patch mentioned by Maxime?

It was applied to drm-misc-next by mistake. Not your mistake of course,
but now it's there so if you don't reply anything it will have to be
reverted, and then sent again to go through all the review process to
be hopefully re-applied in the future.

If you agree with keeping it in drm-misc-next, that would be less noise
for everybody.

I'm going to send v3 very soon, so it would be good to decide what to
do before that.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

