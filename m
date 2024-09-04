Return-Path: <linux-renesas-soc+bounces-8705-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D2F96C2EF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2024 17:51:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18D15284C8C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2024 15:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D201DFE20;
	Wed,  4 Sep 2024 15:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d692u+bM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA701DEFC0
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Sep 2024 15:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725464998; cv=none; b=o0qe04ZuaSxfcZNSyucEw0pEjSLZ+3ibfZ38FjImi3OEj4LoDcVPcRTfQd6T3Hw8Y7E7A/Viy5092UHv7VaBM8RCmIXFCFrbUbv1maNEN9SSlepHITtv6Po0bgtyix/UkzIGfqWMqtm8JJcC1mVLtg89Bp4tEWVlGJ/FDyClkEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725464998; c=relaxed/simple;
	bh=CTpZT61cw+v7Isz+5KEp0TwRe2k81PyY8Q9DOwJbOnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGqbePMnpMZBi+M86Gs+wD3ah86aqikwe58jv3r9Y52QqqUp5C+KFGtDcGrciW7vCd8CuFSDLFtJR02DSr5RRs8MhAbY4Gc/2AGcLpbn4vicwpj1GcmDhLOB5Ff7SWOL52DnmZtM2JHPcxdbo7l/56YbNGHGhBsIitDC+PC3z/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d692u+bM; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-206aee40676so10504025ad.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Sep 2024 08:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725464996; x=1726069796; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aUspjdaZipuOhA4NRY0RJgeHGMKwRMzsWto8djn5vLI=;
        b=d692u+bMkoKPaC1KysMc/5oBJOQrUqWi4Tz0sQhd99IZ3e5CmzKMlA8yu83gEO4cYp
         eW6ZnRYJOt+ixnU+LVgmrDSgFGgF6x4pjD92BZn87RVsxQYz1l+8Hz1Q+50owV20aCcT
         DDl922u1dP02I/xMllsRxmpGVsEtPtPpTfszHZ/1ncPRpG7UkT1NH6b3pbs+27NrLIZn
         +1fEpbl2zaZ5pFlB529qqhzBZfYxsf7azUnHlMRdnfAO0G9zhQshWQ8OJ5nbo2jpp6T0
         5yh4GPeZt5eQoKT3Uen0gUECaPJy87To6Lc3yUh3riydVWa91hgocwi4voLipM6HKJOm
         hyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725464996; x=1726069796;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aUspjdaZipuOhA4NRY0RJgeHGMKwRMzsWto8djn5vLI=;
        b=XnMOzgxV9QbU7gpdtpxziLsnH/VGB7Hm0gcTjHGBX6BQyyAx3w/rfYdhafEaZzsHkU
         LgtBdEa854/j+90OtP8cXTKdL09348nL6IplUwqSVmuSynNuqUBhL8oOCk3KI9Zov0kz
         g4xOZ1egSyaLAyeOh7B+OtPhbXSR/LDIdXcUlNECPVWVdiVZg40L8XSvfOO58mu7GJ4x
         Gi3QeYcPu2k/lHDIjJxLhg2FRhC0E/QAJYEyk7Ew89B78r9pDJtbIQhIFZnSsjDVs06L
         /5S35KTPFPxLBcL4A2yZ13ePG6qUF6Q5WmuHwZbGLH6rxZIVZyhZNnydDe/6tVBBYmya
         cQxA==
X-Forwarded-Encrypted: i=1; AJvYcCWF3Wo74nC8nP/8PMSyFdGOfuByDJo6vURUlvEwQMKJB1B+IRdBv+HRWDE1LQazteyNysmOGTuwB3nIf0xTmnDk9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YznApuRj1XNnCCE8voQMni2TC5Ce1N+yR0uyiYTtdUXdkMFTExi
	R1tQwBy2tYnot5JcXEDujAB0XHyFFYA7mudi4KiphzjNprkZ35hMFdc0+TntTg==
X-Google-Smtp-Source: AGHT+IGaIqW5Fd7iC7eWGx3Bkr4KIAhnl/c5JAG+0dmpw/6XA8lzo2zqW5pfYpjv80IFZFIFhT9/Sw==
X-Received: by 2002:a17:902:cec6:b0:206:9caf:1e00 with SMTP id d9443c01a7336-2069caf211cmr72629265ad.25.1725464996370;
        Wed, 04 Sep 2024 08:49:56 -0700 (PDT)
