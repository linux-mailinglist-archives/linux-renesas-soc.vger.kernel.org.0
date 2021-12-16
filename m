Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 356CB4774FF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 15:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237975AbhLPOwI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 09:52:08 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38720 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237955AbhLPOwH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 09:52:07 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E9493F6;
        Thu, 16 Dec 2021 15:52:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639666325;
        bh=7tR2zj9LiJsFgIWk69oL/8FuB0C4Ixxh7BTB5Pvw2KU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Nn8iln8MGdfagy0tOiEfSGNIr3Wjd0cMOz4jEo0ARxrZHESssG9kag7Xuip5HqkMx
         681UaVi7rPfOoFCszTKB0O0V8yNEU643hH7eo5nOkgFyQPJLRSrVv8OExzcq00g73I
         wZ9OYjJ1+x3p7igoHLJUDbXJcWqQ5rm5YyzySF3Y=
Date:   Thu, 16 Dec 2021 16:52:03 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp
Subject: Re: [PATCH 2/3] serial: sh-sci: Use dev_err_probe()
Message-ID: <YbtSk+K6Ald6aq4u@pendragon.ideasonboard.com>
References: <cover.1639663832.git.geert+renesas@glider.be>
 <5c4dd8df1f8d0d14786f26ee80b77f3eb8e06cd5.1639663832.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5c4dd8df1f8d0d14786f26ee80b77f3eb8e06cd5.1639663832.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Thu, Dec 16, 2021 at 03:17:33PM +0100, Geert Uytterhoeven wrote:
> Use the dev_err_probe() helper to streamline error handling.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/tty/serial/sh-sci.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 686ca1777222b1d4..5f6d85b8e3dd4173 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -2790,15 +2790,12 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
>  			 * global "peripheral_clk" clock.
>  			 */
>  			clk = devm_clk_get(dev, "peripheral_clk");
> -			if (!IS_ERR(clk))
> -				goto found;
> -
> -			dev_err(dev, "failed to get %s (%ld)\n", clk_names[i],
> -				PTR_ERR(clk));
> -			return PTR_ERR(clk);
> +			if (IS_ERR(clk))
> +				return dev_err_probe(dev, PTR_ERR(clk),
> +						     "failed to get %s\n",
> +						     clk_names[i]);
>  		}
>  
> -found:
>  		if (IS_ERR(clk))
>  			dev_dbg(dev, "failed to get %s (%ld)\n", clk_names[i],
>  				PTR_ERR(clk));

-- 
Regards,

Laurent Pinchart
