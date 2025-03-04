Return-Path: <linux-renesas-soc+bounces-13972-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33295A4E97F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Mar 2025 18:42:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 921551881867
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Mar 2025 17:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DFBA2980AD;
	Tue,  4 Mar 2025 17:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K9wFxLbn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB8327F4CE
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Mar 2025 17:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741108326; cv=none; b=ToMq/43K8cMBfH0QvmqhrdQkxJWYGnKnWG/af6fIRP+k4sng8msYcu3UwIOfWqxxJx37uj3OVJ1tX2cd+r+8RNgcKF1WnCzm21we23c+F4U9ujoP3e9nEg8arGZZbZD4Cy3Qr8id1iRpe0bDJvTP+VsmUvoZwLGhqVfNGesdpEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741108326; c=relaxed/simple;
	bh=qUPNYhbM7EM4tXTnq0Udx6d1pN2xoKCqq336L8Pjv1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7pJb8rA4UjA+mHf7aM4rHrxlx6We+nrSDJA8RkfRqXM21JPrBJ5cY3re5CMuHLzs6p1IxFBcMqp2zWNNaeOE9NzYYKs/Ff2WXIho+g239n2NsF5lmeZkmuYZNsVJCu2g5nh5DP4Us2QDECarbQi170sabIMA+hZ2qRMR3vNeiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K9wFxLbn; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2feaca4e99cso8668098a91.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Mar 2025 09:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741108324; x=1741713124; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cKWAtQRLCp0qz4UwlvN+WFU+keHMUnNOhmFv6iaIYQU=;
        b=K9wFxLbn1cb+SuQFCyRUKGLDXcCQ+0FK12TRKX27v0hZroWk9jBp2q6INElk40XNTR
         nPeca/AidNdKKjyqJPcrmrfWF2VWVczG6L5PI1KuN91+bv4mXU0gveq0Q2hNKsBflS6O
         psm8zvi1727i0x+9AF+oZCYgOOMlMnH6yl03utPaK50+bN8KC9Ty8HQdTm0hrQGaNUYH
         w6LExT31IDynMont9PjMax7iJdhL2t7y/Gg4hqS2gYM4gsAWskFnRZtgXr9O03BZ9BiL
         y5cWpOV4NRYlKygcgyWIdfOPB+Zr27HZycZTnvxRAkARE64clrpg0xSs+s2s7YjVZB5X
         Af1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741108324; x=1741713124;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cKWAtQRLCp0qz4UwlvN+WFU+keHMUnNOhmFv6iaIYQU=;
        b=mkz8G0O35Uiamf0v0SJ/TSUZNoIw542wou0l78XWlukOlycFZ0gxtyF07F8dDA5k58
         j82AgAODmanZmtKN8jEW6oioLIXRz5BYpS1MjY40u8lRjWy1ThpBa7aAib9qF5OOKmGx
         72ULtl0UrOzCuVk6bLuKsymTzL1c1wCHxoRadqwP5S4hE6xChf2oxdw4zHRnU+r32doQ
         zWi62GBZsFsxsppOP3YaaaJsb6UQZ0xIknDIxh3ZkQzug57llx/hkE6u9yGoVDB/SlyL
         Yf3bSsUpcSKeAlr4ToiFR5lT7i9lM4RpMo1VZQBe9XrH+HlVMj0rqeKq0k63PD8ST5Bu
         6qFw==
X-Forwarded-Encrypted: i=1; AJvYcCWD2YS5WgN64Agi8utMV8dbYfRswnuEHZ5gK+2j4DMN4Bk320D906matO2y0RaAQb8SsQIUr0OXLFH04VggGjm13A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl3lHpEKep6J1h8h06CtxfBsbhZKpOwDlyOSYx2XRfdRPuYR8Q
	NzughpnVuCHtKmFjfzOPVQEIl62OAlHiT8EVXt+78UUUj5NSzgnsDtSUxW9wGQ==
X-Gm-Gg: ASbGnctKrXBa44bjIN9CRCT+MKqj0OmMAMkVB4BJ/gvIcSB50jg9+h38T8p3DVuJGdQ
	OUufsLZq1Q/rEeWO4I4prcTgXJWA5gN/BKxsn+4ry9uOPcYMhO9rG9cXhpU+6iI979JACd/TnrC
	89sHO7MKUQp6VOQXwgEdwLd/GwSqqL/95AHp6a2ScmplpRzg5p9MC+S+3whd1qH1FcMqcwD7k3v
	e+1sR4YM6d3dOyNoBhEUUzoTj5khbeyKWjpCf6uCOQQ3v55kWcuEcYaD4fVf3mc4z6PkK1jviyX
	Zx1KuKA7uk7Hopz2Hs6wI72gJ/RQAEJSWTV+IyZwmSEYf/sPTC+/nNY=
X-Google-Smtp-Source: AGHT+IHAxbyCgHNleOV6pyn/ykxc9Lgl0VZqS9TI0AHJNMb4FhegCiAgjJqpVwILV7hlEejAmOZObw==
X-Received: by 2002:a17:90b:1c09:b0:2f2:3efd:96da with SMTP id 98e67ed59e1d1-2ff497a01bbmr70685a91.24.1741108323433;
        Tue, 04 Mar 2025 09:12:03 -0800 (PST)
