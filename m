Return-Path: <linux-renesas-soc+bounces-21690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF69AB50F7C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 09:33:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4DC7546777
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 07:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE3930BB89;
	Wed, 10 Sep 2025 07:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="V+Yl7ejL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D127D1E5219;
	Wed, 10 Sep 2025 07:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757489579; cv=none; b=SEAe6WnRQU/dXnr93d02Se2+/JBkl8ayPiOhqRO0siV/Lq/UX9ai2UNZ9s9Z4svb3NFJR6l4tVCRM7HoNtF921gzr9PZZR/xtfd3oZyBhEGmyxIRlnzYxZ0Ud0nH5UgtPhPhfILHU10xT/fWmeX/kzVLrqdjdPn5KwOhDJUEGng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757489579; c=relaxed/simple;
	bh=kaGdOkum4VxJNgDecI3kCpUnC8nt+LPl8FizBkxbrDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XYuFHidIAj1alZdnZLgjEKh169YIZa7PsmjUsCqiAINlK8qAqAo+Pde6rzenNZ+OKK5wUyJOxPDnozZ8yxxBYaBO8y7rIveOhzp8Ll9r+XNSp2zIcebZ/eOLy6XUwuP/EDALwQKhNXmASdpIDPkqCvnsCBEd8vMGvB4dJy0f0vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=V+Yl7ejL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D617815CD;
	Wed, 10 Sep 2025 09:31:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757489501;
	bh=kaGdOkum4VxJNgDecI3kCpUnC8nt+LPl8FizBkxbrDQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V+Yl7ejLfiPIYE9VBgRU7RqydnSAMThRHVMc+IaktSQo/exlniYy/lLM4SU6XEcFX
	 Ij0PbHPMGZVht9SsDxh2AZ0+Dymj98lozmm81LNoprnxz14lWNhQIHcopmzlA06nFc
	 EaAKPrt7uMJo7qsT9pXF3pzynzvaXYUAsR8aNnOI=
Message-ID: <5ddabd43-35a0-406e-bc4d-3878febd3341@ideasonboard.com>
Date: Wed, 10 Sep 2025 10:32:49 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/6] drm: renesas: rz-du: mipi_dsi: Add LPCLK clock
 support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>
References: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250903161718.180488-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250903161718.180488-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/09/2025 19:17, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add LPCLK clock handling to the RZ/G2L MIPI DSI driver to support proper
> DSI timing parameter configuration on RZ/V2H SoCs. While lpclk is present
> on both RZ/G2L and RZ/V2H SoCs, the RZ/V2H SoC specifically uses the lpclk
> rate to configure the DSI timing parameter ULPSEXIT.
> 
> Introduce a new lpclk field in the rzg2l_mipi_dsi structure and acquire
> the "lpclk" clock during probe to enable lpclk rate-based timing
> calculations on RZ/V2H while maintaining compatibility with RZ/G2L.
> 
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v7->v8:
> - Updated commit message
> - Switched to use devm_clk_get() instead of devm_clk_get_optional()
>   as lpclk clock is available on all SoCs.
> 
> v6->v7:
> - New patch
> Note, this patch was previously part of series [0].
> [0] https://lore.kernel.org/all/20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index 3b52dfc0ea1e..bb03b49b1e85 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -68,6 +68,7 @@ struct rzg2l_mipi_dsi {
>  	struct drm_bridge *next_bridge;
>  
>  	struct clk *vclk;
> +	struct clk *lpclk;
>  
>  	enum mipi_dsi_pixel_format format;
>  	unsigned int num_data_lanes;
> @@ -979,6 +980,10 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>  	if (IS_ERR(dsi->vclk))
>  		return PTR_ERR(dsi->vclk);
>  
> +	dsi->lpclk = devm_clk_get(dsi->dev, "lpclk");
> +	if (IS_ERR(dsi->lpclk))
> +		return PTR_ERR(dsi->lpclk);
> +
>  	dsi->rstc = devm_reset_control_get_optional_exclusive(dsi->dev, "rst");
>  	if (IS_ERR(dsi->rstc))
>  		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

 Tomi


