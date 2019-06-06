Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10B5837A62
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 19:00:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727402AbfFFRAB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 13:00:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45048 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfFFRAB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 13:00:01 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C041E33B;
        Thu,  6 Jun 2019 18:59:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559840399;
        bh=5X4XDtwWOlQt05zyhRZuWjlaeJCoBpyM3GZhcMPznXA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=raeumGqFAlTVMCr+owMwwJa/2Wngo6TIzylT8fOqd35r9LEGs1YViIc4zVedGRC+R
         obs1iDnmH//4ElvAmMWLUIpKz/wJ8ROuxSzZt4IOdiX2abflHKB8hMmZRBv9MN5iuU
         +fMSJj2Y4GtUlf4dZoLhV8O3LNDSGStY1+XLcnUU=
Date:   Thu, 6 Jun 2019 19:59:45 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/20] clk: renesas: r8a77965: Add CMM clocks
Message-ID: <20190606165945.GM12825@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-7-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-7-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Thu, Jun 06, 2019 at 04:22:06PM +0200, Jacopo Mondi wrote:
> Add clock definitions for CMM units on Renesas R-Car Gen3 M3-N.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/clk/renesas/r8a77965-cpg-mssr.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
> index eb1cca58a1e1..58f75b03c8bb 100644
> --- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
> @@ -178,6 +178,9 @@ static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
>  	DEF_MOD("ehci1",		702,	R8A77965_CLK_S3D4),
>  	DEF_MOD("ehci0",		703,	R8A77965_CLK_S3D4),
>  	DEF_MOD("hsusb",		704,	R8A77965_CLK_S3D4),
> +	DEF_MOD("cmm3",			708,	R8A77965_CLK_S2D1),
> +	DEF_MOD("cmm1",			710,	R8A77965_CLK_S2D1),
> +	DEF_MOD("cmm0",			711,	R8A77965_CLK_S2D1),
>  	DEF_MOD("csi20",		714,	R8A77965_CLK_CSI0),
>  	DEF_MOD("csi40",		716,	R8A77965_CLK_CSI0),
>  	DEF_MOD("du3",			721,	R8A77965_CLK_S2D1),

-- 
Regards,

Laurent Pinchart
