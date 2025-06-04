Return-Path: <linux-renesas-soc+bounces-17852-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A54EACE37D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 19:25:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE164176367
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 17:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843BC1F4187;
	Wed,  4 Jun 2025 17:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tqI6fcgw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43DA1F1909
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Jun 2025 17:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749057741; cv=none; b=OXJ31wv1dBUpC2gHDhAou7C3ghGAOaxXtubKPFXJnAkc21qKF2LMpdlEhRN4hjnKIOeXmaGxqtx5BfdsKrDvkF/HOfshc1oBTr3eobTOYc8y0f7CEt/wtq2htmolLOsqop223f6tCdWdhdfHFWaCAsL3cGhI09ng8r1DMb2hu4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749057741; c=relaxed/simple;
	bh=sKSYyUTmKbFRcwzxl/2agtBhqQgXK9AN08QzSiogKtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P5j4SFbDILAM1+ueZZS/FDjlSVYZ/BXBu8vNEE6ANFKUywmuti45OVZbWLwfhmg4/RWqYtt643+cXJ/ffDdEjCN4b2rztKJLQ4G70fgyo9KRyp5UFs1GLlZJ+1jvXy/nSU9yreSTXlEAMKqCxRh8t0QFriY3KqJqzhZqmpOFGpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tqI6fcgw; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-747fba9f962so152371b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Jun 2025 10:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749057739; x=1749662539; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eRFhhLJjI4zA7koH9NNbXkaz3+o0i9nOOHT1b6Am9B4=;
        b=tqI6fcgwECZShrNWkE7HO9IkhId5FzM7tdTO5DuK1q6LT82Fpqtn56uQBj2Qmw+mX2
         4n0shTp+6KoDbxNUPUwYgfD4u0Kee9qEt7PyMwTqGxJRM0k2fmJ9dezCq8o/OE5sq30D
         XWCYhJQjKBDtogm6A8aFM6RZN3Z8EWQUQ7LiGk63MciQJ4sRVUu+zzRzFKm92eNLZgXs
         eHwMr2cvUYmVVU9PK8St56UimKPnO/yKeqOjneYztOemYbC+z7G0AiplxZiu5BhczGww
         grFYlDP5l4Hhr+lJZJhhu2B+f+UEo+d0CyQ+hhZSfZtksPdrfkbYXFi8MFIqisks/ok9
         7ykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057739; x=1749662539;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eRFhhLJjI4zA7koH9NNbXkaz3+o0i9nOOHT1b6Am9B4=;
        b=uZcrS/4X+PXE+W6m00n00iHHuT3aCZItQLSFuUvvm7ZhO/cfTGcWFUpVDaoCUOvPS1
         vauADTump5YS+QvZMPRkCiJJQqiFF7sVKuh3l8TJubB97E7eRMTe6JHjYWKn+2hAz4xc
         wqVP7VsjIMtkIZ5JZN5tfK6rtpxjcngm+TrSU0n4M9A+QBVYBV1Rxk4W40QJCW7Q8MyN
         75aDr0xGKk+KlLq4g2aREVrLRv/2FfXVWb6C07198afYZNvvt9lfVqHOq7hkjKIrqMJH
         imtQ88t+FxWCHWRwMerzfDd+FJx6LYV9Rg+gKZiw8eiuKdxrn4RJw+2na4p20lPRmj8Y
         8Lww==
X-Forwarded-Encrypted: i=1; AJvYcCWqdBlDvDPMuyiuk7UQdcMSal+r3kjrKoK7VHAelsCXUmroEi7sc4yfpnwpdWp0LPHhiu7IYhV47+7XwIDkxlYHuA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2W6qCZ9PsSiYjhMuw7FbvWX46tA8U99mSwio/8NOSRV+CXyHg
	rQCZXXN1Nz+DZaDTAOW5lg2yrk4KYBJPk6C3wLMdmX922crmRG7mEjCmtldrxUFKdg==
X-Gm-Gg: ASbGnctx3rts/3vdZVPJn7i9F/dKpcOameuiFsstkKUve/9rdKyKA+4oqFEx3aNT1RZ
	HIgQbVy3kPmGLwcmrlKnmOeuvWu7YXWbqy8Tf77iR91fO8xd6C0gnCMTWdqvf8y3pUiA3VeAyqr
	IzXyr97RgnpJdoewHi5TjWYmk7/r3cAJkZEC9SN5T9i0qD+HRtgICZPYy6XM4zxmjCvK4LEwNxz
	8EnLIsPByWEZgqrJdTZQsdISjcmIL22oUyTFXQU7w2ZzsAN2u2HdGxbHVNUKGHIdwkkPjl3XjJx
	rYxVAVGsxsl9WMdJITWrL5Cp7CsdGDd/5WuQIxALp0yDchf319LLpdKhaIesDQ==
