Return-Path: <linux-renesas-soc+bounces-31707-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GYFADK78GmFXwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31707-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 15:50:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BD365486419
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 15:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 430C430B0F8E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 13:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56368238D54;
	Tue, 28 Apr 2026 13:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qRLoVPjW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD74844B694;
	Tue, 28 Apr 2026 13:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777383614; cv=none; b=fwTDwaGZLR/0XFp7Ym17VpH6UJdW016cAEQL1MeL3EMsYVKKSyeKmed4J3+yIALWsJMG7qBHA5HY3BW1v6ZfHYtZTBFN6742tQRAja9rzN4aY0q9LHrkTCb/zz0HRXUqRClzorHK+viQQO8dfDOrBlyh6x0W1soR4pPHGVI69KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777383614; c=relaxed/simple;
	bh=DY37OnpoYjjW+GFpmDYkzr+BXySsTF4/pHUAAopHjvA=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=slL67D5Pb0oXGXNGd6GcDGDQ9SiSh4NCwHbWwmTxOvDwJzawFlIIiZwHrdRw6kNf+MF0tNQrguXOv/sOlQyFZud0kgNFQDTOGbLi4pnGrvUMtf2/PqEQdoXFadmgtWo9dRb7Stl2PP/lPNXthvDdP2tcREiR9paYYoV2kDr6Fpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qRLoVPjW; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BC4EAC5EF10;
	Tue, 28 Apr 2026 13:40:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 026AB601DF;
	Tue, 28 Apr 2026 13:40:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6AAE10728BFF;
	Tue, 28 Apr 2026 15:39:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777383605; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DY37OnpoYjjW+GFpmDYkzr+BXySsTF4/pHUAAopHjvA=;
	b=qRLoVPjWicMlOER4CBoXDyZ31IS3N9wzfHFsgyWbAAFF/gci+qsFmTs0vCeqFcMtumISls
	Tj3oY/2Cdf6m/7gztcQrTJLdN0ggRvFVqgt+JH8FxO2/nx+GfiibBB7tr9VdYd2pRAyZX1
	XAXF0QiFbh370lTIQPb7xonACEwx2kQTWqUUcXxmMBeCKnlqHPelpK3fTwkngZn/4NCD/d
	KE58A7C2KizgbREMj4kyFapvuVzo03ASQ8lKHF89cbbYlD9WTUWuW4Ve1tF5Yw+ztjpBH4
	MjEA//3NGYT7/zO8OOYAeAWTnaFj1l+B1bRPPqqwsMjaj7jeo7/wmSi84hXibw==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 15:39:43 +0200
Message-Id: <DI4TW9XECX53.17TEZPCSWTH1A@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 00/41] drm/display: bridge-connector: attach encoder
 to the connector
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <asahi@lists.linux.dev>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mips@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-rockchip@lists.infradead.org>,
 <linux-tegra@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Sasha Finkelstein"
 <fnkl.kernel@gmail.com>, "Janne Grunau" <j@jannau.net>, "Liu Ying"
 <victor.liu@nxp.com>, "Douglas Anderson" <dianders@chromium.org>,
 "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>, "Lucas Stach"
 <l.stach@pengutronix.de>, "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Paul Cercueil" <paul@crapouillou.net>,
 "Anitha Chrisanthus" <anitha.chrisanthus@intel.com>, "Chun-Kuang Hu"
 <chunkuang.hu@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Kevin Hilman" <khilman@baylibre.com>, "Jerome Brunet"
 <jbrunet@baylibre.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Sandy Huang" <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "Andy Yan"
 <andy.yan@rock-chips.com>, "Thierry Reding" <thierry.reding@gmail.com>,
 "Mikko Perttunen" <mperttunen@nvidia.com>, "Jonathan Hunter"
 <jonathanh@nvidia.com>, "Jingoo Han" <jingoohan1@gmail.com>, "Inki Dae"
 <inki.dae@samsung.com>, "Seung-Woo Kim" <sw0312.kim@samsung.com>, "Kyungmin
 Park" <kyungmin.park@samsung.com>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>, "Laurent Pinchart"
 <laurent.pinchart+renesas@ideasonboard.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Biju
 Das" <biju.das.jz@bp.renesas.com>, "Marek Vasut" <marex@denx.de>, "Stefan
 Agner" <stefan@agner.ch>, "Jyri Sarha" <jyri.sarha@iki.fi>, "Michal Simek"
 <michal.simek@amd.com>
