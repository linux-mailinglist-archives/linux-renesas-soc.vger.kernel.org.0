Return-Path: <linux-renesas-soc+bounces-24788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7694DC6E92A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 13:48:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C37FC3A34D1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 12:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8516B3596EC;
	Wed, 19 Nov 2025 12:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ByQ49Ug9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4173D341ADD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 12:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763555835; cv=none; b=fOaWI0lMCMju30bLdQOCVSkAMAO3c6PFQQk3BQLbBpQKwJdV+pfPljFKinQlHA4IboBooliya4MT+otDC8JrIFURf4FiBpAIjOKU0kXy2ffWnV6/PBi+Lw/DraC48qpzgVzoa2UpTEDfTtunn0wXMVOjicWdXuyCSj4LpIzIomI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763555835; c=relaxed/simple;
	bh=7mcK1ohMWSnVS3aGt8xXqpYJWiiQ0HtA7t/k3b3t2qM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iGQ89wG8qSCwp5i1WWlSNGf/XdUt3pZ4JVnd0kL8cO92aj9CZ7O+ZS97qZfDWOdMkHPITeWwFq2KXx8RcDOnXUWcy/K3kv6g48cqMtCihRDoQIm6YX8iJcChX8S6vNO80q6y+GFx4GioSzMOH2lZrJHF+NP1ZVycrlAmH5aMNUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ByQ49Ug9; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-429c48e05aeso565740f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 04:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763555831; x=1764160631; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t/wl42pES18vi+TWKSwvoZgKjCTDSQ0moe0G5S5wwP0=;
        b=ByQ49Ug9JyghRQWjjhl4codhMP56qX4QOicBO3dVuitaV+VTvCRuXxZnElIOAla12Z
         cy3i2VyzhBG+UNS0DRev0ugY73n5FaQ7i6SEaFfSAkvnRluOmHIbuTWpANgXXQ6M4en5
         iKgB26/BMzfRj0bhjcUwOgrORabLEj8aS0WlMsucnY45+6lXI3/wZJr+ZeKWFaAu68xx
         OyTH7XXLagXHNoxHadA7R766G7m8wb8rPx1FdU2HboGiGEx7dgEfdpE9nP22Rb/4sHTR
         dbDpB9pPNd5AcwIm3LiCslC+S5jOBAWTiyNInGnE6ui733LSTiwxiVNRvFlCJqGhrRrN
         ARkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763555831; x=1764160631;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/wl42pES18vi+TWKSwvoZgKjCTDSQ0moe0G5S5wwP0=;
        b=gN7yvdKIxdcOvWaSglERLENDel+jm+VBcRfMmdcWekO4Zgxz18TD5RpDjw0sear6FG
         8nS96APpEZEo6DGKOuqN115wma3s6FzFKgr4RmL7ZrI3U2dA2WuOZFxA8n3logOwyAU2
         mKuEYFRlmuu3b1i8m3oUWBFanvdWo0hFmYoAzZn1YxU2BW1WtCSHyXYEhCcua6JehnzX
         U4nQBMbc9+ZAeGThtDNPxoyyPWf/tNdc9A4/1fkQpkm3xywi1yaBhtuNAvxjzD8wPUe5
         5CatDdITdZ4ec9JMCFMdmdixnS4PjE11FcOHnQGeMV46or1KG+QSRzI49rG+NZMgrqay
         dPoQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0gSOlygP0d2nb/d8ZjkBNKWf1YxLGtqMWU5Cd60FgIrGsWuRasemHmWhvx9n3LiqFSWGrtJoo7Ouje4fS/qPXKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOAR2HbPDQOtI0at70oCVIyhFg2Oh3CNhLQzKss2+3RZD2+g0D
	TKtF8q3pToNwz/o9FRJmuBriDHVsRu2jA68xLt+W8i4zQkNN9DjR847UZqdfu0miRCo=
X-Gm-Gg: ASbGncurwnc0U6QwKYqgeoZk8B3Px2a6cT7xSawc8WsbvMKY25Bqi3vsRv/dYCyckf4
	HWiFS1Vt6FFqeTl2u0vXTPwXh1ITSMpD5cHZoa15xpJjQziD1eyQDSlWaijToJvzjlqxo68rRFN
	Ko+89lKMZjsRiG0nuJ/pngPd0RGfq9oNo8u5qT5+RNtcaLNJXNTxZrL9wzk25skOn+ZAmUC6tRK
	10uyf5tD9IjdnmRWl8SM9z6DjCPhbP87mZqZGW1oTlh0EcEfKIGxF2DdTgOplrwsR0HVNP19wuc
	FjZd/paaSvtSIc8iaBFYPinqV1a1+5omskEKxvfd0PAZ/iO7ZKhMA+jFGaz8YUF9s+1Gc06Ynyp
	BhUT2J1LXFJ+7ho786uPbWWaB5i93lmPSlS9YmvCwuebaehzyRBmXX3gfHMRxf0esgIPMemijXo
	bwvCyOY+PvchsopsTsnYE=
X-Google-Smtp-Source: AGHT+IGnRLIab0NUOFUDavvOiLBBWE+nlfc8LKHZvJFNPJHySFzr4PFRjXHBJqq65SUqVwQ5sSesJA==
X-Received: by 2002:a05:6000:228a:b0:42b:3ed2:c086 with SMTP id ffacd0b85a97d-42cb21daf0emr2431577f8f.4.1763555831526;
        Wed, 19 Nov 2025 04:37:11 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42c97745f79sm23703122f8f.23.2025.11.19.04.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 04:37:11 -0800 (PST)
