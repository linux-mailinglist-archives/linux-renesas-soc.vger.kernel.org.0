Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32470A6A6E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2019 15:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729426AbfICNwY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Sep 2019 09:52:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:45448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729353AbfICNwY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Sep 2019 09:52:24 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C61FB23711;
        Tue,  3 Sep 2019 13:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567518743;
        bh=so+QyVl+RHSTotV4ctrO2c5csPw8U6CBiHviICf+MsI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xWvNQdMkFxWk8ldM5i1Z+7rW9ZPS0tCUqllEWHWItu08hK7ttugUalD3nR5HmTwHU
         N+tRJLnBQMJvO5xfDeeVFT+1tykDfU4SE9ussAwqhj/go/mooZW5OZ2K+EykMmHvwx
         LZJIT4Goxd8Y1PqrCXHT67jPgob8+PlXKlBr1rjI=
Date:   Tue, 3 Sep 2019 15:52:20 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     mathias.nyman@intel.com, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] usb: host: xhci-plat: add quirks member into
 struct xhci_plat_priv
Message-ID: <20190903135220.GA16118@kroah.com>
References: <1567425698-27560-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1567425698-27560-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567425698-27560-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 02, 2019 at 09:01:36PM +0900, Yoshihiro Shimoda wrote:
> To simplify adding xhci->quirks instead of the .init_quirk()
> function, this patch adds a new parameter "quirks" into
> the struct xhci_plat_priv.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/usb/host/xhci-plat.c | 4 +++-
>  drivers/usb/host/xhci-plat.h | 2 ++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index a1e5ce4..1843b69 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -66,12 +66,14 @@ static int xhci_priv_resume_quirk(struct usb_hcd *hcd)
>  
>  static void xhci_plat_quirks(struct device *dev, struct xhci_hcd *xhci)
>  {
> +	struct xhci_plat_priv *priv = xhci_to_priv(xhci);
> +
>  	/*
>  	 * As of now platform drivers don't provide MSI support so we ensure
>  	 * here that the generic code does not try to make a pci_dev from our
>  	 * dev struct in order to setup MSI
>  	 */
> -	xhci->quirks |= XHCI_PLAT;
> +	xhci->quirks |= XHCI_PLAT | priv->quirks;
>  }
>  
>  /* called during probe() after chip reset completes */
> diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
> index ae29f22..5681723 100644
> --- a/drivers/usb/host/xhci-plat.h
> +++ b/drivers/usb/host/xhci-plat.h
> @@ -12,10 +12,12 @@
>  
>  struct xhci_plat_priv {
>  	const char *firmware_name;
> +	unsigned long long quirks;

So you mean u64?  Or something else?

Please be specific here so we know the size of this field.

Ugh, looks like xhci.c uses unsigned long long too, ok, nevermind :(