X-Mailer: aerc 0.20.1
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com> <cf2c91396eb3017aa51dd9c840badffddca2f7ec.camel@iscas.ac.cn>
In-Reply-To: <cf2c91396eb3017aa51dd9c840badffddca2f7ec.camel@iscas.ac.cn>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: BD365486419
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31707-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FREEMAIL_TO(0.00)[iscas.ac.cn,oss.qualcomm.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,jannau.net,nxp.com,chromium.org,oss.nxp.com,pengutronix.de,crapouillou.net,collabora.com,baylibre.com,googlemail.com,linux.dev,poorly.run,somainline.org,rock-chips.com,sntech.de,nvidia.com,samsung.com,glider.be,bp.renesas.com,denx.de,agner.ch,iki.fi,amd.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[78];
	NEURAL_HAM(-0.00)[-0.998];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,bootlin.com:dkim,bootlin.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Hello Icenowy,

On Sat Apr 25, 2026 at 5:22 PM CEST, Icenowy Zheng wrote:
> =E5=9C=A8 2026-04-23=E5=9B=9B=E7=9A=84 11:16 +0200=EF=BC=8CLuca Ceresoli=
=E5=86=99=E9=81=93=EF=BC=9A
>> This series simplifies using the bridge-connector by removing the
>> need to
>> attach the newly created connector to the encoder.
>>
>> =3D=3D Series description
>>
>> Currently all users of the bridge-connector must call
>> drm_connector_attach_encoder() immediately after a successful
>> drm_bridge_connector_init().
>>
>> This is an unnecessary burden for users. Move the call to the end of
>> drm_bridge_connector_init() so all callers can be simplified.
>>
>> =C2=A0* Patch 1 adds a drm_connector_attach_encoder() call at the end of
>> =C2=A0=C2=A0 drm_bridge_connector_init()
>> =C2=A0* The other patches remove drm_connector_attach_encoder() after al=
l
>> =C2=A0=C2=A0 drm_bridge_connector_init() calls, ordered from the simples=
t ones
>> =C2=A0=C2=A0 (only the last one is somewhat non-obvious)
>>
>> The Cc list is huge due to the many drivers touched. I sent v1 to a
>> reduced
>> Cc list to ensure there is an agreement about the overall idea. That
>> seems
>> to be the case, so now it's time to copy all drivers maintainers.
>>
>> It would be nice to apply all of this series at once to avoid
>> duplicated
>> calls to drm_connector_attach_encoder() in the interim. That would be
>> harmless beacuse drm_connector_attach_encoder() is idempotent, but
>> unpleasant.
>>
>> =3D=3D Additional rationale (for the curious)
>>
>> Besides making the usage of the bridge-connector a bit simpler, this
>> series
>> is in preparation for DRM bridge hotplug. Here's why, feel free to
>> skip if
>> you don't care.
>>
>> The old bridge hotplug proposals I have sent in the past [1] were
>> based on
>> a hotplug-bridge driver to sit between the last fixed bridge and the
>> first
>> hotplugged bridge. Discussion with the community led to the need of
>> removing the hotplug-bridge and let common DRM code handle hotplug.
>> The
>> common place of code that appears the most suitable for hotplug
>> handling is
>> the bridge-connector, which is by now the recommended way to handle
>> connector instantiation after a bridge chain.
>>
>> So I'm in the process of extending the bridge-connector to be the
>> central
>> point to handle bridge hotplug. Turns out the need to call
>> drm_connector_attach_encoder() after drm_bridge_connector_init() has
>> returned is adding big headaches to such work. So I'm send this long
>> but
>> simple series to both simplify bridge-connector usage and remove one
>> obstacle from the bridge hotplug work. This series is relevant by
>> itself
>> anyway.
>>
>> [1]
>> https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-26-9d6f2c9c3=
058@bootlin.com/
>>
>> =3D=3D Grand plan
>>
>> This is part of the work to support hotplug of DRM bridges. The grand
>> plan
>> was discussed in [0].
>
> Just see the bridge hotplugging thing, is it possible for DRM drivers
> to declare bridges attached to themselves after this?
>
> Loongson 7A1000 PCH can only output DPI signals, so nearly all products
> with it are shipping with some kind of external bridges, but currently
> drm/loongson does not support them (all display connectors are now seen
> as DPI ones, and connectors behind non-transparent bridges won't work).
>
> The bridges are going to be accessed by the DDC I2C busses of 7A1000,
> and are not declared with device tree (systems with 7A1000 never ship
> with device trees, and Linux currently matches a built-in device tree).
> (Bridges being on the DDC I2C also introduces some dependency for them
> to depend on the drm/loongson driver.)
>
> Loongson have defined some kind of VBIOS declaring what bridge is
> behind, and their non-mainline driver just contains driver codes for
> all possible bridges. (Sui Jingfeng previously tried to mainline such
> practice, and of course it's rejected because of code duplicity.)

I'm afraid your question goes a bit beyond my knowledge, the hotplug work
I'm carrying on is focuses on DT platforms.

My limited understading of non-DT platforms is that a card driver must
instantiate all components and tie them together, which assumes it has to
know them somehow (ACPI, hardcoded, whatever). Others can probably comment
better about this.

As a general principle, when devices can be mixed and matched by the board
designer, hardcoding them is a bad design choice. Think of bad old board
files written in C, which were unmanageable and got replaced exactly by
device tree. So my opinion is that DRM encoders and bridges should know as
little as possible about the following bridge, connector or panel that
follows them.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

