Return-Path: <linux-renesas-soc+bounces-20858-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DDDB2F2FD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 10:56:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EC501BC0D11
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 08:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1832ED147;
	Thu, 21 Aug 2025 08:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u6/Fb0yb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516DB2ECEBF;
	Thu, 21 Aug 2025 08:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755766368; cv=none; b=svDv/fbRZo3VZhZYWNcIMJZU2lr898oii5u3wVDPYjhWmrTJsIVD6UtlukTsWOPsTZgx19CP9PvjbAL2LFrqK0p7KyFee1+z/qG/Wkopri9TpKFipfEBmaeK9RKgG2uXim+S97pl7+4swV7o+OvQRSHmF5xvv9v1nh2mFrFZBFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755766368; c=relaxed/simple;
	bh=C2dlNnaM7u0qj7k51quVsQ//aocjvVqHYJx7fh3mPJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bfPzoxzKay03Ifj6dro7ru4qtj4O585o3ksLmqNShW20EPGk8z0t7vbTo3J7JbxiGhkULouoe+Sx5pqpabkfYpvUSnXAomx14/QpC7//UlG8j64P9jztoq+oEvHqxC3cEFVPY/vr6gcxJLgV23VCh3wOzEQcFsldf1jTe4ChdqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u6/Fb0yb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3A04C78;
	Thu, 21 Aug 2025 10:51:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755766303;
	bh=C2dlNnaM7u0qj7k51quVsQ//aocjvVqHYJx7fh3mPJo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u6/Fb0yb36ohZvE0nOc6wbVrQqeEvju5gYPLx5Pm3Lt3BQVxj8UAevRJeINKkII4J
	 jCTPGKhv3ksUPsyLardwccR7ZUGheew8S7/fpGigQxq+Vq3JmhU8W97+/lVY+KrPYR
	 hIer/A+U+tvqTVzXMJH7QOnH2VnL2Q3GWyjqEvTk=
Message-ID: <7bffc8e2-ccdd-4a92-bbc6-95c7c99d7e4a@ideasonboard.com>
Date: Thu, 21 Aug 2025 11:52:38 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/6] drm: renesas: rz-du: mipi_dsi: Add support for
 LPCLK clock handling
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250728201435.3505594-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250728201435.3505594-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 28/07/2025 23:14, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add LPCLK clock support in the RZ/G2L MIPI DSI driver via the optional
> clock API. This clock is required by some SoCs like RZ/V2H(P) for proper
> DPHY configuration, whereas it is absent on others like RZ/G2L.

In the DT binding lpclk is present for all SoCs. Is that an error in the
binding, then? And if I read the binding correctly, it's mandatory for
all SoCs, so why is it optional in the driver?

 Tomi

> Introduce a new `lpclk` field in the `rzg2l_mipi_dsi` structure and
> conditionally acquire the "lpclk" clock using `devm_clk_get_optional()`
> during probe. This allows LPCLK-aware SoCs to pass the clock via device
> tree without impacting existing platforms.
> 
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v6->v7:
> - New patch
> Note, this patch was previously part of series [0].
> [0] https://lore.kernel.org/all/20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index f87337c3cbb5..893a90c7a886 100644
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
> +	dsi->lpclk = devm_clk_get_optional(dsi->dev, "lpclk");
> +	if (IS_ERR(dsi->lpclk))
> +		return PTR_ERR(dsi->lpclk);
> +
>  	dsi->rstc = devm_reset_control_get_optional_exclusive(dsi->dev, "rst");
>  	if (IS_ERR(dsi->rstc))
>  		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),


