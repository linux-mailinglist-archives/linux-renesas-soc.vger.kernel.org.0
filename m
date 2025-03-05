Return-Path: <linux-renesas-soc+bounces-14032-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F69EA509FF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 19:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E15E18831F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 18:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C602B2505BD;
	Wed,  5 Mar 2025 18:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rawN+bV5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198851D63C3
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Mar 2025 18:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741199325; cv=none; b=BlSOD8uniNpzZ1AMVUv11RO7h04V/WRFQNy114LyzotBpuHBZz1gtqVoSwE1bUx7xSTOOt/7oXD/WC6CD4k4iPyHYQBGE84yLHqSizg33/L33HbpYQVxQKGjPd2RZ7HY9D4HxA9xRLyypgcBlw01ZSKoK0/RlZyOK3oINB9tHVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741199325; c=relaxed/simple;
	bh=NXQNTWJeiSFzjPLlih2rgrST7ZU+kwSlPLsGUkO6i4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DnEwAESm+ICznqlLv+xm915BPD1JxZJA1iXU4kG8w4dxMB4pJj9+S+UJhVos5wyt6L4V7XPMEhveIBqNM0Gw20RvBIIXjiK6ikzOCwIW8dzGhZiKlcP55sND029pM/2ZUfqLJe4aIbYRZfKKT8gqZZ98e8CsW9IKd5y/8WF7A/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rawN+bV5; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2235908a30aso133304835ad.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Mar 2025 10:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741199323; x=1741804123; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IlUZuaZqa3JLI6rAH+eSKbr5zwilBRdu2UhafBOdrdc=;
        b=rawN+bV57J1B+RzCmZ77uY16uIki+f4lQ9ppIpAkWldjdzIMnlkOIEnCKIAOSOoOGh
         jjkd8TApQJ5n5ruGtpwgOVUfEhGfijcHsYT3n1Lgxot7HWpAEs4033eFWCbcs96WjKh4
         Shg1NLPB9a7KkAA1MexVwFCjo2lSgPJSSk5PWnfaIKds+1qKqn60LIEYTR8TyCkrCjBy
         I+H/B5fyojgxbNVaYXHGwkTySQA5rx9rBSLgztiGEDsiThM6W4QD0by8V20kTq2F/k7H
         WKXJP/nejCrj4h0a4U+O+Cf8sR0SHPVoB1BemiMXZ2cUCARNCV+m5V7+laeDq2CIRyar
         dQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741199323; x=1741804123;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IlUZuaZqa3JLI6rAH+eSKbr5zwilBRdu2UhafBOdrdc=;
        b=EG/z4M7/mREuTthg5RPseZmE/oo+5G/W0qPcR6DjREl7oVdXHxD22e7m9zxgbOvK7N
         ACWkyYTvp+wY9dMWIgIowHCmqrU70VqLcq9OQdJLKVIsFrNHq4dnSISwWWWbevA2L7Ox
         6nbIqYDhWUvGZLl0bp60lHBF6+mOWpyTw+Hy4nYSJPTdQS9pVHcyJ4loJN1yriQo8c1E
         iDiZXbJ762xTD/OzlzV1BUNgVlMZSBrrWuHqiPT6p6b3gaIL0c88qWus89980ifOqC0k
         e3mDXDGSs4yZfrz9jnMKF+NGxWRq3uUFyWVzPB9guQjKNRwbBYFMUgY4wRMXQRlvj5HA
         6C+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmunrqEab46+jxfOpBXvmfJoCfwZJf6PMOQVLS2Mi7VBZ4d2PjN0EoeLA5oVhkQw84FM4dF4l4oEz9Np0bWd4bIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtGLbdntrAA4Sb37tP71K/r6zn5d10YBNdnj3mIA207H+I2mgm
	770vOeMrNX7gJcWryLNx/Pb7wkXeUI+jdg6rYb1r4IiA08bmc4pJB9ZXH2/cEg==
X-Gm-Gg: ASbGncv7aGLuUZdCB4y7Zpiq2yAVX3Fz9YLLGRzNdI/uDZqO8aHfnPC5EuMBzvH+ySQ
	hFcqBDAQmC1oDGHZ6PdEKutSYK7C5tJGgXodByUn0PIhUZAm293n05H9JkZxYBn0zlu+x0Xhnry
	KXaFJWDu+dx4Qzad4vfDyyXNV9eaIa3o0MU7bkBZ1feQ5WaX/Hbh/aDZIlz0FpoMKoQhEZwrqkO
	45dHprFps12gSamn2yRG/Dt21zTdwQ1BuvPHTYej3Doo/1AC7QDPY/FO7+uzuCGkzoFXzblfnpt
	25hea0o1UbnPeOitMqQPG8TPvNt67O85V2PJ9aqNcgMV70az/MTinCI4
X-Google-Smtp-Source: AGHT+IF+TGwksJJjKWkdx/R8tEcgWJtus8Acn/xVNQz9+4wgbYvkHfwKDe4CHqeQdGOj/ucT3x99Xw==
X-Received: by 2002:a05:6a21:3986:b0:1f0:e84c:866f with SMTP id adf61e73a8af0-1f3494967f1mr8474146637.21.1741199323380;
        Wed, 05 Mar 2025 10:28:43 -0800 (PST)
