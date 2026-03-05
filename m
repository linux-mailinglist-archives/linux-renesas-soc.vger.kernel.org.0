Return-Path: <linux-renesas-soc+bounces-28842-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SH7LBLsvqWmO2wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28842-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 08:24:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D29020C9BC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 08:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6DADD3018C20
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 07:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3BC230F92D;
	Thu,  5 Mar 2026 07:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lnfaComR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFAF191F91;
	Thu,  5 Mar 2026 07:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772695480; cv=none; b=qj2FtqYCZT04UzEHqbAXZnwKajDQK90eijJsOdCael5oI/5+YGhrERdkp0GuP9gMrqZsQfwxgkLdYDXEuELxGXuob72giSJFm/A/WussW4mo8+xHOC46a+Tjbw6kBOk4trxauPIBJnx5Fi+zSlxADbetRomzmKDrzZXVAwHBcaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772695480; c=relaxed/simple;
	bh=SqAxJif48hn5wMCG4M87dJcdnDhhNcOcYRdFJfc8YDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cm5K3fIH8SJYnQCs31l59uFD8KUdwMcGCL6KW8f2ABiyyg0AVBXr2pta42Y4N1XsVtCyQjnFx4ImZdLTViafYK1WbQR8P2eQYmKxMWZLyqMYkWhefjtvdJaiSabbRxrWR+zclSCUMkEVQF/E0SyCrOnIPsrysEaB8OUruER32W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lnfaComR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A51ABC116C6;
	Thu,  5 Mar 2026 07:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772695480;
	bh=SqAxJif48hn5wMCG4M87dJcdnDhhNcOcYRdFJfc8YDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lnfaComR5UCb151SD6jDFra15uT8o/zUc66FlKXSyBKpa/mkNwVTpOZ9sfomEKYIq
	 ObYqO+wc2ML3Oi8OH6JiD2+i8hoVNL60NioUMu57HLF5ObCNlgdtnJq37VIAjD6T3A
	 dUe2JWDLHhx9AftYUqOPbxCCCa18TigUYefJEPEA8wF8x/QR8hwWoCux8Prqm9mVy1
	 xee0D8ycpoXFebufVAS8ATObgmSY4sAh4qRvAE0ReW+aX43s9ex8rF3eOIMnRwhqFa
	 yyqGjSgTyZQNGllxhd+Yo7xFJ8pzu3AXnUiY7TbZ1WBvrEHVA6SLLv5fBK0s3Szl+B
	 TFq3RRwJxUX3A==
Date: Thu, 5 Mar 2026 12:54:24 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 3/9] pci: pwrctrl: rename pci-pwrctrl-slot as generic
Message-ID: <twcdswrgibd3ydrb7ebmxdmyfi32c7yamii6pmrthiecryiyyt@3o6nexlweyzv>
References: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-0-1ad79caa1efa@linaro.org>
 <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-3-1ad79caa1efa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-3-1ad79caa1efa@linaro.org>
X-Rspamd-Queue-Id: 7D29020C9BC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28842-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 04:04:42PM +0100, Neil Armstrong wrote:
> The driver is pretty generic and would fit for either
> PCI Slots or endpoints connected to PCI ports, so rename
> the driver and module as pci-pwrctrl-generic.
> 
> Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

One comment below, but that can be fixed while applying. So,

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

> ---
>  drivers/pci/controller/dwc/Kconfig |   4 +-
>  drivers/pci/pwrctrl/Kconfig        |  13 ++--
>  drivers/pci/pwrctrl/Makefile       |   4 +-
>  drivers/pci/pwrctrl/generic.c      | 139 +++++++++++++++++++++++++++++++++++++
>  drivers/pci/pwrctrl/slot.c         | 137 ------------------------------------
>  5 files changed, 150 insertions(+), 147 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index d0aa031397fa..4bd36e133ca6 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -309,7 +309,7 @@ config PCIE_QCOM
>  	select CRC8
>  	select PCIE_QCOM_COMMON
>  	select PCI_HOST_COMMON
> -	select PCI_PWRCTRL_SLOT
> +	select PCI_PWRCTRL_GENERIC
>  	help
>  	  Say Y here to enable PCIe controller support on Qualcomm SoCs. The
>  	  PCIe controller uses the DesignWare core plus Qualcomm-specific
> @@ -431,7 +431,7 @@ config PCIE_SPACEMIT_K1
>  	depends on ARCH_SPACEMIT || COMPILE_TEST
>  	depends on HAS_IOMEM
>  	select PCIE_DW_HOST
> -	select PCI_PWRCTRL_SLOT
> +	select PCI_PWRCTRL_GENERIC
>  	default ARCH_SPACEMIT
>  	help
>  	  Enables support for the DesignWare based PCIe controller in
> diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
> index cd3aa15bad00..ff67bec5b500 100644
> --- a/drivers/pci/pwrctrl/Kconfig
> +++ b/drivers/pci/pwrctrl/Kconfig
> @@ -11,17 +11,18 @@ config PCI_PWRCTRL_PWRSEQ
>  	select POWER_SEQUENCING
>  	select PCI_PWRCTRL
>  
> -config PCI_PWRCTRL_SLOT
> -	tristate "PCI Power Control driver for PCI slots"
> +config PCI_PWRCTRL_GENERIC
> +	tristate "Generic PCI Power Control driver for PCI slots and endpoints"
>  	select POWER_SEQUENCING
>  	select PCI_PWRCTRL
>  	help
> -	  Say Y here to enable the PCI Power Control driver to control the power
> -	  state of PCI slots.
> +	  Say Y here to enable the generic PCI Power Control driver to control
> +	  the power state of PCI slots and endpoints.
>  
>  	  This is a generic driver that controls the power state of different
> -	  PCI slots. The voltage regulators powering the rails of the PCI slots
> -	  are expected to be defined in the devicetree node of the PCI bridge.
> +	  PCI slots and endpoints. The voltage regulators powering the rails
> +	  of the PCI slots or endpoints are expected to be defined in the
> +	  devicetree node of the PCI bridge.

'PCI bridge or endpoint'

- Mani

-- 
மணிவண்ணன் சதாசிவம்

