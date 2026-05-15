Return-Path: <linux-renesas-soc+bounces-32689-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4N9uCJE3B2ottwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32689-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 17:11:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB99551ED3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 17:11:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39E7E30329BE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 15:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF96A481FB3;
	Fri, 15 May 2026 15:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ogJCGY5G"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2BD48B38E;
	Fri, 15 May 2026 15:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778857559; cv=none; b=qnmUXfhLksNWJQSTHzDPyhQktUyCXB8vUtjiBBJgyk1Gx1qZ8gZv0a81db+e74poFchxmTSLpvjL3M31qKIEtGywRDFRY21S8CvOr352sIrrnZQN77/nN3BwUSzSEBW/RBBTNT+OoH/WcMVG/1M1Uxl6nWeQprbcScpESszaH6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778857559; c=relaxed/simple;
	bh=McpnXz/rGrMuSUIcvQ4AG8Kl82xuU/L/dKPrY5yg0M4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mxUbV2YpyENZrwepfNQyJIfBFA+xJ9TaSQmtPS33rSFd8W9h0wrtC0fgJ/vnJe8zU4h06q766NnH12aSH3lOsdkAm+Cdkzd0ausqTzwBd4DgxOhrKaxc7aUMTrVKV/8XNWE8jeMq1oZMcVtO602tUOcowh+Y+0K2N7suS3HpwpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ogJCGY5G; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=D0aVJ1oI07M7fsLfw7yCfiuyUD9A/pHOpyMY/I0o1C0=;
	b=ogJCGY5GZCO33EocCv82XtHrz71uQciISGEtOBaI6KUPvqZBTXI1vlRhWzoRMJ
	AoMm1RqkBfRCAHa6aRGQUK801b33FTNE3yrwHQyrsI0nzqh+wa0+n9vXpaGLcZwn
	3BifagXBGJ7WKejgWWYPtGM6QO3a0kB+lq3idysEMul7k=
Received: from [IPV6:240e:b8f:91b3:d000:79ec:4c96:c180:869b] (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDnr6MGNgdqmNEiBg--.36082S2;
	Fri, 15 May 2026 23:04:39 +0800 (CST)
Message-ID: <01f61c3f-d2a7-4ce3-a820-a5502312a07f@163.com>
Date: Fri, 15 May 2026 23:04:39 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] PCI: aardvark: Add 100 ms delay after link
 training
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, vigneshr@ti.com, jingoohan1@gmail.com,
 thomas.petazzoni@bootlin.com, ryder.lee@mediatek.com,
 jianjun.wang@mediatek.com, claudiu.beznea.uj@bp.renesas.com,
 mpillai@cadence.com, robh@kernel.org, s-vadapalli@ti.com,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260506152346.166056-1-18255117159@163.com>
 <20260506152346.166056-7-18255117159@163.com>
 <20260512212531.jupoocz7acv22qyg@pali>
 <581e91fb-2e57-43ed-b79d-19dbf384b955@163.com>
 <20260513072008.vol4htgbzquly2rb@pali>
 <15532890-ce22-4b20-96d9-e7f7c47050d2@163.com>
 <20260513185442.mw3md5te7dhojyd7@pali>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20260513185442.mw3md5te7dhojyd7@pali>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnr6MGNgdqmNEiBg--.36082S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3XF1xXrWrJF4xWry5Wry7Awb_yoW3Zr43pF
	W5Ga9FyF47Jr13u3W0q3W8ZFyjqan8C343Xrn8X347Wr9I9FyDtF12krWfuasrGr4vyr12
	vw45tFy3CwnIva7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07URVbkUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6wjrj2oHNgiRnAAA3Z
