Return-Path: <linux-renesas-soc+bounces-3237-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 385818689EB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 08:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BB441C21C45
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 07:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D413955E63;
	Tue, 27 Feb 2024 07:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ldv9eMli"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5E954F9F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2024 07:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709019308; cv=none; b=M9Jz/h9pNbyHcpMe/aWD31pk0cfqBUyg9AwEm7LYW0a+NzvVG09GNVgAmLZAPnYfi3FfHqvJqRooOqLoSfJOt6rtkAAbyN9CQkiOOiX399XXFcKfCPHdLjF1b9tCRpYkJvvwG/sJaqo7gFMaWpTV9gN1Ux/UJFaFK5CTN3KGuKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709019308; c=relaxed/simple;
	bh=pAafngDaYgAut7R/eqNrFUqz29Ygcobextfawbs04io=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CsniwfA2zhXnrYwb69gFhcD8mbU1QEGV8IPDXj8mcui3u7HGo+5KznL6odnQMr8m9rCw7IYkkI1WkiTH3xhdMGQ2j6J8XH6sgn3egYe2zKM9Ssfxx3nsWJ+myfOzeiEOOfUPwimZMjUt0f95xdD5TOEyPNOQPirt7py5W5e2/aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ldv9eMli; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1dcb3e6ff3fso8962245ad.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 23:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709019304; x=1709624104; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jxJu0PThWsJVSfDTe50TdK1bwGEaXtV2aPTG4iN2Vf8=;
        b=Ldv9eMliPNuJOQNTebLIHNFAhoTyc7jYzHlXL3CnljzC1st/5PvbXGk3X1carT9hWb
         8wqfoGwl2Nww8cGeZt79utcom9UWUGyS/xxWWHz8IIB59QlOGhDAibX7kdnybZReo/Cw
         5DRPWYgnwVxJPhf05lXVwPQG9eOU2ota1xzwIRacRkk/t0Pp6qYcHImblFsY+FNZOUgG
         Jp52r/01RgW5MITngHxk/tV0/Y2JvxWHsTxhIeaUzuu88i/EzFbWlae+e2AEfjqhAzfH
         7P1MWw/0B4y8pCVkXxM6VhrXyN8PNFzUprzqsnWk3r7HsG5BBpwR6rPLLovMDww99kBN
         76qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709019304; x=1709624104;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jxJu0PThWsJVSfDTe50TdK1bwGEaXtV2aPTG4iN2Vf8=;
        b=hxmSJYWwyTgh34kv1x/B7B913VQrp6jWXRg336VoV2fVj69L4Vw0j2Tpyb4SHmoQ4y
         LedKZW+AI7PQkdwDjHj/AizfxSbSjHCW7sFiTTsVvDYt5D6RY9Gw5GRNIEP/4u9ZUX+2
         H6GXJW8OirF8+BgENzvdl5nXx7gaRJKGqqj40nXlvieDpsG0dJDgZ74v8WODcfLmKb+1
         2BRiCDqFJBBrd6Q1oEmLzXjfPXTjDGpta3l0J+sGBFzZKaBJbQvTfC4gpn0Ux7rmhex4
         CTFU0+zp/Oc9c/6eXtOsEG4FU3CndGXNw64IJJShtjJNtOF9nvAz6DkZEbEZQM3jZiQ0
         yHYg==
X-Forwarded-Encrypted: i=1; AJvYcCX92V4QBePWMHzVqarCaysK/9AMSr+9lstUf82i2T6jdj8LmI3iZfyRj19+tEBKh+SQ1wJK33s/oswxY6kLiyLvVZYYmoJcTRbAK7YXL1A3Pv8=
X-Gm-Message-State: AOJu0YwWL4jjF/+vd8AJiJNX7/bHYh7PzJ5yJsnn6qSkQM3aH0fXKkpX
	8giFdd5iyH1JbG+wqpe+PYkhwcbN2lAY6D9QIpuuLmtFHPo0orgZNLJPPW7ecQ==
