Return-Path: <linux-renesas-soc+bounces-17059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95334AB594C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 18:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA2823A8BBC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 16:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3D02BE104;
	Tue, 13 May 2025 16:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ufGODcyG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDC11F94C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 May 2025 16:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747152240; cv=none; b=ppb411uaga3E1N8WKb6fFXFCGi95JoUI1YmGX/ZXzPL7fIt82yq1le6AxR9bjEmIGLI0Mo3Ahi8UXk1lDthucMcXoT5exq9O4whqRAYuBipTPKuiz3U7+UiSxZL2z35H/nE0Un43lG4pN+aoqZK0hHcYjREYN1pkq+hlP//udSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747152240; c=relaxed/simple;
	bh=bqw6sbaW5RwWVhD4d5QEdbcOsLqCAoBvAKpuJxVk+AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bwqpNyvbk1MHWsAsTe4zqwv4TekHVUkEPwIVKTTLyKMFdHwP5CT5HLB51j/jtq8mX80KLDqXraZXcdCUVEc8ef4lkbUcHIoPz4JGygVAz9tmXVarcIU8bMsF3Pz63pCAugBPNB5tmD4lK/3/FpFi+nD3g/OY5bZEJhSDD+aP6BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ufGODcyG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so12979815e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 May 2025 09:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747152237; x=1747757037; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mPP34a2qPJLJUDs68IjGTEbCLX34B34aXKmwHjCda18=;
        b=ufGODcyGTXZEZIIaYs71aLTqB2KBtxg7P12vzYHbcw528lARqABpzEddiCxtyzSJsl
         T3OoYfxLr5vQiIpi3+Gqa3Honuffd6ahYglYQUNOpu8sMZFX8VqnAJymsN5kZlsbnkB+
         1waQ81ZJz5zv0ZX/jfxFaqVzDkfxhozbfHTcdJ+3g6Jg0BtheJR5ZICu2grWTeQGMz1h
         iEaIF9engL4b3iIsRn2j/oGXO90HvKgMN9MDKt+NuC3o5bOlhNGFaQ2I+/TwB7ruh2zP
         GuEGsa2zxzoAnhD67nF/0Cyzq23slPypQ2qi7V0cmSAd5/rCXhMK2hzjlYt64CdcxzGA
         xPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747152237; x=1747757037;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mPP34a2qPJLJUDs68IjGTEbCLX34B34aXKmwHjCda18=;
        b=gLphR1WF7WVvKY8OPVeJdfghdn7+Mx1Uk8KKHPwy6DvyZPsh9zaQDAWczMNF62HAzt
         StqJXTvGd6vJ/pHAFMvHrLG827Ji8hyCz69JvqTMMahXR11SSqJV5Dz/aMtK6TltrnHs
         8Wr8dlD9Y3GjjpY9e6eVMetmMSliMDs/iHQs1k0N021gDWR2PW3YhWmSxtB3/HonMsSM
         88sBR6FZzDnDSCQ1xgR2vkZmh4uDe5MC6LHyw9zIRM7QWwnSr8S6DDaFkDmYbWA8BNtC
         VwNnY+DPst3/cFhCb9/lK99TO8tFALbyJ+Whch4HjgUwvIJrOqbQPtMPU51YGcNDfN1+
         4XXg==
X-Forwarded-Encrypted: i=1; AJvYcCV14SsyZqElY85YzZ0ePpUpBF7SQ6Tis5EWeiwZhdyddlES5lFxGzqdqXQgxuJeO7RQrMSMzNp5mE/v7Rk2KixY4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwT7FQ+asfKspZ4Obt+cKaflpsKfg+djkXd4B3eQeJgAWyvFYul
	vdJcxU5EK2RQOMFkydTugeJxTb8nC6aMgL0SRsdSDkWXPNs3TwN6Q+RmbwuSfQ==
X-Gm-Gg: ASbGncvEnQ3FWyZgAIZB/GG04f6B31hjTQJmZAEDLVytD6NbS1tySZXPcfEKSxiVAyG
	3cFKhWp0maBsg9t0oNDMutYKFrNPWHl+ODpImiHrolzJbN25/UMkkwTOraI656Voi3qwcoGIk0/
	Fr8cmESzJrpF+6ZEqtTQFLowyXcBVEEP5/WyAfj+lcTmxFRLFMsIw8qe+rSjfi6+imkU0hM+R/v
	oEwsL11btlSyerRadn+//rzWUiRmYrUad4XRDqPJPL6mISV0Oly219P+kSOU68Wtz6EVfsuc751
	HvWqbLl1cdSq2Hgq989OUD0F7oZFxIRdvRsJBs9Uy5J+0Bt70WGNr8z9/lq+ox6DPv27iHkt4Wo
	305RA1W+QCUQ2Ww==
X-Google-Smtp-Source: AGHT+IFUs/E8lGN4Y6i35nSeqOc0zjhP+SyJASizXG0DBXcxPw4b86BdcbX5E/ih1Apnan2qlPCivQ==
X-Received: by 2002:a05:600c:4f54:b0:442:e9eb:1b48 with SMTP id 5b1f17b1804b1-442e9eb1c1emr42627385e9.24.1747152236887;
        Tue, 13 May 2025 09:03:56 -0700 (PDT)
Received: from thinkpad (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67d5c09sm175331185e9.7.2025.05.13.09.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 09:03:56 -0700 (PDT)
Date: Tue, 13 May 2025 17:03:54 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Marek Vasut <marek.vasut+renesas@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Alan Douglas <adouglas@cadence.com>, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, Damien Le Moal <dlemoal@kernel.org>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/6] PCI: endpoint: IRQ callback fixes and cleanups
Message-ID: <lds72okw4m4novwi2ysaomolph45dzuuyxdcyl6llpruie7a5t@4v6ol6qtu6w3>
References: <20250513073055.169486-8-cassel@kernel.org>
 <20250513102522.GB2003346@rocinante>
 <aCM7lWQiwJBwamEp@ryzen>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCM7lWQiwJBwamEp@ryzen>

On Tue, May 13, 2025 at 02:31:17PM +0200, Niklas Cassel wrote:
> On Tue, May 13, 2025 at 07:25:22PM +0900, Krzysztof Wilczyński wrote:
> > Hello,
> 
> Hello
> 
> > 
> > >   PCI: dwc: ep: Fix broken set_msix() callback
> > >   PCI: cadence-ep: Fix broken set_msix() callback
> > >   PCI: endpoint: cleanup get_msi() callback
> > >   PCI: endpoint: cleanup set_msi() callback
> > >   PCI: endpoint: cleanup get_msix() callback
> > >   PCI: endpoint: cleanup set_msix() callback
> > 
> > Note that PCI prefers to capitalise first letter of the subject.
> 
> Do I need to resend or can some of the maintainers fix this up while applying?

I will fix it up while applying.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

