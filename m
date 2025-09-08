Return-Path: <linux-renesas-soc+bounces-21569-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 394A6B48EA5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 15:06:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7057E3424F2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 13:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC4130C630;
	Mon,  8 Sep 2025 13:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="CARTHGcf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D61D30BB93
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Sep 2025 13:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757336676; cv=none; b=g6ilX20CjZSyvgno0Yl3XhgB6L2Sva0cZCMbgSscGSVkkkb4ixilB7wlFOS8tZI7xWWpTSGQ64wNLxuNBommg7pWZwrZvEB8s0VuRs8tqnCZrUWcdmOlD5ugcBsoDey7CJNTrM5QTBlROxuxqTxCrcy8lTsr9nyYFz2lsxyJ+hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757336676; c=relaxed/simple;
	bh=9eSNNMYWl6Ezk00Y7GbdoLIlm1gW9gBEiyXh++DBIfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QJqnriFDSmd1T7culZOjs21SYrt1VR0oJvyho9/N3MhXJt3HarqhAuafrwzeBMzxzqdoD5O6jFWAiJ2SQ/qH56I26gKd8DSvWVx3RzxZe6dlWk+BWb19TRhMita9idna+PPY2kZ3e5OV1UdolVRL5O1lHIcaSwiLJXYzxQPdG48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=CARTHGcf; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6228de280ccso4399198a12.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Sep 2025 06:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757336671; x=1757941471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yd7mLJQDkHllxwujkPQ/7Z9ByYCiL7cm7yP3I7t4tTI=;
        b=CARTHGcfpuGQRiCFTvZM4NXt95YK/DQTgVoX3DMJTajOq6Oj7RTiw5vh7z503RGPgF
         TaV7XiFZ834FIBdWLYDSF8+AFd3EvqsSnkmfz17PXDBSvAk0T75ghFtq1xTiDuOpG9+q
         WX0IbyGkLYJYqrrbg7Fox8TcKqbwOA1cmR7Tbem/HCm7vi8fHp7DP/LdD6JgI7NSAMoR
         HQSgGPPOb6VOtCwoS5VCXDbB7ypfBS1zn+9I1S2pKDWLdDZYfOzsmW+KN0mqsxJuGeL5
         BhsJ+Igv4tLs1XqCgjVxIXffGsBAVGpMBGYUpeY+w6Yv4L5/IDDRvB2+lrKA0pvMsFpw
         RLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757336671; x=1757941471;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yd7mLJQDkHllxwujkPQ/7Z9ByYCiL7cm7yP3I7t4tTI=;
        b=IxnZxZ8/V46ogSYb6pr+K4rNPAl53NLVUazUt96f/akTFcDMcHuUy9nnm83276r5ED
         ryF7KfciHT51UBzIxaiGs4YL132ipxc6TMeUUgKtBeSTTkG9jXlkdFxufgonDG4phIti
         oJjht7bzD3ufim1mFXoNoCdMimXD/RxwN1xgmA1ourHD83Wp+RiPetl1y+L8I6lSzHLC
         izkA03xx6ogbp3rv5RW7CMOA9nq+UvPBJReZk8lbeFRX0jGK9jmIsyrkJSz4YqntLzKM
         tIk+5y1zVMmh2krXUvtgV131yNrSs2zXgWwc6ubQwiJzYblAvslPNWHl4WNLkUhlWBEj
         gVig==
X-Forwarded-Encrypted: i=1; AJvYcCWRW8gCIDi+xLk7ByT5+Mz/bLmHUUZOu41HlSsfdMAyDmNdp+SMq1SIGhcAn47s9mVW1fOwQe+nVMuR1TZC0g985g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYlY/2KD/3ZzStzZ8x4c8v+BRqQpmbv6f+bGFKF7TKG7ylSp9P
	o3G/ajmnU59luO10l8tu1T7uzZv4O3rUyqnDs4jBEvAwgle+XkfAiEX78mTHabW2wtE=