X-Google-Smtp-Source: AGHT+IF5qCH87pgk8mzfEN6e/vWkj+Lkv+zoEImw8I8EPmhF8wuiKbsba1BqsKFCjz+kC+4zNB6kVg==
X-Received: by 2002:a17:903:41cb:b0:1dc:38c7:ba1a with SMTP id u11-20020a17090341cb00b001dc38c7ba1amr11749172ple.25.1709019304388;
        Mon, 26 Feb 2024 23:35:04 -0800 (PST)
Received: from thinkpad ([117.213.97.177])
        by smtp.gmail.com with ESMTPSA id g13-20020a170902c38d00b001d9eef9892asm852511plg.174.2024.02.26.23.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 23:35:04 -0800 (PST)
Date: Tue, 27 Feb 2024 13:04:55 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	mhi@lists.linux.dev
Subject: Re: [PATCH v3 1/5] PCI: dwc: Refactor dw_pcie_edma_find_chip() API
Message-ID: <20240227073455.GG2587@thinkpad>
References: <20240226-dw-hdma-v3-0-cfcb8171fc24@linaro.org>
 <20240226-dw-hdma-v3-1-cfcb8171fc24@linaro.org>
 <fielxplkgrvz5qmqrrq5ahmah5yqx7anjylrlcqyev2z2cl2wo@3ltyl242vkba>
 <20240226152757.GF8422@thinkpad>
 <6r7kquumuaga5j2hosyi6fla6frdzm5e4iobt7dtftjuwm7wku@7wij7dfhneob>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6r7kquumuaga5j2hosyi6fla6frdzm5e4iobt7dtftjuwm7wku@7wij7dfhneob>

