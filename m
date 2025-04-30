Return-Path: <linux-renesas-soc+bounces-16513-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89488AA490B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 12:46:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35FD13ADB74
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 10:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248A425A331;
	Wed, 30 Apr 2025 10:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ba2+wqLp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E86154BE2;
	Wed, 30 Apr 2025 10:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009563; cv=none; b=HxVcBrTcn4nAf/YAnj8ct0OxTYJRpf1kygM8RQZpq3btnfFZsjKFJr9mVLI3/M9pgnLU9u4hwFOGfjz5Z1xtY4dTh/CVq7gyk9ECjV3QMBf6WjtFEH5vG0tIAnt8tiPcqMDHoEugltzqhcmJIm3C/vASSYvXa9v65x3rTiUb3yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009563; c=relaxed/simple;
	bh=pa/oq7Iq9DFQzLAcYNPUeUzLf26wbsIriyzXBSer2gM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kHgATGFbwWdf0ToZApQFBDeHXGIRT3IpyQyYHagrQ03fhxjdYw4qtHsVSq7f3kYKn0gjhnZIJVOz80Cgwc0+s4btBLVC+RPoO7wCSriOv6DmAIRTr5sexkIItmfrmLouqDMZJbFXStBg3J42aGoMq7EXAB7Z2beVuXA9jp7OQP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ba2+wqLp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B910BC4CEE9;
	Wed, 30 Apr 2025 10:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746009560;
	bh=pa/oq7Iq9DFQzLAcYNPUeUzLf26wbsIriyzXBSer2gM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ba2+wqLpY4w4Dwob5uYJx95CKmUelGELftsNTS3eHspzZ58Ikjl7LtL2k/WEVojg3
	 6RNboZgAoPsRSceBSrJQ4gI0KI+kLh/x/+zVe369vcEYvsrJcpw+MaLGq1dvO0dhzT
	 UXRNIHNfOndCAVL8bp8Vk+mUt5Z7AOA9GNYnov13fOSdNL5ZdZ+HunWP8UpY2BZFVS
	 kcUcVI8My66bOlI48dIaW0RnArzM3AEdSf4RJwXFrBtI9GNBMwHbLfcRwpMdomOayN
	 rqMkzFB+G2QvvC7JpYRvfRaEQX3MjkSQYncUy0phaJL6pWidajSYs2KXlz01S2iNTQ
	 1tZFXEK+iUgRg==
Date: Wed, 30 Apr 2025 12:39:17 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Anusha Srivatsa <asrivats@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, Adam Ford <aford173@gmail.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, Aleksandr Mishin <amishin@t-argos.ru>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benson Leung <bleung@chromium.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Christoph Fritz <chf.fritz@googlemail.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Detlev Casanova <detlev.casanova@collabora.com>, 
	Dharma Balasubiramani <dharma.b@microchip.com>, Guenter Roeck <groeck@chromium.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jani Nikula <jani.nikula@intel.com>, Janne Grunau <j@jannau.net>, 
	Jerome Brunet <jbrunet@baylibre.com>, Jesse Van Gavere <jesseevg@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Liu Ying <victor.liu@nxp.com>, Manikandan Muralidharan <manikandan.m@microchip.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Phong LE <ple@baylibre.com>, 
	Sasha Finkelstein <fnkl.kernel@gmail.com>, Sugar Zhang <sugar.zhang@rock-chips.com>, 
	Sui Jingfeng <sui.jingfeng@linux.dev>, Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Vitalii Mordan <mordan@ispras.ru>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Hans de Goede <hdegoede@redhat.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, "Rob Herring (Arm)" <robh@kernel.org>, 
	Hsin-Te Yuan <yuanhsinte@chromium.org>, Pin-yen Lin <treapking@chromium.org>, 
	Xin Ji <xji@analogixsemi.com>, Aradhya Bhatia <a-bhatia1@ti.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Ian Ray <ian.ray@ge.com>, 
	Martyn Welch <martyn.welch@collabora.co.uk>, Peter Senna Tschudin <peter.senna@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Herve Codina <herve.codina@bootlin.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Inki Dae <inki.dae@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Helge Deller <deller@gmx.de>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: (subset) [PATCH v2 00/34] drm: convert all bridges to
 devm_drm_bridge_alloc()
Message-ID: <20250430-scorpion-of-majestic-argument-7f59b4@houat>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <174591887152.961603.7706063017853945511.b4-ty@bootlin.com>
 <sdiwpe7nnhud3fvkgijjbfyenlwpchbxgehyxmsy7c5loo257h@hkfcawkjrlhd>
 <efcf3798-9ac1-42a7-8a12-24d931cbf771@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="n3uft3wwvexxpcog"
Content-Disposition: inline
In-Reply-To: <efcf3798-9ac1-42a7-8a12-24d931cbf771@bootlin.com>


--n3uft3wwvexxpcog
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: (subset) [PATCH v2 00/34] drm: convert all bridges to
 devm_drm_bridge_alloc()
MIME-Version: 1.0

On Wed, Apr 30, 2025 at 10:21:48AM +0200, Louis Chauvet wrote:
>=20
>=20
> Le 29/04/2025 =E0 16:42, Dmitry Baryshkov a =E9crit=A0:
> > On Tue, Apr 29, 2025 at 11:27:51AM +0200, Louis Chauvet wrote:
> > >=20
> > > On Thu, 24 Apr 2025 20:59:07 +0200, Luca Ceresoli wrote:
> > > > devm_drm_bridge_alloc() [0] is the new API to allocate and initiali=
ze a DRM
> > > > bridge, and the only one supported from now on. It is also necessar=
y for
> > > > implementing reference counting and thus needed to support removal =
of
> > > > bridges from a still existing DRM pipeline without use-after-free.
> > > >=20
> > > > This series converts all DRM bridges to the new API.
> > > >=20
> > > > [...]
> > >=20
> > > Applied, thanks!
> > >=20
> >=20
> > [...]
> >=20
> > > [16/34] drm/msm/dp: convert to devm_drm_bridge_alloc() API
> > >          commit: b2aabe5c6b65516d88214aba4b12ce2ca78bac6c
> > > [17/34] drm/msm/dsi: convert to devm_drm_bridge_alloc() API
> > >          commit: fffc8847743e45604c4478f554d628481b985556
> > > [18/34] drm/msm/hdmi: convert to devm_drm_bridge_alloc() API
> > >          commit: e11532be87e437648521a8ed5358c56df11933b4
> >=20
> > Why? These drivers are explicitly handled outside of drm-misc. Please be
> > more careful next time.
> >=20
>=20
> Sorry, I was not aware that msm also have his own repository.
>=20
> TBH, I was not aware that other repositories existed for drm (I should ha=
ve
> looked at MAINTAINERS, it is totally my fault). DIM and doc[1] only list
> drm, drm-misc, drm-xe, drm-intel, so I just tough "intel is special", not
> "drm is divided in many repositories".

It's mentioned in the drm-misc section:

https://drm.pages.freedesktop.org/maintainer-tools/repositories/drm-misc.ht=
ml

> This repository consists mostly of the core drm code as well as DRM
> drivers that do not have a dedicated repository.

Feel free to send a patch to improve the doc. If you missed it, someone
else will.

Maxime

--n3uft3wwvexxpcog
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaBH91QAKCRAnX84Zoj2+
dtaAAYD+vw3ijG0Npi7DNS7E4rH/Y/pmL5jn26rshJDKKon86xXDKPf7qxcxUMUk
GcIwPpABfiK4x23dgB5GWaHnby7RQQrps8EcAVNJ5CjGxA14hgs3XZLzSy+6xbQn
WiWn0Tn6mA==
=/a61
-----END PGP SIGNATURE-----

--n3uft3wwvexxpcog--

