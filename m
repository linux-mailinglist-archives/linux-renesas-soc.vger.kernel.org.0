Return-Path: <linux-renesas-soc+bounces-16929-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BB5AB22A4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 10:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FEF0A04BD2
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 08:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8111F3B91;
	Sat, 10 May 2025 08:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DC7nHWS9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0BF1E571B;
	Sat, 10 May 2025 08:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746867401; cv=none; b=MHB/98HKfKPaJzlvACqNVKGSDrrQ4g4ZObMSk9pAfcPfWV8iBvJirKr8zYaqm9b8i+Io+0sSRQPdAp2BIO7J5PcgVgQym26Sch1WYdJcaeU5gA/mXTWu3nqKKwGITbmfftWrhgAIbVdeoWsopAdeaUGffp0P7qGBIsoPQIILB34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746867401; c=relaxed/simple;
	bh=xUHNWhUmOFOgiDtHE420PZyZI+pkNsNu9bIeQueqmi0=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=UlWIb6bx/iol752GJ1sqsNKfQtxTHJnrAHGS+aTlZbyx3IcSv6NTyyL9i37WrYTMtUDk5b45Cj5CcKiEvOzclZk00hQbSnnNZehEtcuHahDwmMw/eXoGMt1I/x9fD0eHgD7dvgPv4KlZaTFTV/aV7hqkz0ZD+4yOMYH7YnBMElw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DC7nHWS9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B09C4CEE2;
	Sat, 10 May 2025 08:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746867400;
	bh=xUHNWhUmOFOgiDtHE420PZyZI+pkNsNu9bIeQueqmi0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=DC7nHWS9MM8BfITQVw3iXqUnmt72hMbohU6W1KzfmxKRQWGy7K4gCvraWhUfPEBb8
	 P38wm1JC4FywQujssIs+INT/E+sUzQ1vmVaZtOeZx7rtoPBEKZ7sqQPdAKlCIk7UcE
	 8jkLyoX6xH2weyUCroU0zdFChRt2LwlDq1a48APDb2X7+SXgqzfwZIRglFSUrpn1kR
	 E20u+kueowMKxgcXIRZhvKnicc4OxCTwx9um+DwmIBhIrRDTwqhRTLtRWEH5HiNJD/
	 2kKc7cHg092uYTxOYO4sMMlepTo73QwZ/K6PIRwFCiEqblIOzOT06LxPyZ+EVmPp/t
	 cp0kB4enGmNvw==
Message-ID: <46bdd0658ee475b1378a831dd0918748@kernel.org>
Date: Sat, 10 May 2025 08:56:37 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 15/22] drm/bridge: stm_lvds: convert to
 devm_drm_bridge_alloc() API
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-15-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-15-b8bc1f16d7aa@bootlin.com>
Cc: asahi@lists.linux.dev, chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, platform-driver-x86@vger.kernel.org, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Anusha
 Srivatsa" <asrivats@redhat.com>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Douglas
 Anderson" <dianders@chromium.org>, "Fabio Estevam" <festevam@gmail.com>, "Hui
 Pu" <Hui.Pu@gehealthcare.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Paul
 Kocialkowski" <paulk@sys-base.io>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Philippe
 Cornu" <philippe.cornu@foss.st.com>, "Raphael Gallais-Pou" <raphael.gallais-pou@foss.st.com>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Yannick
 Fertre" <yannick.fertre@foss.st.com>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

On Fri, 9 May 2025 15:53:41 +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

