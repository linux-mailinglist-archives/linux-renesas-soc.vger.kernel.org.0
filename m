Return-Path: <linux-renesas-soc+bounces-16931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D1BAB22AD
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 10:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 989AC18889A2
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 08:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022411FCFC0;
	Sat, 10 May 2025 08:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/QyRyCj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CEA1EE010;
	Sat, 10 May 2025 08:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746867454; cv=none; b=Pffg29J8WJM8J7SvMFuZ0uRIAKkgGFN7auduAGMC2Yrb/v8zACsBhRhmmh5JMIKnoRxwExR3t1kMghUkfiCLl8n+oD/MIM8AwtVtHf3hhIsHeUYOGb1Twvo5bwXknvF/WwfmH3zhMd/7kYESnW3+RYEqdvwtHZDjAbHTSatose8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746867454; c=relaxed/simple;
	bh=tC3B6hWsBtkSvoNTvU5ELZanQvPAvCpKhKJcyglbi24=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=cwkzdMzWCqvCzQ+PpjPigjL0nEkBMW6+B5MSPY4dBmJMiMj/ULwYAMf3JFuL9BJNDDAxovYvA7Mulbf5ZikAZmdkfo7hkxEAI/B+JJDrhXpibzpeqgs5mGCQiIyR1ODbNCSAZWbTbWJ78JULFqgL/FlU8NahVFbGd3TJDsrlrDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/QyRyCj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D51C4CEE2;
	Sat, 10 May 2025 08:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746867454;
	bh=tC3B6hWsBtkSvoNTvU5ELZanQvPAvCpKhKJcyglbi24=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=E/QyRyCjQphAbk+XXHUyHfDNKmqmLP+fuKyiBUaBSJRMgWKbK/BxB7kKCVlCkUAee
	 KhWHZtXMZZK9YSL7YUmJ7wbmISnbxDgtTas6rIsC3ecP9wZ42phK5mWeaVpWo7vTCc
	 kQOtHS/RZ/pBNIKo17v9GVx/ObRAldtbTdWtQQ9Lta8JE0EA05s1O1eK9D1/HOAOcS
	 spYDNQL96vakm3C6AWadK1lfJHemYZMCEb+7VVpt0SKbwqmW1SZxzs/gbaYNIPU9Mi
	 RGQvM14XS5y6lxUNpazE6YnmVhQNJ9V2cyeynUyYhacCXQoMuhVprp98y3ZsoEqUtp
	 PYvNgc9vtzD0Q==
Message-ID: <c264afd17fb81a5c39e4de6eb903d05b@kernel.org>
Date: Sat, 10 May 2025 08:57:30 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 17/22] drm: zynqmp_dp: convert to
 devm_drm_bridge_alloc() API
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-17-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-17-b8bc1f16d7aa@bootlin.com>
Cc: asahi@lists.linux.dev, chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, platform-driver-x86@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Anusha Srivatsa" <asrivats@redhat.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Douglas Anderson" <dianders@chromium.org>, "Fabio
 Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Michal
 Simek" <michal.simek@amd.com>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Paul
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

On Fri, 9 May 2025 15:53:43 +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
>=20
> This driver has a peculiar structure. zynqmp_dpsub.c is the actual driver,
> which delegates to a submodule (zynqmp_dp.c) the allocation of a
> sub-structure embedding the drm_bridge and its initialization, however it
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

