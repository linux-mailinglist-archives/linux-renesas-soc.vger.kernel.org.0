Return-Path: <linux-renesas-soc+bounces-4100-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CAF88D951
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Mar 2024 09:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3C122982DE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Mar 2024 08:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCDB374CC;
	Wed, 27 Mar 2024 08:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zBUvIzC+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A87637165
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Mar 2024 08:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711528873; cv=none; b=Eoxgmhd0fiTnTL74wMXGT6GYTdDHvrNE4n158/iC5jNQxm+qobdbYEWlEXB2MFi2pzuVvNQ+HqxynUfC/Cyw1h3+GmJuB0pvv3aNVo3XO40Bg2uCJxsfNVQXTvksGdeO10xjzlQr13QLgGtxBfJdtb2iWIoIXtaykohd4D3e818=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711528873; c=relaxed/simple;
	bh=Vxz59oGSPPXtkvKXl3CH0Bedz+fRY4D6DbBmcqa4Z5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cbusjYFL3WHxSnPxyD+7Rc5KjA929tpLIDVc2InqT32jhF0zJCod9vIIYr0MMNiBlO5pmDiWjzV2B+biha9M0B+H831CPnDDpsXai2uC+rIrZHdPAK4TJvjIkp9Ta5Uf8IkdaGqdiyIa09QN/fbRvWgj300SXViMbGMu0Ws60wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zBUvIzC+; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6dc8b280155so3785209a34.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Mar 2024 01:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711528870; x=1712133670; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3kBGo9rBQDVD8B/37mPPc4bOK2wXan+HIEhCfIghQeQ=;
        b=zBUvIzC+K0KhmWy6Tsxhve5/iQWSHh2Kmd1UybWCM24AAqwL0s6Ysxhdw9NxjCC21n
         LJgon4QclJceB0+HftwRUtV7i2zDBe/CWKf6kdbXbkwm4j3LTQQ1QiU/MU8/aCWHkFfo
         1lXucySU+MGX812f59+1YVnaQ9ZXsqwWF6sdpJIABxJSfkmCJjhpu6ardsxBL1tk47hl
         zF5pWuGH5oh1rFhZtR6xB7hzoGO3olLfN8HU+oMqdIX5Xv0asZMAPZLhobyzt0b5Cezv
         G6Q+n+Qr9JWefxvwmRg0uVSm/mw2sG935G4Gm7ZnwadZqHzxQJfLfbAYunxOCrYwbKFE
         77rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711528870; x=1712133670;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3kBGo9rBQDVD8B/37mPPc4bOK2wXan+HIEhCfIghQeQ=;
        b=RTQAA7JqWNsgNF0y0aKQqaSsuOhcLGVwW2mwf3c544b/3KjJca7NUsl6jb7Cw8wevh
         u6RbIKzRBiCN00de5zq3wpO+BZxITlHTvGzmINGA6zmVZz3wQ+wGf28k4ylCfF6l8F43
         DbIDEHmZu+U57mpW/04jtSr2nIP57bqCYtAyoSR3Oj9BVVojuQWagblC+qanpeCziiaf
         5HroIb0Etye1eyNgGJasHu/j3/yjlvobEUC/Gu8kAeJMW8OV5a7dGAR6JgUe5b5QBwgM
         aK/2cQkzzTfGrnqPTjpPm80M/4l1QNDVrNuZCXT3MYQO/T8Hg5CwuYDzYv5yhVMdZ5Qy
         MGjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXX4SJelAIcqCghtgCwGCDTSaO1GZN+hoKE+B65mQ7VV2CusuYtyGcHggFmMdlePIY8kKhpZLtsrYR4JEdSENmtWyKdKvMBCwwwqLOz1sIEAmI=
X-Gm-Message-State: AOJu0YxJraRn7nWyqiEgy4qwhfxMHh349PLNnbTsZpLjn3MnxD0/D4VX
	sqTRIbMYwyWiuQS0t2dadc5WgDXKlM9zc/aNeGRrWzR7InTSgINa1hSsfar4HQ==
X-Google-Smtp-Source: AGHT+IH7Hg0Sm990ZknW0ZrRwtuXnVXRB36mHywm9jAemkPYppo81oiTIBfmm8SNo3JZTiDkMTN0Pg==
X-Received: by 2002:a05:6870:239d:b0:221:bd93:2940 with SMTP id e29-20020a056870239d00b00221bd932940mr2005103oap.27.1711528869823;
        Wed, 27 Mar 2024 01:41:09 -0700 (PDT)
Received: from thinkpad ([120.60.52.77])
        by smtp.gmail.com with ESMTPSA id m9-20020a62f209000000b006e6bf165a3asm7434651pfh.91.2024.03.27.01.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 01:41:09 -0700 (PDT)
