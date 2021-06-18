Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16ED63AD042
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 18:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233773AbhFRQYV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 12:24:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231898AbhFRQYV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 12:24:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73F8CC061574;
        Fri, 18 Jun 2021 09:22:11 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B688E3F0;
        Fri, 18 Jun 2021 18:22:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624033328;
        bh=IPVdtd67zPx2N3xgN8+fedqL+w9xqQtUSwdNV5S7Q70=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KyrIXghLwsRe5JMRdOKteSrE/Jl2Q1y5AVw3EzNxCEvSfp15Fr40Yz3o9Sc3BIwlC
         JO8NBZfpJT7CvAk4Onn2pBxrOyWoKujQEThnueuxJqiUCrF4/hPI5mbg3R109S7nV6
         zeTRaVlkqRk3M0NYhK1dQ6+zCyy6lBRPruCGw91w=
Date:   Fri, 18 Jun 2021 19:21:45 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH] media: vsp1: Fix WPF macro names
Message-ID: <YMzIGSYHrYV2tTQ7@pendragon.ideasonboard.com>
References: <20210618161041.444987-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210618161041.444987-1-kieran.bingham@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Fri, Jun 18, 2021 at 05:10:41PM +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> The WPF IRQ enable and status macros have been incorrectly named WFP.
> Fix them accordingly, and update all uses of the macros.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Wow, and all this time it has escaped our eyes.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Feel free to push. Oh, wait... I'm too used to libcamera :-)

> ---
>  drivers/media/platform/vsp1/vsp1_drv.c  | 4 ++--
>  drivers/media/platform/vsp1/vsp1_regs.h | 8 ++++----
>  drivers/media/platform/vsp1/vsp1_wpf.c  | 2 +-
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
> index de442d6c9926..1018786d0437 100644
> --- a/drivers/media/platform/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/vsp1/vsp1_drv.c
> @@ -44,7 +44,7 @@
>  
>  static irqreturn_t vsp1_irq_handler(int irq, void *data)
>  {
> -	u32 mask = VI6_WFP_IRQ_STA_DFE | VI6_WFP_IRQ_STA_FRE;
> +	u32 mask = VI6_WPF_IRQ_STA_DFE | VI6_WPF_IRQ_STA_FRE;
>  	struct vsp1_device *vsp1 = data;
>  	irqreturn_t ret = IRQ_NONE;
>  	unsigned int i;
> @@ -59,7 +59,7 @@ static irqreturn_t vsp1_irq_handler(int irq, void *data)
>  		status = vsp1_read(vsp1, VI6_WPF_IRQ_STA(i));
>  		vsp1_write(vsp1, VI6_WPF_IRQ_STA(i), ~status & mask);
>  
> -		if (status & VI6_WFP_IRQ_STA_DFE) {
> +		if (status & VI6_WPF_IRQ_STA_DFE) {
>  			vsp1_pipeline_frame_end(wpf->entity.pipe);
>  			ret = IRQ_HANDLED;
>  		}
> diff --git a/drivers/media/platform/vsp1/vsp1_regs.h b/drivers/media/platform/vsp1/vsp1_regs.h
> index fe3130db1fa2..97942436868c 100644
> --- a/drivers/media/platform/vsp1/vsp1_regs.h
> +++ b/drivers/media/platform/vsp1/vsp1_regs.h
> @@ -32,12 +32,12 @@
>  #define VI6_STATUS_SYS_ACT(n)		BIT((n) + 8)
>  
>  #define VI6_WPF_IRQ_ENB(n)		(0x0048 + (n) * 12)
> -#define VI6_WFP_IRQ_ENB_DFEE		BIT(1)
> -#define VI6_WFP_IRQ_ENB_FREE		BIT(0)
> +#define VI6_WPF_IRQ_ENB_DFEE		BIT(1)
> +#define VI6_WPF_IRQ_ENB_FREE		BIT(0)
>  
>  #define VI6_WPF_IRQ_STA(n)		(0x004c + (n) * 12)
> -#define VI6_WFP_IRQ_STA_DFE		BIT(1)
> -#define VI6_WFP_IRQ_STA_FRE		BIT(0)
> +#define VI6_WPF_IRQ_STA_DFE		BIT(1)
> +#define VI6_WPF_IRQ_STA_FRE		BIT(0)
>  
>  #define VI6_DISP_IRQ_ENB(n)		(0x0078 + (n) * 60)
>  #define VI6_DISP_IRQ_ENB_DSTE		BIT(8)
> diff --git a/drivers/media/platform/vsp1/vsp1_wpf.c b/drivers/media/platform/vsp1/vsp1_wpf.c
> index 208498fa6ed7..94e91d7bb56c 100644
> --- a/drivers/media/platform/vsp1/vsp1_wpf.c
> +++ b/drivers/media/platform/vsp1/vsp1_wpf.c
> @@ -342,7 +342,7 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
>  	/* Enable interrupts. */
>  	vsp1_dl_body_write(dlb, VI6_WPF_IRQ_STA(index), 0);
>  	vsp1_dl_body_write(dlb, VI6_WPF_IRQ_ENB(index),
> -			   VI6_WFP_IRQ_ENB_DFEE);
> +			   VI6_WPF_IRQ_ENB_DFEE);
>  
>  	/*
>  	 * Configure writeback for display pipelines (the wpf writeback flag is

-- 
Regards,

Laurent Pinchart
