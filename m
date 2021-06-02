Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EDC53988B1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jun 2021 13:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbhFBL64 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Jun 2021 07:58:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:52182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229524AbhFBL6x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Jun 2021 07:58:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4C32613AA;
        Wed,  2 Jun 2021 11:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1622635030;
        bh=6CjIyfv7G12jEh5uO0m+gLajWf57EkvIGneqfDb7WxE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zgk2M3KfzgG51hxVeV66u7MTRrujUGSn3qncmm1pc9JAqp++Be3K6nHpUFBm8LeOC
         HU+Hm/1IfRkf6kjyVFBgOTV6UTKneIXTCkeCD/14rIofTMGgpjsd2E25/nfY3T0U20
         3qVGRUY1zai/Ze2hcFoTrDBK3YKVrrfAY72VnlAY=
Date:   Wed, 2 Jun 2021 13:57:07 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     jirislaby@kernel.org, linux-serial@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] serial: sh-sci: Stop dmaengine transfer in sci_stop_tx()
Message-ID: <YLdyE/Jf/YcSz7AE@kroah.com>
References: <20210602114108.510527-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602114108.510527-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 02, 2021 at 08:41:08PM +0900, Yoshihiro Shimoda wrote:
> Stop dmaengine transfer in sci_stop_tx(). Otherwise, the following
> message is possible output when system enters suspend and while
> transferring data, because clearing TIE bit in SCSCR is not able to
> stop any dmaengine transfer.
> 
>     sh-sci e6550000.serial: ttySC1: Unable to drain transmitter
> 
> Notes that this patch uses dmaengine_terminate_async() so that
> we can apply this patch into longterm kernel v4.9.x or later.
> 
> Fixes: 73a19e4c0301 ("serial: sh-sci: Add DMA support.")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/tty/serial/sh-sci.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 4baf1316ea72..e7130be48946 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -600,6 +600,9 @@ static void sci_start_tx(struct uart_port *port)
>  static void sci_stop_tx(struct uart_port *port)
>  {
>  	unsigned short ctrl;
> +#ifdef CONFIG_SERIAL_SH_SCI_DMA
> +	struct sci_port *s = to_sci_port(port);
> +#endif

Please do not put #ifdef in .c files, this should be possible without
that.

thanks,

greg k-h
