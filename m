Return-Path: <linux-renesas-soc+bounces-34572-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EjCRO0TtQ2qzlgoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34572-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 18:22:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 859416E664E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 18:22:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dul5b6bc;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34572-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34572-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 373DD302284B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 16:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845E04779BF;
	Tue, 30 Jun 2026 16:22:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B591411687;
	Tue, 30 Jun 2026 16:22:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782836545; cv=none; b=fZ/ZZnHQrubUgiBkAskyQd8/ighmbYBMYE3j9+Pe/9skhJfejmcVXRVRgOn9egv6bDRMtzcSzAes6hlP288poTskULOPS6JOavlqAmBm/HsZj4FBClOH3yizb47S0jE9ofAIz4zwwEvhbgAmZVys77DBFkeOHYBnsYDQHlYcJUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782836545; c=relaxed/simple;
	bh=yomOaMMl+vcnji15fJRLYYv6WVklrScE4szp52y4iTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C1WGauKAkYv3QAs9aDN51QRu37Bn8oIG7CpKH6Fg8/v5Hr/3XkYz0zyc4dEkd/ftVQMAMhmmoKebuPhTR+m2PxjAZx4Snq4LYzp4cgUBnFV6pkbRAg/+m4W5/51GwttbkgrGfTvdHjkx1BPSNQgNko/N8gniOF0Qt4AcGyqgono=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dul5b6bc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8681F000E9;
	Tue, 30 Jun 2026 16:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782836543;
	bh=sslHSl9vky2DIRPZzDKqYfXMiyTPmeA8uuP0XK5gK7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dul5b6bcSmqXLVoo6tIeMdmES/vM+PkaSomaF+A3lC8ejOh+Po+qF6DKRh7QRQ2qj
	 RNt5b/KsKki68SFNDJku6wPb9CW+ZISWaf0sLRJDquJs7b1haH+BphobIlZQ/XsrxK
	 7E3ztX8E7Fe4NBFIGjf/w9wLbnZk4d6dZkciTmjJWFaotbV52J/Fblih8ggVQ3AfyZ
	 w9Ki3HlFWs5/xZeCkmZ2vLV+jhuhzcM6fttlAUrOL/P1tLzQNNB3zopW6CYS3jjrCV
	 y7Wuixcf3Ctz91L2/ZgKY6aqX969OGCbE8ZsQQCg3RbEHpHi0Lejl3t7SC7x1470r5
	 Bsvt3p8kOJEYw==
Date: Tue, 30 Jun 2026 18:22:09 +0200
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
Subject: Re: [PATCH v2 1/4] PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not
 used
Message-ID: <ck6i6tdw4ngde6vmtamfrvryg47ixycpmd74ny5hpzury5ekpr@ibgrw7o6uewj>
References: <20260618220427.14325-1-marek.vasut+renesas@mailbox.org>
 <20260618220427.14325-2-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260618220427.14325-2-marek.vasut+renesas@mailbox.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34572-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:linux-pci@vger.kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:maz@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 859416E664E

On Fri, Jun 19, 2026 at 12:01:59AM +0200, Marek Vasut wrote:
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

Same as patch 3, SoB chain is broken. Rest LGTM!