Date: Wed, 27 Mar 2024 14:10:56 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@axis.com,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v11 8/8] PCI: endpoint: Remove "core_init_notifier" flag
Message-ID: <20240327084056.GC2742@thinkpad>
References: <20240327-pci-dbi-rework-v11-0-6f5259f90673@linaro.org>
 <20240327-pci-dbi-rework-v11-8-6f5259f90673@linaro.org>
 <ZgPXpZgoMqVn8QHt@ryzen>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZgPXpZgoMqVn8QHt@ryzen>

On Wed, Mar 27, 2024 at 09:24:05AM +0100, Niklas Cassel wrote:
> Hello Mani,
> 
> On Wed, Mar 27, 2024 at 12:05:54PM +0530, Manivannan Sadhasivam wrote:
> > "core_init_notifier" flag is set by the glue drivers requiring refclk from
> > the host to complete the DWC core initialization. Also, those drivers will
> > send a notification to the EPF drivers once the initialization is fully
> > completed using the pci_epc_init_notify() API. Only then, the EPF drivers
> > will start functioning.
> > 
> > For the rest of the drivers generating refclk locally, EPF drivers will
> > start functioning post binding with them. EPF drivers rely on the
> > 'core_init_notifier' flag to differentiate between the drivers.
> > Unfortunately, this creates two different flows for the EPF drivers.
> > 
> > So to avoid that, let's get rid of the "core_init_notifier" flag and follow
> > a single initialization flow for the EPF drivers. This is done by calling
> > the dw_pcie_ep_init_notify() from all glue drivers after the completion of
> > dw_pcie_ep_init_registers() API. This will allow all the glue drivers to
> > send the notification to the EPF drivers once the initialization is fully
> > completed.
> > 
> > Only difference here is that, the drivers requiring refclk from host will
> > send the notification once refclk is received, while others will send it
> > during probe time itself.
> > 
> > But this also requires the EPC core driver to deliver the notification
> > after EPF driver bind. Because, the glue driver can send the notification
> > before the EPF drivers bind() and in those cases the EPF drivers will miss
> > the event. To accommodate this, EPC core is now caching the state of the
> > EPC initialization in 'init_complete' flag and pci-ep-cfs driver sends the
> > notification to EPF drivers based on that after each EPF driver bind.
> > 
> > Tested-by: Niklas Cassel <cassel@kernel.org>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/cadence/pcie-cadence-ep.c  |  2 ++
> >  drivers/pci/controller/dwc/pci-dra7xx.c           |  2 ++
> >  drivers/pci/controller/dwc/pci-imx6.c             |  2 ++
> >  drivers/pci/controller/dwc/pci-keystone.c         |  2 ++
> >  drivers/pci/controller/dwc/pci-layerscape-ep.c    |  2 ++
> >  drivers/pci/controller/dwc/pcie-artpec6.c         |  2 ++
> >  drivers/pci/controller/dwc/pcie-designware-ep.c   |  1 +
> >  drivers/pci/controller/dwc/pcie-designware-plat.c |  2 ++
> >  drivers/pci/controller/dwc/pcie-keembay.c         |  2 ++
> >  drivers/pci/controller/dwc/pcie-qcom-ep.c         |  1 -
> >  drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  2 ++
> >  drivers/pci/controller/dwc/pcie-tegra194.c        |  1 -
> >  drivers/pci/controller/dwc/pcie-uniphier-ep.c     |  2 ++
> >  drivers/pci/controller/pcie-rcar-ep.c             |  2 ++
> >  drivers/pci/controller/pcie-rockchip-ep.c         |  2 ++
> >  drivers/pci/endpoint/functions/pci-epf-test.c     | 18 +++++-------------
> >  drivers/pci/endpoint/pci-ep-cfs.c                 |  9 +++++++++
> >  drivers/pci/endpoint/pci-epc-core.c               | 22 ++++++++++++++++++++++
> >  include/linux/pci-epc.h                           |  7 ++++---
> >  19 files changed, 65 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/cadence/pcie-cadence-ep.c b/drivers/pci/controller/cadence/pcie-cadence-ep.c
> > index 2d0a8d78bffb..da67a06ee790 100644
> > --- a/drivers/pci/controller/cadence/pcie-cadence-ep.c
> > +++ b/drivers/pci/controller/cadence/pcie-cadence-ep.c
> > @@ -734,6 +734,8 @@ int cdns_pcie_ep_setup(struct cdns_pcie_ep *ep)
> >  
> >  	spin_lock_init(&ep->lock);
> >  
> > +	dw_pcie_ep_init_notify(&pci->ep);
> 
> This looks wrong (and I think that you have not build tested this).
> 

Ah, this is silly. Sorry, added the change in a rush :(

> dw_* prefix indicates DWC, so it is a DWC specific function.
> 
> I don't think that you can use this function for the 3 non-DWC EPC drivers.
> I think that you need to use call pci_epc_init_notify() directly.
> 
> 
> (Also perhaps rebase your series on v6.9-rc1, I got conflicts when trying
> to apply it to v6.9-rc1, because it looks like the series is still based
> on v6.8-rc1.)
> 

I rebased the epf rework series and didn't get any conflict. But will rebase
this one also and send next version.

Thanks for noticing my idiocy.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

