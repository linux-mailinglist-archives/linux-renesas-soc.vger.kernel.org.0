Return-Path: <linux-renesas-soc+bounces-16358-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 758C1A9B81D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 21:16:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 073BD5A7206
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 19:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE31128E5FB;
	Thu, 24 Apr 2025 19:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WsBvaANT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E77ADDC1;
	Thu, 24 Apr 2025 19:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745522205; cv=none; b=kpEjU+4zeIPs9QSf1ixRgqOgbJFvqV/A71rzMfTHs1dvIzLMH59CAIyeGpBkcelBVvK2ncwVvwqhf67ctels7td8UqXZbH1fVlEZYEY7ZyNqkKD3v+uvtK+dvhJmzKkeMIiYoDFuyMuFbTr+MJhXz0+rTgPZUcnkAQLwKUyC2xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745522205; c=relaxed/simple;
	bh=BeGRHNVg6BvIeAlm3dPnlkLRvWWekhEyXNNMSQVYXzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uNPiqGVHSY7Z/R4y3ODBiKqgV8NkjtZr2OWBYrN4YvrUXs2H6K5oVCiEAwXAB/kovVDxvYTDPzhoYrao6XfeokhrEz8xMnXwxoNQ+wr/IR1HcgFxsTiet13Ql+kviYVDfllnwS1YzMTu38b25mz+i4iAUa7miNfvbycfO9D6OcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WsBvaANT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745522201;
	bh=BeGRHNVg6BvIeAlm3dPnlkLRvWWekhEyXNNMSQVYXzQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WsBvaANTHgbnS3+9c5su2ftn0YjtROxchfOZzyFaP0OViUemYI5shQEMQmVffBzVt
	 PmZ1MDn9UmcJ/gFKtl2U8lfYMtj01Gt9COqI5kqweExVTk3aMT1FwVND/4YfW6Hmba
	 y2t6w4FPZOUbhTdXwGAAe9gbe5AVCNKJQMf8jZqJBo5Oj1YEOqtWoFpDevbw1eFUdo
	 sY0IjJmv+TO0YtHLQYbptz8R5Ek6CyGZYRJEk9cyJci7Uj/10jM8vZaMY20SFaguo9
	 PIkIVhmRyfnbns6cTEHyX6nNZOkHygBUCY42F9sn/DC4Re3KRdIjGG5cBIITsgLPOv
	 Rp1VkPawFdPjg==
Received: from [192.168.1.90] (unknown [82.76.59.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 708F717E0402;
	Thu, 24 Apr 2025 21:16:39 +0200 (CEST)
Message-ID: <25de7fc3-2628-42c9-8d66-b1cab2896c3d@collabora.com>
Date: Thu, 24 Apr 2025 22:16:38 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/34] drm/bridge: dw-hdmi: convert to
 devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson
 <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>,
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>,
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-11-8f91a404d86b@bootlin.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-11-8f91a404d86b@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/24/25 9:59 PM, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

