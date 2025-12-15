Return-Path: <linux-renesas-soc+bounces-25774-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 612BACBE5DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 15:45:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A233C305F7C2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 14:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569E2346FDF;
	Mon, 15 Dec 2025 14:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pzSvaA1t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BC7346FD0;
	Mon, 15 Dec 2025 14:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765809003; cv=none; b=WqlWFPTxn5fJJVsOEBM4aInqjWCdMqYy1rXsh8JpujRy1jZ9NmDMIT+wwJRFx3Tr4kl+gPb2Zp01pPpKoK6uEBt8uxCguFIn5Kj1eMQt0VRm56BRMi7215KoTH3t3hB8x965YG7dxa6zW+gOO2kdVMYFSoa/mXnVMeKXsJCNtro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765809003; c=relaxed/simple;
	bh=d/qPch42wTytcUVZpnvLFzPzkHT+2Te29Yve88Y7qvk=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=p7jPzKgGFGQ/J6K4pkU0gPhjHwI+0VCmIdJR9X65CEf//s1ZZZYXRNIIVh8MkrBNnDgekujVXIKU3l8eaQ++KtG/e+Z+EpsF2tViDFbakhHfXlpfm7HBAyhp7vaERqT3scWonLStESCX7ETPZYgca4YNDTTaMHwfgEL27K8NW/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pzSvaA1t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6C9C4CEF5;
	Mon, 15 Dec 2025 14:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765809002;
	bh=d/qPch42wTytcUVZpnvLFzPzkHT+2Te29Yve88Y7qvk=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=pzSvaA1tzUfFX90Bpv7uTWgOJvjpUreVk5QSuq+ylzfpRBLaffXCIftWhmRtgcwHn
	 WqHHYi/n/LJNXU0xFMhdAxMNl30qsNJgW5AopWO/V+nhjnnrRjZksJ37KJc7wpSLuc
	 XqOT9au/7pIpkRdGOi9b1As4P3b1bXRZTV49Z+pjSY735aCfnlOeZXtj9CY/dJk91c
	 sTbeDasJ8Ce/N/YpYqXJpJHhbvqKQS7yolYAx1vDOGX4tHTY09mNAgi2eYRSwmRiCK
	 k8sq0J3hT7j1Ell8suet00MB4TSsecGkYIYGjkVPcnHwbhrllGCVXkpB3JIZTqa7gG
	 /aof8tGnhNvZQ==
Message-ID: <ed313451e1a08a9e8e976d81a19d2c1a@kernel.org>
Date: Mon, 15 Dec 2025 14:29:59 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 02/26] drm/bridge: deprecate of_drm_find_bridge()
In-Reply-To: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-2-88f8a107eca2@bootlin.com>
References: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-2-88f8a107eca2@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, "Adrien
 Grassein" <adrien.grassein@gmail.com>, "Alexey Brodkin" <abrodkin@synopsys.com>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, "Anitha Chrisanthus" <anitha.chrisanthus@intel.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "David Airlie" <airlied@gmail.com>, "Fabio
 Estevam" <festevam@gmail.com>, "Geert Uytterhoeven" <geert+renesas@glider.be>, "Hui
 Pu" <Hui.Pu@gehealthcare.com>, "Inki Dae" <inki.dae@samsung.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jerome Brunet" <jbrunet@baylibre.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Kevin
 Hilman" <khilman@baylibre.com>, "Kieran Bingham" <kieran.bingham+renesas@ideasonboard.com>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Kyungmin Park" <kyungmin.park@samsung.com>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Laurent Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Magnus Damm" <magnus.damm@gmail.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Phong
 LE" <ple@baylibre.com>, "Robert Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Seung-Woo
 Kim" <sw0312.kim@samsung.com>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Tomi Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

On Fri, 28 Nov 2025 17:50:12 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() does not increment the returned bridge
> refcount. of_drm_get_bridge() is to be used as a replacement.
>=20
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Link: https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a=
18ad@houat/
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

