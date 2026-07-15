Return-Path: <linux-renesas-soc+bounces-35266-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +sLmLY6fV2pSYAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35266-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 16:56:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F15A975FA69
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 16:56:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=iqe6SMdp;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35266-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35266-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8E453566A03
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 14:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E6047DFAF;
	Wed, 15 Jul 2026 14:36:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9920947CC96;
	Wed, 15 Jul 2026 14:36:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784126177; cv=none; b=KEigJF0d/0oyD20g8M1Dtb4UMPyMla+88AA79J6mwHUvhdOVQz0kPoiOn4n/CZ/Kp1Q3lf7/ZoOFJc26D9YhSS+bmy17iIfYs6ExW744a95dZOfiZZM2W2mPOKJHlxlntmb/XJzIHF98Yz0EHCzasKS7Em+kqVAB1+hkOkjE9A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784126177; c=relaxed/simple;
	bh=77XOxyDYDjEyLwe07YaqSDYbq4HFjvL3XqxATZqnX/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XnUmI4fVjZ9EcvUIIGnOh1FBRnQHHNZQp9+OfPTrETXf4oJpAHH3cnENDBOE9wN/+3157kyFbHRuRDs2ZCNhmmBr4f2UlrcqFbCk1u/flAiO6bdqLl5Z0nLvz99WVw4PDK4Y3Gu4fHemPSHFzkeL8JC+GDTwOCmv+Lb4H8+ydw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqe6SMdp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48CF21F000E9;
	Wed, 15 Jul 2026 14:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784126175;
	bh=3JnfyHzBdaTsit2m6V8M0Hw8/jfJz/4wuqPOncLtSVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iqe6SMdpmxlxxdjxuCrUI2lTZgZmf4/X9u75gQcO4a1cxmIy0QLFVIdh6u4uV0zpe
	 Hx4ZyHX8CgA3zFH/cLGlouKG8oVuQzENhgfDGyYAD1hKltrxdY7Ho44YSV401Jai7y
	 B5pQjhugTnpXwpTz3dPr9RR/2eLt5qIakYEhJqXbrM/6wGFRIOiKMd/MoLM+8pSuJv
	 wluZyaa5wzztTmS8oPZbOX0Zsj65BluBVvSXDBNA2P8Ft2ujrCfuBDsxXbYrxw5ntr
	 3youB74XMGuZe159cbIXB8BkxRcPCPv+Jahj4DwYdIUXad/ZLpkjrukzSMfGeJ40Es
	 70srItUZKxtpw==
Date: Wed, 15 Jul 2026 16:36:07 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/5] PCI: dwc: rcar-gen4: Handle PERST via reset subsystem
Message-ID: <ceimnmpsyfmrkuvrrsgkjg3fk2yf7fj7z5ie3cj6vfyighatag@hyb3vr2nclpm>
References: <20260704202748.355708-1-marek.vasut+renesas@mailbox.org>
 <20260704202748.355708-5-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260704202748.355708-5-marek.vasut+renesas@mailbox.org>
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:linux-pci@vger.kernel.org,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:robh@kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-35266-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F15A975FA69
X-Rspamd-Action: no action

