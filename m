Return-Path: <linux-renesas-soc+bounces-16927-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0E6AB228E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 10:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65AF24C0DAF
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 08:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679D01F151D;
	Sat, 10 May 2025 08:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aumuG/P6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283441A38F9;
	Sat, 10 May 2025 08:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746867361; cv=none; b=eFUUUFTUnauqcyCuRF0GsPOMPu6+dUlXRBdTlXcuom6uXpGNc2mc+Ksv+vSHZ55Sx2A4nziTV4on/1eVUZ0IQNlnW3T+PoQRCB3Szdrb6ZrD7wzmwy07HUsmOiJ1l+GXfGCqZasw1kkBtWPIY6IUZqXYZ2bmfozt7ztMmUnKnPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746867361; c=relaxed/simple;
	bh=OC/+BtZ0ooFhUNjPocwxrg82VS4PrJY80Y8QYYi5gdw=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=DSW+9mqjjKiITIGqzWAGBWzBhx8BTqaT3Q5YIb0sO/Tu7Ynk30/3j61qu+tujI5TR/I8zdy8tPVlVYHztdNLqK3YgRiCoS0aWv1F+MpDEO19N0ka/ySQW9jCoC9MxMMnAqk6O8pTxS1Aakd/UBwP+t98MRH7ZvAklXuM+unLW2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aumuG/P6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426E3C4CEE2;
	Sat, 10 May 2025 08:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746867361;
	bh=OC/+BtZ0ooFhUNjPocwxrg82VS4PrJY80Y8QYYi5gdw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=aumuG/P6IVcesDDt65dxp40V8hP9Tnxtpt0xmNrxoDzj7r9O1C4gz6H4AHvFgXZFC
	 6XZEqqhKPiIvhGIi7A6Dixz3IBB2VaRit/pr9MwOXMlN6xYSnB/SOh3g/xUJXjQ2M7
	 RzZbLikKPmSFqkTGsRbiFFkpAE8klv9bRIGM1jV4RAB2Knke47OviQ5poM5WQvWHWV
	 kH3tCQ4S+goSpYoJvsVhDq8brb42KI/VnsPjmgEHWeO/p86dQZaEZ/VCjwls98Vrse
	 WmgUAS2K9WMdRN3gV0fDfdd2JQnxD+MNM2HB5EevXrGA5yjzNDgeT1yXebDA4CmTpc
	 wxBpo6SGj64Gw==
Message-ID: <923990fc00f1d421c7db3ccd74aa516b@kernel.org>
Date: Sat, 10 May 2025 08:55:57 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 13/22] drm/omap: dss: venc: convert to
 devm_drm_bridge_alloc() API
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-13-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-13-b8bc1f16d7aa@bootlin.com>
Cc: asahi@lists.linux.dev, chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, platform-driver-x86@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Anusha Srivatsa" <asrivats@redhat.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Douglas Anderson" <dianders@chromium.org>, "Fabio
 Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Paul
 Kocialkowski" <paulk@sys-base.io>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

On Fri, 9 May 2025 15:53:39 +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
>=20
> Switching from a non-devm to a devm allocation allows removing the kfree()
> in the remove function and in the probe error management code, and as a
> consequence to simplify the code flow by removing now unnecessary gotos.
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

