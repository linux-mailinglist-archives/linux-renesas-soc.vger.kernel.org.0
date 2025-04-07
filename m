Return-Path: <linux-renesas-soc+bounces-15500-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3507EA7E75A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 18:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F3C118870C1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 16:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24989215197;
	Mon,  7 Apr 2025 16:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YK7Ze1ul"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E98C215079;
	Mon,  7 Apr 2025 16:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744044436; cv=none; b=uRyVsYhOFUY6e4BkWufRh7grUkklsCH3yERq0cffVPTbuEbrO34gb/gf6P4ZgDh6Xhw6Ul69f5NLIb2ooXePQHkLOFzT1nICaUML1aghfiDbKyEV4H+9MNV56ZK0FNM7TVp61yPgxlynGvreyqAuQ+BxUvZonEvzqKf5ndqA8G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744044436; c=relaxed/simple;
	bh=d/9rF2v6gxz+aVjjloTd50bAqLAn569sdN/hKyUhniA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sAffc7/MaB8h9oVid+spP9sowiKCUiBzIXVPrPiYwAAtP6trHn3vsQNPLWX3XZMHrt2PiTQrfPvebvAHZizyt1h/Vlgd2KDxGBevmvcFsy8axP4pw8eMHGZjop+3Phe+9kBmdW4EUM9TH1/ZYjqDyGalJxThxLJzcIxTVqbx6ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YK7Ze1ul; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744044434; x=1775580434;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=d/9rF2v6gxz+aVjjloTd50bAqLAn569sdN/hKyUhniA=;
  b=YK7Ze1ulO3IPQJIf1oveqFe8p2IG/YiclFxHNSbFlgcWECdQV31TO0HU
   5CGp7fVZ8/7oVnpr3HR8tTRuKpgw7/zxf0KISObSVDTK1ronrgWpQnSL7
   JHM6+ambKdgIDL+XQMkc188fwPg1AW0sHLA7c5xSLLehtVLPS/oaNJXic
   a3rnZMCJjMyrhFmxBjRJXHz2wjL7jnp0iq1DjAJ3C1kmLILSet70IuFaK
   Z7RNx3v2+BHV78iKU/w1OB9pM2sxGwEgky0jPk3EZCtfwR9QjupNg+tRB
   8v1rn+kkelZTCp81bvVCP+No9ZKCApIjFz1w42kqK+w8KpjdTFTASU2vQ
   A==;
X-CSE-ConnectionGUID: YKW7OwGrSCChaKFcr57O+w==
X-CSE-MsgGUID: P6pQb+gtToKAn45TPgM4Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45533291"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45533291"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 09:47:13 -0700
X-CSE-ConnectionGUID: dEMeJzZ7RJaZ+YDO48bYaw==
X-CSE-MsgGUID: yioqSJnkQC+IzOwpsUAeHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127767783"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 09:47:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 7 Apr 2025 19:46:59 +0300 (EEST)
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
    Maxime Ripard <mripard@kernel.org>, 
    Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
    Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
    Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
    Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
    Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
    Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
    Sascha Hauer <s.hauer@pengutronix.de>, 
    Pengutronix Kernel Team <kernel@pengutronix.de>, 
    Fabio Estevam <festevam@gmail.com>, 
    Douglas Anderson <dianders@chromium.org>, 
    Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
    Krzysztof Kozlowski <krzk@kernel.org>, 
    Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
    Anusha Srivatsa <asrivats@redhat.com>, 
    Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
    =?ISO-8859-15?Q?Herv=E9_Codina?= <herve.codina@bootlin.com>, 
    Hui Pu <Hui.Pu@gehealthcare.com>, 
    Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
    dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
    LKML <linux-kernel@vger.kernel.org>, chrome-platform@lists.linux.dev, 
    imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
    linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
    linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
    linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
    freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
    Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 02/34] platform: arm64: acer-aspire1-ec: convert to
 devm_drm_bridge_alloc() API
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-2-42113ff8d9c0@bootlin.com>
Message-ID: <a9000632-a6d1-d369-c317-9ee73aa645dc@linux.intel.com>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com> <20250407-drm-bridge-convert-to-alloc-api-v1-2-42113ff8d9c0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1316811861-1744044419=:936"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1316811861-1744044419=:936
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 7 Apr 2025, Luca Ceresoli wrote:

> This is the new API for allocating DRM bridges.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> ---
>=20
> Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
> Cc: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/arm64/acer-aspire1-ec.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/platform/arm64/acer-aspire1-ec.c b/drivers/platform/=
arm64/acer-aspire1-ec.c
> index 958fe1bf5f85bb69ac7962f217de9f0b40cde9a1..438532a047e68799ac53a16a4=
c813fc16be997b9 100644
> --- a/drivers/platform/arm64/acer-aspire1-ec.c
> +++ b/drivers/platform/arm64/acer-aspire1-ec.c
> @@ -452,9 +452,9 @@ static int aspire_ec_probe(struct i2c_client *client)
>  =09int ret;
>  =09u8 tmp;
> =20
> -=09ec =3D devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
> -=09if (!ec)
> -=09=09return -ENOMEM;
> +=09ec =3D devm_drm_bridge_alloc(dev, struct aspire_ec, bridge, &aspire_e=
c_bridge_funcs);
> +=09if (IS_ERR(ec))
> +=09=09return PTR_ERR(ec);
> =20
>  =09ec->client =3D client;
>  =09i2c_set_clientdata(client, ec);
> @@ -497,7 +497,6 @@ static int aspire_ec_probe(struct i2c_client *client)
>  =09fwnode =3D device_get_named_child_node(dev, "connector");
>  =09if (fwnode) {
>  =09=09INIT_WORK(&ec->work, aspire_ec_bridge_update_hpd_work);
> -=09=09ec->bridge.funcs =3D &aspire_ec_bridge_funcs;
>  =09=09ec->bridge.of_node =3D to_of_node(fwnode);
>  =09=09ec->bridge.ops =3D DRM_BRIDGE_OP_HPD;
>  =09=09ec->bridge.type =3D DRM_MODE_CONNECTOR_USB;

Hi Luca,

It took a while to locate where the code for the new helper is. I suggest=
=20
if you need send another version of the series directly linking to the=20
commit in the cover letter so that it won't take multiple hoops to find it=
=20
if one wants to review the code and is not having all drm trees easily at=
=20
hand. Here it is for the benefit of other pdx86 people:

https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cc6aadd7fc1e629b71=
5ea3d1ba537ef2da95eec


Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

I assume you want this to go through the drm tree where the helper already=
=20
is?

--=20
 i.

--8323328-1316811861-1744044419=:936--

