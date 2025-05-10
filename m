Return-Path: <linux-renesas-soc+bounces-16928-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE15AB2297
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 10:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D9324C0F54
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 08:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63861FF1D5;
	Sat, 10 May 2025 08:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEgc34wp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF6B1F462F;
	Sat, 10 May 2025 08:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746867376; cv=none; b=lDEH4GVlWRG64kUN/KhTdZZNq18xQQToIsRkxFBFjYZ19XlYM51RSzsVlnkkICku3oZ79fHq7IgwZoDr5OXP1g0vk9YX9R01afE++Kqk5JZvp4RI4XhWOO8bh3suB8f3h32siP1xSP4WqWNEiHbhbYQgENCv5B+K0h2b6jxTVEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746867376; c=relaxed/simple;
	bh=Ty+SuvC27JKyVPo5kwDSn6Vcmvyw7zf8JUSFENB4Udk=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=aN76lbvzjTrLENjS++6WG1EtBRL/g4xvBYmEtAkfnwDC6BnamPE0dJuBiuQGbIgxD+Z7zrClErjCoakaa395SIzjNjikW3ZvTJs1Kk6wPCmaNN9lIUzugfpXpduL8YsZiN6oCqdUXv4GWPewuQCsLOLumVOhp/KfB0S0qOc/t7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEgc34wp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9C1C4CEE2;
	Sat, 10 May 2025 08:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746867374;
	bh=Ty+SuvC27JKyVPo5kwDSn6Vcmvyw7zf8JUSFENB4Udk=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=AEgc34wpj1ZefFXoxT56t2Tj6K1edVyK4KnK3pM71s7L9KTRxInv3j/vr9rJ8nX5i
	 nwCTehEJTFs6eap2ML02KpP6Zb6i6hFN3VtjVPtNnWCwBFQ+TPu+LVyovvTgucqACh
	 OvKa1VQwQmEQMYhgvXdOdCEO/kB/uw9GLLYIdy2DjrVb7SW7OHAhz42ZAR2XHQfqYi
	 NIjnKAdN+YTTjiS1tqhKgLzVFW9p+Gn7TaNor7bp7YPT4ezS2s06TDSjAnhyyEFftl
	 KSnro8PULHUGj0u8osPSQml7j19d7HuaiuB+4v2UbpmdsnRK9SVu7fkyHWYPudEbBu
	 kaEm+hnQts6mg==
Message-ID: <3b2d3e047a8c0f1735c154f46f420216@kernel.org>
Date: Sat, 10 May 2025 08:56:11 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 14/22] drm/rcar-du: dsi: convert to
 devm_drm_bridge_alloc() API
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-14-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-14-b8bc1f16d7aa@bootlin.com>
Cc: asahi@lists.linux.dev, chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, platform-driver-x86@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Anusha Srivatsa" <asrivats@redhat.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Douglas Anderson" <dianders@chromium.org>, "Fabio
 Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Kieran Bingham" <kieran.bingham+renesas@ideasonboard.com>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Laurent
 Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Paul
 Kocialkowski" <paulk@sys-base.io>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tomi
 Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

On Fri, 9 May 2025 15:53:40 +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

