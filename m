Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC0039E877
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jun 2021 22:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231362AbhFGUdj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Jun 2021 16:33:39 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34892 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbhFGUdj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jun 2021 16:33:39 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 52CA48DB;
        Mon,  7 Jun 2021 22:31:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623097906;
        bh=DAGUPdYMwiclzas/bXqhoRYYuV7vbLJIHV7AhaR6PD0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rTcfZbVTd3HLsgT7LO40cNQnaya/BYcLrTnFtorjTYuciH8KOmnXwVgdIbTWs+jl6
         gaY/2h9GwfyWc0zKEpO0oygS4C5dIDuvOJU8Q/w2vrKOCUVs6+cA1bYJ+RC+SDUmPB
         gV9kdSprHdDKSLtk20//qS9VGYe6fBFcYjGHnbus=
Date:   Mon, 7 Jun 2021 23:31:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] serial: sh-sci: Remove unused STEPFN() macro
Message-ID: <YL6CJORpSMBVMSI9@pendragon.ideasonboard.com>
References: <970387d104dea5bb7ea674bb89229641467e629b.1623076891.git.geert+renesas@glider.be>
 <YL5OqsVMxbHm2EWa@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YL5OqsVMxbHm2EWa@oden.dyn.berto.se>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 07, 2021 at 06:51:54PM +0200, Niklas Söderlund wrote:
> On 2021-06-07 16:43:45 +0200, Geert Uytterhoeven wrote:
> > The last user of the STEPFN() macro was removed in commit
> > d5cb1319a91d4f13 ("serial: sh-sci: Remove manual break debouncing").
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

A simple and good fix.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > ---
> >  drivers/tty/serial/sh-sci.c | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> > index 4baf1316ea729931..946c4bd920f48960 100644
> > --- a/drivers/tty/serial/sh-sci.c
> > +++ b/drivers/tty/serial/sh-sci.c
> > @@ -840,9 +840,6 @@ static void sci_transmit_chars(struct uart_port *port)
> >  
> >  }
> >  
> > -/* On SH3, SCIF may read end-of-break as a space->mark char */
> > -#define STEPFN(c)  ({int __c = (c); (((__c-1)|(__c)) == -1); })
> > -
> >  static void sci_receive_chars(struct uart_port *port)
> >  {
> >  	struct tty_port *tport = &port->state->port;

-- 
Regards,

Laurent Pinchart
