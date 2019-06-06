Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0183137A67
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 19:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727477AbfFFRAq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 13:00:46 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45078 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfFFRAq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 13:00:46 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F77533B;
        Thu,  6 Jun 2019 19:00:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559840444;
        bh=PU8fsFA4LR5gjN8p9jDNP2JzGYDseNa3weTfGFWVzZ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t6sBGV44VxSNtAeLVoAPNvH3ANJ2suLeeoOQOY9O3sh6HUEvSLTsNSy88Td1yV8Fp
         mWGdWwuEhrxNf7WUGAtdsshqdPUICEIOb6DGA8t6tmZjor3EyRj4w5kP49kAoQAu/n
         BKfRJP4nd7Ovh+Wa1aep6lgAz+EPTO5wSPeCRTYM=
Date:   Thu, 6 Jun 2019 20:00:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/20] clk: renesas: r8a77990: Add CMM clocks
Message-ID: <20190606170030.GN12825@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-8-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-8-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Thu, Jun 06, 2019 at 04:22:07PM +0200, Jacopo Mondi wrote:
> Add clock definitions for CMM units on Renesas R-Car Gen3 E3.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/clk/renesas/r8a77990-cpg-mssr.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
> index 9a278c75c918..8cdd0e6fb74f 100644
> --- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
> @@ -182,6 +182,8 @@ static const struct mssr_mod_clk r8a77990_mod_clks[] __initconst = {
>  
>  	DEF_MOD("ehci0",		 703,	R8A77990_CLK_S3D4),
>  	DEF_MOD("hsusb",		 704,	R8A77990_CLK_S3D4),
> +	DEF_MOD("cmm1",			 710,	R8A77990_CLK_S1D1),
> +	DEF_MOD("cmm0",			 711,	R8A77990_CLK_S1D1),
>  	DEF_MOD("csi40",		 716,	R8A77990_CLK_CSI0),
>  	DEF_MOD("du1",			 723,	R8A77990_CLK_S1D1),
>  	DEF_MOD("du0",			 724,	R8A77990_CLK_S1D1),

-- 
Regards,

Laurent Pinchart
