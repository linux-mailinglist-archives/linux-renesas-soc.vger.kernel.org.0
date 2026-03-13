Return-Path: <linux-renesas-soc+bounces-29371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLx8BpBEtGk4kAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 18:08:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAE0287D6B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 18:08:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35590333C3F4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 16:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A82A3CBE9A;
	Fri, 13 Mar 2026 16:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Wo53AdgG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5903E3CAE9D;
	Fri, 13 Mar 2026 16:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773421011; cv=none; b=Lj9mUerW+ls4IuHLC8YE0rZYvygmakQH/7OlmAxbK0wd/wMvY3LoScqNKpncqB+egc78CaYbl36fypREpVSUX1R33CpOeeUQpgPktG1BsHff46sxn6S6rQgwu+76ZHBDdEa1NmyH2Pt1gs0XonQF9DXy7j8ilZBhwUKfE5ExbfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773421011; c=relaxed/simple;
	bh=m1IZt4EIniBQvWyYd+TWH4K/i4qK7yb1ZDm1bnrzdM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ldhLMwXl/CmP9tWfR0QMANZ7tvo0vfsWR+mud7n6VvlUTxNznL9KvtaWE9L4JwKLFk1ZAPQPwTNHizc/mGjeKF0usC3BVL7m990w17XHxckyGmnjxSBgxED9jTesd86R6L2ent6OOgoPPsWE5A3hOlp6g8DKQBTAfQKtZt/cjZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Wo53AdgG; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=q0DpKTN4PvH+Dvh4/uxnkl1rNoX6VwmuHBu5SZYEtE8=;
	b=Wo53AdgGBjt+gydVUW2mUdbTMrbHIQuEJyOJvYJ+H6YZwglc8W+3+awCF2zMIG
	M7E/+2uYLDjp68O2wbnh2ABatIphbt/csPcrLNTC7vBDR1vora8jaFMDWSWaHdJy
	0W588sHhrbqU6UCeHIaF1UBu6S8qZzfPAkvEvqWC1LX4I=
Received: from [IPV6:240e:b8f:927e:1000:ce47:698d:adec:5bb5] (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnSkZpQbRpcaQ8Aw--.32207S2;
	Sat, 14 Mar 2026 00:55:07 +0800 (CST)
Message-ID: <f7e6c82e-5300-447a-b007-917ea0a5b6f2@163.com>
Date: Sat, 14 Mar 2026 00:55:05 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] PCI: of: Remove max-link-speed generation
 validation
To: Shawn Lin <shawn.lin@rock-chips.com>, lpieralisi@kernel.org,
 jingoohan1@gmail.com, mani@kernel.org, kwilczynski@kernel.org,
 bhelgaas@google.com, helgaas@kernel.org, florian.fainelli@broadcom.com,
 jim2101024@gmail.com
Cc: robh@kernel.org, ilpo.jarvinen@linux.intel.com,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, claudiu.beznea.uj@bp.renesas.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260312163652.113228-1-18255117159@163.com>
 <20260312163652.113228-6-18255117159@163.com>
 <44e74dff-c321-7cfe-e304-a21644ac7787@rock-chips.com>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <44e74dff-c321-7cfe-e304-a21644ac7787@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnSkZpQbRpcaQ8Aw--.32207S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr4fCFy3Cr4xZw17XF18Krg_yoW5GFyxpa
	y7Ar1Y9F1UJr45Wr1xXF4rZFy2gFnYgrWktryrG3ZruwnxZrs3tFy2qF15Xr929rZ5ZF17
	X3WagF4UCa90yaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U7PEfUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7AvxlWm0QWv-lQAA3e
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[rock-chips.com,kernel.org,gmail.com,google.com,broadcom.com];
	FREEMAIL_FROM(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-29371-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[163.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8EAE0287D6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2026/3/13 15:04, Shawn Lin wrote:
> Hi Hans
> 
> 在 2026/03/13 星期五 0:36, Hans Zhang 写道:
>> The of_pci_get_max_link_speed() function currently validates the
>> "max-link-speed" DT property to be in the range 1..4 (Gen1..Gen4).
>> This imposes a maintenance burden because each new PCIe generation
>> would require updating this validation.
>>
>> Remove the range check so the function returns the raw property value
>> (or a negative error code if the property is missing or malformed).
>> Callers must now validate the returned speed against the range they
>> support. A subsequent patch adds such validation to the DWC driver,
>> which is the primary user of this function.
>>
>> Removing the validation from this common function allows future PCIe
>> generations to be supported without modifying drivers/pci/of.c.
>>
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> ---
>>   drivers/pci/of.c | 12 +++++++-----
>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
>> index 9f8eb5df279e..fbb779a94202 100644
>> --- a/drivers/pci/of.c
>> +++ b/drivers/pci/of.c
>> @@ -875,8 +875,9 @@ EXPORT_SYMBOL_GPL(of_pci_supply_present);
>>    * of_pci_get_max_link_speed - Find the maximum link speed of the 
>> given device node.
>>    * @node: Device tree node with the maximum link speed information.
>>    *
>> - * This function will try to find the limitation of link speed by 
>> finding
>> - * a property called "max-link-speed" of the given device node.
>> + * This function will try to read the "max-link-speed" property of 
>> the given
>> + * device tree node. It does NOT validate the value of the property 
>> (e.g.,
>> + * range checks for PCIe generations).
>>    *
>>    * Return:
>>    * * > 0    - On success, a maximum link speed.
> 
> Thanks for the patch. However, after applying it, I noticed this part
> still seems off. There is a detailed comment in the file saying this
> function checks if the max-link-speed is invalid, just a few lines below
> your change. Could you please take another look at that comment and
> adjust them?

Hi Shawn,

Thanks. Will change.

Best regards,
Hans


> 
>> @@ -889,10 +890,11 @@ EXPORT_SYMBOL_GPL(of_pci_supply_present);
>>   int of_pci_get_max_link_speed(struct device_node *node)
>>   {
>>       u32 max_link_speed;
>> +    int ret;
>> -    if (of_property_read_u32(node, "max-link-speed", &max_link_speed) ||
>> -        max_link_speed == 0 || max_link_speed > 4)
>> -        return -EINVAL;
>> +    ret = of_property_read_u32(node, "max-link-speed", &max_link_speed);
>> +    if (ret)
>> +        return ret;
>>       return max_link_speed;
>>   }
>>


