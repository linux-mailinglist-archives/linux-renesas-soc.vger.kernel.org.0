Return-Path: <linux-renesas-soc+bounces-15531-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6BBA7ED80
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 21:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 781EE4441C6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 19:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B991622331F;
	Mon,  7 Apr 2025 19:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Gi+8MJKk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB15A222587;
	Mon,  7 Apr 2025 19:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744054069; cv=none; b=sJI6nE72atTxmpLbLmWTmNwZjPTWqykZAWOOF4gMppAW0n9N7yGbdy1N0DMOpv97MULvqq0l/GhE6lohh/4T9IlzaEvruCtPX7bK7xg/oi2qOXgh44x3XR2pVuow5/l9FcE8bzwCek2kYZH8j9cGNd5/dgtbR6hMMnt2fgsC6YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744054069; c=relaxed/simple;
	bh=nWMPJiZ/C1me5It7a1cdWkDqp5i0FTr20WskxIIMaYc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WSkKuzsv67Hu3rIkvH+mzsasjSXFweQV9rIV5SgDuZ6P0fbqVtC0/jFQVgPBznljvDr26FsloK/1WrTPDYBAFfPilOIBLQmImCQt/MOIvWPmsu18IYMdiYjfi3pTGFhGLL5jegfS5D+Abq6HdPcEHb3FLLuszv2mNMizV4+KQIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Gi+8MJKk; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37D604421F;
	Mon,  7 Apr 2025 19:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744054065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cjEt/IPzaAdKLiLHC8nJ5ihJ1fjZFnzeMJstnBzp7XQ=;
	b=Gi+8MJKk54bvu0U11jHOJw08NvtnpAzunZzJXO4mlFlnzsLVy8DFQIv5f1cwemOl31f/in
	yXq1Um8EF62nuW+7K5/FANGhJKfIDt3FpxkAeF2Uw52NGHGgsgSLt5hId5UF1i3v6U7LiQ
	QV71SvnJzRB4Bv9Y0pBT6LtPqcjAci3aXj9uPyPUUIhwMeK2lXlaYCBe0svd+nHK7Htak4
	/9HotCk7aCwdmAu+N82j0bdVIG/9XNextLdkUXD3MPHCRUDF3rNzBb5f+B2kzx0rN1agcB
	y2M7EU6B7HGxiOcK1BDKg9fGTg+UZIk8/GVGNr8AJuzWT4pQ2/Cw+JF6m2DEKA==
Date: Mon, 7 Apr 2025 21:27:39 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
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
 Kozlowski <krzk@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Anusha Srivatsa <asrivats@redhat.com>, Paul
 Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>,
 =?UTF-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Hui Pu
 <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, LKML
 <linux-kernel@vger.kernel.org>, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Hans de Goede
 <hdegoede@redhat.com>
Subject: Re: [PATCH 02/34] platform: arm64: acer-aspire1-ec: convert to
 devm_drm_bridge_alloc() API
Message-ID: <20250407212739.1e991b6a@booty>
In-Reply-To: <a9000632-a6d1-d369-c317-9ee73aa645dc@linux.intel.com>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
	<20250407-drm-bridge-convert-to-alloc-api-v1-2-42113ff8d9c0@bootlin.com>
	<a9000632-a6d1-d369-c317-9ee73aa645dc@linux.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvddtuedtfefgueehiefhjeeiffekudfhgfdtledvffekhfegteduieejveevteehnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeefpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigr
 dhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Ilpo,

On Mon, 7 Apr 2025 19:46:59 +0300 (EEST)
Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> wrote:

> On Mon, 7 Apr 2025, Luca Ceresoli wrote:
>=20
> > This is the new API for allocating DRM bridges.
> >=20
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> >=20
> > ---
> >=20
> > Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
> > Cc: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > ---
> >  drivers/platform/arm64/acer-aspire1-ec.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/platform/arm64/acer-aspire1-ec.c b/drivers/platfor=
m/arm64/acer-aspire1-ec.c
> > index 958fe1bf5f85bb69ac7962f217de9f0b40cde9a1..438532a047e68799ac53a16=
a4c813fc16be997b9 100644
> > --- a/drivers/platform/arm64/acer-aspire1-ec.c
> > +++ b/drivers/platform/arm64/acer-aspire1-ec.c
> > @@ -452,9 +452,9 @@ static int aspire_ec_probe(struct i2c_client *clien=
t)
> >  	int ret;
> >  	u8 tmp;
> > =20
> > -	ec =3D devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
> > -	if (!ec)
> > -		return -ENOMEM;
> > +	ec =3D devm_drm_bridge_alloc(dev, struct aspire_ec, bridge, &aspire_e=
c_bridge_funcs);
> > +	if (IS_ERR(ec))
> > +		return PTR_ERR(ec);
> > =20
> >  	ec->client =3D client;
> >  	i2c_set_clientdata(client, ec);
> > @@ -497,7 +497,6 @@ static int aspire_ec_probe(struct i2c_client *clien=
t)
> >  	fwnode =3D device_get_named_child_node(dev, "connector");
> >  	if (fwnode) {
> >  		INIT_WORK(&ec->work, aspire_ec_bridge_update_hpd_work);
> > -		ec->bridge.funcs =3D &aspire_ec_bridge_funcs;
> >  		ec->bridge.of_node =3D to_of_node(fwnode);
> >  		ec->bridge.ops =3D DRM_BRIDGE_OP_HPD;
> >  		ec->bridge.type =3D DRM_MODE_CONNECTOR_USB; =20
>=20
> Hi Luca,
>=20
> It took a while to locate where the code for the new helper is. I suggest=
=20
> if you need send another version of the series directly linking to the=20
> commit in the cover letter so that it won't take multiple hoops to find i=
t=20
> if one wants to review the code and is not having all drm trees easily at=
=20
> hand. Here it is for the benefit of other pdx86 people:
>=20
> https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cc6aadd7fc1e629b=
715ea3d1ba537ef2da95eec

Apologies, indeed you have a good point. I added the link to the cover
letter so it will be in v2, if any.

> Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

Thanks!

> I assume you want this to go through the drm tree where the helper alread=
y=20
> is?

MY best guess is that drm-misc-next is the appropriate branch, and it
is where the helper is already present, but I'll let maintainers decide
what is most appropriate.

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

