Return-Path: <linux-renesas-soc+bounces-8898-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFA3973DF9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2024 19:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BF69288417
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2024 17:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4769818DF8C;
	Tue, 10 Sep 2024 17:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nEi2hqXy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A694A02
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Sep 2024 17:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725987675; cv=none; b=aMZbMaPIkzfCyc4p+rOGGskrwYuaFJzJoT27xdsxZu/LCfMUyOOegV+81ed8P7wyJTIcNiQvbr2e0CtPtWXQJLO0KtwlrSs51ukkjgvs+bV6otGaADlHKhw+jCAu/sVitMDE9Up5pTTC8eiMf4TZO2J/qpSR4Lmqal3gNFdPDfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725987675; c=relaxed/simple;
	bh=HIYNvnAdgW89EfSpETD3OtBL5KxgpvDe1ZV5+r8iyVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTBtHvzJpvxeUT/ZTgg17cryK04t97CUdP5Z+aUYyBiZoOiVwljAkcu6LFgYdbV8WW4m4Nawddeulc88ZhT0MUY/ewyKhmL9svMBytoX3KfLOpVSvkeqgIXsfbBiS/T+G+LDC3+tGCCbmLYBJlMD/RflnD+5YsBnB441ATW0bnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nEi2hqXy; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-207115e3056so27783905ad.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Sep 2024 10:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725987673; x=1726592473; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pBskbk3QBU0YMtrU99WpBguxflCzi8adsZB8njQ7nhU=;
        b=nEi2hqXy4bFv+4EXH00305ZEe9khGaOb0o7r5k1e7907EtjPorp37Sg6idERwbjLrt
         BaxF3rwNLBB1KcmCg26EowKEPFX+r1J1NJJCiYxlaWaHZARxdOHh2gdslX7eZNDJFvvi
         aokzwO3fQIkZ2GoLtPmekyEkD7ZGP2ycs+qO6jcnPLsCF7lR1RLO3UxKaGpfSsMcyXX/
         0C2V//Gn5iFPWG1Gzpqhb1HAoMV3wMGV6RU0K4NvAJu5t+ZKbgWAoBFupFhnwTsR/Kk8
         vpJFZjcYN157HT82zDoi+sEA4to/H+Y6rWxUNRgApGzdvhgxN6kn7PcKqPrUoVCBDX+L
         ft/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725987673; x=1726592473;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pBskbk3QBU0YMtrU99WpBguxflCzi8adsZB8njQ7nhU=;
        b=LFC5v7PBAfN+45Tu32/6JrejGxSjc2wClF4cpF+A8avOWfZgxaRs8Hcz1WBgfrzOgL
         J7lfNmUyoep8NxV+/V0+KQjC43kD8Fsfw0ymLEQrjo315vdb6ag6ydmUre1/tdwZ1c7r
         FuMu9QSkh08KcMQSkT7j4uZSHP9HrJ7ypCC/UPFSCgt9FmovaFDRqQJlW0OVxHYe694x
         stcgJK5tjSCQj5RRTQ08WKx/2OO9QS71WKABErbVoCvPs5nMfXCQfcCv4tUYTZwkO2uw
         CQexzg22m9jpOgxb43a3fLbRiFNJz3xUvm9Rjz+73HWQt9tMvnGAPFX3pqrgAFnSbKXR
         WoNA==
X-Forwarded-Encrypted: i=1; AJvYcCVPujk2CY7pmbF13xPsjFanpqIBsuETD71XPcUrspKAV/+4Lb9/6RUBk7unIa1hNMdTrqdpp7NVnSZ6A3GDi9Wwug==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUbDHqxViXKMWewzsoro1lRNSSWfSN77wH9sz6BpFnN9vaI0ND
	MrGdHECs/ppxYtcp//Qs4p4ZX90oDJ64b6Nkt12uf/9Uw5joAucMLiFjI9foeQ==
X-Google-Smtp-Source: AGHT+IF/raqp+DCJypfwe5V7+Q+7qT8bMOaTzbFGyeYWrZCI1/k/X6tIvkrcWMVdJdlQehGHErlM4Q==
X-Received: by 2002:a17:902:d2c9:b0:207:73f:59f3 with SMTP id d9443c01a7336-2074c681cecmr18549225ad.32.1725987672621;
        Tue, 10 Sep 2024 10:01:12 -0700 (PDT)
Received: from thinkpad ([120.60.128.228])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f1f469sm50762155ad.223.2024.09.10.10.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:01:12 -0700 (PDT)
Date: Tue, 10 Sep 2024 22:30:52 +0530
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
Message-ID: <20240910170052.qorc7hedfy4oqzgt@thinkpad>
References: <20240904-pci-qcom-gen4-stability-v6-0-ec39f7ae3f62@linaro.org>
 <20240904-pci-qcom-gen4-stability-v6-3-ec39f7ae3f62@linaro.org>
 <ZtgqvXGgp2sWNg5O@hovoldconsulting.com>
 <20240905152742.4llkcjvvu3klmo6j@thinkpad>
 <Ztnb-GauC_8D8N-i@hovoldconsulting.com>
 <20240905173437.hm3hegv5zolaj7gj@thinkpad>
 <Ztql31KXrBQ1I5JV@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ztql31KXrBQ1I5JV@hovoldconsulting.com>

On Fri, Sep 06, 2024 at 08:49:03AM +0200, Johan Hovold wrote:
> On Thu, Sep 05, 2024 at 11:04:37PM +0530, Manivannan Sadhasivam wrote:
> > On Thu, Sep 05, 2024 at 06:27:36PM +0200, Johan Hovold wrote:
> > > On Thu, Sep 05, 2024 at 08:57:42PM +0530, Manivannan Sadhasivam wrote:
>  
> > > > Perhaps we can just get rid of the Kconfig entry and build it by default for
> > > > both RC and EP drivers? I don't see a value in building it as a separate module.
> > > > And we may also move more common code in the future.
> > > 
> > > It is already built by default for both drivers. I'm not sure what
> > > you're suggesting here.
> > 
> > Right now it is selected by both drivers using a Kconfig symbol. But I'm
> > thinking of building it by default as below:
> > 
> > -obj-$(CONFIG_PCIE_QCOM) += pcie-qcom.o
> > -obj-$(CONFIG_PCIE_QCOM_EP) += pcie-qcom-ep.o
> > +obj-$(CONFIG_PCIE_QCOM) += pcie-qcom.o pcie-qcom-common.o
> > +obj-$(CONFIG_PCIE_QCOM_EP) += pcie-qcom-ep.o pcie-qcom-common.o
> > 
> > A separate Kconfig symbol is not really needed here as this file contains common
> > code required by both the drivers.
> 
> But the separate Kconfig symbol will only be enabled via either PCI
> driver's option (e.g. can't be enabled on its own).
> 

True. But since the common file is required by both drivers, I thought of just
building it by default. But looking at your below reply, it won't be possible.

> I'm also not sure if the above works if you build one driver as a module
> and the other into the kernel (yes, I still intend to resubmit my patch
> for making the rc driver modular).
> 

Hmm, I thought you dropped that patch ;) Anyway, if that happens, it will be a
problem. I'll keep it as it is.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

