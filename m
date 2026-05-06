Return-Path: <linux-renesas-soc+bounces-32161-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMpQCw1r+2miawMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32161-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:23:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 836174DE0B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADFED30C40B6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 16:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E29E44D035;
	Wed,  6 May 2026 16:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="dxaB81nr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B53F492519;
	Wed,  6 May 2026 16:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778084140; cv=none; b=abt+PRgMj0f5rVxXG7Xv+0VkA8dpognmOVVuu29wNrvBysZe0AzwPmR0JwmBGZtPXVQfEMKAUXJiItDJTC6lmwRoUkOycHYyD7D5L4oIl06kvolNlFLsllTegNcvauoZiar0ElktbaNL6W6PZhsoW5I7+vR50llJZl0Bxg5qPGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778084140; c=relaxed/simple;
	bh=Em6agBQQRn6xNuzMij5Am1ZYeTw8pgbbnZOlbl0v8oQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DocisOzWK4b7hE3tXe7TyoGKtcr5ZK04KZu8m95MTg/kubvtHlPa13FDRJBVJoxQzwJdbmOZBixtKWEukhsKdKsM/zNuyppwAZs9/JXLcbaHB+7l0ZPZeZypFmorA2jx1w/mh8KXB9uxaB6JJAY5RSU/n2nmr2xlsQw+BNeYdvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=dxaB81nr; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=FFGQIxzV0XqW9nC0/AKOyv2OIrk100bnZQY5xlfWlcc=;
	b=dxaB81nrrQv9ZYzmI+hxe9hf8pTaEG82gZB2ZW/exdXHtXFqRWfJtaSl9rVb7X
	g/HMC0XeUUgN9EmtXmooML8TP+K1xVY24fdLXFsnpQJQWKCb1Xdp+1TyCuNEY9fh
	YefWdL+yAUf76s44LeF+K8/ooMF18Pq7SeBqqoHafOxRI=
Received: from [IPV6:240e:b8f:927e:5900:dbee:26f0:1b68:48a4] (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgDnr1XeaPtpun1fDQ--.22605S2;
	Thu, 07 May 2026 00:14:23 +0800 (CST)
Message-ID: <72aff075-847d-4e30-a5c3-bf26670646b5@163.com>
Date: Thu, 7 May 2026 00:14:22 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] PCI: cadence: LGA: Add max_link_speed field and
 100 ms delay after link training
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
 <20260506152346.166056-3-18255117159@163.com>
 <jmqw5tmgbpou5lanjcnolrpmipgnny6chm53wqybtqg4epfuql@cxqryplrmylk>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <jmqw5tmgbpou5lanjcnolrpmipgnny6chm53wqybtqg4epfuql@cxqryplrmylk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:PSgvCgDnr1XeaPtpun1fDQ--.22605S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWrWrAFWDCF43GF48Zr43Jrb_yoW5ArW8pa
	yDGa4fGF1IqrWY93WkZ3W5XryYqas0k3s7Kws2ka4xWr13Cr1UJF12gF15WF9xKrWDAr17
	ZF1DtF9rGF4ayFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UN6pPUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwx+qTmn7aN9kqQAA3Q
X-Rspamd-Queue-Id: 836174DE0B3
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-32161-lists,linux-renesas-soc=lfdr.de];
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



On 5/7/26 00:03, Manivannan Sadhasivam wrote:
> On Wed, May 06, 2026 at 11:23:40PM +0800, Hans Zhang wrote:
>> The Cadence LGA (Legacy Architecture IP) PCIe host controller currently
>> lacks the mandatory 100 ms delay after link training completes for speeds
>>> 5.0 GT/s, as required by PCIe r6.0 sec 6.6.1.
>>
>> Add a 'max_link_speed' field to struct cdns_pcie to record the maximum
>> supported link speed (or the currently configured speed). In the common
>> host layer function cdns_pcie_host_start_link(), after the link has been
>> successfully established, call pcie_wait_after_link_train() to insert the
>> required delay if max_link_speed > 2.
>>
>> Glue drivers must set max_link_speed appropriately (e.g., from the device
>> tree property "max-link-speed") to enable the delay.
>>
> 
> You need to club those glue driver patches into this one. Otherwise, you'll end
> up breaking bisectability.

Hi Mani,

Will change.

Best regards,
Hans

> 
> - Mani
> 
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> ---
>>   drivers/pci/controller/cadence/pcie-cadence-host-common.c | 4 ++++
>>   drivers/pci/controller/cadence/pcie-cadence.h             | 2 ++
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host-common.c b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>> index 2b0211870f02..51376f69d007 100644
>> --- a/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>> +++ b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>> @@ -14,6 +14,7 @@
>>   
>>   #include "pcie-cadence.h"
>>   #include "pcie-cadence-host-common.h"
>> +#include "../../pci.h"
>>   
>>   #define LINK_RETRAIN_TIMEOUT HZ
>>   
>> @@ -115,6 +116,9 @@ int cdns_pcie_host_start_link(struct cdns_pcie_rc *rc,
>>   	if (!ret && rc->quirk_retrain_flag)
>>   		ret = cdns_pcie_retrain(pcie, pcie_link_up);
>>   
>> +	if (!ret)
>> +		pcie_wait_after_link_train(pcie->max_link_speed);
>> +
>>   	return ret;
>>   }
>>   EXPORT_SYMBOL_GPL(cdns_pcie_host_start_link);
>> diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
>> index 574e9cf4d003..e222b095d2b6 100644
>> --- a/drivers/pci/controller/cadence/pcie-cadence.h
>> +++ b/drivers/pci/controller/cadence/pcie-cadence.h
>> @@ -86,6 +86,7 @@ struct cdns_plat_pcie_of_data {
>>    * @ops: Platform-specific ops to control various inputs from Cadence PCIe
>>    *       wrapper
>>    * @cdns_pcie_reg_offsets: Register bank offsets for different SoC
>> + * @max_link_speed: maximum supported link speed
>>    */
>>   struct cdns_pcie {
>>   	void __iomem		             *reg_base;
>> @@ -98,6 +99,7 @@ struct cdns_pcie {
>>   	struct device_link	             **link;
>>   	const  struct cdns_pcie_ops          *ops;
>>   	const  struct cdns_plat_pcie_of_data *cdns_pcie_reg_offsets;
>> +	int				     max_link_speed;
>>   };
>>   
>>   /**
>> -- 
>> 2.34.1
>>
> 


