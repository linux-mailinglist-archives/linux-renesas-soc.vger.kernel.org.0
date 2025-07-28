Return-Path: <linux-renesas-soc+bounces-19707-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD16EB1339B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Jul 2025 06:18:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E160316C358
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Jul 2025 04:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851B11E5710;
	Mon, 28 Jul 2025 04:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Pob29YA9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435811C36;
	Mon, 28 Jul 2025 04:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753676320; cv=none; b=ANU1csrr6Pa6Q/HT8kWCfOmCOuzvrib1htNZQqbz0rW4AXzkYPeRYGOcHfhEvEsUHurHZGXiLlrSo97Fwj0Uzdw5zCxeF7v1uKBMDmnJ1F0GMORvv2LD2jdtIJ5tccwEiYFbdpqWHIWsIxj6J4CjwYz3eF9AItVl/cNTHb6u5ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753676320; c=relaxed/simple;
	bh=vEJb4o0t3khHJpgtG8gkcYUb1C8wJPZ4Z5J84HGPSRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Or6Sulf6qA+VuHXSwuV5+0Qw1fP4p06fOtsatj8mKACJBpd7qM3eW+tIwX2x0MDCHFi3G+m6okjbrsTgn5F63WDyYxPNR8NKbcOf3685OTSjRg0UbzOIIxtVCWkfc91bYAv5YrLqXdIvh3HT6KsnaM2HnAND9R5TFxbHrCImEok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Pob29YA9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 559C4C4CEE7;
	Mon, 28 Jul 2025 04:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753676319;
	bh=vEJb4o0t3khHJpgtG8gkcYUb1C8wJPZ4Z5J84HGPSRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pob29YA9dNfsOZRSQxrwdQxnICzwXI3+OzA6j1KOFZOtxEWDxSqfcKO+bvaEzJVyn
	 WOIZZnjgamV28WzrwEBJPDesElZ4uvC7iMjvLojIXaQgk0WjCueVJVzilfHNHjOoio
	 auiC+1uaHIw7uC81TE0oOZiWpF+wxKRxXEf50w7g=
Date: Mon, 28 Jul 2025 06:18:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-usb@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Vinod Koul <vkoul@kernel.org>, stable@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] usb: renesas-xhci: Fix External ROM access timeouts
Message-ID: <2025072828-suspect-work-12ca@gregkh>
References: <20250727154516.11599-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250727154516.11599-1-marek.vasut+renesas@mailbox.org>

On Sun, Jul 27, 2025 at 05:44:16PM +0200, Marek Vasut wrote:
> Increase the External ROM access timeouts to prevent failures during
> programming of External SPI EEPROM chips. The current timeouts are
> too short for some SPI EEPROMs used with uPD720201 controllers.
> 
> The current timeout for Chip Erase in renesas_rom_erase() is 100 ms ,
> the current timeout for Sector Erase issued by the controller before
> Page Program in renesas_fw_download_image() is also 100 ms. Neither
> timeout is sufficient for e.g. the Macronix MX25L5121E or MX25V5126F.
> 
> MX25L5121E reference manual [1] page 35 section "ERASE AND PROGRAMMING
> PERFORMANCE" and page 23 section "Table 8. AC CHARACTERISTICS (Temperature
> = 0°C to 70°C for Commercial grade, VCC = 2.7V ~ 3.6V)" row "tCE" indicate
> that the maximum time required for Chip Erase opcode to complete is 2 s,
> and for Sector Erase it is 300 ms .
> 
> MX25V5126F reference manual [2] page 47 section "13. ERASE AND PROGRAMMING
> PERFORMANCE (2.3V - 3.6V)" and page 42 section "Table 8. AC CHARACTERISTICS
> (Temperature = -40°C to 85°C for Industrial grade, VCC = 2.3V - 3.6V)" row
> "tCE" indicate that the maximum time required for Chip Erase opcode to
> complete is 3.2 s, and for Sector Erase it is 400 ms .
> 
> Update the timeouts such, that Chip Erase timeout is set to 5 seconds,
> and Sector Erase timeout is set to 500 ms. Such lengthy timeouts ought
> to be sufficient for majority of SPI EEPROM chips.
> 
> [1] https://www.macronix.com/Lists/Datasheet/Attachments/8634/MX25L5121E,%203V,%20512Kb,%20v1.3.pdf
> [2] https://www.macronix.com/Lists/Datasheet/Attachments/8750/MX25V5126F,%202.5V,%20512Kb,%20v1.1.pdf
> 
> Fixes: 2478be82de44 ("usb: renesas-xhci: Add ROM loader for uPD720201")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Mathias Nyman <mathias.nyman@intel.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: <stable@vger.kernel.org>
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> ---
>  drivers/usb/host/xhci-pci-renesas.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-pci-renesas.c b/drivers/usb/host/xhci-pci-renesas.c
> index 620f8f0febb8..86df80399c9f 100644
> --- a/drivers/usb/host/xhci-pci-renesas.c
> +++ b/drivers/usb/host/xhci-pci-renesas.c
> @@ -47,8 +47,9 @@
>  #define RENESAS_ROM_ERASE_MAGIC				0x5A65726F
>  #define RENESAS_ROM_WRITE_MAGIC				0x53524F4D
>  
> -#define RENESAS_RETRY	10000
> -#define RENESAS_DELAY	10
> +#define RENESAS_RETRY			50000	/* 50000 * RENESAS_DELAY ~= 500ms */
> +#define RENESAS_CHIP_ERASE_RETRY	500000	/* 500000 * RENESAS_DELAY ~= 5s */
> +#define RENESAS_DELAY			10
>  
>  #define RENESAS_FW_NAME	"renesas_usb_fw.mem"
>  
> @@ -407,7 +408,7 @@ static void renesas_rom_erase(struct pci_dev *pdev)
>  	/* sleep a bit while ROM is erased */
>  	msleep(20);
>  
> -	for (i = 0; i < RENESAS_RETRY; i++) {
> +	for (i = 0; i < RENESAS_CHIP_ERASE_RETRY; i++) {
>  		retval = pci_read_config_byte(pdev, RENESAS_ROM_STATUS,
>  					      &status);
>  		status &= RENESAS_ROM_STATUS_ERASE;
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