X-Gm-Gg: ASbGnct7O6+CyCPIu43i5vbGmVXDCVfBWlhd8E3f4VE63LTm5P3VGrL2EeyGFy417hW
	gECzL/a7NnVf+saODlVNSdwa86pIZlQ2z53xR7jDVOxqxRb9m69GHRumUv+7Pz/+BCrjRef9ECf
	fjDL/quT4V17jq/NqY16ioQZVpeUcBP8mJWgCA8YJoa4GqAg6SJAPXiLqzM9ZQIh7+caRTTkAg3
	U4hQcK8fh1GVBBr+GsCB6I0+ztlLsvv3fW+f1eGBBJXSTRdE4pKtbnQoejY1XlJ8ZvhIS2TTRzO
	5QBTBf1zBcECxT0aLptJQzFa4Tf28Ky4VeeHh3OKYXCaU+6lsMMaLvsco1UKok2cda8yLIWm1e+
	Y1DMm6CcDRcFjw5Ls+qLjwkqtf8/j2dE=
X-Google-Smtp-Source: AGHT+IEmhgCH3sUPlRQKMy5XutR0hjOQQ3uuBSZbxPWNovm+H+RQwCI0Zz7MCSmSQKcPnEjwUEs0SA==
X-Received: by 2002:a05:6402:2348:b0:61c:8fe9:9423 with SMTP id 4fb4d7f45d1cf-6237edb2f15mr8247367a12.17.1757336670479;
        Mon, 08 Sep 2025 06:04:30 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc575b94sm21301716a12.53.2025.09.08.06.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 06:04:29 -0700 (PDT)
Message-ID: <83301c1e-9e6d-4bbe-ac76-db6ce7ec670e@tuxon.dev>
Date: Mon, 8 Sep 2025 16:04:28 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] PCI: rzg3s-host: Add Initial PCIe Host Driver for
 Renesas RZ/G3S SoC
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, lizhi.hou@amd.com, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
 <20250704161410.3931884-6-claudiu.beznea.uj@bp.renesas.com>
 <ddxayjj5wcuuish4kvyluzrujkes5seo7zlusmomyjfjcgzcyj@xe3zzzmy2zaj>
 <8ef466aa-b470-4dcb-9024-0a9c36eb9a6a@tuxon.dev>
 <zsgncwvhykw4ja3bbqaxwupppjsqq4pcrdgrsduahokmt72xsm@twekpse6uzzh>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <zsgncwvhykw4ja3bbqaxwupppjsqq4pcrdgrsduahokmt72xsm@twekpse6uzzh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Manivannan,

Apologies for the late reply, I've been off for a while.

