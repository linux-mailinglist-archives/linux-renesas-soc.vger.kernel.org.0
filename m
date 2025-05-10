Return-Path: <linux-renesas-soc+bounces-16921-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 948F8AB2251
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 10:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17C6D1B65F08
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 08:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE881F09A7;
	Sat, 10 May 2025 08:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u6POvg0R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0751A38F9;
	Sat, 10 May 2025 08:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746867155; cv=none; b=V48EFS3VhrDcHcO9mazGbE+aYZGmVNSh7JgTAztKAc8uKNqrKYWMIMIzminPGuwR1NlQjDMj7SXP5tSu95rVCVkzwpi9ZBUYxICsRqq9E6/OegI6d/cDHGDIb98vrF5h/8oH+LDyPmP7X2VeCj00ExPpfHDLOxnAEWGhbZ97Jeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746867155; c=relaxed/simple;
	bh=xxc2ym26er/oaaE1G9pmTnLUli4Nl+UeevCR9pjUqNY=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=KOY11oGRgJBIaV9QkWGdnrJi+x6Es5L6R3sElAV1RZAPClS1BiYxXLWnZ4gvQfWghHBw+K5qW4B3g3XrP7kpQO0YnmjnujGkuZguWLdaKjMhHEF+TcJ5TdO8/jnpdhB1C5FT6ermMsOH+ETcRZZlhS4EA7P1SVewhMaCkvDbFwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u6POvg0R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE61AC4CEE2;
	Sat, 10 May 2025 08:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746867154;
	bh=xxc2ym26er/oaaE1G9pmTnLUli4Nl+UeevCR9pjUqNY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=u6POvg0RoFpuchX+JOAMvMYPUDTwiBIHjt/qHcI/IRKDnfC1fSSp8+LYTudVdhtM2
	 DGa1dlRsKF2q4WyKo4zK3QyVCou9Qd/SNLp9N66niyHUn7SkQkhJb8K9sGZVAkTi1A
	 XaEKhgNhhsa6D6a1pd4kbzLucG9XwFGnp3UrH1WNNBtBsDK7Yro2GTRaJ1RzCvX/Z3
	 Lu/ZVHWj+p87BElKR38XoGrcbMRaFc3cePAYB91awhQfijgxw8j7LMtXireDjlCkwB
	 ZPJu51LjtqjP3331sjBmcRRdodGPtKsejzuUntd/H1o/JJTQf/6SUqTYesuOTGMaja
	 3FComrE5QG1eQ==
Message-ID: <9c4cd5dbff541b2af45a7c093e619666@kernel.org>
Date: Sat, 10 May 2025 08:52:30 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 06/22] drm/bridge: nxp-ptn3460: convert to
 devm_drm_bridge_alloc() API
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-6-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-6-b8bc1f16d7aa@bootlin.com>
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

On Fri, 9 May 2025 15:53:32 +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

