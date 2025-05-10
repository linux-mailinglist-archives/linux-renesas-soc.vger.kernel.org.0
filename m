Return-Path: <linux-renesas-soc+bounces-16932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3418AB22BA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 10:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B77E4C11DD
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 08:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A67C21FF1D5;
	Sat, 10 May 2025 08:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hn3ETCkg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D401F2C58;
	Sat, 10 May 2025 08:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746867506; cv=none; b=l7XMBepbnszbg1UzmS3o4wDaHUcmcRTgIPJNIOYloVxm7RBc24SLErdNkgeXalKBt9SOk+qXE5qrehZTHiXLAAc9kQ7fegOS+9uJsZrHBvVJ8LcDRT0LJinu8mnwTBMKrdw4BhdXdTcdMnHo5f2OYJNDsvSqwMOed2HdY911xDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746867506; c=relaxed/simple;
	bh=KQZXL+8mSvjE/ffDNqcBTcqjRRAsjW7xKRH4V1Yhz3g=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=EHu0QYcdDHh62e2YkReASJbO7jyaM2P8HffYqjjFoibe209unp8BGqPI3UpNN+QBDs42lWopKtoi0nqYe/Q1SDcxs5WAjfag2cNeL4gwdyGtrb+Yx/OHvVKk5E7PhN9eCV41ZQuv9wR22WKnRPXIQbWK2ghDBNRY4W7v4wPAQMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hn3ETCkg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FDE7C4CEE2;
	Sat, 10 May 2025 08:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746867505;
	bh=KQZXL+8mSvjE/ffDNqcBTcqjRRAsjW7xKRH4V1Yhz3g=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=Hn3ETCkgrLKLiIMOIHgmHZ0GK9SwwrPLV0AORbbNC7iRm8NgjaFFdGZDc4Dtk2Vkb
	 ILpF5jgJemxZm3tBLCXYuylreXKQOedbjrYPf0dX0D8Gwil+GrvA0d/N+MjuTsSPi0
	 pPXGD42cx5PYor7h5EmMwlIF4f95fjfhiVhe/LB/cRGe/t9k+6FmfPtxcc5lPcfE33
	 53jRp5zSdpPN5PTvZm6DUFfd/lZcF7sQUUw97FMRgTz2HVr2bOvL/wyG6QmRSnCVOS
	 bRBedGbL4x3zcX/cDykTDe+pno5Sl0lYyGXnm97mAT/4Iy50StfDILe1nmNMV8bsfE
	 2UD6ihELv+fDQ==
Message-ID: <5573173c96551b51def2ec8806f297be@kernel.org>
Date: Sat, 10 May 2025 08:58:22 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 12/22] drm/omap: dss: sdi: convert to
 devm_drm_bridge_alloc() API
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-12-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-12-b8bc1f16d7aa@bootlin.com>
Cc: asahi@lists.linux.dev, chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, platform-driver-x86@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Anusha Srivatsa" <asrivats@redhat.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Douglas Anderson" <dianders@chromium.org>, "Fabio
 Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Kuninori
 Morimoto" <kuninori.morimoto.gx@renesas.com>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Paul Kocialkowski" <paulk@sys-base.io>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>, "Robert
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

On Fri, 9 May 2025 15:53:38 +0200, Luca Ceresoli wrote:
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