- Mani

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
> V2: Pull GITS_TRANSLATER address from DT, which also fixes missing +0x40
>     offset of the GITS_TRANSLATER register
> ---
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c | 118 +++++++++++++++++++-
>  1 file changed, 113 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index 8b03c42f8c84c..6300ab4dc38b3 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -13,8 +13,11 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> +#include <linux/irqchip/arm-gic-v3.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> @@ -31,6 +34,10 @@
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
> @@ -55,6 +62,14 @@
>  #define APP_HOLD_PHY_RST	BIT(16)
>  #define APP_LTSSM_ENABLE	BIT(0)
>  
> +/* INTC address */
> +#define AXIINTCADDR		0x0a00
> +
> +/* INTC control & mask */
> +#define AXIINTCCONT		0x0a04
> +#define INTC_EN			BIT(31)
> +#define INTC_MASK		GENMASK(11, 2)
> +
>  /* PCIe Power Management Control */
>  #define PCIEPWRMNGCTRL		0x0070
>  #define APP_CLK_REQ_N		BIT(11)
> @@ -305,13 +320,103 @@ static struct rcar_gen4_pcie *rcar_gen4_pcie_alloc(struct platform_device *pdev)
>  	return rcar;
>  }
>  
> +static int rcar_gen4_pcie_host_msi_addr(struct dw_pcie_rp *pp, u32 *msi_addr)
> +{
> +	struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
> +	struct device_node *msi_node = NULL;
> +	struct device *dev = dw->dev;
> +	struct resource res;
> +	u64 addr;
> +	int ret;
> +
> +	/*
> +	 * Either the "msi-parent" or the "msi-map" phandle needs to exist
> +	 * to obtain the MSI node.
> +	 */
> +	of_msi_xlate(dev, &msi_node, 0);
> +	if (!msi_node)
> +		return -ENODEV;
> +
> +	/* Check if "msi-parent" or the "msi-map" points to ARM GICv3 ITS. */
> +	if (!of_device_is_compatible(msi_node, "arm,gic-v3-its"))
> +		return dev_err_probe(dev, -ENODEV, "Compatible MSI controller not found\n");
> +
> +	/* Derive GITS_TRANSLATER address from GICv3 */
> +	ret = of_address_to_resource(msi_node, 0, &res);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "MSI controller resources not obtained\n");
> +
> +	addr = res.start + GITS_TRANSLATER;
> +	if (addr >= SZ_4G)
> +		return dev_err_probe(dev, -EINVAL, "MSI controller address above 32bit range\n");
> +
> +	*msi_addr = addr;
> +	return 0;
> +}
> +
> +static int rcar_gen4_pcie_host_msi_init(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
> +	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
> +	u32 val;
> +	int ret;
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
> +		/* Clear AXIINTC mapping. */
> +		writel(0, rcar->base + AXIINTCADDR);
> +		writel(0, rcar->base + AXIINTCCONT);
> +	} else {
> +		ret = rcar_gen4_pcie_host_msi_addr(pp, &val);
> +		if (ret)
> +			goto err;
> +
> +		/* Point AXIINTC to GIC ITS and enable. */
> +		writel(val, rcar->base + AXIINTCADDR);
> +		writel(INTC_EN | INTC_MASK, rcar->base + AXIINTCCONT);
> +	}
> +
> +	/* Configure MSI interrupt signal */
> +	val = readl(rcar->base + PCIEINTSTS0EN);
> +	if (pci_msi_enabled())
> +		val |= MSI_CTRL_INT;
> +	else
> +		val &= ~MSI_CTRL_INT;
> +	writel(val, rcar->base + PCIEINTSTS0EN);
> +
> +	return 0;
> +
> +err:
> +	/* Deconfigure MSICAP0 MSIE. */
> +	val = dw_pcie_readl_dbi(dw, MSICAP0);
> +	val &= ~MSICAP0_MSIE;
> +	dw_pcie_writel_dbi(dw, MSICAP0, val);
> +
> +	/* Clear AXIINTC mapping. */
> +	writel(0, rcar->base + AXIINTCADDR);
> +	writel(0, rcar->base + AXIINTCCONT);
> +
> +	/* Deconfigure MSI interrupt signal */
> +	val = readl(rcar->base + PCIEINTSTS0EN);
> +	val &= ~MSI_CTRL_INT;
> +	writel(val, rcar->base + PCIEINTSTS0EN);
> +
> +	return ret;
> +}
> +
>  /* Host mode */
>  static int rcar_gen4_pcie_host_init(struct dw_pcie_rp *pp)
>  {
>  	struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
>  	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
>  	int ret;
> -	u32 val;
>  
>  	gpiod_set_value_cansleep(dw->pe_rst, 1);
>  
> @@ -328,16 +433,19 @@ static int rcar_gen4_pcie_host_init(struct dw_pcie_rp *pp)
>  	dw_pcie_writel_dbi2(dw, PCI_BASE_ADDRESS_0, 0x0);
>  	dw_pcie_writel_dbi2(dw, PCI_BASE_ADDRESS_1, 0x0);
>  
> -	/* Enable MSI interrupt signal */
> -	val = readl(rcar->base + PCIEINTSTS0EN);
> -	val |= MSI_CTRL_INT;
> -	writel(val, rcar->base + PCIEINTSTS0EN);
> +	ret = rcar_gen4_pcie_host_msi_init(pp);
> +	if (ret)
> +		goto err;
>  
>  	msleep(PCIE_T_PVPERL_MS);	/* pe_rst requires 100msec delay */
>  
>  	gpiod_set_value_cansleep(dw->pe_rst, 0);
>  
>  	return 0;
> +
> +err:
> +	rcar_gen4_pcie_common_deinit(rcar);
> +	return ret;
>  }
>  
>  static void rcar_gen4_pcie_host_deinit(struct dw_pcie_rp *pp)
> -- 
> 2.53.0
> 

-- 
மணிவண்ணன் சதாசிவம்