X-Rspamd-Queue-Id: BCB99551ED3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32689-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com,cadence.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[163.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action



On 5/14/26 02:54, Pali Rohár wrote:
> On Wednesday 13 May 2026 15:34:46 Hans Zhang wrote:
>> On 5/13/26 15:20, Pali Rohár wrote:
>>> On Wednesday 13 May 2026 15:00:04 Hans Zhang wrote:
>>>>
>>>>
>>>> On 5/13/26 05:25, Pali Rohár wrote:
>>>>> On Wednesday 06 May 2026 23:23:44 Hans Zhang wrote:
>>>>>> The Aardvark PCIe controller driver waits for the link to come up but
>>>>>> does not implement the mandatory 100 ms delay after link training
>>>>>> completes for speeds greater than 5.0 GT/s (PCIe r6.0 sec 6.6.1).
>>>>>>
>>>>>> The driver already maintains a 'link_gen' field that holds the negotiated
>>>>>> link speed. Use it together with pcie_wait_after_link_train() to insert
>>>>>> the required delay immediately after confirming that the link is up.
>>>>>>
>>>>>> Signed-off-by: Hans Zhang <18255117159@163.com>
>>>>>> ---
>>>>>>     drivers/pci/controller/pci-aardvark.c | 4 +++-
>>>>>>     1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
>>>>>> index e34bea1ff0ac..526351c21c49 100644
>>>>>> --- a/drivers/pci/controller/pci-aardvark.c
>>>>>> +++ b/drivers/pci/controller/pci-aardvark.c
>>>>>> @@ -350,8 +350,10 @@ static int advk_pcie_wait_for_link(struct advk_pcie *pcie)
>>>>>>     	/* check if the link is up or not */
>>>>>>     	for (retries = 0; retries < LINK_WAIT_MAX_RETRIES; retries++) {
>>>>>> -		if (advk_pcie_link_up(pcie))
>>>>>> +		if (advk_pcie_link_up(pcie)) {
>>>>>> +			pcie_wait_after_link_train(pcie->link_gen);
>>>>>>     			return 0;
>>>>>> +		}
>>>>>>     		usleep_range(LINK_WAIT_USLEEP_MIN, LINK_WAIT_USLEEP_MAX);
>>>>>>     	}
>>>>>> -- 
>>>>>> 2.34.1
>>>>>>
>>>>>
>>>>> Are you sure that this is correct to do? Have you checked the A3720
>>>>> Functional Specification which describes how to bring PCIe link up?
>>>>>
>>>>> A3720 PCIe controller is buggy and needs more timing hacks to make it
>>>>> behave. Playing with random sleeps can break its internal logic.
>>>>> I'm not sure if it could be safe without proper testing.
>>>>>
>>>>> And IIRC A3720 PCIe controller is just PCIe2.0 with 5 GT/s.
>>>>
>>>>
>>>> Hi Pali,
>>>>
>>>> 1. This driver does not support A3720.
>>>>
>>>> static const struct of_device_id advk_pcie_of_match_table[] = {
>>>> 	{ .compatible = "marvell,armada-3700-pcie", },
>>>> 	{},
>>>> };
>>>> MODULE_DEVICE_TABLE(of, advk_pcie_of_match_table);
>>>>
>>>> If you need support for A3720, please submit the corresponding patch so that
>>>> Bjorn and Mani can review it.
>>>
>>> 3700 (or 37xx) is family and covers both a3710 and a3720. In most cases is the
>>> a3720 dominant and hence identifiers 3700 and 3720 are begin mixed.
>>>
>>>>
>>>> 2. If A3720 only supports GEN2, you can configure "max-link-speed" to be 2
>>>> in the DT. This will not affect the functionality of this patch.
>>>
>>> Whole A37xx supports only GEN2. And in DT files for 37xx should be
>>> already there max-link-speed.
>>>
>>> Seems that in advk_pcie_of_match_table there is no GEN3 device
>>> specified.
>>>
>>
>> Hi Pali,
>>
>> However, I saw many GEN3 assignments and conditions in the code.
>>
>> ret = of_pci_get_max_link_speed(dev->of_node);
>> if (ret <= 0 || ret > 3)
>> 	pcie->link_gen = 3;
>> else
>> 	pcie->link_gen = ret;
>>
>>
>> static void advk_pcie_train_link(struct advk_pcie *pcie)
>> {
>> 	struct device *dev = &pcie->pdev->dev;
>> 	u32 reg;
>> 	int ret;
>>
>> 	/*
>> 	 * Setup PCIe rev / gen compliance based on device tree property
>> 	 * 'max-link-speed' which also forces maximal link speed.
>> 	 */
>> 	reg = advk_readl(pcie, PCIE_CORE_CTRL0_REG);
>> 	reg &= ~PCIE_GEN_SEL_MSK;
>> 	if (pcie->link_gen == 3)
>> 		reg |= SPEED_GEN_3;
>> 	else if (pcie->link_gen == 2)
>> 		reg |= SPEED_GEN_2;
>> 	else
>> 		reg |= SPEED_GEN_1;
>> 	advk_writel(pcie, reg, PCIE_CORE_CTRL0_REG);
>>
>> 	/*
>> 	 * Set maximal link speed value also into PCIe Link Control 2 register.
>> 	 * Armada 3700 Functional Specification says that default value is based
>> 	 * on SPEED_GEN but tests showed that default value is always 8.0 GT/s.
>> 	 */
>> 	reg = advk_readl(pcie, PCIE_CORE_PCIEXP_CAP + PCI_EXP_LNKCTL2);
>> 	reg &= ~PCI_EXP_LNKCTL2_TLS;
>> 	if (pcie->link_gen == 3)
>> 		reg |= PCI_EXP_LNKCTL2_TLS_8_0GT;
>> 	else if (pcie->link_gen == 2)
>> 		reg |= PCI_EXP_LNKCTL2_TLS_5_0GT;
>> 	else
>> 		reg |= PCI_EXP_LNKCTL2_TLS_2_5GT;
>> 	advk_writel(pcie, reg, PCIE_CORE_PCIEXP_CAP + PCI_EXP_LNKCTL2);
>>
>> ....
>>
>>
>> If you are certain about the relevant information. Is it understandable that
>> we need to delete the code related to GEN3?
> 
> Ok. So some explanation. pci-aardvark.c is implementing driver for PCIe
> controller with codename aardvark. I have no idea from what this
> codename comes and what is represents. What we know that the driver was
> written for A37xx SoC platform according to A37xx functional specification.
> As it is common in SoC world, vendors just buy some IP and integrate it
> into SoC. In this case Marvell bought this PCIe controller IP and
> integrated it into the A37xx. In past I tried to investigate what it
> could be and IIRC my assumption was that it was PCIe IP from Denali.
> Denali was acquired by Cadence, and when I compared Cadence PCIe
> controller registers and PCIe controller registers in A37xx functional
> specification there were large overlap. For me it looked like new
> Cadence PCIe controller is an evolution (or new version) of what is in
> A37xx. So this was some confirmation of my theory. Linux kernel has
> separate driver for PCIe controller from Cadence and for refactoring
> there were ideas to merge these two drivers... But there were more
> important things, fix issues related to A37xx PCIe, lot of changes
> which address these issues were sent to the list but they were not
> taken. I do not think that it makes sense to do refactoring or doing any
> other changes before addressing any existing issues with these
> drivers (like PCIe card is not working correctly).
> 
> There are reported more HW erratas for this PCIe controller which needs
> to be addressed in the software (meaning in Linux kernel) to make PCIe
> card working properly. And there are more design HW decision which needs
> does not conform to the PCIe specification and those deviations needs to
> be "fixed" or "adjusted" in software (meaning in pci-aardvark.c driver)
> to make PCI/PCIe compatible drivers to work correctly.
> 
> Now about GEN3. From register allocation it looks like that PCIe IP
> supports GEN3. A37xx does not support it (or at least officially). This
> does not mean that there cannot be some SoC with this "aardvark" PCIe IP
> that is GEN3 capable. Just we see that such SoC is not supported by Linux.
> Also as the comment in above code says, by default the speed is reported
> as 8.0 GT/s, so changing it to 5.0 GT/s or 2.5 GT/s is needed as so code
> some parts of GEN3 code in the driver is needed.
> 
> Does it makes sense to remove it? Does it makes sense to spend time on
> such thing which does not address any existing issue? For me not.
> Because it does not fix any _real_ issue with existing PCIe cards. And
> for refactoring it is better to merge drivers as explained above and
> IIRC cadence driver has HW on which is GEN3 used.
> 
> Now about your change. If you are sure that pcie_wait_after_link_train()
> function is noop for pcie->link_gen == 2 || pcie->link_gen == 1 then go
> ahead, I have no objects. I have not looked deeply at the change. I just
> spotted some change which is touching timing critical code path which
> was problematic in the past and broke many wifi cards. So I'm really
> careful to prevent breaking Linux support again.
> 

Hi Pali,

This condition, pcie->link_gen == 2 || pcie->link_gen == 1, will have no 
effect.


Best regards,
Hans

> As maintainers decided to not take any new changes from me for this
> driver, I have no motivation to prepare any new changes. I will rather
> spend my free time on something which will make sense and not be wasting
> of my free time.
>


