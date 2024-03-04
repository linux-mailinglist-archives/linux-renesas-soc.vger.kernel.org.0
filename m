Return-Path: <linux-renesas-soc+bounces-3414-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C8E86F9F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 07:19:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB3052815F5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 06:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C132C2C8;
	Mon,  4 Mar 2024 06:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UkdwZ0NJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A26BA5E
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Mar 2024 06:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709533151; cv=none; b=of/PCocG0i0PYni0DdSwUigTn4cMxnf+aXzBSja5SHtZNhJVJ/hhHeWH0EAuQyeumRSxlZNzZi14TY93CnhiHvsvKzmB9JN+AMv834+R0AUuUmuSDGHSNehhXeI9vR+QcEU5Oyb+MM7rI4KX2vduz4m5B14aFPajk9LRSUB4rGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709533151; c=relaxed/simple;
	bh=oDnfxJ4A8v+Y+oMepOulbgQydBSN2yDgubk57DJ4nVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rYR/iTDCYepEfg+1r5Cap4jktwWtDJ7ekUbJvyuysd0j61/aYKYMIQRYt+JFMjh6MLx8wWqQa2eP9pjkLcif2Hx1OgtFgfTpZkL34QmM+WGzbKcJOOzQnCmVMSXpW8lMxlx6MKx1EqFLiGTUieZwz9PVr/pzFEXN1lR7eMmEJVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UkdwZ0NJ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6e55731af5cso3056275b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 03 Mar 2024 22:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709533149; x=1710137949; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yY8EnFgYAlXlPqttQTMQ9X4CPIclgM7lc+6szk0vfN0=;
        b=UkdwZ0NJO/t+VeRQ3jJaAJWmtWtHhKKNpJDL8AnzczA5poxIkP82dlz2Nz3ZvQaA5j
         042n+WMa/w1Z1PmxEDdZ+r7jrAX6o+4erId+uuiw40c6rNLfagxqvvs3sCp7PmXk3oY+
         p7z8YX5yAkFjrnDGq4yUApovsYKc/v106gUdPYksnuaFAz978pmQUBVm484eaJhbCZN4
         Sloh50Q44CSXV5G67vSnWWKOJ4ho0R4hNbViDYrKxyBJvG+htd+UdGVJjnMNBkHMLpOf
         jJW8OKwZmqof6MZl+/eLJGjheZqCLf3+NQiWtBMgLVBw7JTZoK8fvHx7ixno2eS74MnX
         6jMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709533149; x=1710137949;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yY8EnFgYAlXlPqttQTMQ9X4CPIclgM7lc+6szk0vfN0=;
        b=BhEwgSbcROQhy5zEsoD4CkF5GNdGC2wdtlV1UqGd7kl78f/EEOifingk943aIkCn3T
         DT3XXcC+XDxAG9Uk59xMs6/SpzLaKjVDE6xpYm/a5J+kzC36iDm1N4JTOlJnlPvxQG3S
         Yu7rTD4G4+bEAz94Ctlk5GybOgbVYDGvSyIMRhqIqBtixsyL8DJ+i6GS6Xn7GRz/zMWI
         A8aRr1HZWoxZK8BgdVu+lKNI8j43CLD+BJTJmrTckJ1YC/eUFLQF0/NneSW+JEzVqYkn
         X1yn69EnvdI/fxhN2AdJVLsMU1gX2KAjo6yrzQUHXKdaLRv146lJvwLBqtxpUDd0YHVM
         KJAg==
X-Forwarded-Encrypted: i=1; AJvYcCVnrvzk/PtOEilsMmHhSTLcwyK9olQ0oU3Zjs64LBGhRBXXc+GM85oe+/7xtuwq4eVbdF1P8m9RzaE1YQWuybPY+fx2Wp8h79deOGC1fftl0c4=
X-Gm-Message-State: AOJu0Yy+Y7D7ixlwC4FH3g45rVmfCj+oz2whS3PiBOSVONF27yI3wH8a
	a9I3v1oWExFY7QovY1yzAz/H0KHFIPew861ZTktX3UmFwZKZe5+7uELOXimAFg==
X-Google-Smtp-Source: AGHT+IEGGhWfMbQLfvF9uJtsc7Y6qkosURA49AQc9jMC4u8Vp5VihTolBAdcYaH2nlvvK6/zVXQicg==
X-Received: by 2002:a05:6a00:2e26:b0:6e4:f32a:4612 with SMTP id fc38-20020a056a002e2600b006e4f32a4612mr8718386pfb.16.1709533149188;
        Sun, 03 Mar 2024 22:19:09 -0800 (PST)
Received: from thinkpad ([117.207.30.163])
        by smtp.gmail.com with ESMTPSA id k19-20020a63ff13000000b005cfb6e7b0c7sm6825218pgi.39.2024.03.03.22.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 22:19:08 -0800 (PST)
Date: Mon, 4 Mar 2024 11:49:00 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
	Siddharth Vadapalli <s-vadapalli@ti.com>
Subject: Re: [PATCH v3 3/5] PCI: dwc: Pass the eDMA mapping format flag
 directly from glue drivers
Message-ID: <20240304061900.GF2647@thinkpad>
References: <20240226-dw-hdma-v3-0-cfcb8171fc24@linaro.org>
 <20240226-dw-hdma-v3-3-cfcb8171fc24@linaro.org>
 <Zdy8lVU6r+JO6OSJ@lizhi-Precision-Tower-5810>
 <20240227074533.GH2587@thinkpad>
 <Zd4eLBXscaV1WkbV@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zd4eLBXscaV1WkbV@lizhi-Precision-Tower-5810>

On Tue, Feb 27, 2024 at 12:38:52PM -0500, Frank Li wrote:
> On Tue, Feb 27, 2024 at 01:15:33PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Feb 26, 2024 at 11:30:13AM -0500, Frank Li wrote:
> > > On Mon, Feb 26, 2024 at 05:07:28PM +0530, Manivannan Sadhasivam wrote:
> > > > Instead of maintaining a separate capability for glue drivers that cannot
> > > > support auto detection of the eDMA mapping format, let's pass the mapping
> > > > format directly from them.
> > > 
> > > Sorry, what's mapping? is it register address layout?
> > > 
> > 
> > Memory map containing the register layout for iATU, DMA etc...
> 
> the world 'map' is too general. can you use 'register map' at least at one
> place? There are bunch 'map' related DMA, such iommu map, stream id map, 
> memory page map. The reader need go though whole thread to figure out it is
> register map. 
> 

This is what used from the start and also what "mf" corresponds to. So I had to
use the same terminology.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

