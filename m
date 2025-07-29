Return-Path: <linux-renesas-soc+bounces-19735-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 490A9B1501B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Jul 2025 17:21:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98953189C59A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Jul 2025 15:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306EA292B43;
	Tue, 29 Jul 2025 15:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XmRM8d1s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA864292B3D;
	Tue, 29 Jul 2025 15:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753802466; cv=none; b=iXHTUNzssjmAV5iu4DOSK4HAXs3CaaLXHoKDRxG6g7lhcR7gaAFEmjeUmKhGUh2LwWU/sx1K1+J+9BxzDqV8vgSrBQBiotWb4rxKqXmJ8WL9waV7QYWFby/s2geTYYxKr5Wmm2uyfT/yHC0jbxIa0/WiOEA11UgUltP7mytj5WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753802466; c=relaxed/simple;
	bh=PJ605ARQguDhCFZo50hkDMxiA0Q8GgGg9/9dBOXj6aA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IuRl9bjVvdRlv/Yyk+cgcEAPgnkKxo+iF29HtEsr226HxBhqRhwf6XvUoX10z+dRmXvwUt+SPgq77XxeFh4gGNNT2Bx9a2kD82oj51S9TPZ8dwPWBSbGMkHNkRDTK4SDGWqF5ZcdTb8yumKxDMM2OxYk59YH+ManialC+ivlCpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XmRM8d1s; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753802464; x=1785338464;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PJ605ARQguDhCFZo50hkDMxiA0Q8GgGg9/9dBOXj6aA=;
  b=XmRM8d1sLZghxkedtGlKhzwnVDlX7nYc1ZuEWA31vePS+i88zLt83hMR
   5RFMZ92N1+OKWy6c1veWIlwskzDwbtnX++SFGdN/ZvK2SVhV0A6SoPD1i
   8vU9Z3f6CAK/3kvkrmPkYvIck3qi6/moWjk/3IsYM0zYZ/eYa6hTwfg3z
   VAavgZm9vRkGOQhDW9hjPd7SPI83hcPsNrmwqzgkpIQK4butiwtcajdFD
   vjqnsqlh2W4CLvaYXhU4HfDL5wAy4eh8mQJKHF6LniC2CsI2klws+4Tjx
   BIAJw97efhuwa46TDITCgbLS7LUO1QtnPzBUnN2EiRJ49ClP39eR2hRtX
   Q==;
X-CSE-ConnectionGUID: SjvUHwU/SS2LVhRqzhExPA==
X-CSE-MsgGUID: i2nGsHjBS96zqOonN4YzhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="59722810"
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; 
   d="scan'208";a="59722810"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 08:21:04 -0700
X-CSE-ConnectionGUID: qdbqXlTiRBKoHflU+LfHDg==
X-CSE-MsgGUID: EVyiJOoQQsGLC5ddS2b97Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; 
   d="scan'208";a="162308092"
Received: from mnyman-desk.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jul 2025 08:21:01 -0700
Message-ID: <c47814bf-85f0-4bd1-bc33-63f06b44d9c9@linux.intel.com>
Date: Tue, 29 Jul 2025 18:20:59 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: renesas-xhci: Fix External ROM access timeouts
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-usb@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>, Vinod Koul <vkoul@kernel.org>,
 stable@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250727154516.11599-1-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250727154516.11599-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27.7.2025 18.44, Marek Vasut wrote:
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
>   drivers/usb/host/xhci-pci-renesas.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-pci-renesas.c b/drivers/usb/host/xhci-pci-renesas.c
> index 620f8f0febb8..86df80399c9f 100644
> --- a/drivers/usb/host/xhci-pci-renesas.c
> +++ b/drivers/usb/host/xhci-pci-renesas.c
> @@ -47,8 +47,9 @@
>   #define RENESAS_ROM_ERASE_MAGIC				0x5A65726F
>   #define RENESAS_ROM_WRITE_MAGIC				0x53524F4D
>   
> -#define RENESAS_RETRY	10000
> -#define RENESAS_DELAY	10
> +#define RENESAS_RETRY			50000	/* 50000 * RENESAS_DELAY ~= 500ms */
> +#define RENESAS_CHIP_ERASE_RETRY	500000	/* 500000 * RENESAS_DELAY ~= 5s */
> +#define RENESAS_DELAY			10

No objection, just making sure author is aware that RENESAS_RETRY is used in
_seven_ for loops, and this change will increase the timeout five-fold for
all of them.

Thanks
Mathias


