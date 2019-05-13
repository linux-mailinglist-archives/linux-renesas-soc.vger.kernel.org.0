Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C66E1BA47
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2019 17:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727462AbfEMPnT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 May 2019 11:43:19 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:37075 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726274AbfEMPnT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 May 2019 11:43:19 -0400
Received: from svr-orw-mbx-01.mgc.mentorg.com ([147.34.90.201])
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hQD6c-0001Xa-5u from George_Davis@mentor.com ; Mon, 13 May 2019 08:43:10 -0700
Received: from localhost (147.34.91.1) by svr-orw-mbx-01.mgc.mentorg.com
 (147.34.90.201) with Microsoft SMTP Server (TLS) id 15.0.1320.4; Mon, 13 May
 2019 08:43:07 -0700
Date:   Mon, 13 May 2019 11:43:06 -0400
From:   "George G. Davis" <george_davis@mentor.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     "George G. Davis" <ggdavisiv@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
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
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] serial: sh-sci: disable DMA for uart_console
Message-ID: <20190513154306.GA6060@mam-gdavis-lt>
References: <20190506194233.GA32430@vmlxhi-102.adit-jv.com>
 <1557413011-1662-1-git-send-email-george_davis@mentor.com>
 <20190513135114.GA20443@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190513135114.GA20443@kunai>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Wolfram,

On Mon, May 13, 2019 at 03:51:14PM +0200, Wolfram Sang wrote:
> On Thu, May 09, 2019 at 10:43:30AM -0400, George G. Davis wrote:
> > As noted in commit 84b40e3b57ee ("serial: 8250: omap: Disable DMA for
> > console UART"), UART console lines use low-level PIO only access functions
> > which will conflict with use of the line when DMA is enabled, e.g. when
> > the console line is also used for systemd messages. So disable DMA
> > support for UART console lines.
> > 
> > Fixes: https://patchwork.kernel.org/patch/10929511/
> > Reported-by: Michael Rodin <mrodin@de.adit-jv.com>
> > Cc: Eugeniu Rosca <erosca@de.adit-jv.com>
> > Signed-off-by: George G. Davis <george_davis@mentor.com>
> > ---
> >  drivers/tty/serial/sh-sci.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> > index 3cd139752d3f..885b56b1d4e4 100644
> > --- a/drivers/tty/serial/sh-sci.c
> > +++ b/drivers/tty/serial/sh-sci.c
> > @@ -1557,6 +1557,9 @@ static void sci_request_dma(struct uart_port *port)
> >  
> >  	dev_dbg(port->dev, "%s: port %d\n", __func__, port->line);
> >  
> > +	if (uart_console(port))
> > +		return; /* Cannot use DMA on console */
> 
> Minor nit: maybe the comment can be made more specific?
> 
> /*
>  * DMA on console may interfere with Kernel log messages which use
>  * plain putchar(). So, simply don't use it with a console.
>  */

I'll submit v2 with the above recommended change.

Thanks!

> Other than that:
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Much better than dropping the properties, as Geert noted.

-- 
Regards,
George
