Return-Path: <linux-renesas-soc+bounces-35265-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZtQLNWaYV2qhXgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35265-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 16:25:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D46175F58C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 16:25:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="QaCdr/Gv";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35265-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35265-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5042A3006466
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 14:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7894634887B;
	Wed, 15 Jul 2026 14:22:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45955334C3D;
	Wed, 15 Jul 2026 14:22:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125345; cv=none; b=lbZlMHqZq2UMWo6h7GkjWGf3quwMsvUmTwXct7VYZbD1PuhssPu8AK+J+Mmk5yHVEDkskoHZ6eCBe+nO/M0RBoHN1Fgs1c43yEfX8bw+jyGS83tiPi25MD0JuvU6n39qKHBBi2NhgbhprGrLN/qQ1nN2T3MCHCBE8YsgaGfJIeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125345; c=relaxed/simple;
	bh=BsUkFG4DRwXh63NZqlAgy1vqlB7HvzsnELEF79rUils=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STu0cMQvQiQ3rrs2QtdcwX/fhMPq0xoeAGrhdmxYk0Lk412+p1CDop9Tr9PHwDFtYGZZPExAQHPL8BgR++ocCPVeABo36K2G17DngSuj7g7iu1R8yeCEMagb0xX2ZPfNty9tCanx5XCMP1lEoja0U6V7tWwLzgyeYoIZEMNf7oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QaCdr/Gv; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF20F1F000E9;
	Wed, 15 Jul 2026 14:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784125343;
	bh=OWZwtTkmInlbNXZy7+CXrsb4ym/YoUrA6kxaCBeRrZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QaCdr/GvwO3p7wtLb4HNaxaw925qdpNgBQ1ovZVYaOQMKqRskrBgYAHA3Xo/l/Oqb
	 CQ7cGrr5jrDod+bm+RyPSKzwI9CpL2JMuvKAVknKaNGgkK3Qsbo4RI81j9M4d25ceS
	 iJY2XnNTfRn3roF4kpFMl9ArxinZMqevGf4NNxo/WcPIUZalHpAhIFkvAEcLLRpUeP
	 Z22fMC8/ppLJnF7psWndNBhYvRVEqK8ojqZ9wR61xK/dlbXm/1/L7+nScqtQ7fNh11
	 84cKf2cSZpd6mqcUk+/+H4v8WGMk9DRUfuxVphx3tOv9QKJyUUtOqsrzxB8pTb+sFN
	 gmxdZRUXgI3AA==
Date: Wed, 15 Jul 2026 16:22:16 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/5] PCI: dwc: rcar-gen4: Return error code from
 .additional_common_init
Message-ID: <k4huw3bsimjq5kyjweuwzksu5lc34rk5acbvxwhrt67tdwbom6@gx3lho54h6i6>
References: <20260704202748.355708-1-marek.vasut+renesas@mailbox.org>
 <20260704202748.355708-3-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260704202748.355708-3-marek.vasut+renesas@mailbox.org>
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
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
	TAGGED_FROM(0.00)[bounces-35265-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D46175F58C
X-Rspamd-Action: no action

On Sat, Jul 04, 2026 at 10:25:01PM +0200, Marek Vasut wrote:
> Return error code from .additional_common_init callback and check
> the error code. This is a preparatory patch for R-Car Gen5 support,
> which may return non-zero error code from .additional_common_init.
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
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index 5f7211b91ee5b..7625cd338262d 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -87,7 +87,7 @@ MODULE_FIRMWARE(RCAR_GEN4_PCIE_FIRMWARE_NAME);
>  
>  struct rcar_gen4_pcie;
>  struct rcar_gen4_pcie_drvdata {
> -	void (*additional_common_init)(struct rcar_gen4_pcie *rcar);
> +	int (*additional_common_init)(struct rcar_gen4_pcie *rcar);

Can you also rename this callback as init() and implementations as
rcar_gen4_pcie_{ep}_init()?

Though this callback is a grab-bag of various register settings, naming it as
just '.init()' will make it more readable and less redundant.

- Mani

>  	int (*ltssm_control)(struct rcar_gen4_pcie *rcar, bool enable);
>  	enum dw_pcie_device_mode mode;
>  };
> @@ -241,11 +241,16 @@ static int rcar_gen4_pcie_common_init(struct rcar_gen4_pcie *rcar)
>  	reset_control_status(dw->core_rsts[DW_PCIE_PWR_RST].rstc);
>  	fsleep(1000);
>  
> -	if (rcar->drvdata->additional_common_init)
> -		rcar->drvdata->additional_common_init(rcar);
> +	if (rcar->drvdata->additional_common_init) {
> +		ret = rcar->drvdata->additional_common_init(rcar);
> +		if (ret)
> +			goto err_deassert;
> +	}
>  
>  	return 0;
>  
> +err_deassert:
> +	reset_control_assert(dw->core_rsts[DW_PCIE_PWR_RST].rstc);
>  err_unprepare:
>  	clk_bulk_disable_unprepare(DW_PCIE_NUM_CORE_CLKS, dw->core_clks);
>  
> @@ -681,7 +686,7 @@ static int r8a779f0_pcie_ltssm_control(struct rcar_gen4_pcie *rcar, bool enable)
>  	return 0;
>  }
>  
> -static void rcar_gen4_pcie_additional_common_init(struct rcar_gen4_pcie *rcar)
> +static int rcar_gen4_pcie_additional_common_init(struct rcar_gen4_pcie *rcar)
>  {
>  	struct dw_pcie *dw = &rcar->dw;
>  	u32 val;
> @@ -695,6 +700,8 @@ static void rcar_gen4_pcie_additional_common_init(struct rcar_gen4_pcie *rcar)
>  	val = readl(rcar->base + PCIEPWRMNGCTRL);
>  	val |= APP_CLK_REQ_N | APP_CLK_PM_EN;
>  	writel(val, rcar->base + PCIEPWRMNGCTRL);
> +
> +	return 0;
>  }
>  
>  static void rcar_gen4_pcie_phy_reg_update_bits(struct rcar_gen4_pcie *rcar,
> -- 
> 2.53.0
> 

-- 
மணிவண்ணன் சதாசிவம்