On 8/31/25 07:07, Manivannan Sadhasivam wrote:
> On Sat, Aug 30, 2025 at 02:22:45PM GMT, Claudiu Beznea wrote:
>>
>>
>> On 30.08.2025 09:59, Manivannan Sadhasivam wrote:
>>> On Fri, Jul 04, 2025 at 07:14:05PM GMT, Claudiu wrote:
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
>>>> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
>>>> only as a root complex, with a single-lane (x1) configuration. The
>>>> controller includes Type 1 configuration registers, as well as IP
>>>> specific registers (called AXI registers) required for various adjustments.
>>>>
>>>> Hardware manual can be downloaded from the address in the "Link" section.
>>>> The following steps should be followed to access the manual:
>>>> 1/ Click the "User Manual" button
>>>> 2/ Click "Confirm"; this will start downloading an archive
>>>> 3/ Open the downloaded archive
>>>> 4/ Navigate to r01uh1014ej*-rzg3s-users-manual-hardware -> Deliverables
>>>> 5/ Open the file r01uh1014ej*-rzg3s.pdf
>>>>
>>>> Link: https://www.renesas.com/en/products/rz-g3s?queryID=695cc067c2d89e3f271d43656ede4d12
>>>> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>> ---
>>>>
>>>
>>> [...]
>>>
>>>> +static bool rzg3s_pcie_child_issue_request(struct rzg3s_pcie_host *host)
>>>> +{
>>>> +	u32 val;
>>>> +	int ret;
>>>> +
>>>> +	rzg3s_pcie_update_bits(host->axi, RZG3S_PCI_REQISS,
>>>> +			       RZG3S_PCI_REQISS_REQ_ISSUE,
>>>> +			       RZG3S_PCI_REQISS_REQ_ISSUE);
>>>> +	ret = readl_poll_timeout_atomic(host->axi + RZG3S_PCI_REQISS, val,
>>>> +					!(val & RZG3S_PCI_REQISS_REQ_ISSUE),
>>>> +					5, RZG3S_REQ_ISSUE_TIMEOUT_US);
>>>> +
>>>> +	return !!ret || (val & RZG3S_PCI_REQISS_MOR_STATUS);
>>>
>>> You don't need to do !!ret as the C11 standard guarantees that any scalar type
>>> stored as bool will have the value of 0 or 1.
>>
>> OK, will drop it anyway as suggested in another thread.
>>
>>>
>>>> +}
>>>> +
>>>
>>> [...]
>>>
>>>> +static void __iomem *rzg3s_pcie_root_map_bus(struct pci_bus *bus,
>>>> +					     unsigned int devfn,
>>>> +					     int where)
>>>> +{
>>>> +	struct rzg3s_pcie_host *host = bus->sysdata;
>>>> +
>>>> +	if (devfn)
>>>> +		return NULL;
>>>
>>> Is it really possible to have devfn as non-zero for a root bus?
>>
>> I will drop it.
>>
>>>
>>>> +
>>>> +	return host->pcie + where;
>>>> +}
>>>> +
>>>
>>> [...]
>>>
>>>> +static int rzg3s_pcie_msi_setup(struct rzg3s_pcie_host *host)
>>>> +{
>>>> +	size_t size = RZG3S_PCI_MSI_INT_NR * sizeof(u32);
>>>> +	struct rzg3s_pcie_msi *msi = &host->msi;
>>>> +	struct device *dev = host->dev;
>>>> +	int id, ret;
>>>> +
>>>> +	msi->pages = __get_free_pages(GFP_KERNEL | GFP_DMA, 0);
>>>> +	if (!msi->pages)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	msi->dma_addr = dma_map_single(dev, (void *)msi->pages, size * 2,
>>>> +				       DMA_BIDIRECTIONAL);
>>>> +	if (dma_mapping_error(dev, msi->dma_addr)) {
>>>> +		ret = -ENOMEM;
>>>> +		goto free_pages;
>>>> +	}
>>>> +
>>>> +	/*
>>>> +	 * According to the RZ/G3S HW manual (Rev.1.10, section 34.4.5.2 Setting
>>>> +	 * the MSI Window) the MSI window need to be within any AXI window. Find
>>>> +	 * an AXI window to setup the MSI window.
>>>
>>> Are you really finding the AXI window or just making sure that the MSI window
>>> falls into one of the AXI window?
>>
>> I'm making sure the MSI windows falls into one of the enabled AXI windows.
>>
> 
> Then you need to reword the comment as such. Currently, it is not clear.

OK

> 
>>>
>>> And I believe it is OK to have more than one MSI window within an AXI window.
>>
>> This IP supports a single MSI window that need to fit into one of the
>> enabled AXI windows.
>>
> 
> [...]
> 
>>>> +
>>>> +	/* Update vendor ID and device ID */
>>>
>>> Are you really updating it or setting it? If you are updating it, are the
>>> default IDs invalid?
>>
>> Default IDs are valid (at least on RZ/G3S) but Renesas specific. Renesas
>> wants to let individual users to set their own IDs.
>>
> 
> So they are optional then? But the binding treats them as required, which should
> be changed if the default IDs are valid.

On RZ/G3S the default IDs are valid. On other SoCs that will be using this
driver (e.g. RZ/G3E) the default IDs are not valid.

These were marked as required as Renesas wants them to be set by the
company that manufactures the end product itself.


> 
>>>
>>>> +	writew(host->vendor_id, host->pcie + PCI_VENDOR_ID);
>>>> +	writew(host->device_id, host->pcie + PCI_DEVICE_ID);
>>>> +
>>>> +	/* HW manual recommends to write 0xffffffff on initialization */
>>>> +	writel(0xffffffff, host->pcie + RZG3S_PCI_CFG_BARMSK00L);
>>>> +	writel(0xffffffff, host->pcie + RZG3S_PCI_CFG_BARMSK00U);
>>>> +
>>>> +	/* Update bus info. */
>>>> +	writeb(primary_bus, host->pcie + PCI_PRIMARY_BUS);
>>>> +	writeb(secondary_bus, host->pcie + PCI_SECONDARY_BUS);
>>>> +	writeb(subordinate_bus, host->pcie + PCI_SUBORDINATE_BUS);
>>>> +
>>>> +	/* Disable access control to the CFGU */
>>>> +	writel(0, host->axi + RZG3S_PCI_PERM);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>
>>> [...]
>>>
>>>> +static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host, bool probe)
>>>> +{
>>>> +	u32 val;
>>>> +	int ret;
>>>> +
>>>> +	/* Initialize the PCIe related registers */
>>>> +	ret = rzg3s_pcie_config_init(host);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	/* Initialize the interrupts */
>>>> +	rzg3s_pcie_irq_init(host);
>>>> +
>>>> +	ret = reset_control_bulk_deassert(host->data->num_cfg_resets,
>>>> +					  host->cfg_resets);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	/* Wait for link up */
>>>> +	ret = readl_poll_timeout(host->axi + RZG3S_PCI_PCSTAT1, val,
>>>> +				 !(val & RZG3S_PCI_PCSTAT1_DL_DOWN_STS),
>>>> +				 PCIE_LINK_WAIT_SLEEP_MS,
>>>> +				 PCIE_LINK_WAIT_SLEEP_MS *
>>>> +				 PCIE_LINK_WAIT_MAX_RETRIES * MILLI);
>>>> +	if (ret) {
>>>> +		reset_control_bulk_assert(host->data->num_cfg_resets,
>>>> +					  host->cfg_resets);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	val = readl(host->axi + RZG3S_PCI_PCSTAT2);
>>>> +	dev_info(host->dev, "PCIe link status [0x%x]\n", val);
>>>> +
>>>> +	val = FIELD_GET(RZG3S_PCI_PCSTAT2_STATE_RX_DETECT, val);
>>>> +	dev_info(host->dev, "PCIe x%d: link up\n", hweight32(val));
>>>> +
>>>> +	if (probe) {
>>>> +		ret = devm_add_action_or_reset(host->dev,
>>>> +					       rzg3s_pcie_cfg_resets_action,
>>>> +					       host);
>>>
>>> Oh well, this gets ugly. Now the devm_add_action_or_reset() is sprinkled
>>> throughout the driver :/
>>>
>>> As I said earlier, there are concerns in unloading the driver if it implements
>>> an irqchip. So if you change the module_platform_driver() to
>>> builtin_platform_driver() for this driver, these devm_add_action_or_reset()
>>> calls become unused.
>>
>> They can still be useful in case the probe fails. As the initialization
>> path is complicated, having actions or resets looks to me that makes the
>> code cleaner as the rest of devm_* helpers.
>>
>> I can drop it and replace with gotos and dedicated functions but this will
>> complicate the code, AFAICT.
>>
>> Please let me know how would you like me to proceed.
>>
> 
> It is generally preferred to cleanup the resources in err path using goto
> labels.

Just to be sure I'll prepare the next version with something that was
requested: would you like to have goto lables on this driver?

I kept it like this as I considered the code is simpler.

Thank you,
Claudiu

