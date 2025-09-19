Return-Path: <linux-renesas-soc+bounces-22064-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF8DB888D3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Sep 2025 11:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5FB91C8641C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Sep 2025 09:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F0A2F5302;
	Fri, 19 Sep 2025 09:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="W2Lu3BvC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03892EC087
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Sep 2025 09:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758274097; cv=none; b=DUjbgAgIbq5HQgTmwonGfU1/6vqfy2FTL5tyYEwvBq9NNKv7BwVnI4/P2x3sPzNTWZhvdoEZtU4HJvuwPD586MLbiJE2Au5UjMAPkyPez7uWWLHd3rJBJhY2gDr8pNSobrWdauBjFhdpQehEywkJVxrgR2Ipzwx1J6fJsKMuFW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758274097; c=relaxed/simple;
	bh=buBQGVajJF/1m5lwRo22cHctIaIWABcM5rOL+YdF3lY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kymoumg9PEXx9G0r2+N5x/vOX3pbC8IB9iYqgdUw23Gof7UP6Z0w7sOIungeBYHzaH3Y3dWcgu94CmDQ7++xGdJUmuyj4sYNHqSSQB+dEG4TZiiCXuXTEsmbybcR4PhRePZQKHsKbGZMTCZzOpbtv+d6KJOogOai86LVYMgl+g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=W2Lu3BvC; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4694ac46ae0so2398275e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Sep 2025 02:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1758274093; x=1758878893; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eX2C6o9JQrp4KbfLBIaQxUWMPEDMSUognUn/sSIXlqA=;
        b=W2Lu3BvCCZvzOsZOqrJR9hMiazm9QbS2jp6AVNqDjn2yPSO4G3STOHrnQfTwVU1XT3
         cQFGbR6fDhs+Qfw+bgBtKfA09oqNVw/k119xoh3RwmORiajJwe4mSZLvkXb8w+iGz4PH
         JU6JEanC/PNiexljU334/PWpHcA+tRmea+vzDKSxHrAIwX/DQ+AESBmKx0v1+gQ/8N1y
         STLPo0VZ+WUcOZkDdMrycaPBlgmZUeOUAZRHW6trUpFRyjl8ic8JIscAv9A+Qe/1h9Nx
         pGZRFc/D1OKfxHW5GY+I8fPte8f2webKX433ZF3flLYfn5PR145X/OvqXV9M/A+cNK3l
         d0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758274093; x=1758878893;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eX2C6o9JQrp4KbfLBIaQxUWMPEDMSUognUn/sSIXlqA=;
        b=JdIt0d+j+XCcEKiGp5TYvVPauI/kpmGyX7y8YAdy0RThDBw9wdC/+atjfPRTq+RMuG
         02eiZcSQSi6dK7TM1KghiVN7UoidoyeVPiavv1cLhotU9IVN8lPAP3jFd2McMcRIaDjc
         KdDfcIH0gv0/YKkeepvT4oZf7KAJxZ6oLzjX7U5eXWvT6cC4iCtp5y1pjHfvfJLmJPkE
         NegAFswF0C+11PMjsouxcjNfdg50vqRWyq1WfPq01vIzO7dgdfTOlBMArTtgSWLsZ+I8
         0bQzE8U7FSoaHkS4fk4dpHgSwhWoYEmUNpiXQ15BdCAsgMn1qOoG7h6HgUZ3iI4ZIzli
         iOtw==
X-Forwarded-Encrypted: i=1; AJvYcCWrTBY3dBNexFBPmv98nhTTNIg8EAOXyj+z7T4GCoVNaAXGpVchFx+O+ohCq4BQyiDoSc7I5PVaDWacA3MmQelMmw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpai8lY3WIVCrkiMKRDuZRJp2o6r/K83+i7L/jFaZm9YT38qeB
	WFEVbTEjRUceoicZoN+oM6GtykP+5jjDr0ZKpWPCO0oUWGiCHp9/VSkKkbDMwxkaijE=
X-Gm-Gg: ASbGncsCK89jh886San5W9qrKMiObvtNFshw6plTxmRPMBrQHFYQw5BKGMzKgGmTPO1
	LOI7Q6pM2rfxyz0nD/XvcKPZ6E1oBMNMhxLrJ02rlvXOuOaQCoXoIPzZ3miaU/gZmW2jgdpLMHg
	uAwH1d0C3tND0PRwKum+bJNj3o5Ej89/XZ3kQUn0qOTYOS/l3gimUsaEHOK9Ctck4zECcS5y/Ah
	UwSVMLoCqIs+uFKFYsKGW3Lzz3uPXS6rbBabNwm8I558RuUpwcJXyas+DVJGrg/w3/T/Q4VmL2m
	HR1JRahayWVSBpsgLxYj3ev4up8eYQrVN4c2ioBAE01GsyJlgaVCuCrYwb8DSjeez54ZI7NexX6
	ZpWHAFyICNwGyQNCf/OPf3tPxG7xzOto=
