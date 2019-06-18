Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC1649A3A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 09:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbfFRHRY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 03:17:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:40942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725955AbfFRHRY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 03:17:24 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4B50720873;
        Tue, 18 Jun 2019 05:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560837557;
        bh=3Mwkc0cWOSStWWOJIiMxyqSyyjL9711lqq0yY8nG0XI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GpiVw4xA/7I8NFtBB+gLGvaRiWU2uSRicLLFUMbSH4aygcKwTIoZK+1cgjTyuzlrP
         X9tzBGaqUyxVM/9FEIq11Hvvnv2/YGFYJyQgO4RiXjpM/XzcdxQ4JrobjcI52mO2Qt
         vlo3hznJ9kzczqTBAipptV2MXdGH1ydtWmnzWZIE=
Date:   Tue, 18 Jun 2019 07:59:15 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] usb: renesas_usbhs: Use struct assignment instead of
 memcpy()
Message-ID: <20190618055915.GA5904@kroah.com>
References: <1560424728-13929-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560424728-13929-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 13, 2019 at 08:18:48PM +0900, Yoshihiro Shimoda wrote:
> To avoid the error-proneness of calls to sizeof() in the memcpy,
> this patch uses struct assignment instead of memcpy.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  This patch is based on Greg's linux-usb.git / usb-next branch.
>  Note that mod_host.c also has memcpy but we cannot use struct assignment
>  for it because the type of urb->setup_patcket is just "unsigned char *".
> 
>  drivers/usb/renesas_usbhs/common.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
> index a501ea6..ebbe322 100644
> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c
> @@ -651,9 +651,8 @@ static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
>  		return NULL;
>  
>  	dparam = &info->driver_param;
> -	memcpy(dparam, &data->param, sizeof(data->param));
> -	memcpy(&info->platform_callback, data->platform_callback,
> -	       sizeof(*data->platform_callback));
> +	*dparam = data->param;
> +	info->platform_callback = *data->platform_callback;

How are the original calls here "error-prone"?  Yes, the compiler will
end up calling memcpy somehow with this change, but it feels "wrong" to
hide a memory copy like this.

So are you _sure_ you want this change?

thanks,

greg k-h