Received: from thinkpad ([120.60.51.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea6753137sm11340607a91.6.2025.03.04.09.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:12:02 -0800 (PST)
Date: Tue, 4 Mar 2025 22:41:54 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Fan Ni <nifan.cxl@gmail.com>,
	Shradha Todi <shradha.t@samsung.com>, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, lpieralisi@kernel.org,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	Jonathan.Cameron@huawei.com, a.manzanares@samsung.com,
	pankaj.dubey@samsung.com, cassel@kernel.org, 18255117159@163.com,
	xueshuai@linux.alibaba.com, renyu.zj@linux.alibaba.com,
	will@kernel.org, mark.rutland@arm.com,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v7 3/5] Add debugfs based silicon debug support in DWC
Message-ID: <20250304171154.njoygsvfd567pb66@thinkpad>
References: <20250221131548.59616-1-shradha.t@samsung.com>
 <CGME20250221132035epcas5p47221a5198df9bf86020abcefdfded789@epcas5p4.samsung.com>
 <20250221131548.59616-4-shradha.t@samsung.com>
 <Z8XrYxP_pZr6tFU8@debian>
 <20250303194647.GC1552306@rocinante>
 <CAMuHMdWens9ZZrjNH1Bd2AN3PJEP1KSUGdiJcBCt0uPGH_GiiA@mail.gmail.com>
 <20250304154638.GB2310180@rocinante>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250304154638.GB2310180@rocinante>

On Wed, Mar 05, 2025 at 12:46:38AM +0900, Krzysztof Wilczyński wrote:
> Hello,
> 
> > This patch is now commit 1ff54f4cbaed9ec6 ("PCI: dwc: Add debugfs
> > based Silicon Debug support for DWC") in pci/next (next-20250304).
> > 
> > On Mon, 3 Mar 2025 at 20:47, Krzysztof Wilczyński <kw@linux.com> wrote:
> > > [...]
> > > > > +int dwc_pcie_debugfs_init(struct dw_pcie *pci)
> > > > > +{
> > > > > +   char dirname[DWC_DEBUGFS_BUF_MAX];
> > > > > +   struct device *dev = pci->dev;
> > > > > +   struct debugfs_info *debugfs;
> > > > > +   struct dentry *dir;
> > > > > +   int ret;
> > > > > +
> > > > > +   /* Create main directory for each platform driver */
> > > > > +   snprintf(dirname, DWC_DEBUGFS_BUF_MAX, "dwc_pcie_%s", dev_name(dev));
> > > > > +   dir = debugfs_create_dir(dirname, NULL);
> > > > > +   debugfs = devm_kzalloc(dev, sizeof(*debugfs), GFP_KERNEL);
> > > > > +   if (!debugfs)
> > > > > +           return -ENOMEM;
> > > > > +
> > > > > +   debugfs->debug_dir = dir;
> > > > > +   pci->debugfs = debugfs;
> > > > > +   ret = dwc_pcie_rasdes_debugfs_init(pci, dir);
> > > > > +   if (ret)
> > > > > +           dev_dbg(dev, "RASDES debugfs init failed\n");
> > > >
> > > > What will happen if ret != 0? still return 0?
> > 
> > And that is exactly what happens on Gray Hawk Single with R-Car
> > V4M: dw_pcie_find_rasdes_capability() returns NULL, causing
> > dwc_pcie_rasdes_debugfs_init() to return -ENODEV.
> 
> Thank you for testing and for catching this issue.  Much appreciated.
> 
> > > Given that callers of dwc_pcie_debugfs_init() check for errors,
> > 
> > Debugfs issues should never be propagated upstream!
> 
> Makes complete sense.  Sorry for breaking things here!
> 
> > > this probably should correctly bubble up any failure coming from
> > > dwc_pcie_rasdes_debugfs_init().
> > >
> > > I made updates to the code directly on the current branch, have a look:
> > 
> > So while applying, you changed this like:
> > 
> >             ret = dwc_pcie_rasdes_debugfs_init(pci, dir);
> >     -       if (ret)
> >     -               dev_dbg(dev, "RASDES debugfs init failed\n");
> >     +       if (ret) {
> >     +               dev_err(dev, "failed to initialize RAS DES debugfs\n");
> >     +               return ret;
> >     +       }
> > 
> >             return 0;
> > 
> > Hence this is now a fatal error, causing the probe to fail.
> 
> I removed the changed, and also move the log level to be a warning, per:
> 
>   https://web.git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/dwc&id=c6759a967e69aba16aef0d92f43e527b112e98a5
> 
> Would this be acceptable here?
> 
> Mani, would this be acceptable to you, too?  Given that you posted the
> following recently:
> 
>   https://lore.kernel.org/linux-pci/20250303200055.GA1881771@rocinante/T/#mab9cbd5834390d259afea056eee9a73d8c3b435f
> 
> That said, perhaps moving the log level to a debug would be better served here.
> 

Even though debugfs_init() failure is not supposed to fail the probe(),
dwc_pcie_rasdes_debugfs_init() has a devm_kzalloc() and propagating that
failure would be canolically correct IMO.

So I would still opt to have my version + your previous one.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