On Tue, Feb 27, 2024 at 12:00:41AM +0300, Serge Semin wrote:
> On Mon, Feb 26, 2024 at 08:57:57PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Feb 26, 2024 at 03:45:16PM +0300, Serge Semin wrote:
> > > Hi Manivannan
> > > 
> > > On Mon, Feb 26, 2024 at 05:07:26PM +0530, Manivannan Sadhasivam wrote:
> > > > In order to add support for Hyper DMA (HDMA), let's refactor the existing
> > > > dw_pcie_edma_find_chip() API by moving the common code to separate
> > > > functions.
> > > > 
> > > > No functional change.
> > > > 
> > > > Suggested-by: Serge Semin <fancer.lancer@gmail.com>
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > ---
> > > >  drivers/pci/controller/dwc/pcie-designware.c | 52 +++++++++++++++++++++-------
> > > >  1 file changed, 39 insertions(+), 13 deletions(-)
> > > > 
> > > > diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> > > > index 250cf7f40b85..193fcd86cf93 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-designware.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-designware.c
> > > > @@ -880,7 +880,17 @@ static struct dw_edma_plat_ops dw_pcie_edma_ops = {
> > > >  	.irq_vector = dw_pcie_edma_irq_vector,
> > > >  };
> > > >  
> > > > -static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
> > > > +static void dw_pcie_edma_init_data(struct dw_pcie *pci)
> > > > +{
> > > > +	pci->edma.dev = pci->dev;
> > > > +
> > > > +	if (!pci->edma.ops)
> > > > +		pci->edma.ops = &dw_pcie_edma_ops;
> > > > +
> > > > +	pci->edma.flags |= DW_EDMA_CHIP_LOCAL;
> > > > +}
> > > > +
> > > > +static int dw_pcie_edma_find_mf(struct dw_pcie *pci)
> > > >  {
> > > >  	u32 val;
> > > >  
> > > > @@ -900,24 +910,27 @@ static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
> > > >  	else
> > > >  		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
> > > > 
> > > 
> > > > -	if (val == 0xFFFFFFFF && pci->edma.reg_base) {
> > > > -		pci->edma.mf = EDMA_MF_EDMA_UNROLL;
> > > > -
> > > > -		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> > > > -	} else if (val != 0xFFFFFFFF) {
> > > > -		pci->edma.mf = EDMA_MF_EDMA_LEGACY;
> > > > +	/* Set default mapping format here and update it below if needed */
> > > > +	pci->edma.mf = EDMA_MF_EDMA_LEGACY;
> > > >  
> > > > +	if (val == 0xFFFFFFFF && pci->edma.reg_base)
> > > > +		pci->edma.mf = EDMA_MF_EDMA_UNROLL;
> > > > +	else if (val != 0xFFFFFFFF)
> > > >  		pci->edma.reg_base = pci->dbi_base + PCIE_DMA_VIEWPORT_BASE;
> > > > -	} else {
> > > > +	else
> > > >  		return -ENODEV;
> > > > -	}
> > > 
> > > Sorry for not posting my opinion about this earlier, but IMO v2 code
> > > was more correct than this one. This version makes the code being not
> > > linear as it was in v2, thus harder to comprehend:
> > > 
> > > 1. Setting up a default value and then overriding it or not makes the
> > > reader to keep in mind the initialized value which is harder than to
> > > just read what is done in the respective branch.
> > > 
> > 
> > No, I disagree. Whether we set the default value or not, EDMA_MF_EDMA_LEGACY is
> > indeed the default mapping format (this is one of the reasons why the enums
> > should start from 1 instead of 0). So initializing it to legacy is not changing
> > anything, rather making it explicit.
> > 
> > > 2. Splitting up the case clause with respective inits and the mapping
> > > format setting up also makes it harder to comprehend what's going on.
> > > In the legacy case the reg-base address and the mapping format init are
> > > split up while they should have been done simultaneously only if (val
> > > != 0xFFFFFFFF).
> > > 
> > 
> > Well again, this doesn't matter since the default mapping format is legacy. But
> > somewhat agree that the two clauses are setting different fields, but even if
> > the legacy mapping format is set inside the second clause, it still differs from
> > the first one since we are not setting reg_base.
> > 
> > > 3. The most of the current devices has the unrolled mapping (available
> > > since v4.9 IP-core), thus having the mf field pre-initialized produces
> > > a redundant store operation for the most of the modern devices.
> > > 
> > 
> > Ok, this one I agree. We could avoid the extra assignment.
> > 
> > > 4. Getting rid from the curly braces isn't something what should be
> > > avoided at any cost and doesn't give any optimization really. It
> > > doesn't cause having less C-lines of the source code and doesn't
> > > improve the code readability.
> > > 
> > 
> > Yeah, there is no benefit other than a simple view of the code. But for point
> > (3), I agree to roll back to v2 version.
> > 
> > > So to speak, I'd suggest to get back the v2 implementation here.
> > > 
> > > >  
> > > > -	pci->edma.dev = pci->dev;
> > > > +	return 0;
> > > > +}
> > > >  
> > > > -	if (!pci->edma.ops)
> > > > -		pci->edma.ops = &dw_pcie_edma_ops;
> > > > +static int dw_pcie_edma_find_channels(struct dw_pcie *pci)
> > > > +{
> > > > +	u32 val;
> > > >  
> > > > -	pci->edma.flags |= DW_EDMA_CHIP_LOCAL;
> > > 
> > > > +	if (pci->edma.mf == EDMA_MF_EDMA_LEGACY)
> > > > +		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
> > > > +	else
> > > > +		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> > > 
> > > Just dw_pcie_readl_dma(pci, PCIE_DMA_CTRL)
> > > 
> > 
> > 'val' is uninitialized. Why should the assignment be skipped?
> 
> The entire
> 
> +	if (pci->edma.mf == EDMA_MF_EDMA_LEGACY)
> +		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
> +	else
> +		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> 
> can be replaced with a single line
> 
> +	val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> 
> since in the legacy case (reg_base = PCIE_DMA_VIEWPORT_BASE) and the
> reg_base has been initialized by now.
> 

Ah okay, got it!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

