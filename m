Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65C8F1A907
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 May 2019 20:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbfEKSWI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 May 2019 14:22:08 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57018 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbfEKSWI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 May 2019 14:22:08 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 833B5D5;
        Sat, 11 May 2019 20:22:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557598926;
        bh=5hztJzP9X78F964TlQyj1V1q7FLYo5XqrrzbS0s+afY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ERMjP9I+pP/ewh6A6vSGoXJJ3UCwEzh0NHFZfIfa5Kb/PzL9L5bWCMRNMISIydJVO
         fbUppCfu8eJPUqTm7D3rRGc6WmNoRUgGuMe2sN7b99vSkyOydEzfrX+6Yg8ZyvgbQb
         v11vN8b1EYaDVP6tPX6LqpupK6NJ+pfs+ETnn3yE=
Date:   Sat, 11 May 2019 21:21:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [RFC 8/9] clk: renesas: r8a7796: Add CMM clocks
Message-ID: <20190511182150.GE13043@pendragon.ideasonboard.com>
References: <20190508173428.22054-1-jacopo+renesas@jmondi.org>
 <20190508173428.22054-9-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190508173428.22054-9-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, May 08, 2019 at 07:34:27PM +0200, Jacopo Mondi wrote:
> Add clock defintions for CMM units on Renesas R-Car Gen3 M3-W.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

We have no clear confirmation that the parent clock is S2D1, but this
assumption makes sense given that the DU uses that clock.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/clk/renesas/r8a7796-cpg-mssr.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> index 12c455859f2c..6044aeda0f83 100644
> --- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> @@ -179,6 +179,9 @@ static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
>  	DEF_MOD("ehci1",		 702,	R8A7796_CLK_S3D4),
>  	DEF_MOD("ehci0",		 703,	R8A7796_CLK_S3D4),
>  	DEF_MOD("hsusb",		 704,	R8A7796_CLK_S3D4),
> +	DEF_MOD("cmm2",			 709,	R8A7796_CLK_S2D1),
> +	DEF_MOD("cmm1",			 710,	R8A7796_CLK_S2D1),
> +	DEF_MOD("cmm0",			 711,	R8A7796_CLK_S2D1),
>  	DEF_MOD("csi20",		 714,	R8A7796_CLK_CSI0),
>  	DEF_MOD("csi40",		 716,	R8A7796_CLK_CSI0),
>  	DEF_MOD("du2",			 722,	R8A7796_CLK_S2D1),

-- 
Regards,

Laurent Pinchart
