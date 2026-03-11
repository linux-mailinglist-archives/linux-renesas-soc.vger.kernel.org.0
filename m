Return-Path: <linux-renesas-soc+bounces-29176-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kL94KGcNsWldqAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29176-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 07:36:23 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B65025CE9B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 07:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AA5C7301C8F9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 06:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63CC2BEC5E;
	Wed, 11 Mar 2026 06:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fJYnITz2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6CC28CF4A;
	Wed, 11 Mar 2026 06:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773210977; cv=none; b=bSxu1VO256dNP+eYR9Z2FSGr4mO56EuOOXO9T5TbrBkhIx39WPJ6plhqAp33M8PB6oF11SyOmJkiRWa9Ge4SvL92gawmLxbpRSNAth2TUvWNFlXz5zYE5TWdVsHvXsuDg1dokR1X/7QxFlf2gJUiLT4HY/DF1haqq1RZ7HSnrr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773210977; c=relaxed/simple;
	bh=AaTYLl8pCEA3iXBWjihENeLR+q/W7z4IGa5dYA772EQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwiZMKRpkXMr7XPPmgeGlLQ2IwHNtfV5YErwFsOXBaWzQqh2EZ8V+BR2I4VUyWkooQjjh+4tsBS6gMHTcTd9kc2lfH7EvGurOnJNWCPRxwJ0vfyWlYlREsjy7niGHf8mjvN1aC02tHivz0C0rxJL5p8Elg9ARR3l0fk+ONfu5ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fJYnITz2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B7FC4CEF7;
	Wed, 11 Mar 2026 06:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773210977;
	bh=AaTYLl8pCEA3iXBWjihENeLR+q/W7z4IGa5dYA772EQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fJYnITz2osAqv0HH//ILVmEPzzOf8UT4nPZBKqx+knGPqv1f6TRUA7INVPTOtfYNK
	 IHjDdoKMq+rQ544yAK1id8Ee6ZsB/exdPnLaFhET8oE574S0L8gaMeBlbV+5zD1brD
	 cAe0fcMTGl75c4tXnpOWH3rRvl/11IPJrgaD3cC9Afin7LOJ88FCUAm9bFg4hEKj80
	 8tpfoCkdZB7aFKkwCPC1yJwEf0+NuWUVID9a9HjqZL09Ql9ZO2InbKNq21PYiPTN4w
	 F4QPa6cWdA69B5knnhLRvTN4ot63Na+2vyccxLuTRkqeYKUnN3txDXUJpRTRvrtUYF
	 Ecc8eG//9Vlng==
Date: Wed, 11 Mar 2026 12:05:59 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, 
	Roy Zang <roy.zang@nxp.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Srikanth Thokala <srikanth.thokala@intel.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Marek Vasut <marek.vasut+renesas@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Manikanta Maddireddy <mmaddireddy@nvidia.com>, 
	Koichiro Den <den@valinux.co.jp>, Damien Le Moal <dlemoal@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/9] PCI: endpoint: Introduce pci_epc_bar_type
 BAR_64BIT_UPPER
Message-ID: <dtxdgxrewfby5hu3cu3pu5kljylm627uc43sw75gk7loimmm6r@ei4w6wmqgd6a>
References: <20260302095913.48155-11-cassel@kernel.org>
 <20260302095913.48155-12-cassel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260302095913.48155-12-cassel@kernel.org>
X-Rspamd-Queue-Id: 9B65025CE9B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29176-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,google.com,intel.com,gmail.com,nvidia.com,socionext.com,renesas.com,glider.be,valinux.co.jp,lists.ozlabs.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,nxp.com:email,nvidia.com:email,valinux.co.jp:email]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 10:59:13AM +0100, Niklas Cassel wrote:
> Add a pci_epc_bar_type BAR_64BIT_UPPER to more clearly differentiate from
> BAR_RESERVED.
> 
> This BAR type will only be used for a BAR following a "only_64bit" BAR.
> 
> This makes the BAR description more clear, and the reader does no longer
> need to check the BAR type for the preceding BAR to know how to interpret
> the BAR type.
> 

I find the naming a bit confusing. How about BAR_64BIT_UPPER_BASE? This also
brings the question, do we really need to mark the preceding BAR? Why can't we
let the PCI EPC core to always assume that if the previous BAR has 'only_64bit'
bit set, next BAR cannot be used as a standalone 32bit BAR?

I find it weird or redundant to mark both BARs.

- Mani

