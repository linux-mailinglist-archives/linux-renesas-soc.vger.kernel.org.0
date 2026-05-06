Return-Path: <linux-renesas-soc+bounces-32163-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKJyFNVs+2miawMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32163-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:31:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4A74DE214
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 87D573002D08
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 16:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48DF63F7A87;
	Wed,  6 May 2026 16:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Ou3/SwMO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20333F0ABC;
	Wed,  6 May 2026 16:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778084549; cv=none; b=mQt15FZDLk3aRUA4pEc7vNWy5kYOmeHmsXxpHtmWsXTACN4KEUSrvOBbw0a4zvVTu9DBiIq6nlRMNKpBw7jXJ+hVRvV/BPEzSE7eDDwcNxDIJ+HgQNNX5fHhMdokWdQ3aa40PHDwVMTOBFB1iIxILhnjYEzYdybR6ZrsvhNMqJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778084549; c=relaxed/simple;
	bh=EpINGQCdb+UhCZ7EU3sUTvutsxXf3RMSJFINmQT9Gk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YuNUqKd1bWhexx/T9Z757HIZ3rox8oMAL7o8VKXUqhSJ4+z9QSPO2OjTHRyBoUghnlgLzjEGCg2U6hhUnEirrptIYLNAyCHx+loVEuMsMV1cfV+2j9IBdUoyvWAfMzwOTfymd3eajhjGp6veyaT+6dEzWB/b0ENZpgUDVwAN1eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Ou3/SwMO; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=LJLe84Gk4h6y8PoVQ/eoWWYBLTFetFxQ4/izT5KcC/Q=;
	b=Ou3/SwMOI3j2gFHY3Qlhek+FocO4RBkhi+1MIn32FhKCwaaT2XnG53a7ekI/d3
	Qq1XrSrh/lVToWyzq62Qjp9jwk+uF+HoIvAwkX/f+WMBY7OfGXXXhzAP7Q4xxsWG
	AQYtmN6ytbVaATEhhHDKwKz7TPD1BEVqngaPe0Zv28ILQ=
Received: from [IPV6:240e:b8f:927e:5900:dbee:26f0:1b68:48a4] (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wBnO1xyavtpJhIDDw--.14523S2;
	Thu, 07 May 2026 00:21:07 +0800 (CST)
Message-ID: <8932a3a4-ede9-464e-985b-f9b0ab90c830@163.com>
Date: Thu, 7 May 2026 00:21:06 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] PCI: cadence: LGA: Add max_link_speed field and
 100 ms delay after link training
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
 "mani@kernel.org" <mani@kernel.org>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "pali@kernel.org" <pali@kernel.org>,
 "ryder.lee@mediatek.com" <ryder.lee@mediatek.com>,
 "jianjun.wang@mediatek.com" <jianjun.wang@mediatek.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 "mpillai@cadence.com" <mpillai@cadence.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "s-vadapalli@ti.com" <s-vadapalli@ti.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260506152346.166056-1-18255117159@163.com>
 <20260506152346.166056-3-18255117159@163.com>
 <TY3PR01MB11346620B7637A16120FDED26863F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <TY3PR01MB11346620B7637A16120FDED26863F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wBnO1xyavtpJhIDDw--.14523S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGw4Utw1DJr4UAr15trW8WFg_yoW5tF1xpa
	ykGFWfGF1xXrWY93WkZ3W5XryYqas8C347Jws3Ka4xWr12kr43JF1IgF1fXF9xKrZFvr17
	AF1DtF9rCr4ayFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UN18QUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwxMQs2n7anOSxwAA3t
X-Rspamd-Queue-Id: 3A4A74DE214
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32163-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[163.com];
	FREEMAIL_TO(0.00)[bp.renesas.com,google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,cadence.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]



On 5/6/26 23:31, Biju Das wrote:
> 
> 
>> -----Original Message-----
>> From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org> On Behalf Of Hans Zhang
>> Sent: 06 May 2026 16:24
>> Subject: [PATCH v2 2/8] PCI: cadence: LGA: Add max_link_speed field and 100 ms delay after link
>> training
>>
>> The Cadence LGA (Legacy Architecture IP) PCIe host controller currently lacks the mandatory 100 ms
>> delay after link training completes for speeds
>>> 5.0 GT/s, as required by PCIe r6.0 sec 6.6.1.
>>
>> Add a 'max_link_speed' field to struct cdns_pcie to record the maximum supported link speed (or the
>> currently configured speed). In the common host layer function cdns_pcie_host_start_link(), after the
>> link has been successfully established, call pcie_wait_after_link_train() to insert the required delay
>> if max_link_speed > 2.
>>
>> Glue drivers must set max_link_speed appropriately (e.g., from the device tree property "max-link-
>> speed") to enable the delay.
>>
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> ---
>>   drivers/pci/controller/cadence/pcie-cadence-host-common.c | 4 ++++
>>   drivers/pci/controller/cadence/pcie-cadence.h             | 2 ++
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>> b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
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
>> diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-
>> cadence.h
>> index 574e9cf4d003..e222b095d2b6 100644
>> --- a/drivers/pci/controller/cadence/pcie-cadence.h
>> +++ b/drivers/pci/controller/cadence/pcie-cadence.h
>> @@ -86,6 +86,7 @@ struct cdns_plat_pcie_of_data {
>>    * @ops: Platform-specific ops to control various inputs from Cadence PCIe
>>    *       wrapper
>>    * @cdns_pcie_reg_offsets: Register bank offsets for different SoC
>> + * @max_link_speed: maximum supported link speed
> 
> Maximum to make consistent with other comments?

Hi Biju,

The reference I used is:

drivers/pci/controller/pcie-rzg3s-host.c
/**
  ......
  * @max_link_speed: maximum supported link speed
  */
struct rzg3s_pcie_host {
......


> 
> 
>>    */
>>   struct cdns_pcie {
>>   	void __iomem		             *reg_base;
>> @@ -98,6 +99,7 @@ struct cdns_pcie {
>>   	struct device_link	             **link;
>>   	const  struct cdns_pcie_ops          *ops;
>>   	const  struct cdns_plat_pcie_of_data *cdns_pcie_reg_offsets;
>> +	int				     max_link_speed;
> 
> unsigned int as speed cannot be negative??

The following file referred to:

drivers/pci/controller/dwc/pcie-designware.h
struct dw_pcie {
     ......
     int			max_link_speed;
     ......
};


Best regards,
Hans
> 
> Cheers,
> Biju
> 
>>   };
>>
>>   /**
>> --
>> 2.34.1
>>


