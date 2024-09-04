Return-Path: <linux-renesas-soc+bounces-8710-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DB696C398
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2024 18:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 606291F25C82
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2024 16:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AD231DAC4A;
	Wed,  4 Sep 2024 16:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A8mqImkJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AA91DEFC2
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Sep 2024 16:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725466350; cv=none; b=F9ZvrGeLrrb2i/Hunf6x2HMO5bNj2mMPlqmGv3F0v4QcZUmqOTHQgVe02poouzMO3VH73stdk7KDrj5vyPZt5VMeVzbc1MrRn3kcI3pTg2C6VnET3599n2kJG8tvCiPEqLACJ1DX9GxWHU/AqMMv+p3Hh/ZcXtESGIDI3HtVIys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725466350; c=relaxed/simple;
	bh=XIrdNl81n2ueUxP61jfkDqb9eHeuiU9W2ygboJKNluE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCftbLcy6KUOiCAwgcvlOJya9Y9au6S6EL4T60LD7vJU5UGq/GI8LDcma5G9X5U5rhTiHxt9HYXsMPo8zGKR14EZ/9DPP1Z1bGk26lGizddyD66ylZYPczSW8bKWR9K79MxNgAIPqgqjKKQ+aymQ5V3eryQJyacVjc7Xhy+ERIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A8mqImkJ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71788bfe60eso106591b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Sep 2024 09:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725466348; x=1726071148; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dfbmz9k0x2e1DiRY5k8IfQ7qPC1hgc/W8gZHBVaX9Mw=;
        b=A8mqImkJU7j54M+7TB81cLXhgfLp1XmdCyKSgBfP/2JWldaQmwECgqfOi5E4X6ySDZ
         usYJD7Hyc5AJHfpNbL+QcAhGtfDaOb3D8fFoJbUw9Lts1By7sHxr6GzU9FJ8T4pmGt2r
         8i4meGHua1xdRTGkf8cMkvBLqbmB2+orL3mXLr6NBrz4MsabisAHModtj5WQsOIxCzxL
         HGNRdEmTt9q9U4rsc/P/IjImNLJmJHMnF0WgvszVqLOnX3Zpsi9yYzSU3hApfAfCVuII
         fLQcoaSR+AFLuLx7ZzHrCargRn/dPTrxhQhWvKOh2yFu/lcA2TQcgeGXDAHP91plRqvz
         dpxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725466348; x=1726071148;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dfbmz9k0x2e1DiRY5k8IfQ7qPC1hgc/W8gZHBVaX9Mw=;
        b=MY6woNZQonQfLqYv9liL/BXNyaHMfDpecAYz0bM+70WotB0WyZ5ZqOajGbQ4/f/9yr
         gjMty5XPuCV8dyesdTZRQPprXPvNbZg1Ie7xmtSTdia5Z3lPHkW2oiA6Nx1bmoTvr/pI
         jmJq+HBw6f4KG3cSmo32qnu3xMmvsmyzPTPu963/C/XAXX/ZACVp0X/0J+gcXFHwj5IZ
         XUpA/H5aWE+3QDLRwiQwsTVEjpNSXjvFDHII8/7ykTH3h+kPFW1QFLJwFft3UaW6QNLY
         8pGCGxCqITx6JXY4p31i/ZG6MrESesVkpGygu9ZfUVQQA4gKzMKEKRECiRXknMaQWPWA
         A2IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOeKs4GD8UC6ifPuT1MemH22PkOUy6oCwxdN5XqAm7IW5KqyVOIkuFXpOS/laSJ2MUFf9ZM+9IaLL43rYK0cvHtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgqU22mxtouNXPyS6chsGMVBcbUypjfD9VY/WBT4ukvXa3kv4v
	McWpG8rKnDKEvPxOelmMqeF9q74tYY8CM7eklEZHbQc+8UKIUHYandWIyui49Q==
X-Google-Smtp-Source: AGHT+IE4nOdsbVLkjfg7+f1hz8ml6mTr4hJCWmSjTw6j+23u7XhfDWWSl1ogaW5wCLdcXnHjLpgzZg==
X-Received: by 2002:a05:6a20:d04d:b0:1c4:d5f6:867e with SMTP id adf61e73a8af0-1cce10978a2mr21924470637.34.1725466347615;
        Wed, 04 Sep 2024 09:12:27 -0700 (PDT)
