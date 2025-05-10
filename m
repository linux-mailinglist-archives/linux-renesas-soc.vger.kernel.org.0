Return-Path: <linux-renesas-soc+bounces-16922-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E7EAB2259
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 10:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F070A4A6B7B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 08:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3821F09A7;
	Sat, 10 May 2025 08:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQOMxzs/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04BD1A38F9;
	Sat, 10 May 2025 08:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746867178; cv=none; b=SXg49A4xcazM5yM7LKiGQS5ueRzWGQdNlf3WCFng2f15XANoISuS/lpGsuery+ogbRRkIc/4IRwzA91+nIeyGlkPo/HDmS/2yBwsjnnV+cQ2Ou8Kv5coKpRnf9XKVtK57OVkZdlCe6ZrGIJSAa5xSzbIT89BIPKPYbll4FpnqPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746867178; c=relaxed/simple;
	bh=1SkPWM5n3FYLcdavTA4KJyrAtCp2bvh3apwyFhEtzEE=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=VlayeOwtYJNNDRH9Tt0v28cSvebj+BpW9UI5b+uDMjJl4hTFyGoHZ/j7IimJ2xkQ8HRcK9h4tUWOI9l/xp9b9hj+KWJ15q31UCsvZ0qLHSef88XdnS/MWL/eWR18XWeq0D1d3NLa5LwOHuHDwCoEtOF/tMk4LRRnRnr82X4oJFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQOMxzs/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99200C4CEE2;
	Sat, 10 May 2025 08:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746867177;
	bh=1SkPWM5n3FYLcdavTA4KJyrAtCp2bvh3apwyFhEtzEE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=aQOMxzs/fHdiIt9+goUYVhcMTPzIbYlRGbAcR+ZSU46xDAXlKvwZhIQ15EuUc4ztO
	 GwNuPspx/1O/WRyesHh+PYce1pOak4mH8LWUZRNbMPioHqJ1nDNtrZhqHDannUWPgL
	 eOxa/7DcUC4m6pF37VFbpaDrXcVT7ASqATt3/ylHCgo+Slpw+xG+mGaGMOTxtfZ8XX
	 IqhVy09w0A+hIZjo55RQIhy1SHUiHUMIGG85tSpLfilRz/KacrS16cyd6vzAScXgUy
	 jfFKsYkA4I2ELZ9ZPNqZPUMa+5128uRndGPlOez8VnTzzPKbFJkEUgs/kxpJsasgT8
	 RnMWXs9ETXCow==
Message-ID: <0306d6e01554bd7f41d962848306ef9e@kernel.org>
Date: Sat, 10 May 2025 08:52:53 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 07/22] drm/bridge: sii902x: convert to
 devm_drm_bridge_alloc() API
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-7-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-7-b8bc1f16d7aa@bootlin.com>
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
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

On Fri, 9 May 2025 15:53:33 +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

