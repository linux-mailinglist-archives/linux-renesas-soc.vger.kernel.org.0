Return-Path: <linux-renesas-soc+bounces-32560-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFFVHwwqBGrfEwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32560-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 09:36:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2034D52EBDD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 09:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CC1AF3017E6F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 07:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD1F3A48CA;
	Wed, 13 May 2026 07:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="e5KTyfYl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC81D3D47A8;
	Wed, 13 May 2026 07:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778657793; cv=none; b=JruC8o4M3/rRgfRVor4wGoy5tvxSEqilhx+7XYqK7QEcUVwiLsvC6azofEuPAGK4eQz+Phbd7HA1dXF49JavCOLWfb3oCS1hNTfZO/aUPi0w7xuE2mS2OftgG9o99b5rGteo1kn0PBzuPFWznQiTowN04pxikoMI+8heqPlfpuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778657793; c=relaxed/simple;
	bh=etik6jZ7THDO8/ZmoimjNBJTBGbryqHsMsuOR/9s4gw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L5ts+b9FVUG354AoSLCl8gBUKV60wnfcR6/DJhcU6mKyn39WdGAiMtLXCpL/RCDwy3AxQJEGXFNSf7/ZCCaw/hSpPXhKZstWAv40Zt5OmgKvoxTQmE5muuka30cxwW1W7QYmGP3DCvEwLrUuVpKDxcQ6d1tMcX9RlB/ENW0IVy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=e5KTyfYl; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=VijwG2fIs9LhVa8a8fRpWCP40TzL9ibkl6s9H7Eu2SA=;
	b=e5KTyfYlAFGe/42vF2z8P7EXkacJhGfEpbHUW3Awoev0s0P91k3Z+NfTtXQEgn
	9uMXTA8eHBgDYCY6c6yWdK/j/IKqOnESn7atUr3cBQdyRnFdejtOkQttakzNE1DM
	qQuDf+g119YFLEA/Z5kqLP5P2HQgn/L64VqoP6KWzoMik=
Received: from [192.168.50.71] (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wC3bRWWKQRqHpJqBA--.6846S2;
	Wed, 13 May 2026 15:34:47 +0800 (CST)
Message-ID: <15532890-ce22-4b20-96d9-e7f7c47050d2@163.com>
Date: Wed, 13 May 2026 15:34:46 +0800
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
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20260513072008.vol4htgbzquly2rb@pali>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wC3bRWWKQRqHpJqBA--.6846S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Ar48GrWDZFWUCw48tr1DJrb_yoW7AF4fpa
	y7GasFyFs5Jr15u3WIq3WDXFyYqan8uFyUXr18Wry7XF9IyryUWF12krZI9FyDGr4vvF1j
	vw4jqFyxu3WYva7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UEPfLUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwxcLrmoEKZfYBwAA3+
X-Rspamd-Queue-Id: 2034D52EBDD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32560-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linutronix.de:email]
X-Rspamd-Action: no action



On 5/13/26 15:20, Pali Rohár wrote:
> On Wednesday 13 May 2026 15:00:04 Hans Zhang wrote:
>>
>>
>> On 5/13/26 05:25, Pali Rohár wrote:
>>> On Wednesday 06 May 2026 23:23:44 Hans Zhang wrote:
>>>> The Aardvark PCIe controller driver waits for the link to come up but
>>>> does not implement the mandatory 100 ms delay after link training
>>>> completes for speeds greater than 5.0 GT/s (PCIe r6.0 sec 6.6.1).
>>>>
>>>> The driver already maintains a 'link_gen' field that holds the negotiated
>>>> link speed. Use it together with pcie_wait_after_link_train() to insert
>>>> the required delay immediately after confirming that the link is up.
>>>>
>>>> Signed-off-by: Hans Zhang <18255117159@163.com>
>>>> ---
>>>>    drivers/pci/controller/pci-aardvark.c | 4 +++-
>>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
>>>> index e34bea1ff0ac..526351c21c49 100644
>>>> --- a/drivers/pci/controller/pci-aardvark.c
>>>> +++ b/drivers/pci/controller/pci-aardvark.c
>>>> @@ -350,8 +350,10 @@ static int advk_pcie_wait_for_link(struct advk_pcie *pcie)
>>>>    	/* check if the link is up or not */
>>>>    	for (retries = 0; retries < LINK_WAIT_MAX_RETRIES; retries++) {
>>>> -		if (advk_pcie_link_up(pcie))
>>>> +		if (advk_pcie_link_up(pcie)) {
>>>> +			pcie_wait_after_link_train(pcie->link_gen);
>>>>    			return 0;
>>>> +		}
>>>>    		usleep_range(LINK_WAIT_USLEEP_MIN, LINK_WAIT_USLEEP_MAX);
>>>>    	}
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>> Are you sure that this is correct to do? Have you checked the A3720
>>> Functional Specification which describes how to bring PCIe link up?
>>>
>>> A3720 PCIe controller is buggy and needs more timing hacks to make it
>>> behave. Playing with random sleeps can break its internal logic.
>>> I'm not sure if it could be safe without proper testing.
>>>
>>> And IIRC A3720 PCIe controller is just PCIe2.0 with 5 GT/s.
>>
>>
>> Hi Pali,
>>
>> 1. This driver does not support A3720.
>>
>> static const struct of_device_id advk_pcie_of_match_table[] = {
>> 	{ .compatible = "marvell,armada-3700-pcie", },
>> 	{},
>> };
>> MODULE_DEVICE_TABLE(of, advk_pcie_of_match_table);
>>
>> If you need support for A3720, please submit the corresponding patch so that
>> Bjorn and Mani can review it.
> 
> 3700 (or 37xx) is family and covers both a3710 and a3720. In most cases is the
> a3720 dominant and hence identifiers 3700 and 3720 are begin mixed.
> 
>>
>> 2. If A3720 only supports GEN2, you can configure "max-link-speed" to be 2
>> in the DT. This will not affect the functionality of this patch.
> 
> Whole A37xx supports only GEN2. And in DT files for 37xx should be
> already there max-link-speed.
> 
> Seems that in advk_pcie_of_match_table there is no GEN3 device
> specified.
> 

