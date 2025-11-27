Return-Path: <linux-renesas-soc+bounces-25302-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AD6C8F9C8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 18:11:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CD27134DF29
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 17:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A47E2E0902;
	Thu, 27 Nov 2025 17:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="iwzzQqzO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245A92DF141;
	Thu, 27 Nov 2025 17:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764263451; cv=none; b=GjS7TlJENOu9+u9Hf07beOCBFQgFqKBX/wtJWUyvopao3Uw+iD3ro7zpnfiVesL885NUeK66ElNu26aHvTLKRdQP3JD4TMepYSOLmPD4obnHz2BOx13lhaKAf5zNys/F99gannT1pjSQzzyIjxj+Kmp9KqohLjbiGeFVYgKXojc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764263451; c=relaxed/simple;
	bh=elLAGUKFTL2jPRU5I7Gg1FLk4dR1W2H1wBHDQxkcnkk=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=ok6JdsK1/QTb/H7DPuilxB5WIKD4cBcrnJ9rvcJdF2zcGSTdnXuc/Zg+p1nPZaGn/aL55QmAxfCLPdkzLkoRaNBI3kp3UG/zZUzjZwbY+3vjm166pYGI84OIPc4A2TN7RrkIHMnB7UL8Peq9CqEwI9FYqlY267rcTKXydZQ/LUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=iwzzQqzO; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=n87dfCOB/sV/NxbQvE2VCIrqwhRsH/0aVGUnSpGKyME=; b=iwzzQqzO/nCXw2HZbCqPIHWqXK
	VlRldf7lDrc7vClkjyYglUY6+4p5BmEk0x/EsTMU8FgpxxnnRV8BWRDashEoqDtQMX/HtMB3htgxw
	Jv/5zWBVrvGAPhKR99sn81kRhbumdow6PCSXqpQJ9Ap8gUmAxMNL/RNMcPDYW+wjWS5E=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:37198 helo=pettiford)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vOfVx-00034g-Cz; Thu, 27 Nov 2025 12:10:41 -0500
Date: Thu, 27 Nov 2025 12:10:40 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-Id: <20251127121040.910aadd3bd8bac9578a40431@hugovil.com>
In-Reply-To: <20251124131003.992554-3-chris.brandt@renesas.com>
References: <20251124131003.992554-1-chris.brandt@renesas.com>
	<20251124131003.992554-3-chris.brandt@renesas.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -0.5 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH v6 2/2] drm: renesas: rz-du: mipi_dsi: Set DSI divider
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

Hi Chris,

On Mon, 24 Nov 2025 08:10:03 -0500
Chris Brandt <chris.brandt@renesas.com> wrote:

> Before the MIPI DSI clock source can be configured, the target divide
> ratio needs to be known.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
Tested-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>

> 
> ---
> v1->v2:
> - Add spaces around '/' in comments
> - Add target argument in new API
> 
> v2->v3:
> - Add missing period in comment (Hugo)
> - Changed '1' to 'PLL5_TARGET_DSI' (Hugo)
> - Added Reviewed-by and Tested-by (Biju)
> 
> v3->v4:
> - Fixed up the comments
> - Fixed the match for the divider to set (was missing a * 2)
> 
> v4->v5:
> - Rename patch title (Hugo)
> - Add bpp varable for easy reuse (Hugo)
> 
> v5->v6:
> - Remove clock diagram that was wrong (Chris)
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index 3b52dfc0ea1e..bee2cc711afd 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
> +#include <linux/clk/renesas.h>
>  #include <linux/delay.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
> @@ -692,6 +693,7 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>  				      struct mipi_dsi_device *device)
>  {
>  	struct rzg2l_mipi_dsi *dsi = host_to_rzg2l_mipi_dsi(host);
> +	int bpp;
>  	int ret;
>  
>  	if (device->lanes > dsi->num_data_lanes) {
> @@ -701,7 +703,8 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>  		return -EINVAL;
>  	}
>  
> -	switch (mipi_dsi_pixel_format_to_bpp(device->format)) {
> +	bpp = mipi_dsi_pixel_format_to_bpp(device->format);
> +	switch (bpp) {
>  	case 24:
>  		break;
>  	case 18:
> @@ -732,6 +735,18 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>  
>  	drm_bridge_add(&dsi->bridge);
>  
> +	/*
> +	 * Report the required division ratio setting for the MIPI clock dividers.
> +	 *
> +	 * vclk * bpp = hsclk * 8 * num_lanes
> +	 *
> +	 * vclk * DSI_AB_divider = hsclk * 16
> +	 *
> +	 *   which simplifies to...
> +	 * DSI_AB_divider = bpp * 2 / num_lanes
> +	 */
> +	rzg2l_cpg_dsi_div_set_divider(bpp * 2 / dsi->lanes, PLL5_TARGET_DSI);
> +
>  	return 0;
>  }
>  
> -- 
> 2.50.1
> 
> 


-- 
Hugo Villeneuve

