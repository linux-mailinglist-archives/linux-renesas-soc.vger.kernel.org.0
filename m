Return-Path: <linux-renesas-soc+bounces-32160-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6B4OMZtq+2miawMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32160-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:21:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 713724DE082
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA701309905E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 16:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20763FAE1C;
	Wed,  6 May 2026 16:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="X7e6W06d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5553ED5DE;
	Wed,  6 May 2026 16:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778084105; cv=none; b=JX3rxxIxIq6kcPHI8GYLSHwmsucoL6VHidDSWyGjVZoPhxngO0XVdmQ782QHGNF+K83676fiHAvpxSI1uqaUBkHlzv30N35V4QNPL/biPsbFTBYzJqPU/xFCpZFnAwPYJLHn0lXx3UwU4npgVtojzVBDspdj0kKEF7lr8g95hII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778084105; c=relaxed/simple;
	bh=84XmaM3yZcBczu+AeAoUlqltRnKXPXorCj6YkOA9cRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ck0nj31hj+duP6c9IFuwTtjhbWhhVW7Xfyof7obz3vvu1cU4AX78F6uDfcNplkOLShtYZFSQ99cVHBgyRwps8zxR0FoPRU+C/lRxM4GbcWldQgIPyt9R1yIFzUwEfRJ6fz9wgnO9VErVtu7C3MwZ4olgigq78iWr3cicXq93OzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=X7e6W06d; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=UfHQJNSrcWZKEHr40jicKw8cLpZAeqLEydFiIKDjPew=;
	b=X7e6W06dzG9bg7e4vXBUThRr6JgymlgdH6czq50E76dL69QAoJYpQAlXJIyIDf
	911If+Xaql37u8fiFpriZvbtopj0Y4/o5oBXZ+dKnpTIQLJgxRE6gDGcQFTNv7Ya
	JuN51vhC/W0GM9lar+eArupIeyzqAiPiHBh5syBSdVjYk=
Received: from [IPV6:240e:b8f:927e:5900:dbee:26f0:1b68:48a4] (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wCnyumpaPtp6K0KDw--.17012S2;
	Thu, 07 May 2026 00:13:30 +0800 (CST)
Message-ID: <384aac89-b99b-45bd-a080-adbc45c2d281@163.com>
Date: Thu, 7 May 2026 00:13:29 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] PCI: Add pcie_wait_after_link_train() helper
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com,
 pali@kernel.org, ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
 claudiu.beznea.uj@bp.renesas.com, mpillai@cadence.com, robh@kernel.org,
 s-vadapalli@ti.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260506152346.166056-1-18255117159@163.com>
 <20260506152346.166056-2-18255117159@163.com>
 <qryvbq7tn7gpkx63ljauddp3qxczgbzlpfkxiula7vq6f23yaz@oi2pal2ynzgv>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <qryvbq7tn7gpkx63ljauddp3qxczgbzlpfkxiula7vq6f23yaz@oi2pal2ynzgv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wCnyumpaPtp6K0KDw--.17012S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7trWfXFyfAryDuryxtrykGrg_yoW8Cr1Dpa
	95GF1YkF48XFW3Wan3Aa43XFyYqFs3ta4UGr97Ga4kGF9xurn3JF4Fg3y5Wrn3Xrs0vr12
	yF15Kw17CF4YyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uso7iUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwwqdQWn7aKpcsQAA3o
X-Rspamd-Queue-Id: 713724DE082
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32160-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]



On 5/6/26 23:55, Manivannan Sadhasivam wrote:
> On Wed, May 06, 2026 at 11:23:39PM +0800, Hans Zhang wrote:
>> PCIe r6.0, sec 6.6.1 (Conventional Reset) requires that for a Downstream
>> Port supporting Link speeds greater than 5.0 GT/s, software must wait a
>> minimum of 100 ms after Link training completes before sending any
>> Configuration Request.
>>
>> Introduce a static inline helper pcie_wait_after_link_train() that checks
>> the given max_link_speed (2 = 5.0 GT/s, 3 = 8.0 GT/s, etc.) and calls
>> msleep(100) only when the speed is greater than 5.0 GT/s. The helper uses
>> the existing PCIE_RESET_CONFIG_WAIT_MS macro defined in pci.h.
>>
>> This allows multiple host controller drivers to share the same mandatory
>> delay without duplicating the logic.
>>
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> ---
>>   drivers/pci/pci.h | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>> index 4a14f88e543a..a8705a2a2d85 100644
>> --- a/drivers/pci/pci.h
>> +++ b/drivers/pci/pci.h
> 
> Since this helper is for host controller drivers, this needs to be defined in
> pci-host-common.h.
> 

Hi Mani,

Thank you very much for your reply and suggestions.

Will change.

>> @@ -60,6 +60,19 @@ struct pcie_tlp_log;
>>    */
>>   #define PCIE_RESET_CONFIG_WAIT_MS	100
>>   
>> +/**
>> + * pcie_wait_after_link_train - Wait 100 ms if link speed > 5 GT/s
>> + * @max_link_speed: the maximum link speed (2 = 5.0 GT/s, 3 = 8.0 GT/s, ...)
>> + *
>> + * Must be called after Link training completes and before the first
>> + * Configuration Request is sent.
>> + */
>> +static inline void pcie_wait_after_link_train(int max_link_speed)
> 
> pci_host_common_link_train_delay()?

I think it's really great. Thanks.

Best regards,
Hans

> 
> - Mani
> 


