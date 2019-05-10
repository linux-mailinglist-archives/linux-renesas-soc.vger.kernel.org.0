Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 209F51A21F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2019 19:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727835AbfEJRKm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 May 2019 13:10:42 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:54827 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbfEJRKm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 May 2019 13:10:42 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 8DBF83C00C6;
        Fri, 10 May 2019 19:10:39 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 2dIuZMVPBgda; Fri, 10 May 2019 19:10:32 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id C99FE3C004C;
        Fri, 10 May 2019 19:10:24 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 10 May
 2019 19:10:24 +0200
Date:   Fri, 10 May 2019 19:10:21 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     "George G. Davis" <ggdavisiv@gmail.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Andy Lowe <andy_lowe@mentor.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "George G. Davis" <george_davis@mentor.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH] serial: sh-sci: disable DMA for uart_console
Message-ID: <20190510171021.GA22691@vmlxhi-102.adit-jv.com>
References: <20190506194233.GA32430@vmlxhi-102.adit-jv.com>
 <1557413011-1662-1-git-send-email-george_davis@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1557413011-1662-1-git-send-email-george_davis@mentor.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi George,

I am able to reproduce the SCIF2 console freeze described in the
referenced patchwork link using M3-ES1.1-Salvator-XS and recent
v5.1-9573-gb970afcfcabd kernel.

I confirm the behavior is healed with this patch. Thanks!
Hope to see it accepted soon, since it fixes a super annoying
console breakage every fourth boot or so on lots of R-Car3 targets.

Tested-by: Eugeniu Rosca <erosca@de.adit-jv.com>

On Thu, May 09, 2019 at 10:43:30AM -0400, George G. Davis wrote:
> As noted in commit 84b40e3b57ee ("serial: 8250: omap: Disable DMA for
> console UART"), UART console lines use low-level PIO only access functions
> which will conflict with use of the line when DMA is enabled, e.g. when
> the console line is also used for systemd messages. So disable DMA
> support for UART console lines.
> 
> Fixes: https://patchwork.kernel.org/patch/10929511/
> Reported-by: Michael Rodin <mrodin@de.adit-jv.com>
> Cc: Eugeniu Rosca <erosca@de.adit-jv.com>
> Signed-off-by: George G. Davis <george_davis@mentor.com>
> ---
>  drivers/tty/serial/sh-sci.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 3cd139752d3f..885b56b1d4e4 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -1557,6 +1557,9 @@ static void sci_request_dma(struct uart_port *port)
>  
>  	dev_dbg(port->dev, "%s: port %d\n", __func__, port->line);
>  
> +	if (uart_console(port))
> +		return; /* Cannot use DMA on console */
> +
>  	if (!port->dev->of_node)
>  		return;
>  
> -- 
> 2.7.4
> 

-- 
Best Regards,
Eugeniu.