X-Google-Smtp-Source: AGHT+IF8SvCo8+93/CF/N3fM2f638seOlv8Zs1arZJ3G7JJNpr7/3DX/KLCOOUOnhqlegFVFvupfZg==
X-Received: by 2002:a05:6000:605:b0:3ea:5f76:3f7a with SMTP id ffacd0b85a97d-3ee7e0116d6mr1373555f8f.22.1758274092847;
        Fri, 19 Sep 2025 02:28:12 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee073f4f6asm6778052f8f.6.2025.09.19.02.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 02:28:12 -0700 (PDT)
Message-ID: <ca1da9cb-5003-49f2-ab8d-70b80a10d8cd@tuxon.dev>
Date: Fri, 19 Sep 2025 12:28:10 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] PCI: rzg3s-host: Add Renesas RZ/G3S SoC host
 driver
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, p.zabel@pengutronix.de,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250912122444.3870284-1-claudiu.beznea.uj@bp.renesas.com>
 <20250912122444.3870284-3-claudiu.beznea.uj@bp.renesas.com>
 <pnph54wv3736lemzren64ig4karlulffkvmc3dzgrhgyv2cpwu@2mcgvlqdr6wu>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <pnph54wv3736lemzren64ig4karlulffkvmc3dzgrhgyv2cpwu@2mcgvlqdr6wu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/19/25 11:45, Manivannan Sadhasivam wrote:
> On Fri, Sep 12, 2025 at 03:24:40PM +0300, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
>> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
>> only as a root complex, with a single-lane (x1) configuration. The
>> controller includes Type 1 configuration registers, as well as IP
>> specific registers (called AXI registers) required for various adjustments.
>>
>> Hardware manual can be downloaded from the address in the "Link" section.
>> The following steps should be followed to access the manual:
>> 1/ Click the "User Manual" button
>> 2/ Click "Confirm"; this will start downloading an archive
>> 3/ Open the downloaded archive
>> 4/ Navigate to r01uh1014ej*-rzg3s-users-manual-hardware -> Deliverables
>> 5/ Open the file r01uh1014ej*-rzg3s.pdf
>>
>> Link: https://www.renesas.com/en/products/rz-g3s?queryID=695cc067c2d89e3f271d43656ede4d12
>> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
> 
> [...]
> 
>> +static void rzg3s_pcie_update_bits(void __iomem *base, u32 offset, u32 mask,
>> +				   u32 val)
>> +{
>> +	u32 tmp;
>> +
>> +	tmp = readl(base + offset);
> 
> Unless there is an ordering requirement, you can safely use
> {readl/writel}_relaxed variants throughout the driver.

HW manual lists specific steps to follow when issuing requests. These steps
are listed in chapter "34.4.2.4 Issuing Special Requests" in the manual
pointed in patch description.

> 
>> +	tmp &= ~mask;
>> +	tmp |= val & mask;
>> +	writel(tmp, base + offset);
>> +}
>> +
> 
> [...]
> 
>> +static void __iomem *rzg3s_pcie_child_map_bus(struct pci_bus *bus,
>> +					      unsigned int devfn,
>> +					      int where)
>> +{
>> +	struct rzg3s_pcie_host *host = bus->sysdata;
>> +	unsigned int dev, func, reg;
>> +
>> +	dev = PCI_SLOT(devfn);
>> +	func = PCI_FUNC(devfn);
>> +	reg = where & ~0x3;
>> +
>> +	/* Set the destination */
>> +	writel(FIELD_PREP(RZG3S_PCI_REQADR1_BUS, bus->number) |
>> +	       FIELD_PREP(RZG3S_PCI_REQADR1_DEV, dev) |
>> +	       FIELD_PREP(RZG3S_PCI_REQADR1_FUNC, func) |
>> +	       FIELD_PREP(RZG3S_PCI_REQADR1_REG, reg),
>> +	       host->axi + RZG3S_PCI_REQADR1);
>> +
>> +	/* Set byte enable */
>> +	writel(RZG3S_PCI_REQBE_BYTE_EN, host->axi + RZG3S_PCI_REQBE);
>> +
>> +	/*
>> +	 * rzg3s_pcie_child_map_bus() is used to configure the controller before
>> +	 * executing requests. It is called only within this driver and not
>> +	 * through subsystem calls. Since it does not return an address that
>> +	 * needs to be used later, return NULL.
>> +	 */
> 
> What guarantees that the PCI core will not call this function through
> pci_ops::map_bus?

As of my code inspection the pci_ops::map_bus is currently called from:
pci_generic_config_read()
pci_generic_config_write()
pci_generic_config_read32()
pci_generic_config_write32()

As of my code inspection, these are currently called from vendor specific
drivers. I the core behavior will be changed, I can't guarantee the
statement from the comment. Please let me know if you want me to drop the
initialization of rzg3s_pcie_child_ops::map_bus and call
rzg3s_pcie_child_map_bus() explicitly instead of calling it though
rzg3s_pcie_child_ops::map_bus

As mentioned in the previous review rounds, this is implemented like this
as it was suggested in v1 review process.

> 
>> +	return NULL;
>> +}
>> +
>> +static struct pci_ops rzg3s_pcie_child_ops = {
>> +	.read		= rzg3s_pcie_child_read,
>> +	.write		= rzg3s_pcie_child_write,
>> +	.map_bus	= rzg3s_pcie_child_map_bus,
>> +};
>> +
>> +static void __iomem *rzg3s_pcie_root_map_bus(struct pci_bus *bus,
>> +					     unsigned int devfn,
>> +					     int where)
>> +{
>> +	struct rzg3s_pcie_host *host = bus->sysdata;
>> +
>> +	if (devfn)
>> +		return NULL;
>> +
>> +	return host->pcie + where;
>> +}
>> +
>> +/* Serialization is provided by 'pci_lock' in drivers/pci/access.c */
>> +static int rzg3s_pcie_root_write(struct pci_bus *bus, unsigned int devfn,
>> +				 int where, int size, u32 val)
>> +{
>> +	struct rzg3s_pcie_host *host = bus->sysdata;
>> +
>> +	/* Enable access control to the CFGU */
>> +	writel(RZG3S_PCI_PERM_CFG_HWINIT_EN, host->axi + RZG3S_PCI_PERM);
>> +
> 
> I'm not sure if 'host->axi' written above and the address written below are in
> the same domain or not. 

host->axi and host->pci are both part of the PCI controller address space.
I don't have more info on it than this. HW manual don't mention anything
about this.

> If they are, then the writes will be serialized and
> would be no issues. If they are in different domains, then you would need to do
> readl() to make sure the above write reaches the hardware before writing below.
> 
>> +	pci_generic_config_write(bus, devfn, where, size, val);
>> +
>> +	/* Disable access control to the CFGU */
>> +	writel(0, host->axi + RZG3S_PCI_PERM);
>> +
>> +	return PCIBIOS_SUCCESSFUL;
>> +}
>> +
>> +static struct pci_ops rzg3s_pcie_root_ops = {
>> +	.read		= pci_generic_config_read,
>> +	.write		= rzg3s_pcie_root_write,
>> +	.map_bus	= rzg3s_pcie_root_map_bus,
>> +};
>> +
> 
> [...]
> 
>> +static int rzg3s_pcie_intx_setup(struct rzg3s_pcie_host *host)
>> +{
>> +	struct device *dev = host->dev;
>> +
>> +	for (int i = 0; i < PCI_NUM_INTX; i++) {
>> +		struct platform_device *pdev = to_platform_device(dev);
>> +		char irq_name[5] = {0};
>> +		int irq;
>> +
>> +		scnprintf(irq_name, ARRAY_SIZE(irq_name), "int%c", 'a' + i);
>> +
>> +		irq = platform_get_irq_byname(pdev, irq_name);
>> +		if (irq < 0)
>> +			return dev_err_probe(dev, -EINVAL,
>> +					     "Failed to parse and map INT%c IRQ\n",
>> +					     'A' + i);
>> +
>> +		host->intx_irqs[i] = irq;
>> +		irq_set_chained_handler_and_data(irq,
>> +						 rzg3s_pcie_intx_irq_handler,
>> +						 host);
>> +	}
>> +
>> +	host->intx_domain = irq_domain_create_linear(of_fwnode_handle(dev->of_node),
>> +						     PCI_NUM_INTX,
>> +						     &rzg3s_pcie_intx_domain_ops,
>> +						     host);
>> +	if (!host->intx_domain)
>> +		return dev_err_probe(dev, -EINVAL,
>> +				     "Failed to add irq domain for INTx IRQs\n");
>> +	irq_domain_update_bus_token(host->intx_domain, DOMAIN_BUS_WIRED);
>> +
>> +	return devm_add_action_or_reset(dev, rzg3s_pcie_intx_teardown, host);
> 
> Didn't I suggest dropping these devm_add_action_or_reset() calls and use error
> labels as like other controller drivers?

It has been mentioned like "It is generally preferred to cleanup the
resources in err path using goto labels."; thorough "generally preferred" I
understood this as a non-strict rule, thus I asked back if you prefer it
for this driver as well, but got no further reply. Sorry for any confusion,
if any.

But before posting this version I also prepared a version that drops the
devm actions or resets and uses gotos instead. I'll send it in reply to
this patch for you to check it. I personally consider it complicates the
failure path. Please let me know your thoughts.

> 
>> +}
>> +
> 
> [...]
> 
>> +static struct platform_driver rzg3s_pcie_driver = {
>> +	.driver = {
>> +		.name = "rzg3s-pcie-host",
>> +		.of_match_table = rzg3s_pcie_of_match,
>> +		.pm = pm_ptr(&rzg3s_pcie_pm_ops),
>> +		.suppress_bind_attrs = true,
>> +	},
>> +	.probe = rzg3s_pcie_probe,
> 
> You could use '.probe_type = PROBE_PREFER_ASYNCHRONOUS' to allow async probing
> of the devices. This will have a big impact in boot time if you have multiple
> controllers.

Thank you for the hint. I'll look to it.

Thank you for your review,
Claudiu

> 
> - Mani
> 


