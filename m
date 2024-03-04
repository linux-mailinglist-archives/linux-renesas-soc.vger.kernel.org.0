Return-Path: <linux-renesas-soc+bounces-3413-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4E586F9EF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 07:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC2961C20C93
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 06:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20332CA4A;
	Mon,  4 Mar 2024 06:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S26BBUwG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186F5C147
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Mar 2024 06:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709533064; cv=none; b=fd6NlU05RyCDvIRdmsyvladUsRgJs/7Pq/twa85iml9BccO3CMHcXrwez8x/xE52eyzpbaz8YPKS1nSarSKd4bLvh7aoHzT0Ir8pVUBxv874uZd9iJL/Uy7gNhqm55k3aMib6MMZSZ9Q2n+42Vh47PQ7TBPMxUCzLgS+/oQO2co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709533064; c=relaxed/simple;
	bh=eTonRj1OlsNLW1l1Yx3ppQL9wMYBgndbkunCG8jk3i8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j5YsZQ3kMh4VTd4DIRqZZYYjSeOtAoialwmsMyQvBtZeW8wYS4iaLB7FJo/ec726HtDHWSyoBbwXm1n550FdvNE7qL6F0f2lHlD7i42Gq739VwHPnscxECaEUTNKlo9VFdfB69xqV2lXt09wVOcooM0zyluERKfsa7dHZZAoxcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S26BBUwG; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e56da425b5so2865500b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 03 Mar 2024 22:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709533061; x=1710137861; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8zwoQ7Hu6cKX/3vgoNUWWeHdXC/JkbTAc8F7XvfFH9k=;
        b=S26BBUwGm7ZjygFCGZ8v86HIVVWCi9jcc5frdyNncCOLPUpnkUK6+H6+qCv+rS9B7Y
         245LcFxxNEh2HAXxIIOvr1ANGMeo78v5z3EB54/0SkunbgO7ISPKnXeL6SlSCpsbSjx8
         VuNJwMRWNsQFkCWz7mIM5S6VYmzfsrupgZBy2eD4LYiuyvNhiZOtOKQbjrWLO8LggbOD
         S2plTZZSiv2yXV83GqvFTyGmZhBIZAGQ/5iMN85SLE+0F0zUJ+tdSEvZBby2jt2mCLY9
         sURrbe5TTPpPLnMdZrbyYI8aogU3kW/9Kh/dMjFLuIpyWV8N/WI75VhI3/zvE/2IB131
         IsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709533061; x=1710137861;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8zwoQ7Hu6cKX/3vgoNUWWeHdXC/JkbTAc8F7XvfFH9k=;
        b=lER/fBLN3hXTWh+sTHEr9Do7bmwaIfCAiNa4R6s+QNVP25oapJ0nxGUPI7/ojvmz0y
         vWAN+mYQ+ondrRes4eTlL0vINhuUtAQOjcox+zlnCV0FAMYpRUgCHW5M3UYUgaEzhutc
         iVq4NyQVFKYdCyhSOE8GB7y3U3d0Pk0xA6TrjA8k0kgCJIN7MtgQ30jPo0liMa8bj9iO
         nyRMXh2NYRiuBCEfESafujjQ2vfqiee/fV2rGh6OrzdKmTVVGJFuTE4M2rHouNKElXo+
         qF9NKEG630jqfxngFNxu4+hW+HfawdBmeTCHwDcYIXWP7Ewd5WBMP9Xd6im9TyZNgQP4
         4NUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8DMfIgLoRQEXRwuLlPDH7RKc/sIWF8KXs/E/qVfk7ukZKbESBhK/mEtHBPQRhN7Vz4kjmNdVphYnn04PBdrU4a4sb8DqdZ09GXl/N4jIy/RY=
X-Gm-Message-State: AOJu0YxtL4LemxEUhiOlq1SNZAMkrFJMYFPHFkOlVTZvKKlzjlAyxPpi
	+8De0HEp/WqFXcotA4x1Y12jOw+GDy3GXVTTUycg1K4bcResNDp0q1FyDLb8dA==
X-Google-Smtp-Source: AGHT+IGAidBjMNZr3uFxIswY96lQVmUkSAOv50INEmJqAR1XK4TVP2+soWWmqf+zo8BBYaQhLSrjZg==
X-Received: by 2002:a05:6a00:1915:b0:6e5:75cd:eff0 with SMTP id y21-20020a056a00191500b006e575cdeff0mr8001868pfi.31.1709533061056;
        Sun, 03 Mar 2024 22:17:41 -0800 (PST)
Received: from thinkpad ([117.207.30.163])
        by smtp.gmail.com with ESMTPSA id d2-20020a63bd42000000b005dc832ed816sm5810721pgp.59.2024.03.03.22.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 22:17:40 -0800 (PST)
