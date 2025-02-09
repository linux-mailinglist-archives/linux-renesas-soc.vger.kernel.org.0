Return-Path: <linux-renesas-soc+bounces-12962-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC54AA2DEE1
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Feb 2025 16:45:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A3E27A2B1F
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Feb 2025 15:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61BB01DF72E;
	Sun,  9 Feb 2025 15:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gLwa2Yaq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0B5199223;
	Sun,  9 Feb 2025 15:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739115898; cv=none; b=kROaJjGw+6rHEXpkgFNRYPn4m78feyDjLbN1LYQbyezViKonMiZoJ97z9DNjNKpehDpZ+uZXmUd8Qu4S6rtMnKRQ3e8idWAzKZlSEuEqQtTM0QLrRUIB2dfNJd5ajRKLTDFus8zAyvO5ezHgzcQebHC5TT0aNT/nXGTv8/D6ZtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739115898; c=relaxed/simple;
	bh=fGPyO9IuWgybQPOtFj72YAAR4JfEYTTChgkn9rio7kY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=moTo+KrwQSRn7mCL4jmS/CFfLJhk8JTlnBZPSXBDsgSxR5kxDgsiNgH7sPB2RYbUucaqly2LdsTBGtkpuNloQJe9NGpuINVVUo8fvkJEBWpuzJT00YR8WrhuZorZFw04RfuYCXrUshVB0jeuzgJg53XLrJ2EZMuCw6FAyYdjUPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gLwa2Yaq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B777C4CEDD;
	Sun,  9 Feb 2025 15:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739115897;
	bh=fGPyO9IuWgybQPOtFj72YAAR4JfEYTTChgkn9rio7kY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gLwa2YaqweFwU75YdxHxJb4Hky60w0bsaZ1e/RUO1SlvfP0TGL5xJUb+DZ2csDZYu
	 +EgIOblo5i0hae/XL2vQdlMm42jtDLvo+WqFyyBA5iE7Lxufh+HFSFtxC2n95o8RKr
	 gQMtxKn5d34ASwhrJz1bkb8yZIj9vwo3kaDPZCIQ=
Date: Sun, 9 Feb 2025 16:44:54 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-usb@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Oliver Neukum <oneukum@suse.com>, linux-renesas-soc@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] USB: cdc-acm: Fill in Renesas R-Car D3 USB Download mode
 quirk
Message-ID: <2025020939-mammary-prevalent-df29@gregkh>
References: <20250209145708.106914-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209145708.106914-1-marek.vasut+renesas@mailbox.org>

On Sun, Feb 09, 2025 at 03:56:11PM +0100, Marek Vasut wrote:
> Add Renesas R-Car D3 USB Download mode quirk and update comments
> on all the other Renesas R-Car USB Download mode quirks to discern
> them from each other. This follows R-Car Series, 3rd Generation
> reference manual Rev.2.00 chapter 19.2.8 USB download mode .
> 
> Fixes: 6d853c9e4104 ("usb: cdc-acm: Add DISABLE_ECHO for Renesas USB Download mode")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Chris Brandt <chris.brandt@renesas.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Oliver Neukum <oneukum@suse.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Cc: stable@vger.kernel.org
> ---
>  drivers/usb/class/cdc-acm.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
> index 6b37d1c47fce1..06c7d86c5449e 100644
> --- a/drivers/usb/class/cdc-acm.c
> +++ b/drivers/usb/class/cdc-acm.c
> @@ -1727,13 +1727,16 @@ static const struct usb_device_id acm_ids[] = {
>  	{ USB_DEVICE(0x0870, 0x0001), /* Metricom GS Modem */
>  	.driver_info = NO_UNION_NORMAL, /* has no union descriptor */
>  	},
> -	{ USB_DEVICE(0x045b, 0x023c),	/* Renesas USB Download mode */
> +	{ USB_DEVICE(0x045b, 0x023c),	/* Renesas R-Car H3 USB Download mode */
>  	.driver_info = DISABLE_ECHO,	/* Don't echo banner */
>  	},
> -	{ USB_DEVICE(0x045b, 0x0248),	/* Renesas USB Download mode */
> +	{ USB_DEVICE(0x045b, 0x0247),	/* Renesas R-Car D3 USB Download mode */
>  	.driver_info = DISABLE_ECHO,	/* Don't echo banner */
>  	},
> -	{ USB_DEVICE(0x045b, 0x024D),	/* Renesas USB Download mode */
> +	{ USB_DEVICE(0x045b, 0x0248),	/* Renesas R-Car M3-N USB Download mode */
> +	.driver_info = DISABLE_ECHO,	/* Don't echo banner */
> +	},
> +	{ USB_DEVICE(0x045b, 0x024D),	/* Renesas R-Car E3 USB Download mode */
>  	.driver_info = DISABLE_ECHO,	/* Don't echo banner */
>  	},
>  	{ USB_DEVICE(0x0e8d, 0x0003), /* FIREFLY, MediaTek Inc; andrey.arapov@gmail.com */
> -- 
> 2.47.2
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

