Return-Path: <linux-renesas-soc+bounces-24485-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 066E7C507B4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 05:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EEB724E3899
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 04:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3352C033C;
	Wed, 12 Nov 2025 04:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="ccsJoCno"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D669D1F09B3;
	Wed, 12 Nov 2025 04:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762920479; cv=none; b=Z2ZF+caR/yk5JW/TD775ov7fIbUIhferu/cOPyroEgsxf8KFuS4rlZ2GfiqOW26GIctlM43KCwWMIyifnJdZrsJtN5Yh44qdc/9vXGOuIo694hvGF4MSMQ4OxLpeNfJ60Ab6sbdnaIr/ITGZWGNt9l4fcm7RUQ7Tfm+CNQFgm4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762920479; c=relaxed/simple;
	bh=Ge/3YqYJ+qF3ayVlnhjcNpLQ/u0tIDSvhyKLvhTUQXU=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=l1mK1cYTKkkDcYZnrbZr+FKMvG1hC2eL76z29eQibbfmlDIMYXgqzSn+Q6nzkfI5VvspnJVg2/Rx5n2ToXu+8jlPVOXTgRuPv3OTvwxo4/kSblsao0L9RKTHVo0ugv9suELL68GDWLtXj+VHzL7feiMeFPHNK8BPTINxKdYwVYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=ccsJoCno; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=bm/+Cj2SktIeikpOBN86eSbau8mk1+J3YHx4AcFTvto=; b=ccsJoCnowKoDb+G1buKXJt3ZHY
	m8dceFvbiYTRFj0OLeVXjuDn/DBuBSaOhS+2bMKIDkOkgSfvfzL4XbQg2GjHABeeAhMWsKXHrqZdn
	U2G/a9lJesw9YbyYinwcGeG5W+m/J3oxwKT4yot2hNiyBnumq00M8mCOhX979WTJAbQg=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:47800 helo=pettiford)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vJ295-0004G3-1w; Tue, 11 Nov 2025 23:07:49 -0500
Date: Tue, 11 Nov 2025 23:07:46 -0500
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
Message-Id: <20251111230746.55a2851b6d9b07cecfcd6645@hugovil.com>
In-Reply-To: <20251105222530.979537-3-chris.brandt@renesas.com>
References: <20251105222530.979537-1-chris.brandt@renesas.com>
	<20251105222530.979537-3-chris.brandt@renesas.com>
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
	* -1.9 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH v4 2/2] drm: renesas: rz-du: Set DSI divider based on
 target MIPI device
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

Hi Chris,
for consitency with other commits on this file, change your patch title:

    drm: renesas: rz-du: Set DSI divider based on...

to

   drm: renesas: rz-du: mipi_dsi: Set DSI divider based on...


On Wed,  5 Nov 2025 17:25:30 -0500
Chris Brandt <chris.brandt@renesas.com> wrote:

> Before the MIPI DSI clock source can be configured, the target divide
> ratio needs to be known.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
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
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index 3b52dfc0ea1e..301550f0ea9f 100644
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
> @@ -732,6 +733,23 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>  

By using an intermediate bpp variable, you can avoid a useless
second call to mipi_dsi_pixel_format_to_bpp():

    unsigned int bpp;
    ...
    bpp = mipi_dsi_pixel_format_to_bpp(device->format);
    switch (bpp) {
	case 24:
    ...

This also nicely matches your use of bpp in your comments/equations below:

>  	drm_bridge_add(&dsi->bridge);
>  
> +	/*
> +	 * Report the required division ratio setting for the MIPI clock dividers.
> +	 *
> +	 * VCO-->[POSTDIV1,2]--FOUTPOSTDIV-->|   |-->[1/(DSI DIV A * B)]--> MIPI_DSI_VCLK
> +	 *            |                      |-->|
> +	 *            |-->[1/2]---FOUT1PH0-->|   |-->[1/16]---------------> hsclk (MIPI-PHY)
> +	 *
> +	 * vclk * bpp = hsclk * 8 * num_lanes
> +	 *
> +	 * vclk * DSI_AB_divider = hsclk * 16
> +	 *
> +	 *   which simplifies to...
> +	 * DSI_AB_divider = bpp * 2 / num_lanes
> +	 */
> +	rzg2l_cpg_dsi_div_set_divider(mipi_dsi_pixel_format_to_bpp(dsi->format) * 2 / dsi->lanes,
> +				      PLL5_TARGET_DSI);

   rzg2l_cpg_dsi_div_set_divider(bpp * 2 / dsi->lanes, PLL5_TARGET_DSI);


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

