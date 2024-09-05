Return-Path: <linux-renesas-soc+bounces-8748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E8196E12B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Sep 2024 19:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47AE71F24EE5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Sep 2024 17:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADA61A4F08;
	Thu,  5 Sep 2024 17:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hulCOhoy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2921953A3
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Sep 2024 17:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725557701; cv=none; b=K57ZUYsIMT6EjVscIw5o5n9vDEVhbLoEEn8GKb/7uyxz9uDqNjmkjA8l3wxpOkd/0GAOSJ25lSsOfAxbrfQF/82ekMOPvd1XmtUw6WXC7nxkW+yG5kqX/4kwXBu9XJHVV1D7M6lQ+uhGKj58wZ4p4gGDYvshHtj36l/72B/sWNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725557701; c=relaxed/simple;
	bh=MI2LRc6AktxdTOVKQGnfpzkt/G3bqZJj+90kchL1ybM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+AQr222HQ2GmT/BoHeIwqMgIBJNokTQaquzpQ4+IeCOc3OVBwC+PD1Vb3bZHjtubI5wgyIonRvA8zoxzku8oYdxApnl0MveYnKS6mFKCTGuWu7qUvUrjK6Mz10TR24BcpB6uuliFIMNP09aKjzvVSdlawwk9+SJm5gZP37FUZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hulCOhoy; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2021c08b95cso18151275ad.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Sep 2024 10:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725557697; x=1726162497; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eIgzal7ITyKn4Uu6UhwVaplHaAv3wUp9Qsoun/N+n+c=;
        b=hulCOhoyJCHBTWpZY3k0dfuTPeZGDEkSROIH4NWLDKyXdLv/1pK8Ku/SWLaIR6QLgp
         CcJzqECDc9oDWK9w95OmGKOKDDbPVue+SzU4QLtXHCzMr6/UiYM8dj+34YttIb75k8jj
         1AICwt+dhQPVN0vEY4EBN982S/jgVjMCErT+nyH9nvUo/atk8ZEkOws2qkdYaBXKbGjx
         J+sGiH924F+hVcjZ7Nzu7ldSVSKSHUhycocG2D8/I93BjABk67sGhTTCrevoF6IoqJQ6
         jRkXCuY7WKRbhn2ZJhPY36JTWoAHHS1wlnJC4lFy2D5CPUxiPU4dNwz3wkB2NfIsDu6I
         TyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725557697; x=1726162497;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eIgzal7ITyKn4Uu6UhwVaplHaAv3wUp9Qsoun/N+n+c=;
        b=M6ko5z1bVL72pvsOGS462xjPiTPuOLXXp5mDmBrTe9UeIQF5qFCNmIB7/96iVeqf0D
         ALttNaiaH2cB367ouuerlr2CF4LoqWs6q6boRNFxLVyo+LHHz6Gk5IZq8Pw4C66NVDJO
         nZPTxCrFt+ZYaZBK4uHB2P/jga0qVmVwzwEB0fIpumw8rw9q05npSHj/ctb5bhNj27pm
         GLFFERYHjqDdieCOj63pbAi7I0JD6LLv0Ph2UwY4q1i8sJAAbGuR1rhF8h8QaWWEC6Td
         eNfSsLvyy9403HzBwi93ReaqPFFHJ+UOU7Fw4/oMw+bo5PpCuqePE6hQbAsEDWRrArq9
         F//g==
X-Forwarded-Encrypted: i=1; AJvYcCXw8IGZeZT6BFQw5H7dPSJ+raYfM3a9p84I8r9CpZqPDLiGwxaD+nT3iXvQKSRQyEo0xkeNEo8O7TwHzdU36WHSwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6eFx2nu1eV8DPtDk26jnVjg7PBYaxbrUuWxQeDS43rhVa5xxr
	2LUtCnpPo9PVI8u+KuFmdYmmdl+M//M4SYMkdN+UX3Kj51YIFSGZ4D0iIVxyNg==
X-Google-Smtp-Source: AGHT+IElFJh9mBN0d10CvX+yxAjA8cHTDsSZBmgENNb/EtffZEORF9F48GUK1FqLfVaqnR4xQfoX8Q==
X-Received: by 2002:a17:902:ea0a:b0:205:3475:63be with SMTP id d9443c01a7336-206eeb8c61amr497735ad.25.1725557696776;
        Thu, 05 Sep 2024 10:34:56 -0700 (PDT)
Received: from thinkpad ([120.60.52.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea69770sm30809955ad.277.2024.09.05.10.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 10:34:56 -0700 (PDT)
Date: Thu, 5 Sep 2024 23:04:37 +0530
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
Subject: Re: [PATCH v6 3/4] PCI: qcom: Add equalization settings for 16.0 GT/s
Message-ID: <20240905173437.hm3hegv5zolaj7gj@thinkpad>
References: <20240904-pci-qcom-gen4-stability-v6-0-ec39f7ae3f62@linaro.org>
 <20240904-pci-qcom-gen4-stability-v6-3-ec39f7ae3f62@linaro.org>
 <ZtgqvXGgp2sWNg5O@hovoldconsulting.com>
 <20240905152742.4llkcjvvu3klmo6j@thinkpad>
 <Ztnb-GauC_8D8N-i@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ztnb-GauC_8D8N-i@hovoldconsulting.com>

On Thu, Sep 05, 2024 at 06:27:36PM +0200, Johan Hovold wrote:
> On Thu, Sep 05, 2024 at 08:57:42PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Sep 04, 2024 at 11:39:09AM +0200, Johan Hovold wrote:
> 
> > > > diff --git a/drivers/pci/controller/dwc/pcie-qcom-common.h b/drivers/pci/controller/dwc/pcie-qcom-common.h
> > > > new file mode 100644
> > > > index 000000000000..259e04b7bdf9
> > > > --- /dev/null
> > > > +++ b/drivers/pci/controller/dwc/pcie-qcom-common.h
> > > > @@ -0,0 +1,8 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > +/*
> > > > + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> > > > + */
> > > > +
> > > > +#include "pcie-designware.h"
> > > 
> > > You only need a forward declaration:
> > > 
> > > 	struct dw_pcie;
> > > 
> > > > +
> > > > +void qcom_pcie_common_set_16gt_eq_settings(struct dw_pcie *pci);
> > > 
> > > Compile guard still missing.
> 
> Sorry, I meant to say *include* guard here.
>

Okay. I got confused initially.
  
> > Perhaps we can just get rid of the Kconfig entry and build it by default for
> > both RC and EP drivers? I don't see a value in building it as a separate module.
> > And we may also move more common code in the future.
> 
> It is already built by default for both drivers. I'm not sure what
> you're suggesting here.
> 

Right now it is selected by both drivers using a Kconfig symbol. But I'm
thinking of building it by default as below:

-obj-$(CONFIG_PCIE_QCOM) += pcie-qcom.o
-obj-$(CONFIG_PCIE_QCOM_EP) += pcie-qcom-ep.o
+obj-$(CONFIG_PCIE_QCOM) += pcie-qcom.o pcie-qcom-common.o
+obj-$(CONFIG_PCIE_QCOM_EP) += pcie-qcom-ep.o pcie-qcom-common.o

A separate Kconfig symbol is not really needed here as this file contains common
code required by both the drivers.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

