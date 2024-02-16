Return-Path: <linux-renesas-soc+bounces-2912-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CE3857FFF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Feb 2024 16:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B74271C2151D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Feb 2024 15:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2774C12F380;
	Fri, 16 Feb 2024 15:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pi638i8s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC931E481
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Feb 2024 15:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708095742; cv=none; b=hB92muGctkp4SqkTLofC2/GRoOQuIwANYUrV9Z9x6Y1fIz/Z61Gol4a4deka+CJUCCUvbEmqJ2oiNZHflnvzZcHCoZRtKfpSWt8YxBuutG1J/Nppo4/cZG0Vh2qxgMgTTcopjhF36CUSQrAt4QVME18BiLZ3+/QHR3x0uv+UlBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708095742; c=relaxed/simple;
	bh=PFnJlG/BH87SYA2q7LzbhYfSQhpNgUw954DgZ38T0rM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ED2sHxqbBgtqOV249aLJmTVWBfHHd6H+82w1PVqNhUzUYqQiJ9rtceQKSe7sVcXTMyVU+0b5LIPowtYVl+YS/zsaV96AbyiOP7EULpR9hlb4DG37vBScxYSSWXKSWjC33m8yUZyGXkqsXaKh+/olDL4PcQ2b3otlty0w95prdjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pi638i8s; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e10614c276so1478345b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Feb 2024 07:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708095740; x=1708700540; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xjKDnEpyYeAmu9qtpq1bDPfT62b9+uwDJch6VEOZdNo=;
        b=Pi638i8sWXXnZAfJfoU2uRQZMy11R+CO96rh3stq7MsUa35+aeCrQEx6U27wm8sfGo
         /3UsP6UILcxE96bbM/p/nhTeys1rnp2G9+fRmP6mbDK8zojuK1UdJ8lEzyUdlIDy39KV
         zhXzp48fYxPQbf7nQB5mwbd5f2fQsAuvWpPvBeeXohsndbHHHjDgMR8lsRk0paFyACuh
         5umVy6JzK83fxZa1re8U3y/UIA98SVhHuZesCXLoJckjAPtuju2uMe5YXK8Ybr9PkVi3
         TlG4IkSkhIg75FPKPWe1GcjFyGrWZyaomp/57+uXlJNWGk8hWGqC1N8tE+ou8XuiFXXe
         xXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708095740; x=1708700540;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xjKDnEpyYeAmu9qtpq1bDPfT62b9+uwDJch6VEOZdNo=;
        b=MHbCrkFaJKqqHZmdEqFC0kNKKGMK1jCY0OpFjuB4A36VplyssQsrz7RDYQocCiZ7Sr
         xP/HCBZ5yhhbG6PpOmOUwZyXqbzVok0wYO0dXH6064BgHOmZry8uIAsO1vCpLPujHnyY
         TklZenVOM8J7jwCiTNohC7z4WcxBwO1FGcnbbws6DrdHAMHU6SooMAyyEpjfrSf6yV1M
         KUaxbUknT8uGmXGhTvdivCFQeHAylR+Ce0qQCTBh4zcffh7uocjO2MKHMkyttXeOPPrB
         ZaF/pyTTU5SYjUodydROvesMp7LHUpAdQGl67caBUZt3Pn5xVO91uImWeRrMBqcX+7/k
         WbiA==
X-Forwarded-Encrypted: i=1; AJvYcCUGQ8xwis7Rb5rd1dTf9hYWZaldDA2+yvpyMt+u35CCU7xJpKhIB9VBrDEFr/DUMQMtlp3LxHIWxkudSSnnK7eW8mKgoAMsALerhs6rF0F9nVE=
X-Gm-Message-State: AOJu0Yx/dtAwt+2WUHLdn1aqx7P5syxGXcTPLS67KR/NgP3OB8Xzm91Q
	61xSnMu7XBQ1eE3Smoc6di1GrxEytWKhweSZHAJaEfH7a9K0lqvGtq/lmoc/bg==