Date: Mon, 4 Mar 2024 11:47:32 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	mhi@lists.linux.dev, Siddharth Vadapalli <s-vadapalli@ti.com>
Subject: Re: [PATCH v3 2/5] PCI: dwc: Skip finding eDMA channels count if
 glue drivers have passed them
Message-ID: <20240304061732.GE2647@thinkpad>
References: <20240226-dw-hdma-v3-0-cfcb8171fc24@linaro.org>
 <20240226-dw-hdma-v3-2-cfcb8171fc24@linaro.org>
 <5gzkxdpx6u3jhw5twbncjhtozgekmlzxrpj3m6is3ijadm2svb@f6ng4owyakup>
 <20240226153014.GG8422@thinkpad>
 <4p4z5eyhpdhxzi36drhrmz6z7krupszddudg6c2baypkbnnj7t@nqcmk2wdntts>
 <20240227084204.GI2587@thinkpad>
 <nl4byqs3boe3zke6yvnxmwpgw5oi63ubo36rgzejzg2c4ymwm5@utad76n57gr5>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <nl4byqs3boe3zke6yvnxmwpgw5oi63ubo36rgzejzg2c4ymwm5@utad76n57gr5>

On Tue, Feb 27, 2024 at 03:21:00PM +0300, Serge Semin wrote:
> On Tue, Feb 27, 2024 at 02:12:04PM +0530, Manivannan Sadhasivam wrote:
> > On Tue, Feb 27, 2024 at 12:32:44AM +0300, Serge Semin wrote:
> > > On Mon, Feb 26, 2024 at 09:00:14PM +0530, Manivannan Sadhasivam wrote:
> > > > On Mon, Feb 26, 2024 at 03:53:20PM +0300, Serge Semin wrote:
> > > > > On Mon, Feb 26, 2024 at 05:07:27PM +0530, Manivannan Sadhasivam wrote:
> > > > > > In the case of Hyper DMA (HDMA) present in DWC controllers, there is no way
> > > > > > the drivers can auto detect the number of read/write channels as like its
> > > > > > predecessor embedded DMA (eDMA). So the glue drivers making use of HDMA
> > > > > > have to pass the channels count during probe.
> > > > > > 
> > > > > > To accommodate that, let's skip finding the channels if the channels count
> > > > > > were already passed by glue drivers. If the channels count passed were
> > > > > > wrong in any form, then the existing sanity check will catch it.
> > > > > > 
> > > > > > Suggested-by: Serge Semin <fancer.lancer@gmail.com>
> > > > > > Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > > > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > > > ---
> > > > > >  drivers/pci/controller/dwc/pcie-designware.c | 16 +++++++++-------
> > > > > >  1 file changed, 9 insertions(+), 7 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> > > > > > index 193fcd86cf93..ce273c3c5421 100644
> > > > > > --- a/drivers/pci/controller/dwc/pcie-designware.c
> > > > > > +++ b/drivers/pci/controller/dwc/pcie-designware.c
> > > > > > @@ -927,13 +927,15 @@ static int dw_pcie_edma_find_channels(struct dw_pcie *pci)
> > > > > >  {
> > > > > >  	u32 val;
> > > > > >  
> > > > > > -	if (pci->edma.mf == EDMA_MF_EDMA_LEGACY)
> > > > > > -		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
> > > > > > -	else
> > > > > > -		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> > > > > > -
> > > > > > -	pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
> > > > > > -	pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
> > > > > 
> > > > > > +	if (!pci->edma.ll_wr_cnt || !pci->edma.ll_rd_cnt) {
> > > > > 
> > > > > Are you sure that the partly initialized case should be considered as
> > > > > a request for the auto-detection? IMO &&-ing here and letting the
> > > > > sanity check to fail further would be more correct since thus the
> > > > > developer would know about improper initialized data.
> > > > > 
> > > > 
> > > > We already have the check below. So the partly initialized case will fail
> > > > anyway.
> > > 
> > > Not really. If the partly initialized case activates the
> > > auto-detection procedure it will override both non-initialized and
> > > _initialized_ number of channels with the values retrieved from the
> > > hardware, which the glue driver has been willing not to use. This
> > > prone to undefined behavior depending on the reasons of skipping the
> > > auto-detection procedure. For instance, assume the DMA_CTRL register
> > > reports an invalid number of read channels. A glue driver by mistake
> > > or willingly overwrites the pci->edma.ll_rd_cnt field only. This won't
> > > solve the problem since the auto-detection will be proceeded due to
> > > the pci->edma.ll_wr_cnt field being left uninitialized.
> > > 
> > > So to speak it would be better to implement a strictly determined case
> > > for activating the auto-detection procedure: both number of channels
> > > aren't initialized; if only one field is initialized then report an
> > > error.
> > > 
> > > Alternatively we can have the auto-detection executed on the
> > > per-channel basis:
> > > 
> > > +	if (pci->edma.mf != EDMA_MF_HDMA_NATIVE) {
> > > +		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> > > +
> > > +		if (!pci->edma.ll_wr_cnt)
> > > +			pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
> > > +
> > > +		if (!pci->edma.ll_rd_cnt)
> > > +			pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
> > > +	}
> > > 
> > 
> > Hmm, in this case there is no need to check for uninitialized channels count:
> > 
> > 	/*
> > 	 * Autodetect the read/write channels count only for non-HDMA platforms.
> > 	 * HDMA platforms doesn't support autodetect, so the glue drivers should've
> > 	 * passed the valid count already. If not, the below sanity check will
> > 	 * catch it.
> > 	 */
> > 	if (pci->edma.mf != EDMA_MF_HDMA_NATIVE) {
> > 		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> > 
> > 		pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
> > 		pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
> > 	}
> > 
> > 	/* Sanity check */
> 
> That is another possible implementation. Let's sum all of them up:
> 
> 1. Channel fields-base conditional statement:
> +	if (!pci->edma.ll_wr_cnt && !pci->edma.ll_rd_cnt) {
> +		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> +
> +		pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
> +		pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
> +	}
> pros: NoF channels override support for all IP-cores; simple.
> cons: incompatible with HDMA, but can be taken by mistake/bug; no
> partial NoF channels pre-initialization.
> 
> 2. Channel fields-base conditional statement with logical OR operator #1:
> +	if (!pci->edma.ll_wr_cnt || !pci->edma.ll_rd_cnt) {
> +		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> +
> +		pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
> +		pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
> +	}
> pros: NoF channels override support for all IP-cores; simple.
> cons: incompatible with HDMA, but can be taken by mistake/bug; no
> partial NoF channels pre-initialization; silently overrides the
> partial NoF channels case.
> 
> 3. Channel fields-base conditional statement with logical OR operator #2:
> +	if (!pci->edma.ll_wr_cnt || !pci->edma.ll_rd_cnt) {
> +		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> +
> +		if (!pci->edma.ll_wr_cnt)
> +			pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
> +
> +		if (!pci->edma.ll_rd_cnt)
> +			pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
> +	}
> pros: NoF channels override support for all IP-cores; partial NoF
> channels pre-initialization support.
> cons: incompatible with HDMA, but can be taken by mistake/bug; more
> complex (and actually looking a bit clumsy due to two conditional
> statements over the same fields).
> 
> 4. Unconditional auto-detection:
> +	val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> +
> +	if (!pci->edma.ll_wr_cnt)
> +		pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
> +
> +	if (!pci->edma.ll_rd_cnt)
> +		pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
> pros: NoF channels override support for all IP-cores; partial NoF
> channels pre-initialization support; simple.
> cons: incompatible with HDMA, but will be executed for it anyway so
> the NoF channels fields will be overridden with the Channel#0.prefetch
> CSR data if haven't been pre-initialized;
> 
> 5. Mapping format-based conditional statement:
> +	if (pci->edma.mf != EDMA_MF_HDMA_NATIVE) {
> +		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> +
> +		pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
> +		pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
> +	}
> pros: free of being executed for HDMA IP-core, simple
> cons: no NoF channels override support for non-HDMA IP-cores.
> 

Is it possible for the non-HDMA IPs to override the channels count? Atleast any
such IPs supported in mainline now? If not, then I'd like to go with this
approach.

Because, this makes it explicit that override is only supported for HDMA IPs and
also simplifies the logic.

> 6. Mapping format-based conditional statement with partial NoF channels override:
> +	if (pci->edma.mf != EDMA_MF_HDMA_NATIVE) {
> +		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> +
> +		if (!pci->edma.ll_wr_cnt)
> +			pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
> +
> +		if (!pci->edma.ll_rd_cnt)
> +			pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
> +	}
> pros: free of being executed for HDMA IP-core; NoF channels override
> support for all IP-cores.
> cons: more complex.
> 
> 
> Looking at all of that I'd say that options 5 and 6 seems better to me
> now since they prohibit the auto-detection for HDMA IP-cores which
> have the Channel#0.prefetch CSR at the 0x8 offset. I don't have strong
> opinion which of those two to choose. If you think simplicity is
> preferable, then option 2 will be enough. If you wish to have the NoF
> channels override supported for all IP-cores, then option 3 will work
> for it.
> 

Thanks for such elaborative comparision :)

- Mani

-- 
மணிவண்ணன் சதாசிவம்