Hi Pali,

However, I saw many GEN3 assignments and conditions in the code.

ret = of_pci_get_max_link_speed(dev->of_node);
if (ret <= 0 || ret > 3)
	pcie->link_gen = 3;
else
	pcie->link_gen = ret;


static void advk_pcie_train_link(struct advk_pcie *pcie)
{
	struct device *dev = &pcie->pdev->dev;
	u32 reg;
	int ret;

	/*
	 * Setup PCIe rev / gen compliance based on device tree property
	 * 'max-link-speed' which also forces maximal link speed.
	 */
	reg = advk_readl(pcie, PCIE_CORE_CTRL0_REG);
	reg &= ~PCIE_GEN_SEL_MSK;
	if (pcie->link_gen == 3)
		reg |= SPEED_GEN_3;
	else if (pcie->link_gen == 2)
		reg |= SPEED_GEN_2;
	else
		reg |= SPEED_GEN_1;
	advk_writel(pcie, reg, PCIE_CORE_CTRL0_REG);

	/*
	 * Set maximal link speed value also into PCIe Link Control 2 register.
	 * Armada 3700 Functional Specification says that default value is based
	 * on SPEED_GEN but tests showed that default value is always 8.0 GT/s.
	 */
	reg = advk_readl(pcie, PCIE_CORE_PCIEXP_CAP + PCI_EXP_LNKCTL2);
	reg &= ~PCI_EXP_LNKCTL2_TLS;
	if (pcie->link_gen == 3)
		reg |= PCI_EXP_LNKCTL2_TLS_8_0GT;
	else if (pcie->link_gen == 2)
		reg |= PCI_EXP_LNKCTL2_TLS_5_0GT;
	else
		reg |= PCI_EXP_LNKCTL2_TLS_2_5GT;
	advk_writel(pcie, reg, PCIE_CORE_PCIEXP_CAP + PCI_EXP_LNKCTL2);

....


If you are certain about the relevant information. Is it understandable 
that we need to delete the code related to GEN3?


Best regards,
Hans


>> 3. This patch is a common delay requirement stipulated by the PCIe
>> specification. If it is greater than GEN2, then msleep(100) will be added;
>> otherwise, there will be no such delay.
>>
>> 4. For instance, we often come across the situation where some common APIs
>> are modified, and in many cases, their functionality does not require the
>> actual development board for verification. I believe that many other
>> developers and maintainers have modified different parts of the code. For
>> example, the recent submission:
> 
> Switching one API to another is one thing. But changing code which looks
> to be critical, specially when it is known that hw has bugs, can cause
> breaking of existing boards.
> 
>> commit 750277048afe7ce8ebfc0b120de7dfbc745058a7
>> Author: Nam Cao <namcao@linutronix.de>
>> Date:   Thu Jun 26 16:47:53 2025 +0200
>>
>>      PCI: aardvark: Switch to msi_create_parent_irq_domain()
>>
>>      Switch to msi_create_parent_irq_domain() from
>> pci_msi_create_irq_domain()
>>      which was using legacy MSI domain setup.
>>
>>
>> And many controller drivers have been modified.
>>
>>
>> Best regards,
>> Hans
>>
>>


