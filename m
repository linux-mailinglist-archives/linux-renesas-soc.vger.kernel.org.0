Return-Path: <linux-renesas-soc+bounces-8706-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E133596C31D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2024 17:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9ACE4282486
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2024 15:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457201E1A34;
	Wed,  4 Sep 2024 15:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PnaoG7LJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD271E1A2E
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Sep 2024 15:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725465164; cv=none; b=g0vJETkWDorFEsixCk+zTNlGdBq6mLLwk2JcvO3ZdxWOduaZwsJeuuIfFpZqp7UwSybOWDYo4zyZpW91tA3dikhu0koZIjyQpzEkcRtIOko1pv71tbRtMSJsOIZtRr6dBfJZRqBMhC2qtzoKSJS76FBhnD3wvcvUeLVnoAoa73o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725465164; c=relaxed/simple;
	bh=KygQNf3+cuF9gbs3HDkBg3xT8j1Jn6935u8ekoom8lI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZN0PFW1kcFazHQKf/Dv2yd1XmusbdqwsYIEkCVKg8SiCtx0Rh9aTbKjm6Sw3RHo49CvsY7qHlddo8g6XdV9BPaIg9bQE0/And7P0ud3sDZPtYwuUhr7vJAqdx9Hz4j3I5mcqoM7XCjkF8x2R2XTuHH00aacwivhO22gABNmy6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PnaoG7LJ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2054feabfc3so35485005ad.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Sep 2024 08:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725465161; x=1726069961; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OI8jsgdgqnkbWWLEKVkCt2Ik5LT6LWIsO1U3amJG1/s=;
        b=PnaoG7LJeIC+Vs4jqgXz4KpTBtW6dOH+tJXxJC93nXJA9zxe+PyxcmFCsUNarMzjY0
         n/aw8R07RJNwDq/jido9HIhZOTkPpbwaSCqjpSSwizg0ziDB/XL2fBdPPOOSz3zrm6xt
         6+2sxmgHPVFfmN2gAWG5PR4Bf/M1sWNhSavemKot21wNdIjmoD35eHC55w4pfDm6IUXk
         UGSQEupobH17xrslYmMhJLmJQ0Ucmy/CNE+Vma1ncoLomaDxXoYbcaGEX7wORgLmUxIi
         inijrXZlfL0aPpVwsZ2aGSUMkzRCpptFGBkhQ6g5a0hdu726oOyPwS9hCuTA03yUU1hv
         b+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725465161; x=1726069961;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OI8jsgdgqnkbWWLEKVkCt2Ik5LT6LWIsO1U3amJG1/s=;
        b=HVz4U2MIb80Vssfxotu7BIyOnRva9QSNEkXBTnVp0zzc35Hs107RDbqKMHBOlYTXWF
         /fAheDF1JLBS3zKXBYrB9VGgn3A6yYyyhbq6AJePVvQ/vjoYP+ta2SfBEftfwYCRkZRb
         Q1LY9AKirTMniCSCvLZQijNJV6b2txCqFqH340rQ4wU1m2vzkTcN3JFgf/8hYINsuwbn
         P+cOly7xFbkQaFwmU/NnmGrIc0723V+9a8/8/rEKrJfWxza0bW5TPGMnENm4g9tH8KvH
         aSDGzYAom7aAs/MlfhHGkgLbIuX0mHdZk85bpr/1mcv01mFlTIgyTbKawU2e+whi5VyU
         rRFA==
X-Forwarded-Encrypted: i=1; AJvYcCVIhHot7W2ndJAeb1RPDkh6phQTHOFRqIVfEDekYRHQfzErKEPVsDgNpL86j+GXCtTLO8ikJRVrtCJenACpRlUiEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIR1x8MY12QZbysa4Bdhx/XmE6ssUdziiiK2SZoMfcE1Y+bquD
	2S7esrK1D4loKCbiszxvibaiaF68NYpgLNK/RRLuWrlpj9sferLb2rNZxC23yw==
X-Google-Smtp-Source: AGHT+IHGBNBoglCNHpz+D7sGeP/HKxiS/0D+eictU65nCi8V3pgHa+1MnnTJSobiRrpdR96hXD+x3Q==
X-Received: by 2002:a17:902:da81:b0:206:8db4:481b with SMTP id d9443c01a7336-2068db45e50mr102338205ad.32.1725465161425;
        Wed, 04 Sep 2024 08:52:41 -0700 (PDT)
