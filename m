Return-Path: <linux-renesas-soc+bounces-16924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CF6AB2276
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 10:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE408A0697E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 08:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B5B1F0E29;
	Sat, 10 May 2025 08:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nBKXOk3r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86461EA7D2;
	Sat, 10 May 2025 08:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746867264; cv=none; b=AbMNaVeCBqWjc+oKh/4ZQtwADJ0h/smq2nOpueUQOZ74Kt7o1Jot4vgbtDiN3y7jDG+Bg4ZHBFgCTQk22OW9u0Y/RI0q//rr7UDdnN/Iv54uHovNk8jUoz4F2poN78dlU3rjf2WwyxcvxX0FIieHX1hOqqMaXLVMcbR/zS38h4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746867264; c=relaxed/simple;
	bh=lIsmhYDAaOgf3OuGuhP0QGWLf36xuzWpImhTwT43KXY=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=NvwOi46HygiJ04om/dDgTQ69FogCr9xP5RK8AX9ZYtAdWkYdBA5qjm7rN4GFnyGzh5N2gEc20cPvTyji9ZZc1fg8g3E5pJ8ajBWtwU1Epx27h90yKsCLH5zf2lMR3cHyTmoYWOM+pbqil4oTC8895LLANP6sGDDglefmQpYF4ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nBKXOk3r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85FC6C4CEE2;
	Sat, 10 May 2025 08:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746867263;
	bh=lIsmhYDAaOgf3OuGuhP0QGWLf36xuzWpImhTwT43KXY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=nBKXOk3rO27D602FaPS1WeuDSQv0FG67XuyA1GlHSEE66tyj36TpNl8x3ixtmHLxF
	 p/0HTgXlg8SwlM8sBX85dn+aKpNGKfBLbPKS5ilpsAZ20xny6++2F76C1NwQV8jJ9K
	 P71k3yxLu5XMWyfrjRMVUxCPJHL3wmFkPLcY1MnTPrhDk4XnrM3R4022hZDxYxsevB
	 D/Fbu+MdSrUfuL3o+GJoJQkfElhCm1tFdxIAetbULcck5pkUoA+XIXbUFWOPYtl5my
	 9HtREqZjdmFG7lpiZ5Pxf/pmVJnKHMlE+SXuKMiX0hSPV3WK59Hy7io5mEA8Z8jrQ6
	 TwAvqWQFfvjDw==
Message-ID: <ef3b22915764e919b2750c2a7b389cbe@kernel.org>
Date: Sat, 10 May 2025 08:54:19 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 09/22] drm/omap: dss: dsi: convert to
 devm_drm_bridge_alloc() API
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-9-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-9-b8bc1f16d7aa@bootlin.com>
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
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

On Fri, 9 May 2025 15:53:35 +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