On Sat, Jul 04, 2026 at 10:25:03PM +0200, Marek Vasut wrote:
> Handle PERST via both GPIO and reset subsystem. On R-Car Gen4, the
> PERST signal is operated as a GPIO, on R-Car Gen5 it might only be
> accessible via SCMI reset via reset subsystem. Support both options.
> This is a preparatory patch for R-Car Gen5 support.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c | 42 +++++++++++++++++++--
>  1 file changed, 39 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index 05c22cc648135..186eedb33c27d 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -98,6 +98,7 @@ struct rcar_gen4_pcie {
>  	void __iomem *base;
>  	void __iomem *phy_base;
>  	struct platform_device *pdev;
> +	struct reset_control *perst;
>  	const struct rcar_gen4_pcie_drvdata *drvdata;
>  };
>  #define to_rcar_gen4_pcie(_dw)	container_of(_dw, struct rcar_gen4_pcie, dw)
> @@ -299,10 +300,27 @@ static void rcar_gen4_pcie_unprepare(struct rcar_gen4_pcie *rcar)
>  
>  static int rcar_gen4_pcie_get_resources(struct rcar_gen4_pcie *rcar)
>  {
> +	struct device *dev = rcar->dw.dev;
> +	struct reset_control *perst;
> +
>  	rcar->phy_base = devm_platform_ioremap_resource_byname(rcar->pdev, "phy");
>  	if (IS_ERR(rcar->phy_base))
>  		return PTR_ERR(rcar->phy_base);
>  
> +	rcar->perst = NULL;
> +	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
> +		perst = of_reset_control_get(of_port, "perst");
> +		if (IS_ERR(perst)) {
> +			if (PTR_ERR(perst) != -EPROBE_DEFER)
> +				dev_err(dev, "Failed to get PERST#\n");
> +			return PTR_ERR(perst);

return dev_err_probe(dev, PTR_ERR(perst), "Failed to get PERST#\n")?

> +		}
> +
> +		/* There is only one root port. */
> +		rcar->perst = perst;
> +		break;

It feels weird to see for_each_available_child_of_node_scoped() and then
breaking with first node. Maybe you can just use of_get_next_available_child().

> +	}
> +
>  	/* Renesas-specific registers */
>  	rcar->base = devm_platform_ioremap_resource_byname(rcar->pdev, "app");
>  
> @@ -425,6 +443,22 @@ static int rcar_gen4_pcie_host_msi_init(struct dw_pcie_rp *pp)
>  	return ret;
>  }
>  
> +static void rcar_gen4_pcie_host_perst(struct dw_pcie_rp *pp, int enable)
> +{

rcar_gen4_pcie_host_perst_assert(struct dw_pcie_rp *pp, bool assert)

> +	struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
> +	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
> +
> +	gpiod_set_value_cansleep(dw->pe_rst, enable);
> +
> +	if (!rcar->perst)
> +		return;
> +
> +	if (enable)
> +		reset_control_assert(rcar->perst);
> +	else
> +		reset_control_deassert(rcar->perst);
> +}
> +
>  /* Host mode */
>  static int rcar_gen4_pcie_host_init(struct dw_pcie_rp *pp)
>  {
> @@ -432,7 +466,7 @@ static int rcar_gen4_pcie_host_init(struct dw_pcie_rp *pp)
>  	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
>  	int ret;
>  
> -	gpiod_set_value_cansleep(dw->pe_rst, 1);
> +	rcar_gen4_pcie_host_perst(pp, 1);
>  
>  	ret = rcar_gen4_pcie_common_init(rcar);
>  	if (ret)
> @@ -453,7 +487,7 @@ static int rcar_gen4_pcie_host_init(struct dw_pcie_rp *pp)
>  
>  	msleep(PCIE_T_PVPERL_MS);	/* pe_rst requires 100msec delay */
>  
> -	gpiod_set_value_cansleep(dw->pe_rst, 0);
> +	rcar_gen4_pcie_host_perst(pp, 0);

rcar_gen4_pcie_host_perst_assert(pp, false)

>  
>  	return 0;
>  
> @@ -467,7 +501,7 @@ static void rcar_gen4_pcie_host_deinit(struct dw_pcie_rp *pp)
>  	struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
>  	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
>  
> -	gpiod_set_value_cansleep(dw->pe_rst, 1);
> +	rcar_gen4_pcie_host_perst(pp, 1);

rcar_gen4_pcie_host_perst_assert(pp, true)

>  	rcar_gen4_pcie_common_deinit(rcar);
>  }
>  
> @@ -671,6 +705,8 @@ static void rcar_gen4_pcie_remove(struct platform_device *pdev)
>  
>  	rcar_gen4_remove_dw_pcie(rcar);
>  	rcar_gen4_pcie_unprepare(rcar);
> +	if (rcar->perst)
> +		reset_control_put(rcar->perst);

I don't see reset_control_put() in any error paths of probe().

- Mani

-- 
மணிவண்ணன் சதாசிவம்