X-Google-Smtp-Source: AGHT+IFgr7DrTunbXNT4CmMkXBhBhF8q3qElLWukIPhZqe8IVzyyit1X3Y+109ONonjOTtTtsSuzVw==
X-Received: by 2002:a05:6a00:c91:b0:6e0:a9c4:3016 with SMTP id a17-20020a056a000c9100b006e0a9c43016mr5957902pfv.16.1708095738239;
        Fri, 16 Feb 2024 07:02:18 -0800 (PST)
Received: from thinkpad ([120.138.12.48])
        by smtp.gmail.com with ESMTPSA id x5-20020aa784c5000000b006e080bbc92dsm27057pfn.177.2024.02.16.07.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 07:02:17 -0800 (PST)
Date: Fri, 16 Feb 2024 20:32:08 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
	linux-tegra@vger.kernel.org, ntb@lists.linux.dev
Subject: Re: [PATCH v2 0/2] PCI endpoint BAR hardware description cleanup
Message-ID: <20240216150208.GC39963@thinkpad>
References: <20240216134524.1142149-1-cassel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240216134524.1142149-1-cassel@kernel.org>

On Fri, Feb 16, 2024 at 02:45:13PM +0100, Niklas Cassel wrote:
> The series is based on top of:
> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=endpoint
> 
> 
> Hello all,
> 
> This series cleans up the hardware description for PCI endpoint BARs.
> 
> The problems with the existing hardware description:
> -The documentation is lackluster.
> -Some of the names are confusingly similar, e.g. fixed_64bit and
>  fixed_size, even though these are for completely unrelated things.
> -The way that the BARs are defined in the endpoint controller drivers
>  is messy, because the left hand side is not a BAR, so you can mark a
>  BAR as e.g. both fixed size and reserved.
> 
> This series tries to address all the problems above.
> 
> Personally, I think that the code is more readable, both the endpoint
> controller drivers, but also pci-epc-core.c.
> 
> (I will be sending out a patch series that adds BAR_RESIZABLE to enum
> pci_epc_bar_type in the coming week.)
> 

Applied to pci/endpoint!

- Mani

> 
> Kind regards,
> Niklas
> 
> 
> Changes since V1:
> -Picked up tags from Kishon and Mani.
> -Improved commit message for patch 1/2 as suggested by Mani.
> -Improved kdoc in patch 2/2 as suggested by Mani.
> 
> 
> Niklas Cassel (2):
>   PCI: endpoint: Clean up hardware description for BARs
>   PCI: endpoint: Drop only_64bit on reserved BARs
> 
>  drivers/pci/controller/dwc/pci-imx6.c         |  3 +-
>  drivers/pci/controller/dwc/pci-keystone.c     | 12 +++---
>  .../pci/controller/dwc/pci-layerscape-ep.c    |  5 ++-
>  drivers/pci/controller/dwc/pcie-keembay.c     |  8 +++-
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c   |  4 +-
>  drivers/pci/controller/dwc/pcie-tegra194.c    | 10 +++--
>  drivers/pci/controller/dwc/pcie-uniphier-ep.c | 15 +++++--
>  drivers/pci/controller/pcie-rcar-ep.c         | 14 ++++---
>  drivers/pci/endpoint/functions/pci-epf-ntb.c  |  4 +-
>  drivers/pci/endpoint/functions/pci-epf-test.c |  8 ++--
>  drivers/pci/endpoint/functions/pci-epf-vntb.c |  2 +-
>  drivers/pci/endpoint/pci-epc-core.c           | 25 +++++-------
>  drivers/pci/endpoint/pci-epf-core.c           | 15 +++----
>  include/linux/pci-epc.h                       | 39 ++++++++++++++++---
>  14 files changed, 106 insertions(+), 58 deletions(-)
> 
> -- 
> 2.43.1
> 

-- 
மணிவண்ணன் சதாசிவம்

