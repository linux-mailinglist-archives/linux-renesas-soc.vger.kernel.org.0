Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43C0B34348
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2019 11:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbfFDJf4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Jun 2019 05:35:56 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:52268 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbfFDJf4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Jun 2019 05:35:56 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D028A25B73F;
        Tue,  4 Jun 2019 19:35:54 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id D06DF940986; Tue,  4 Jun 2019 11:35:52 +0200 (CEST)
Date:   Tue, 4 Jun 2019 11:35:52 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: renesas_usbhs: remove sudmac support
Message-ID: <20190604093551.szxmo4xsqqkq4ixz@verge.net.au>
References: <1559621375-5436-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1559621375-5436-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559621375-5436-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Tue, Jun 04, 2019 at 01:09:34PM +0900, Yoshihiro Shimoda wrote:
> SUDMAC featurer was supported in v3.10, but was never used by
> any platform. So, this patch removes it.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/usb/renesas_usbhs/fifo.c  | 5 +----
>  include/linux/usb/renesas_usbhs.h | 1 -
>  2 files changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usbhs/fifo.c
> index 452b456..53f8e2f 100644
> --- a/drivers/usb/renesas_usbhs/fifo.c
> +++ b/drivers/usb/renesas_usbhs/fifo.c
> @@ -325,10 +325,7 @@ static int usbhsf_fifo_select(struct usbhs_pipe *pipe,
>  	}
>  
>  	/* "base" will be used below  */
> -	if (usbhs_get_dparam(priv, has_sudmac) && !usbhsf_is_cfifo(priv, fifo))

I believe usbhsf_is_cfifo() will now be unused and should be removed.

With that change feel free to add:

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>


> -		usbhs_write(priv, fifo->sel, base);
> -	else
> -		usbhs_write(priv, fifo->sel, base | MBW_32);
> +	usbhs_write(priv, fifo->sel, base | MBW_32);
>  
>  	/* check ISEL and CURPIPE value */
>  	while (timeout--) {
> diff --git a/include/linux/usb/renesas_usbhs.h b/include/linux/usb/renesas_usbhs.h
> index 3f53043..a2481f4d 100644
> --- a/include/linux/usb/renesas_usbhs.h
> +++ b/include/linux/usb/renesas_usbhs.h
> @@ -187,7 +187,6 @@ struct renesas_usbhs_driver_param {
>  	 * option:
>  	 */
>  	u32 has_otg:1; /* for controlling PWEN/EXTLP */
> -	u32 has_sudmac:1; /* for SUDMAC */
>  	u32 has_usb_dmac:1; /* for USB-DMAC */
>  	u32 runtime_pwctrl:1;
>  	u32 has_cnen:1;
> -- 
> 2.7.4
> 
