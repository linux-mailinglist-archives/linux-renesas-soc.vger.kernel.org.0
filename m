Return-Path: <linux-renesas-soc+bounces-16934-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BE9AB22F7
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 11:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67E471B62383
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 09:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2123F221D88;
	Sat, 10 May 2025 09:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jlVr2zbb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE23E1DF25A;
	Sat, 10 May 2025 09:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746870142; cv=none; b=riUNYytJyXKnBcX3Ohbb5C3ny5pE7OuGJEtRTQZHoH6fdx3q88NhJM1PCD1isDi/FJjM/Ki1JjjlGxwPsuM3Wd9rvwWqkx9jbm88RDs7ja1DIjZ0teMfjopsv0t5XvY8k39IRqD+6GD/cw+RteIRlmsCb9zVLhKmTGKsBfz3DDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746870142; c=relaxed/simple;
	bh=G9sYTZQj22xPoW/QRyiBT8ULSaRBAKtHRHeWzEHazyE=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=aqtZ7e60LeJe2Qc5TJYPhcV/aPBZZRlNWESqbaZuStgtHosrf2D+39BfMR5Qboyqu59qjcWUGhYWQ5ZenYrP5wY4MotWeMVpyWJJellWAlOPT9b41lZtaOPTiCee4ANj7faw/5NCWA37F6J5cDp8lxCfQXuE3JcD35Uo1WFil6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jlVr2zbb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83767C4CEE2;
	Sat, 10 May 2025 09:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746870141;
	bh=G9sYTZQj22xPoW/QRyiBT8ULSaRBAKtHRHeWzEHazyE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=jlVr2zbbJuiI24eEJxS+199kMPtpdarNQhO042/lb4Yc8VQ58YTh8v/KGvIVvQ+6K
	 oen+VX3n6hHvHfJe2ATsRM6vYFRaULbUG+Yao8Mgrx1kxODCleHdLKqKgUilj5jXRO
	 WR/ozntmFI90brgHMEyLOROkMAjUuHhAAnEl0cD6XBcKO9mP4tGh2eDKx7NgR7O06J
	 +2HnrUWOoTfYzFWzGjsB6eGqQm4ptgTcrKyzJvpNzh5bMMKsfT6y+pwmpIkZWCWEkv
	 hULrNvc6guSud4ZcCK05J4svZDNhGc9NE3sVlbOlJmZUOOK0oWFRPH/kY9F2ckg8xO
	 orlNF6f9H+hXQ==
Message-ID: <217864a52bc7770419e5da062d43aaa7@kernel.org>
Date: Sat, 10 May 2025 09:42:16 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 21/22] drm/bridge: panel: convert to
 devm_drm_bridge_alloc() API
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-21-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-21-b8bc1f16d7aa@bootlin.com>
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
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

On Fri, 9 May 2025 15:53:47 +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
>=20
> The devm lifetime management of this driver is peculiar. The underlying
> device for the panel_bridge is the panel, and the devm lifetime is tied t=
he
> panel device (panel->dev). However the panel_bridge allocation is not
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

