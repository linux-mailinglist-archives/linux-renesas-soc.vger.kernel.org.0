Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B29939B818
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jun 2021 13:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbhFDLkP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Jun 2021 07:40:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:37614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229980AbhFDLkP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jun 2021 07:40:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 693E66141C;
        Fri,  4 Jun 2021 11:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1622806693;
        bh=CITyZwk498+PUiCAZrsokNQgDCfFlea+qhpIF5zqVGI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vtNViaLJkCJCb8Ju3SnLzs0aPwEpDe/AFgKIZGG/OVHH+6yP+iAQRqYS5BfXMRtbI
         wVHXIx57ZpNTYpCiijBV09RJrP5Vr4EejXmIUqQs+bSN2ZfzSg7N/IOzTkcJKk36ZR
         tKhOc5blJD3JzGgstl/daOsOcbrZngBAXg9LWgbA=
Date:   Fri, 4 Jun 2021 13:38:10 +0200
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2] serial: sh-sci: Stop dmaengine transfer in
 sci_stop_tx()
Message-ID: <YLoQotNwkeo6lDDN@kroah.com>
References: <20210604095704.756190-1-yoshihiro.shimoda.uh@renesas.com>
 <19b2a786-0b32-f26c-efd9-2f5dbd9894aa@kernel.org>
 <TY2PR01MB3692BB5BFDA1C8C305992330D83B9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY2PR01MB3692BB5BFDA1C8C305992330D83B9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 04, 2021 at 10:28:19AM +0000, Yoshihiro Shimoda wrote:
> Hi Jiri,
> 
> Thank you for your review!
> 
> > From: Jiri Slaby, Sent: Friday, June 4, 2021 7:22 PM
> > 
> > On 04. 06. 21, 11:57, Yoshihiro Shimoda wrote:
> > > Stop dmaengine transfer in sci_stop_tx(). Otherwise, the following
> > > message is possible output when system enters suspend and while
> > > transferring data, because clearing TIE bit in SCSCR is not able to
> > > stop any dmaengine transfer.
> > >
> > >      sh-sci e6550000.serial: ttySC1: Unable to drain transmitter
> > >
> > > Notes:
> > >   - sci_dma_stop_tx() is a macro in the .h file because struct sci_port
> > >     is declared in the .c file and #ifdef should be in the .h file.
> > >   - This patch uses dmaengine_terminate_async() so that we can apply
> > >     this into longterm kernel v4.9.x or later.
> > >
> > > Fixes: 73a19e4c0301 ("serial: sh-sci: Add DMA support.")
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > ---
> <snip>
> > > diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> > > index 4baf1316ea72..3793cf9f352c 100644
> > > --- a/drivers/tty/serial/sh-sci.c
> > > +++ b/drivers/tty/serial/sh-sci.c
> > > @@ -610,6 +610,8 @@ static void sci_stop_tx(struct uart_port *port)
> > >   	ctrl &= ~SCSCR_TIE;
> > >
> > >   	serial_port_out(port, SCSCR, ctrl);
> > > +
> > > +	sci_dma_stop_tx(port);
> > >   }
> > >
> > >   static void sci_start_rx(struct uart_port *port)
> > > diff --git a/drivers/tty/serial/sh-sci.h b/drivers/tty/serial/sh-sci.h
> > > index c0dfe4382898..435c674af1ce 100644
> > > --- a/drivers/tty/serial/sh-sci.h
> > > +++ b/drivers/tty/serial/sh-sci.h
> > > @@ -174,3 +174,19 @@ enum {
> > >   	(((port)->type == PORT_SCI) ? SCI_TDxE_CLEAR : SCIF_TDxE_CLEAR)
> > >   #define SCxSR_BREAK_CLEAR(port) \
> > >   	(((port)->type == PORT_SCI) ? SCI_BREAK_CLEAR : SCIF_BREAK_CLEAR)
> > > +
> > > +#ifdef CONFIG_SERIAL_SH_SCI_DMA
> > > +#define sci_dma_stop_tx(port)					\
> > 
> > Ouch. First, why this needs to be in a header?
> 
> The v1 patch [1] putted #ifdef in .c file, so that I got feedback from Greg like below:
> "Please do not put #ifdef in .c files, this should be possible without that."

Yes, but that does not mean using a macro, please do this correctly.

thanks,

greg k-h