Received: from thinkpad ([120.60.128.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7177859a470sm1772639b3a.180.2024.09.04.09.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 09:12:27 -0700 (PDT)
Date: Wed, 4 Sep 2024 21:42:16 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Chuanhua Lei <lchuanhua@maxlinear.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	abel.vesa@linaro.org, johan+linaro@kernel.org,
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>
Subject: Re: [PATCH v6 1/4] PCI: dwc: Rename 'dw_pcie::link_gen' to
 'dw_pcie::max_link_speed'
Message-ID: <20240904161216.5zlwzf52za33wxoy@thinkpad>
References: <20240904-pci-qcom-gen4-stability-v6-0-ec39f7ae3f62@linaro.org>
 <20240904-pci-qcom-gen4-stability-v6-1-ec39f7ae3f62@linaro.org>
 <ZtiDwuz5jFDfGvi5@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtiDwuz5jFDfGvi5@lizhi-Precision-Tower-5810>

On Wed, Sep 04, 2024 at 11:58:58AM -0400, Frank Li wrote:
> On Wed, Sep 04, 2024 at 12:41:57PM +0530, Manivannan Sadhasivam wrote:
> > 'link_gen' field is now holding the maximum supported link speed set either
> > by the controller driver or by DT through 'max-link-speed' property.
> >
> > But the name 'link_gen' sounds like the negotiated link speed of the PCIe
> > link. So let's rename it to 'max_link_speed' to make it clear that it holds
> > the maximum supported link speed of the controller.
> >
> > NOTE: For the sake of clarity, I've used 'max_link_speed' instead of
> > 'max_link_gen'. Also the link speed and link generation values map 1:1.
> 
> Maybe a little confuse is about unit of max_link_speed. the word 'gen'
> (1, 2, 3...), we know it PCIe[1,2,3...].  But word "speed" look like should
> be some mHz.
> 

Ideally, the DT property should've used the definitions in pci.h, but it ended
up accepting the PCIe Gen version. Still, it is named as 'max-link-speed', so I
wanted to keept the same name for the variable.

- Mani

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> >
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pci-imx6.c        |  8 ++++----
> >  drivers/pci/controller/dwc/pcie-designware.c | 12 ++++++------
> >  drivers/pci/controller/dwc/pcie-designware.h |  2 +-
> >  drivers/pci/controller/dwc/pcie-intel-gw.c   |  4 ++--
> >  drivers/pci/controller/dwc/pcie-rcar-gen4.c  |  6 +++---
> >  5 files changed, 16 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> > index 964d67756eb2..ef12a4f31740 100644
> > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > @@ -847,12 +847,12 @@ static int imx6_pcie_start_link(struct dw_pcie *pci)
> >  	if (ret)
> >  		goto err_reset_phy;
> >
> > -	if (pci->link_gen > 1) {
> > +	if (pci->max_link_speed > 1) {
> >  		/* Allow faster modes after the link is up */
> >  		dw_pcie_dbi_ro_wr_en(pci);
> >  		tmp = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
> >  		tmp &= ~PCI_EXP_LNKCAP_SLS;
> > -		tmp |= pci->link_gen;
> > +		tmp |= pci->max_link_speed;
> >  		dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, tmp);
> >
> >  		/*
> > @@ -1386,8 +1386,8 @@ static int imx6_pcie_probe(struct platform_device *pdev)
> >  		imx6_pcie->tx_swing_low = 127;
> >
> >  	/* Limit link speed */
> > -	pci->link_gen = 1;
> > -	of_property_read_u32(node, "fsl,max-link-speed", &pci->link_gen);
> > +	pci->max_link_speed = 1;
> > +	of_property_read_u32(node, "fsl,max-link-speed", &pci->max_link_speed);
> >
> >  	imx6_pcie->vpcie = devm_regulator_get_optional(&pdev->dev, "vpcie");
> >  	if (IS_ERR(imx6_pcie->vpcie)) {
> > diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> > index 1b5aba1f0c92..86c49ba097c6 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware.c
> > @@ -166,8 +166,8 @@ int dw_pcie_get_resources(struct dw_pcie *pci)
> >  			return ret;
> >  	}
> >
> > -	if (pci->link_gen < 1)
> > -		pci->link_gen = of_pci_get_max_link_speed(np);
> > +	if (pci->max_link_speed < 1)
> > +		pci->max_link_speed = of_pci_get_max_link_speed(np);
> >
> >  	of_property_read_u32(np, "num-lanes", &pci->num_lanes);
> >
> > @@ -687,7 +687,7 @@ void dw_pcie_upconfig_setup(struct dw_pcie *pci)
> >  }
> >  EXPORT_SYMBOL_GPL(dw_pcie_upconfig_setup);
> >
> > -static void dw_pcie_link_set_max_speed(struct dw_pcie *pci, u32 link_gen)
> > +static void dw_pcie_link_set_max_speed(struct dw_pcie *pci, u32 max_link_speed)
> >  {
> >  	u32 cap, ctrl2, link_speed;
> >  	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> > @@ -696,7 +696,7 @@ static void dw_pcie_link_set_max_speed(struct dw_pcie *pci, u32 link_gen)
> >  	ctrl2 = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCTL2);
> >  	ctrl2 &= ~PCI_EXP_LNKCTL2_TLS;
> >
> > -	switch (pcie_link_speed[link_gen]) {
> > +	switch (pcie_link_speed[max_link_speed]) {
> >  	case PCIE_SPEED_2_5GT:
> >  		link_speed = PCI_EXP_LNKCTL2_TLS_2_5GT;
> >  		break;
> > @@ -1058,8 +1058,8 @@ void dw_pcie_setup(struct dw_pcie *pci)
> >  {
> >  	u32 val;
> >
> > -	if (pci->link_gen > 0)
> > -		dw_pcie_link_set_max_speed(pci, pci->link_gen);
> > +	if (pci->max_link_speed > 0)
> > +		dw_pcie_link_set_max_speed(pci, pci->max_link_speed);
> >
> >  	/* Configure Gen1 N_FTS */
> >  	if (pci->n_fts[0]) {
> > diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> > index 53c4c8f399c8..22765564f301 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > @@ -421,7 +421,7 @@ struct dw_pcie {
> >  	u32			type;
> >  	unsigned long		caps;
> >  	int			num_lanes;
> > -	int			link_gen;
> > +	int			max_link_speed;
> >  	u8			n_fts[2];
> >  	struct dw_edma_chip	edma;
> >  	struct clk_bulk_data	app_clks[DW_PCIE_NUM_APP_CLKS];
> > diff --git a/drivers/pci/controller/dwc/pcie-intel-gw.c b/drivers/pci/controller/dwc/pcie-intel-gw.c
> > index acbe4f6d3291..676d2aba4fbd 100644
> > --- a/drivers/pci/controller/dwc/pcie-intel-gw.c
> > +++ b/drivers/pci/controller/dwc/pcie-intel-gw.c
> > @@ -132,7 +132,7 @@ static void intel_pcie_link_setup(struct intel_pcie *pcie)
> >
> >  static void intel_pcie_init_n_fts(struct dw_pcie *pci)
> >  {
> > -	switch (pci->link_gen) {
> > +	switch (pci->max_link_speed) {
> >  	case 3:
> >  		pci->n_fts[1] = PORT_AFR_N_FTS_GEN3;
> >  		break;
> > @@ -252,7 +252,7 @@ static int intel_pcie_wait_l2(struct intel_pcie *pcie)
> >  	int ret;
> >  	struct dw_pcie *pci = &pcie->pci;
> >
> > -	if (pci->link_gen < 3)
> > +	if (pci->max_link_speed < 3)
> >  		return 0;
> >
> >  	/* Send PME_TURN_OFF message */
> > diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > index f0f3ebd1a033..00ad4832f2cf 100644
> > --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > @@ -141,10 +141,10 @@ static int rcar_gen4_pcie_start_link(struct dw_pcie *dw)
> >  	}
> >
> >  	/*
> > -	 * Require direct speed change with retrying here if the link_gen is
> > -	 * PCIe Gen2 or higher.
> > +	 * Require direct speed change with retrying here if the max_link_speed
> > +	 * is PCIe Gen2 or higher.
> >  	 */
> > -	changes = min_not_zero(dw->link_gen, RCAR_MAX_LINK_SPEED) - 1;
> > +	changes = min_not_zero(dw->max_link_speed, RCAR_MAX_LINK_SPEED) - 1;
> >
> >  	/*
> >  	 * Since dw_pcie_setup_rc() sets it once, PCIe Gen2 will be trained.
> >
> > --
> > 2.25.1
> >

-- 
மணிவண்ணன் சதாசிவம்