Received: from thinkpad ([120.60.128.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea37ae2sm15212725ad.173.2024.09.04.08.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 08:52:41 -0700 (PDT)
Date: Wed, 4 Sep 2024 21:22:33 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>,
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>
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
	abel.vesa@linaro.org, johan+linaro@kernel.org
Subject: Re: [PATCH v6 3/4] PCI: qcom: Add equalization settings for 16.0 GT/s
Message-ID: <20240904155233.zm3m6x3wvco35g6t@thinkpad>
References: <20240904-pci-qcom-gen4-stability-v6-0-ec39f7ae3f62@linaro.org>
 <20240904-pci-qcom-gen4-stability-v6-3-ec39f7ae3f62@linaro.org>
 <ZtgqvXGgp2sWNg5O@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtgqvXGgp2sWNg5O@hovoldconsulting.com>

On Wed, Sep 04, 2024 at 11:39:09AM +0200, Johan Hovold wrote:
> On Wed, Sep 04, 2024 at 12:41:59PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>
> > 
> > During high data transmission rates such as 16.0 GT/s, there is an
> > increased risk of signal loss due to poor channel quality and interference.
> > This can impact receiver's ability to capture signals accurately. Hence,
> > signal compensation is achieved through appropriate lane equalization
> > settings at both transmitter and receiver. This will result in increased
> > PCIe signal strength.
> > 
> > Signed-off-by: Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>
> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > [mani: dropped the code refactoring and minor changes]
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>  
> > +#define GEN3_EQ_CONTROL_OFF			0x8a8
> 
> Nit: uppercase hex since that's what is used for the other offsets
> 
> > +#define GEN3_EQ_CONTROL_OFF_FB_MODE		GENMASK(3, 0)
> > +#define GEN3_EQ_CONTROL_OFF_PHASE23_EXIT_MODE	BIT(4)
> > +#define GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC	GENMASK(23, 8)
> > +#define GEN3_EQ_CONTROL_OFF_FOM_INC_INITIAL_EVAL	BIT(24)
> > +
> > +#define GEN3_EQ_FB_MODE_DIR_CHANGE_OFF          0x8ac
> 
> Nit: odd indentation uses spaces, uppercase
> 
> > +#define GEN3_EQ_FMDC_T_MIN_PHASE23		GENMASK(4, 0)
> > +#define GEN3_EQ_FMDC_N_EVALS			GENMASK(9, 5)
> > +#define GEN3_EQ_FMDC_MAX_PRE_CUSROR_DELTA	GENMASK(13, 10)
> > +#define GEN3_EQ_FMDC_MAX_POST_CUSROR_DELTA	GENMASK(17, 14)
> > +
> >  #define PCIE_PORT_MULTI_LANE_CTRL	0x8C0
> >  #define PORT_MLTI_UPCFG_SUPPORT		BIT(7)
> >  
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom-common.c b/drivers/pci/controller/dwc/pcie-qcom-common.c
> > new file mode 100644
> > index 000000000000..dc7d93db9dc5
> > --- /dev/null
> > +++ b/drivers/pci/controller/dwc/pcie-qcom-common.c
> > @@ -0,0 +1,45 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> > + */
> > +
> > +#include <linux/pci.h>
> > +
> > +#include "pcie-designware.h"
> > +#include "pcie-qcom-common.h"
> > +
> > +void qcom_pcie_common_set_16gt_eq_settings(struct dw_pcie *pci)
> > +{
> > +	u32 reg;
> > +
> > +	/*
> > +	 * GEN3_RELATED_OFF register is repurposed to apply equalization
> > +	 * settings at various data transmission rates through registers namely
> > +	 * GEN3_EQ_*. RATE_SHADOW_SEL bit field of GEN3_RELATED_OFF determines
> > +	 * data rate for which this equalization settings are applied.
> 
> *The* RATE_SHADOW_SEL bit field
> 
> *the* data rate
> 
> s/this/these/
> 
> > +	 */
> > +	reg = dw_pcie_readl_dbi(pci, GEN3_RELATED_OFF);
> > +	reg &= ~GEN3_RELATED_OFF_GEN3_ZRXDC_NONCOMPL;
> > +	reg &= ~GEN3_RELATED_OFF_RATE_SHADOW_SEL_MASK;
> > +	reg |= FIELD_PREP(GEN3_RELATED_OFF_RATE_SHADOW_SEL_MASK, 0x1);
> 
> How does 0x1 map to gen4/16 GT?
> 

I need inputs from Shashank here as I don't know the answer.

- Mani

> > +	dw_pcie_writel_dbi(pci, GEN3_RELATED_OFF, reg);
> > +
> > +	reg = dw_pcie_readl_dbi(pci, GEN3_EQ_FB_MODE_DIR_CHANGE_OFF);
> > +	reg &= ~(GEN3_EQ_FMDC_T_MIN_PHASE23 |
> > +		GEN3_EQ_FMDC_N_EVALS |
> > +		GEN3_EQ_FMDC_MAX_PRE_CUSROR_DELTA |
> > +		GEN3_EQ_FMDC_MAX_POST_CUSROR_DELTA);
> > +	reg |= FIELD_PREP(GEN3_EQ_FMDC_T_MIN_PHASE23, 0x1) |
> > +		FIELD_PREP(GEN3_EQ_FMDC_N_EVALS, 0xd) |
> > +		FIELD_PREP(GEN3_EQ_FMDC_MAX_PRE_CUSROR_DELTA, 0x5) |
> > +		FIELD_PREP(GEN3_EQ_FMDC_MAX_POST_CUSROR_DELTA, 0x5);
> > +	dw_pcie_writel_dbi(pci, GEN3_EQ_FB_MODE_DIR_CHANGE_OFF, reg);
> > +
> > +	reg = dw_pcie_readl_dbi(pci, GEN3_EQ_CONTROL_OFF);
> > +	reg &= ~(GEN3_EQ_CONTROL_OFF_FB_MODE |
> > +		GEN3_EQ_CONTROL_OFF_PHASE23_EXIT_MODE |
> > +		GEN3_EQ_CONTROL_OFF_FOM_INC_INITIAL_EVAL |
> > +		GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC);
> > +	dw_pcie_writel_dbi(pci, GEN3_EQ_CONTROL_OFF, reg);
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pcie_common_set_16gt_eq_settings);
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom-common.h b/drivers/pci/controller/dwc/pcie-qcom-common.h
> > new file mode 100644
> > index 000000000000..259e04b7bdf9
> > --- /dev/null
> > +++ b/drivers/pci/controller/dwc/pcie-qcom-common.h
> > @@ -0,0 +1,8 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> > + */
> > +
> > +#include "pcie-designware.h"
> 
> You only need a forward declaration:
> 
> 	struct dw_pcie;
> 
> > +
> > +void qcom_pcie_common_set_16gt_eq_settings(struct dw_pcie *pci);
> 
> Compile guard still missing.
> 
> Johan

-- 
மணிவண்ணன் சதாசிவம்

