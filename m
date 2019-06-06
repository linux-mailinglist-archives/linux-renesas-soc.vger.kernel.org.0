Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB30837A5D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 18:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728551AbfFFQ7N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 12:59:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45024 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfFFQ7N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 12:59:13 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D541333B;
        Thu,  6 Jun 2019 18:59:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559840352;
        bh=XDx8nCiqiYqSjm6geqOh75YZZTdb04aCc3T8YidISPg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ut/qrx1h0uk4GGyPirmjpOsBDdj0ByH5fFxjf7XKO9fHkKLj6K7NJ3Cfk7vOxFYns
         Iv+k3M4VgrxNhkQBLPNt0uTs9+7zBw8qIaNmuMPfGO5OOUE+TV095gB8otzT0pISsx
         4gGhckbNQvtIw4C8IR3hPJqD6RpacJCsCx8Idpc0=
Date:   Thu, 6 Jun 2019 19:58:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/20] clk: renesas: r8a7795: Add CMM clocks
Message-ID: <20190606165857.GL12825@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-6-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-6-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Thu, Jun 06, 2019 at 04:22:05PM +0200, Jacopo Mondi wrote:
> Add clock definitions for CMM units on Renesas R-Car Gen3 H3.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/clk/renesas/r8a7795-cpg-mssr.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> index 86842c9fd314..e8f1d5ec0455 100644
> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> @@ -200,6 +200,10 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
>  	DEF_MOD("ehci0",		 703,	R8A7795_CLK_S3D4),
>  	DEF_MOD("hsusb",		 704,	R8A7795_CLK_S3D4),
>  	DEF_MOD("hsusb3",		 705,	R8A7795_CLK_S3D4),
> +	DEF_MOD("cmm3",			 708,	R8A7795_CLK_S2D1),
> +	DEF_MOD("cmm2",			 709,	R8A7795_CLK_S2D1),
> +	DEF_MOD("cmm1",			 710,	R8A7795_CLK_S2D1),
> +	DEF_MOD("cmm0",			 711,	R8A7795_CLK_S2D1),

Could you try to get confirmation that S2D1 is the right parent (for all
SoCs) ? Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	DEF_MOD("csi21",		 713,	R8A7795_CLK_CSI0), /* ES1.x */
>  	DEF_MOD("csi20",		 714,	R8A7795_CLK_CSI0),
>  	DEF_MOD("csi41",		 715,	R8A7795_CLK_CSI0),

-- 
Regards,

Laurent Pinchart
