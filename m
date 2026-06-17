Return-Path: <linux-renesas-soc+bounces-34135-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1Y9RHXh5Mmob0gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34135-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 12:39:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F638698965
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 12:39:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=N37b7Ihg;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34135-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34135-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CCFC431FE9ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 10:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415E2404BFA;
	Wed, 17 Jun 2026 10:33:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6519E405C2D;
	Wed, 17 Jun 2026 10:33:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692431; cv=none; b=As4SCwW+oAbzcfp3P95FARWZ3Y5ne4ftZdJK5BftXlw07WMaU4uj2Eorzt/TTMOh0TAx3F1qYb6nVKY844GtYbD9VqU5lEwaIxFGHBAjIg36iwqR9eSp6sZNOjrjk1lPZ/WuUu7p18KkaDqFjAzKPaZ7Chz/cUz6SLn1oKuyLB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692431; c=relaxed/simple;
	bh=IOTXUH576NXlSthhVuzvANvakjDYSXmiJ5wl6Xy6Df4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDQhli6xhwsMQXc2VdTotm1V1RUFpehUDEaofkhjNnwHw5bW08Dei7lLDBwEjd013xaWgCMhFbejfggsNhEueo9ZBAph0H/nTUxVkKG01iPqCMB884FakTpMV4xoNqIPEnqrKDJtSAa6JdhGV+WuCBDaw+TD4SpaZYP9+xySZjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N37b7Ihg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 749A61F000E9;
	Wed, 17 Jun 2026 10:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781692429;
	bh=szLE0S72oFPtCHbqy6RYhj+xzfkKN142/ocsCt11p94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N37b7IhgoLv0nxsiTXFRbKaFHlR4HBRYKnrPzolbj6l4lHrypkiYiRraYPnPdiubo
	 mKX35W+0Fmhe6GwAubfGWzQWrwAGV87fmOeAlG0NnfsiiNNXzXkTTMyTt3dSDWHSLI
	 WQaNuRFAaxGAFo1gwCbVJAOtA6yEab3oT8GxxiML/HK3sToP8Ru5ugvj4jtucO8cp7
	 Bp02jPEYrbv1etezulBk/di4LkHhR4eSduZBgOlvzIK7GV6DpUVSRV3RFSUIGDPVqB
	 XOXbDPaXbzxDMGb34jsJzWBqpbp4/k6tM8ZbGC99oiJI51tWsVgeSper9fg1cJxUne
	 KMateyyg0kgWQ==
Date: Wed, 17 Jun 2026 12:33:39 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
Message-ID: <lstafqaogzunb2azyqwvtt3swrk42nu3n5zyct2la5fqxomaqg@wyrz3qolhist>
References: <20260617030008.154449-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260617030008.154449-1-marek.vasut+renesas@mailbox.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:linux-pci@vger.kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:maz@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34135-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,arm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F638698965

On Wed, Jun 17, 2026 at 04:59:44AM +0200, Marek Vasut wrote:
> In case MSI are enabled, but DWC built-in iMSI-RX is not in use, the
> MSI are handled via GIC ITS. Configure all controller MSI registers
> fully.
> 
> Set or clear MSI capability register MSICAP0 MSI enable MSIE bit and
> PCIe Interrupt Status 0 Enable register PCIEINTSTS0EN MSI interrupt
> enable MSI_CTRL_INT bit according to MSI enable state, set both bits
> if MSI are enabled, clear both bits if MSI are disabled.
> 
> If MSI are disabled, or MSI are enabled and iMSI-RX is used, then
> deconfigure AXIINTCADDR and AXIINTCCONT to 0, which disables any
> pass through of MSI TLPs onto the AXI bus and then further into
> GIC ITS translation registers.
> 
> If MSI are enabled and iMSI-RX is not used, the configure AXIINTCADDR
> with target address of GIC ITS translation registers, and configure
> AXIINTCCONT to enable MSI TLP pass through onto AXI bus and into the
> GIC ITS. This specific configuration allows handling of MSI via the
> GIC ITS instead of integrated iMSI-RX.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> NOTE: This would not be possible without prior work from Shimoda-san
> ---
> Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c | 53 +++++++++++++++++++--
>  1 file changed, 48 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index 485cfa8bd9692..ba6e3bedd6d0a 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -31,6 +31,10 @@
>  #define DEVICE_TYPE_RC		BIT(4)
>  #define BIFUR_MOD_SET_ON	BIT(0)
>  
> +/* MSI Capability */
> +#define MSICAP0			0x0050
> +#define MSICAP0_MSIE		BIT(16)
> +
>  /* PCIe Interrupt Status 0 */
>  #define PCIEINTSTS0		0x0084
>  
> @@ -55,6 +59,16 @@
>  #define APP_HOLD_PHY_RST	BIT(16)
>  #define APP_LTSSM_ENABLE	BIT(0)
>  
> +/* INTC address */
> +#define AXIINTCADDR		0x0a00
> +/* GITS GIC ITS translation register */
> +#define AXIINTCADDR_VAL		0xf1050000

As Marc pointed out, this address should be fetched from DT, not hardcoded in
the driver.

> +
> +/* INTC control & mask */
> +#define AXIINTCCONT		0x0a04
> +#define INTC_EN			BIT(31)
> +#define INTC_MASK		GENMASK(11, 2)
> +
>  /* PCIe Power Management Control */
>  #define PCIEPWRMNGCTRL		0x0070
>  #define APP_CLK_REQ_N		BIT(11)
> @@ -305,6 +319,39 @@ static struct rcar_gen4_pcie *rcar_gen4_pcie_alloc(struct platform_device *pdev)
>  	return rcar;
>  }
>  
> +static void rcar_gen4_pcie_host_msi_init(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
> +	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
> +	u32 val;
> +
> +	/* Make sure MSICAP0 MSIE is configured. */
> +	val = dw_pcie_readl_dbi(dw, MSICAP0);
> +	if (pci_msi_enabled())
> +		val |= MSICAP0_MSIE;
> +	else
> +		val &= ~MSICAP0_MSIE;
> +	dw_pcie_writel_dbi(dw, MSICAP0, val);
> +
> +	if (!pci_msi_enabled() || pp->use_imsi_rx) {

If MSI is not enabled, then what's the point in clearing these registers (also
above)? I see it as a redundant code. Is there a necessity to clear them?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