Received: from thinkpad ([120.60.128.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae950571sm15158925ad.82.2024.09.04.08.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 08:49:56 -0700 (PDT)
Date: Wed, 4 Sep 2024 21:19:44 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
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
Subject: Re: [PATCH v6 2/4] PCI: dwc: Always cache the maximum link speed
 value in dw_pcie::max_link_speed
Message-ID: <20240904154944.w4bujfmhy5uhzkld@thinkpad>
References: <20240904-pci-qcom-gen4-stability-v6-0-ec39f7ae3f62@linaro.org>
 <20240904-pci-qcom-gen4-stability-v6-2-ec39f7ae3f62@linaro.org>
 <ZtgooHdex5gXh0tP@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtgooHdex5gXh0tP@hovoldconsulting.com>

On Wed, Sep 04, 2024 at 11:30:08AM +0200, Johan Hovold wrote:
> On Wed, Sep 04, 2024 at 12:41:58PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > Currently, dw_pcie::max_link_speed has a valid value only if the controller
> > driver restricts the maximum link speed in the driver or if the platform
> > does so in the devicetree using the 'max-link-speed' property.
> > 
> > But having the maximum supported link speed of the platform would be
> > helpful for the vendor drivers to configure any link specific settings.
> > So in the case of non-valid value in dw_pcie::max_link_speed, just cache
> > the hardware default value from Link Capability register.
> > 
> > While at it, let's also remove the 'max_link_speed' argument to the
> > dw_pcie_link_set_max_speed() function since the value can be retrieved
> > within the function.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-designware.c | 18 ++++++++++++++----
> >  1 file changed, 14 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> > index 86c49ba097c6..0704853daa85 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware.c
> > @@ -687,16 +687,27 @@ void dw_pcie_upconfig_setup(struct dw_pcie *pci)
> >  }
> >  EXPORT_SYMBOL_GPL(dw_pcie_upconfig_setup);
> >  
> > -static void dw_pcie_link_set_max_speed(struct dw_pcie *pci, u32 max_link_speed)
> > +static void dw_pcie_link_set_max_speed(struct dw_pcie *pci)
> >  {
> >  	u32 cap, ctrl2, link_speed;
> >  	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> >  
> >  	cap = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
> > +
> > +	/*
> > +	 * Even if the platform doesn't want to limit the maximum link speed,
> > +	 * just cache the hardware default value so that the vendor drivers can
> > +	 * use it to do any link specific configuration.
> > +	 */
> > +	if (pci->max_link_speed < 0) {
> 
> This should be 
> 
> 	if (pci->max_link_speed < 1) {
> 

Well I was trying to catch the error value here because if neither driver nor
platform limits the max link speed, this would have -EINVAL (returned by
of_pci_get_max_link_speed()).

But logically it makes sense to use 'pci->max_link_speed < 1' since anything
below value 1 is an invalid value.

Will change it.

- Mani

> but the patch works as-is because of the default case in the switch
> below which falls back to PCI_EXP_LNKCAP_SLS.
> 
> > +		pci->max_link_speed = FIELD_GET(PCI_EXP_LNKCAP_SLS, cap);
> > +		return;
> > +	}
> > +
> >  	ctrl2 = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCTL2);
> >  	ctrl2 &= ~PCI_EXP_LNKCTL2_TLS;
> >  
> > -	switch (pcie_link_speed[max_link_speed]) {
> > +	switch (pcie_link_speed[pci->max_link_speed]) {
> >  	case PCIE_SPEED_2_5GT:
> >  		link_speed = PCI_EXP_LNKCTL2_TLS_2_5GT;
> >  		break;
> 
> > @@ -1058,8 +1069,7 @@ void dw_pcie_setup(struct dw_pcie *pci)
> >  {
> >  	u32 val;
> >  
> > -	if (pci->max_link_speed > 0)
> > -		dw_pcie_link_set_max_speed(pci, pci->max_link_speed);
> > +	dw_pcie_link_set_max_speed(pci);
> 
> With the above fixed:
> 
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

-- 
மணிவண்ணன் சதாசிவம்

