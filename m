Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA81A4364
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Aug 2019 10:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbfHaInJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 31 Aug 2019 04:43:09 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:50074 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbfHaInJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 31 Aug 2019 04:43:09 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 6A7FF25AD78;
        Sat, 31 Aug 2019 18:43:07 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 46A02E218F0; Sat, 31 Aug 2019 10:43:05 +0200 (CEST)
Date:   Sat, 31 Aug 2019 10:43:05 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     gregkh@linuxfoundation.org, mathias.nyman@intel.com,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/4] usb: host: xhci-rcar: avoid 60s wait by
 request_firmware() in system booting
Message-ID: <20190831084304.wisliftdg5g26jbf@verge.net.au>
References: <1566900127-11148-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1566900127-11148-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566900127-11148-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 27, 2019 at 07:02:07PM +0900, Yoshihiro Shimoda wrote:
> If CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y and CONFIG_USB_XHCI_RCAR=y,
> request_firmware() in xhci_rcar_download_firmware() waits for 60s to
> sysfs fallback for the firmware like below.
> 
> [    1.599701] xhci-hcd ee000000.usb: xHCI Host Controller
> [    1.604948] xhci-hcd ee000000.usb: new USB bus registered, assigned bus number 3
> [    1.612403] xhci-hcd ee000000.usb: Direct firmware load for r8a779x_usb3_v3.dlmem failed with error -2
> [    1.621726] xhci-hcd ee000000.usb: Falling back to sysfs fallback for: r8a779x_usb3_v3.dlmem
> [    1.707953] ata1: link resume succeeded after 1 retries
> [    1.819379] ata1: SATA link down (SStatus 0 SControl 300)
> [   62.436012] xhci-hcd ee000000.usb: can't setup: -11
> [   62.440901] xhci-hcd ee000000.usb: USB bus 3 deregistered
> [   62.446361] xhci-hcd: probe of ee000000.usb failed with error -11
> 
> To avoid this 60s wait, this patch adds to check the system_state
> condition and if the system is not running,
> xhci_rcar_download_firmware() calls request_firmware_direct()
> instead of request_firmware() as a workaround.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

It seems to me that request_firmware() is working as expected.
And that this patch introduces an alternate behaviour for xhci-rcar
where it will fall back to the user-space helper in some cases but not
others. This inconsistency isn't obviously correct to me. Perhaps
xhci-rcar should always call request_firmware_direct() ?

> ---
>  drivers/usb/host/xhci-rcar.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
> index 34761be..c90cf46 100644
> --- a/drivers/usb/host/xhci-rcar.c
> +++ b/drivers/usb/host/xhci-rcar.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/firmware.h>
> +#include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/of.h>
> @@ -146,7 +147,10 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
>  		firmware_name = priv->firmware_name;
>  
>  	/* request R-Car USB3.0 firmware */
> -	retval = request_firmware(&fw, firmware_name, dev);
> +	if (system_state < SYSTEM_RUNNING)
> +		retval = request_firmware_direct(&fw, firmware_name, dev);
> +	else
> +		retval = request_firmware(&fw, firmware_name, dev);
>  	if (retval)
>  		return retval;
>  
> -- 
> 2.7.4
> 