X-Google-Smtp-Source: AGHT+IEfy4DmIHTrKSJlkqSXJHSlJ3gLkmiP8MmaPN6LL/v90GBnAH1FIJiiM09/woNRLt0+WHE+iQ==
X-Received: by 2002:a05:6a00:3b0d:b0:736:b400:b58f with SMTP id d2e1a72fcca58-7481814420fmr375938b3a.0.1749057738824;
        Wed, 04 Jun 2025 10:22:18 -0700 (PDT)
Received: from thinkpad ([120.60.60.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afff7e3bsm11735265b3a.175.2025.06.04.10.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:22:18 -0700 (PDT)
Date: Wed, 4 Jun 2025 22:52:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	linux-arm-kernel@lists.infradead.org, Anand Moon <linux.amoon@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Helgaas <bhelgaas@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] PCI/pwrctrl: Add optional slot clock to pwrctrl
 driver for PCI slots
Message-ID: <zzm2nyrm4nw5di7afe5nxte3hxbx3dvorjg74rsjhl3jlaywp4@x7icn3epnh67>
References: <20250530225504.55042-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUFHKHKfymqa6jwfNnxZTAuH3kbj5WL+-zN=TR6XGd0eA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUFHKHKfymqa6jwfNnxZTAuH3kbj5WL+-zN=TR6XGd0eA@mail.gmail.com>

On Wed, Jun 04, 2025 at 10:40:25AM +0200, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> Thanks for your patch!
> 
> On Sat, 31 May 2025 at 00:55, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
> > Add the ability to enable optional slot clock into the pwrctrl driver.
> > This is used to enable slot clock in split-clock topologies, where the
> > PCIe host/controller supply and PCIe slot supply are not provided by
> > the same clock. The PCIe host/controller clock should be described in
> > the controller node as the controller clock, while the slot clock should
> > be described in controller bridge/slot subnode.
> >
> > Example DT snippet:
> > &pcicontroller {
> >     clocks = <&clk_dif 0>;             /* PCIe controller clock */
> >
> >     pci@0,0 {
> >         #address-cells = <3>;
> >         #size-cells = <2>;
> >         reg = <0x0 0x0 0x0 0x0 0x0>;
> >         compatible = "pciclass,0604";
> >         device_type = "pci";
> >         clocks = <&clk_dif 1>;         /* PCIe slot clock */
> 
> I assume this should be documented in
> dtschema/schemas/pci/pci-bus-common.yaml, too?

You are right.

> 
> >         vpcie3v3-supply = <&reg_3p3v>;
> >         ranges;
> >     };
> > };
> >
> > Example clock topology:
> >  ____________                    ____________
> > |  PCIe host |                  | PCIe slot  |
> > |            |                  |            |
> > |    PCIe RX<|==================|>PCIe TX    |
> > |    PCIe TX<|==================|>PCIe RX    |
> > |            |                  |            |
> > |   PCIe CLK<|======..  ..======|>PCIe CLK   |
> > '------------'      ||  ||      '------------'
> >                     ||  ||
> >  ____________       ||  ||
> > |  9FGV0441  |      ||  ||
> > |            |      ||  ||
> > |   CLK DIF0<|======''  ||
> > |   CLK DIF1<|==========''
> > |   CLK DIF2<|
> > |   CLK DIF3<|
> > '------------'
> >
> > Reviewed-by: Anand Moon <linux.amoon@gmail.com>
> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> > --- a/drivers/pci/pwrctrl/slot.c
> > +++ b/drivers/pci/pwrctrl/slot.c
> 
> > @@ -30,6 +31,7 @@ static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
> >  {
> >         struct pci_pwrctrl_slot_data *slot;
> >         struct device *dev = &pdev->dev;
> > +       struct clk *clk;
> >         int ret;
> >
> >         slot = devm_kzalloc(dev, sizeof(*slot), GFP_KERNEL);
> > @@ -50,6 +52,13 @@ static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
> >                 goto err_regulator_free;
> >         }
> >
> > +       clk = devm_clk_get_optional_enabled(dev, NULL);
> > +       if (IS_ERR(clk)) {
> > +               ret = dev_err_probe(dev, PTR_ERR(clk),
> > +                                   "Failed to enable slot clock\n");
> > +               goto err_regulator_disable;
> > +       }
> 
> You are adding this block in the middle of the regulator handling.
> Please move it below, under the devm_add_action_or_reset() call
> (which is handled wrong, I have sent a patch[1]).
> 

Good catch!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