> No functional changes.
> 
> Tested-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Tested-by: Koichiro Den <den@valinux.co.jp>
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>  drivers/pci/controller/dwc/pci-layerscape-ep.c |  4 ++--
>  drivers/pci/controller/dwc/pcie-keembay.c      |  6 +++---
>  drivers/pci/controller/dwc/pcie-qcom-ep.c      |  4 ++--
>  drivers/pci/controller/dwc/pcie-tegra194.c     |  2 +-
>  drivers/pci/controller/dwc/pcie-uniphier-ep.c  | 10 +++++-----
>  drivers/pci/controller/pcie-rcar-ep.c          |  6 +++---
>  drivers/pci/endpoint/pci-epc-core.c            |  3 ++-
>  include/linux/pci-epc.h                        |  5 ++++-
>  8 files changed, 22 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index a4a800699f89..5a03a8f895f9 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -251,9 +251,9 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
>  	pci->ops = pcie->drvdata->dw_pcie_ops;
>  
>  	ls_epc->bar[BAR_2].only_64bit = true;
> -	ls_epc->bar[BAR_3].type = BAR_RESERVED;
> +	ls_epc->bar[BAR_3].type = BAR_64BIT_UPPER;
>  	ls_epc->bar[BAR_4].only_64bit = true;
> -	ls_epc->bar[BAR_5].type = BAR_RESERVED;
> +	ls_epc->bar[BAR_5].type = BAR_64BIT_UPPER;
>  	ls_epc->linkup_notifier = true;
>  
>  	pcie->pci = pci;
> diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
> index 2666a9c3d67e..5a00b8cf5b53 100644
> --- a/drivers/pci/controller/dwc/pcie-keembay.c
> +++ b/drivers/pci/controller/dwc/pcie-keembay.c
> @@ -313,11 +313,11 @@ static const struct pci_epc_features keembay_pcie_epc_features = {
>  	.msi_capable		= true,
>  	.msix_capable		= true,
>  	.bar[BAR_0]		= { .only_64bit = true, },
> -	.bar[BAR_1]		= { .type = BAR_RESERVED, },
> +	.bar[BAR_1]		= { .type = BAR_64BIT_UPPER, },
>  	.bar[BAR_2]		= { .only_64bit = true, },
> -	.bar[BAR_3]		= { .type = BAR_RESERVED, },
> +	.bar[BAR_3]		= { .type = BAR_64BIT_UPPER, },
>  	.bar[BAR_4]		= { .only_64bit = true, },
> -	.bar[BAR_5]		= { .type = BAR_RESERVED, },
> +	.bar[BAR_5]		= { .type = BAR_64BIT_UPPER, },
>  	.align			= SZ_16K,
>  };
>  
> diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> index 18460f01b2c6..e55675b3840a 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> @@ -850,9 +850,9 @@ static const struct pci_epc_features qcom_pcie_epc_features = {
>  	.msi_capable = true,
>  	.align = SZ_4K,
>  	.bar[BAR_0] = { .only_64bit = true, },
> -	.bar[BAR_1] = { .type = BAR_RESERVED, },
> +	.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
>  	.bar[BAR_2] = { .only_64bit = true, },
> -	.bar[BAR_3] = { .type = BAR_RESERVED, },
> +	.bar[BAR_3] = { .type = BAR_64BIT_UPPER, },
>  };
>  
>  static const struct pci_epc_features *
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 06571d806ab3..31aa9a494dbc 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -1993,7 +1993,7 @@ static const struct pci_epc_features tegra_pcie_epc_features = {
>  	.msi_capable = true,
>  	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M,
>  			.only_64bit = true, },
> -	.bar[BAR_1] = { .type = BAR_RESERVED, },
> +	.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
>  	.bar[BAR_2] = { .type = BAR_RESERVED, },
>  	.bar[BAR_3] = { .type = BAR_RESERVED, },
>  	.bar[BAR_4] = { .type = BAR_RESERVED, },
> diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> index d52753060970..f873a1659592 100644
> --- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> @@ -426,9 +426,9 @@ static const struct uniphier_pcie_ep_soc_data uniphier_pro5_data = {
>  		.msix_capable = false,
>  		.align = 1 << 16,
>  		.bar[BAR_0] = { .only_64bit = true, },
> -		.bar[BAR_1] = { .type = BAR_RESERVED, },
> +		.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
>  		.bar[BAR_2] = { .only_64bit = true, },
> -		.bar[BAR_3] = { .type = BAR_RESERVED, },
> +		.bar[BAR_3] = { .type = BAR_64BIT_UPPER, },
>  		.bar[BAR_4] = { .type = BAR_RESERVED, },
>  		.bar[BAR_5] = { .type = BAR_RESERVED, },
>  	},
> @@ -445,11 +445,11 @@ static const struct uniphier_pcie_ep_soc_data uniphier_nx1_data = {
>  		.msix_capable = false,
>  		.align = 1 << 12,
>  		.bar[BAR_0] = { .only_64bit = true, },
> -		.bar[BAR_1] = { .type = BAR_RESERVED, },
> +		.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
>  		.bar[BAR_2] = { .only_64bit = true, },
> -		.bar[BAR_3] = { .type = BAR_RESERVED, },
> +		.bar[BAR_3] = { .type = BAR_64BIT_UPPER, },
>  		.bar[BAR_4] = { .only_64bit = true, },
> -		.bar[BAR_5] = { .type = BAR_RESERVED, },
> +		.bar[BAR_5] = { .type = BAR_64BIT_UPPER, },
>  	},
>  };
>  
> diff --git a/drivers/pci/controller/pcie-rcar-ep.c b/drivers/pci/controller/pcie-rcar-ep.c
> index 657875ef4657..9b3f5391fabe 100644
> --- a/drivers/pci/controller/pcie-rcar-ep.c
> +++ b/drivers/pci/controller/pcie-rcar-ep.c
> @@ -440,13 +440,13 @@ static const struct pci_epc_features rcar_pcie_epc_features = {
>  	/* use 64-bit BARs so mark BAR[1,3,5] as reserved */
>  	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = 128,
>  			.only_64bit = true, },
> -	.bar[BAR_1] = { .type = BAR_RESERVED, },
> +	.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
>  	.bar[BAR_2] = { .type = BAR_FIXED, .fixed_size = 256,
>  			.only_64bit = true, },
> -	.bar[BAR_3] = { .type = BAR_RESERVED, },
> +	.bar[BAR_3] = { .type = BAR_64BIT_UPPER, },
>  	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = 256,
>  			.only_64bit = true, },
> -	.bar[BAR_5] = { .type = BAR_RESERVED, },
> +	.bar[BAR_5] = { .type = BAR_64BIT_UPPER, },
>  };
>  
>  static const struct pci_epc_features*
> diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
> index e546b3dbb240..1ad2f62963c8 100644
> --- a/drivers/pci/endpoint/pci-epc-core.c
> +++ b/drivers/pci/endpoint/pci-epc-core.c
> @@ -104,7 +104,8 @@ enum pci_barno pci_epc_get_next_free_bar(const struct pci_epc_features
>  
>  	for (i = bar; i < PCI_STD_NUM_BARS; i++) {
>  		/* If the BAR is not reserved, return it. */
> -		if (epc_features->bar[i].type != BAR_RESERVED)
> +		if (epc_features->bar[i].type != BAR_RESERVED &&
> +		    epc_features->bar[i].type != BAR_64BIT_UPPER)
>  			return i;
>  	}
>  
> diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
> index c021c7af175f..c22f8a6cf9a3 100644
> --- a/include/linux/pci-epc.h
> +++ b/include/linux/pci-epc.h
> @@ -192,12 +192,15 @@ struct pci_epc {
>   *		   NOTE: An EPC driver can currently only set a single supported
>   *		   size.
>   * @BAR_RESERVED: The BAR should not be touched by an EPF driver.
> + * @BAR_64BIT_UPPER: Should only be set on a BAR if the preceding BAR is marked
> + *		     as only_64bit.
>   */
>  enum pci_epc_bar_type {
>  	BAR_PROGRAMMABLE = 0,
>  	BAR_FIXED,
>  	BAR_RESIZABLE,
>  	BAR_RESERVED,
> +	BAR_64BIT_UPPER,
>  };
>  
>  /**
> @@ -207,7 +210,7 @@ enum pci_epc_bar_type {
>   * @only_64bit: if true, an EPF driver is not allowed to choose if this BAR
>   *		should be configured as 32-bit or 64-bit, the EPF driver must
>   *		configure this BAR as 64-bit. Additionally, the BAR succeeding
> - *		this BAR must be set to type BAR_RESERVED.
> + *		this BAR must be set to type BAR_64BIT_UPPER.
>   *
>   *		only_64bit should not be set on a BAR of type BAR_RESERVED.
>   *		(If BARx is a 64-bit BAR that an EPF driver is not allowed to
> -- 
> 2.53.0
> 

-- 
மணிவண்ணன் சதாசிவம்