Received: from thinkpad ([120.60.140.239])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7ddf2444sm12428366a12.3.2025.03.05.10.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 10:28:42 -0800 (PST)
Date: Wed, 5 Mar 2025 23:58:33 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Fan Ni <nifan.cxl@gmail.com>, Shradha Todi <shradha.t@samsung.com>,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, lpieralisi@kernel.org,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	Jonathan.Cameron@huawei.com, a.manzanares@samsung.com,
	pankaj.dubey@samsung.com, cassel@kernel.org, 18255117159@163.com,
	xueshuai@linux.alibaba.com, renyu.zj@linux.alibaba.com,
	will@kernel.org, mark.rutland@arm.com,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v7 3/5] Add debugfs based silicon debug support in DWC
Message-ID: <20250305182833.cgrwbrcwzjscxmku@thinkpad>
References: <20250304171154.njoygsvfd567pb66@thinkpad>
 <20250305173826.GA303920@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250305173826.GA303920@bhelgaas>

On Wed, Mar 05, 2025 at 11:38:26AM -0600, Bjorn Helgaas wrote:
> On Tue, Mar 04, 2025 at 10:41:54PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Mar 05, 2025 at 12:46:38AM +0900, Krzysztof Wilczyński wrote:
> > > > On Mon, 3 Mar 2025 at 20:47, Krzysztof Wilczyński <kw@linux.com> wrote:
> > > > > [...]
> > > > > > > +int dwc_pcie_debugfs_init(struct dw_pcie *pci)
> > > > > > > +{
> > > > > > > +   char dirname[DWC_DEBUGFS_BUF_MAX];
> > > > > > > +   struct device *dev = pci->dev;
> > > > > > > +   struct debugfs_info *debugfs;
> > > > > > > +   struct dentry *dir;
> > > > > > > +   int ret;
> > > > > > > +
> > > > > > > +   /* Create main directory for each platform driver */
> > > > > > > +   snprintf(dirname, DWC_DEBUGFS_BUF_MAX, "dwc_pcie_%s", dev_name(dev));
> > > > > > > +   dir = debugfs_create_dir(dirname, NULL);
> > > > > > > +   debugfs = devm_kzalloc(dev, sizeof(*debugfs), GFP_KERNEL);
> > > > > > > +   if (!debugfs)
> > > > > > > +           return -ENOMEM;
> > > > > > > +
> > > > > > > +   debugfs->debug_dir = dir;
> > > > > > > +   pci->debugfs = debugfs;
> > > > > > > +   ret = dwc_pcie_rasdes_debugfs_init(pci, dir);
> > > > > > > +   if (ret)
> > > > > > > +           dev_dbg(dev, "RASDES debugfs init failed\n");
> > > > > >
> > > > > > What will happen if ret != 0? still return 0?
> > > > 
> > > > And that is exactly what happens on Gray Hawk Single with R-Car
> > > > V4M: dw_pcie_find_rasdes_capability() returns NULL, causing
> > > > dwc_pcie_rasdes_debugfs_init() to return -ENODEV.
> > > > 
> > > > Debugfs issues should never be propagated upstream!
> > ...
> 
> > > > So while applying, you changed this like:
> > > > 
> > > >             ret = dwc_pcie_rasdes_debugfs_init(pci, dir);
> > > >     -       if (ret)
> > > >     -               dev_dbg(dev, "RASDES debugfs init failed\n");
> > > >     +       if (ret) {
> > > >     +               dev_err(dev, "failed to initialize RAS DES debugfs\n");
> > > >     +               return ret;
> > > >     +       }
> > > > 
> > > >             return 0;
> > > > 
> > > > Hence this is now a fatal error, causing the probe to fail.
> 
> > Even though debugfs_init() failure is not supposed to fail the probe(),
> > dwc_pcie_rasdes_debugfs_init() has a devm_kzalloc() and propagating that
> > failure would be canolically correct IMO.
> 
> I'm not sure about this.  What's the requirement to propagate
> devm_kzalloc() failures?  I think devres will free any allocs that
> were successful regardless.
> 
> IIUC, we resolved the Gray Hawk Single issue by changing
> dwc_pcie_rasdes_debugfs_init() to return success without doing
> anything when there's no RAS DES Capability.
> 
> But dwc_pcie_debugfs_init() can still return failure, and that still
> causes dw_pcie_ep_init_registers() to fail, which breaks the "don't
> propagate debugfs issues upstream" rule:
> 
>   int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
>   {
>           ...
>           ret = dwc_pcie_debugfs_init(pci);
>           if (ret)
>                   goto err_remove_edma;
> 
>           return 0;
> 
>   err_remove_edma:
>           dw_pcie_edma_remove(pci);
> 
>           return ret;
>   }
> 
> We can say that kzalloc() failure should "never" happen, and therefore
> it's OK to fail the driver probe if it happens, but that doesn't seem
> like a strong argument for breaking the "don't propagate debugfs
> issues" rule.  And someday there may be other kinds of failures from
> dwc_pcie_debugfs_init().
> 

Fine with me. I was not too sure about propagating failure either.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

