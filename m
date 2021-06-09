Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD5413A1493
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jun 2021 14:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232109AbhFIMjo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Jun 2021 08:39:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:50082 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232090AbhFIMjo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jun 2021 08:39:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1000961354;
        Wed,  9 Jun 2021 12:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623242269;
        bh=4azbVFSgWEE//TQvLyn0cj8m8IsgnXUBpDf6bcvHw/E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H4mFP5szxnQr07TZFzbxSWHxVNBQFOUzBfAL+vb4VC4FKbYDwUQkJxC3S/wb548JN
         FwNOhrxiEPjN1IxyxCIW1D1Ly2iU9trZxrtOXuHNEhZkml3PcN7EqF1rMfGOcJUx9N
         Z8jH/Zjwe7x+KsKssmxPCDXPhOT5O63v4ZLikgcw=
Date:   Wed, 9 Jun 2021 14:37:31 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     jirislaby@kernel.org, linux-serial@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] serial: sh-sci: Stop dmaengine transfer in
 sci_stop_tx()
Message-ID: <YMC2C0AXxhAxH/Mf@kroah.com>
References: <20210609014902.271237-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609014902.271237-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 09, 2021 at 10:49:02AM +0900, Yoshihiro Shimoda wrote:
> Stop dmaengine transfer in sci_stop_tx(). Otherwise, the following
> message is possible output when system enters suspend and while
> transferring data, because clearing TIE bit in SCSCR is not able to
> stop any dmaengine transfer.
> 
>     sh-sci e6550000.serial: ttySC1: Unable to drain transmitter
> 
> Note that this patch uses dmaengine_terminate_async() so that
> we can apply this patch into longterm kernel v4.9.x or later.
> 
> Fixes: 73a19e4c0301 ("serial: sh-sci: Add DMA support.")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Changes from v2:
>  - Don't use a macro.
>  - Revise the commit descrption.
>  https://lore.kernel.org/linux-renesas-soc/20210604095704.756190-1-yoshihiro.shimoda.uh@renesas.com/
> 
>  Changes from v1:
>  - Don't put #ifdef in the .c file.
>  - Update the commit description.
>  https://lore.kernel.org/linux-renesas-soc/20210602114108.510527-1-yoshihiro.shimoda.uh@renesas.com/
> 
>  drivers/tty/serial/sh-sci.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 4baf1316ea72..2d5487bf6855 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -610,6 +610,14 @@ static void sci_stop_tx(struct uart_port *port)
>  	ctrl &= ~SCSCR_TIE;
>  
>  	serial_port_out(port, SCSCR, ctrl);
> +
> +#ifdef CONFIG_SERIAL_SH_SCI_DMA

Please no #ifdef in .c files.

thanks,

greg k-h