Message-ID: <9e459cff-7e6c-409e-ac34-9978fb501e51@tuxon.dev>
Date: Wed, 19 Nov 2025 14:37:09 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : [PATCH v7 2/6] PCI: rzg3s-host: Add Renesas RZ/G3S
 SoC host driver
To: ALOK TIWARI <alok.a.tiwari@oracle.com>, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, p.zabel@pengutronix.de
Cc: linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20251117090859.3840888-1-claudiu.beznea.uj@bp.renesas.com>
 <20251117090859.3840888-3-claudiu.beznea.uj@bp.renesas.com>
 <32bec7e0-6631-4850-835b-c0c377722dca@oracle.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <32bec7e0-6631-4850-835b-c0c377722dca@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Alok,

On 11/17/25 16:04, ALOK TIWARI wrote:
>> +
>> +/* Serialization is provided by 'pci_lock' in drivers/pci/access.c */
>> +static int rzg3s_pcie_root_write(struct pci_bus *bus, unsigned int devfn,
>> +                 int where, int size, u32 val)
>> +{
>> +    struct rzg3s_pcie_host *host = bus->sysdata;
>> +
>> +    /* Enable access control to the CFGU */
>> +    writel_relaxed(RZG3S_PCI_PERM_CFG_HWINIT_EN,
>> +               host->axi + RZG3S_PCI_PERM);
>> +
>> +    pci_generic_config_write(bus, devfn, where, size, val);
> 
> why ignore pci_generic_config_write ret ?

Missed it.

> 
>> +
>> +    /* Disable access control to the CFGU */
>> +    writel_relaxed(0, host->axi + RZG3S_PCI_PERM);
>> +
>> +    return PCIBIOS_SUCCESSFUL;
>> +}

[...]

>> +static int rzg3s_pcie_init_msi(struct rzg3s_pcie_host *host)
>> +{
>> +    struct platform_device *pdev = to_platform_device(host->dev);
>> +    struct rzg3s_pcie_msi *msi = &host->msi;
>> +    struct device *dev = host->dev;
>> +    const char *devname;
>> +    int irq, ret;
>> +
>> +    ret = devm_mutex_init(dev, &msi->map_lock);
>> +    if (ret)
>> +        return ret;
>> +
>> +    msi->irq = platform_get_irq_byname(pdev, "msi");
>> +    if (msi->irq < 0)
>> +        return dev_err_probe(dev, irq ? irq : -EINVAL,
>> +                     "Failed to get MSI IRQ!\n");
> 
> irq is uninitialized. do you mean msi->irq?

Good catch, I'll update it.

> 
>> +
>> +    devname = devm_kasprintf(dev, GFP_KERNEL, "%s-msi", dev_name(dev));
>> +    if (!devname)
>> +        return -ENOMEM;
>> +
>> +    ret = rzg3s_pcie_msi_allocate_domains(msi);
>> +    if (ret)
>> +        return ret;
>> +
>> +    /*
>> +     * Don't use devm_request_irq() as the driver uses non-devm helpers
>> +     * to control clocks. Mixing them may lead to subtle bugs.
>> +     */
>> +    ret = request_irq(msi->irq, rzg3s_pcie_msi_irq, 0, devname, host);
>> +    if (ret) {
>> +        dev_err_probe(dev, ret, "Failed to request IRQ: %d\n", ret);
>> +        goto free_domains;
>> +    }
>> +
>> +    ret = rzg3s_pcie_msi_setup(host);
>> +    if (ret) {
>> +        dev_err_probe(dev, ret, "Failed to setup MSI!\n");
>> +        goto free_irq;
>> +    }
>> +
>> +    return 0;
>> +
>> +free_irq:
>> +    free_irq(msi->irq, host);
>> +free_domains:
>> +    irq_domain_remove(msi->domain);
>> +    return ret;
>> +}
>> +
>> +static void rzg3s_pcie_intx_irq_ack(struct irq_data *d)
>> +{
>> +    struct rzg3s_pcie_host *host = irq_data_get_irq_chip_data(d);
>> +
>> +    guard(raw_spinlock_irqsave)(&host->hw_lock);
>> +
>> +    rzg3s_pcie_update_bits(host->axi, RZG3S_PCI_PINTRCVIS,
>> +                   RZG3S_PCI_PINTRCVIS_INTX(d->hwirq),
>> +                   RZG3S_PCI_PINTRCVIS_INTX(d->hwirq));
>> +}
>> +
>> +static int
>> +rzg3s_pcie_host_setup(struct rzg3s_pcie_host *host,
>> +              int (*init_irqdomain)(struct rzg3s_pcie_host *host),
>> +              void (*teardown_irqdomain)(struct rzg3s_pcie_host *host))
>> +{
>> +    struct device *dev = host->dev;
>> +    int ret;
>> +
>> +    /* Set inbound windows */
>> +    ret = rzg3s_pcie_parse_map_dma_ranges(host);
>> +    if (ret)
>> +        return dev_err_probe(dev, ret,
>> +                     "Failed to set inbound windows!\n");
>> +
>> +    /* Set outbound windows */
>> +    ret = rzg3s_pcie_parse_map_ranges(host);
>> +    if (ret)
>> +        return dev_err_probe(dev, ret,
>> +                     "Failed to set outbound windows!\n");
>> +
>> +    ret = init_irqdomain(host);
>> +    if (ret)
>> +        return dev_err_probe(dev, ret, "Failed to init IRQ doamin\n");
> 
> typo doamin -> domain

Same here.

Thank you for your review,
Claudiu

