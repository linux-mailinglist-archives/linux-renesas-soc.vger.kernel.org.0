Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5A3B47750C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 15:54:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237402AbhLPOyA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 09:54:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235059AbhLPOx7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 09:53:59 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A87DCC06173E;
        Thu, 16 Dec 2021 06:53:59 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 26B483F6;
        Thu, 16 Dec 2021 15:53:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639666438;
        bh=LCgyCIFjvDLvFwIifCwiILneQWUk+R/rzgaJ8vk99YA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NX8xNu/ODaRhOLdINyRjNY++zmkC2MaVZSmiGrc+W4+5vm5pHll34mmpFmJnfBM2G
         P+20i2SsvDjRpg1N930Lx3N+2H5QKmU7/v8RQkLzOHaJ5sJpS/xx3rugBTOILkWi/T
         3Hm8DZnSgSzoDkfhhSSj5GAKFymov1HRFXzbGSN0=
Date:   Thu, 16 Dec 2021 16:53:56 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp
Subject: Re: [PATCH 3/3] serial: sh-sci: Use devm_clk_get_optional()
Message-ID: <YbtTBN2OrKPOfXmR@pendragon.ideasonboard.com>
References: <cover.1639663832.git.geert+renesas@glider.be>
 <bce27288cb570952dd96b441e1af8768ad8b4870.1639663832.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bce27288cb570952dd96b441e1af8768ad8b4870.1639663832.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Thu, Dec 16, 2021 at 03:17:34PM +0100, Geert Uytterhoeven wrote:
> The sh-sci driver supports up to four input clocks, of which only the
> first one is mandatory.
> 
> Replace devm_clk_get() and custom error checking by
> devm_clk_get_optional(), to simplify the code and to catch all real
> errors.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/tty/serial/sh-sci.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 5f6d85b8e3dd4173..bb3adf0a109324ca 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -2779,11 +2779,11 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
>  		clk_names[SCI_SCK] = "hsck";
>  
>  	for (i = 0; i < SCI_NUM_CLKS; i++) {
> -		clk = devm_clk_get(dev, clk_names[i]);
> -		if (PTR_ERR(clk) == -EPROBE_DEFER)
> -			return -EPROBE_DEFER;
> +		clk = devm_clk_get_optional(dev, clk_names[i]);
> +		if (IS_ERR(clk))
> +			return PTR_ERR(clk);
>  
> -		if (IS_ERR(clk) && i == SCI_FCK) {
> +		if (!clk && i == SCI_FCK) {
>  			/*
>  			 * Not all SH platforms declare a clock lookup entry
>  			 * for SCI devices, in which case we need to get the
> @@ -2796,13 +2796,12 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
>  						     clk_names[i]);
>  		}
>  
> -		if (IS_ERR(clk))
> -			dev_dbg(dev, "failed to get %s (%ld)\n", clk_names[i],
> -				PTR_ERR(clk));
> +		if (!clk)
> +			dev_dbg(dev, "failed to get %s\n", clk_names[i]);
>  		else
>  			dev_dbg(dev, "clk %s is %pC rate %lu\n", clk_names[i],
>  				clk, clk_get_rate(clk));
> -		sci_port->clks[i] = IS_ERR(clk) ? NULL : clk;
> +		sci_port->clks[i] = clk;
>  	}
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart
