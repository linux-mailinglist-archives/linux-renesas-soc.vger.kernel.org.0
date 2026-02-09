Return-Path: <linux-renesas-soc+bounces-28065-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ASnD07YiWnfCQAAu9opvQ:T3
	(envelope-from <linux-renesas-soc+bounces-28065-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 13:51:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B3210F161
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 13:51:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA0F13012263
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Feb 2026 11:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 040FB36F41B;
	Mon,  9 Feb 2026 11:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lNE0sK87"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4000309F13;
	Mon,  9 Feb 2026 11:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770636718; cv=none; b=s9/cZqGL8AQ5ZitLaWxqQC2sG23uzKx7ff5xlmdarrkdaqJLNTbZ1vjIvqBsGsfLNtMA/UusDuyjuN60yF0E1Kswj5A/tkhmPgrj5PYV15dHZwIO1IPgmTLGsgDo2Qh0Sv7YNuW81ckoIV1sxCTm4NEXhZWP75VgDZg2tjHSmNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770636718; c=relaxed/simple;
	bh=IzsSg4wlaPkah4/tNrZ7OVhwcyrh9IEAANSOQnMpZPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eeebEn+HJW0iTSbgDlsiyrnqLStfWWzi9kCcFs9SVC7/KDSaro/moYbFH547fpy3SI8gNXAp+61S+ipsW7bbxxXluzYe0fmem1rtI9nKMQBuqbb3dUTqFauAL1CVIoYT+P2jsOqp0WCVya1bvtZaD28EdnH4S+35XDZNITfPOEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lNE0sK87; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43548C116C6;
	Mon,  9 Feb 2026 11:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770636718;
	bh=IzsSg4wlaPkah4/tNrZ7OVhwcyrh9IEAANSOQnMpZPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lNE0sK87h+lDPkMAAP0oswud6Fa5ssc+ib1XdE0HBhnPIx4CqpckDXy6pJrB9Uwqm
	 R2wk+T6nGbu5yBZgW/63cr8XbWhNqPQOJ5SwoqXOFIp4jfxSwC8LE17WeAj7ZSkJu0
	 hZmRQYj03Sal3i8QoBrhBBgqOSN9pR6nrciR0nQ65g5yNbXxSivzK9Oz2q0xWj61Qz
	 ZO5RXdkU2VjhEIuAHXILDMfBG7o0Y5K2Sa4DhypWI9qZt0cNjyDCGaeBP/4Svv3IRG
	 O8fb7ZoWadbWFBVJ34Q9VGiuQx9fFloTBbEwKlRQgDvQzCunUaaxLAcYI40lTsQIDi
	 9KN/fnFNplldw==
Date: Mon, 9 Feb 2026 17:01:48 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 3/9] pci: pwrctrl: rename pci-pwrctrl-slot as generic
Message-ID: <n4hgyepoiqwyu665ds2tkijmdk7d52symfozvpgch3nxbdehwr@hiabvjpbu2re>
References: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-0-5b79c5d61a03@linaro.org>
 <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-3-5b79c5d61a03@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-3-5b79c5d61a03@linaro.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28065-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com,vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 98B3210F161
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 03:50:31PM +0100, Neil Armstrong wrote:
> The driver is pretty generic and would fit for either
> PCI Slots or PCI devices connected to PCI ports, so rename
> the driver and module as pci-pwrctrl-generic.
> 
> Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/pci/pwrctrl/Kconfig               | 8 ++++----
>  drivers/pci/pwrctrl/Makefile              | 4 ++--
>  drivers/pci/pwrctrl/{slot.c => generic.c} | 0
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
> index e0f999f299bb..0a93ac4cd11b 100644
> --- a/drivers/pci/pwrctrl/Kconfig
> +++ b/drivers/pci/pwrctrl/Kconfig
> @@ -11,12 +11,12 @@ config PCI_PWRCTRL_PWRSEQ
>  	select POWER_SEQUENCING
>  	select PCI_PWRCTRL
>  
> -config PCI_PWRCTRL_SLOT
> -	tristate "PCI Power Control driver for PCI slots"
> +config PCI_PWRCTRL_GENERIC
> +	tristate "Generic PCI Power Control driver for PCI slots"

s/slots/slots and endpoints

>  	select PCI_PWRCTRL
>  	help
> -	  Say Y here to enable the PCI Power Control driver to control the power
> -	  state of PCI slots.
> +	  Say Y here to enable the generic PCI Power Control driver to control
> +	  the power state of PCI slots.

s/slots/slots and endpoints.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

