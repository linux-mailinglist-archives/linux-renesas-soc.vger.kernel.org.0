Return-Path: <linux-renesas-soc+bounces-16926-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EC2AB2288
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 10:55:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8279A07065
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 08:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2A61F151D;
	Sat, 10 May 2025 08:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WVOW4a8J"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0711E9B08;
	Sat, 10 May 2025 08:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746867299; cv=none; b=g4QjRugELU+Y61MroqBGBxCy0cJT3noS98SesPOVSISwe4Ka1PRkDmkFY6jbIpa7h6fmTLLrX9mwl+2fJkzSrgnLQyDUhHqhFvBHH28UnK0h8zJxjVciAFyExiCxzSYfYCbJq1JfyAj1MCe5VSyuNodcDgUWMGCqS5TwPPIdx9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746867299; c=relaxed/simple;
	bh=4vkGWeWrB5qJeRA05ngKUQ3a9wYaykQKSQsySoPOVy8=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=Wj/NcVblyOLMJW0WpL2Mp59timpiQ4YndBclqcNmuNg/SVSDGbKZsBUiS/e8FQTGptSZIDqBFw3EuJ1cmrUZ8iue98QjvVPpnBa9OAIXZGU1CIeEebLas7Yg/dtn6qceOA1Ik3qnFddCLECHBkO0EedSFK8rTCgIozULjma+JJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WVOW4a8J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1116BC4CEE2;
	Sat, 10 May 2025 08:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746867298;
	bh=4vkGWeWrB5qJeRA05ngKUQ3a9wYaykQKSQsySoPOVy8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=WVOW4a8JqlO3E+y5fXdF0Wt7TpzA/IeZHZg3CSK2aFr3Jp140Rn9r9KUB1iVCFsrh
	 4xsSJHXLVhzy8GUfyUmcubvrtu6f66ltZh3esxqd2Dix/KKASa4P7qvwmx7WhRf8Dk
	 TisNsRSCZql41EszZCX8HO6m/eWbLWfK9XGqne/hK60KolGFA+NuOlDsJA4Xg+TCvU
	 RpO8VGfsIRHhbF3jpS0P494+bYpVyG9B1BWbRqUW5wMn4w6G27pzBfFb+BNKMg6c82
	 o/6E+7Lgd7rVXHwoKdIiAo0tbNcalI0YnXugo+M11E8Y5wYUCrog9oFgejVnu+MS5I
	 mK7NpD4mytzxA==
Message-ID: <eee8c1382b8fa3034621a4d3bc251c48@kernel.org>
Date: Sat, 10 May 2025 08:54:55 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 11/22] drm/omap: dss: hdmi5: convert to
 devm_drm_bridge_alloc() API
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-11-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-11-b8bc1f16d7aa@bootlin.com>
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

On Fri, 9 May 2025 15:53:37 +0200, Luca Ceresoli wrote:
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

