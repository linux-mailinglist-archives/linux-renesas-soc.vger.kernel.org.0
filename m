Return-Path: <linux-renesas-soc+bounces-32461-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MVMMZn8AmpOzQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32461-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 12:10:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCDC51E4D5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 12:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6441E301D322
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 10:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDEA34BCADE;
	Tue, 12 May 2026 10:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cJYzaqLU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8FA3A6F08;
	Tue, 12 May 2026 10:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580429; cv=none; b=q6PMbMtJVqgy7hLjMc0+B86Vc8W4PriLLPoy4yu0QopHm1/EEAfIKlGduU9dU7yjI4Kkh7itJp55+eo993tdWBfOLKYTYkHre7WYK069n4eah9dTydLBAd5+0azraPD3uruDO7QH6lffmQJWQ0NAOYRMqFG1VIxpQfHC5+ZqIls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580429; c=relaxed/simple;
	bh=AD0app1w4BFdSkcdIy/XC4ScpmQ9BJbGP3dbb6abghY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g8ouLgPv0SOLaHznvHEcSCPOHd8wjY/pGRgfwsUY0xzqvtb6ha2mZsHzM8EUzf+WwhRxbR3UHVD6ilTLiTP/J3s+A0+IyWeKYNgha14gX29DVVHfOVxHc2DBJbC5GqKGuZPnLVbvOUAB3475QFyXZ6xHReOsUHh0S4QTUGbOoV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cJYzaqLU; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=kzdyIVkDD4QspuDbsjStOhs6nIN3cMjYoJI+LAqsHhM=;
	b=cJYzaqLU7FvnxIe/dHqjQJeaKxTf8ggNXlJTQgH3HEwIGLY7vFGCYrEX/oQJnb
	63fAXELNRTnwJ7/qRDPvHd8k+TZblVxS/lx5kQSogukkwyNY0sFVeO8xkDZsXq31
	JTib7FThncgOzzXPag82g0b5MvcqThZnlyli6+FlV8sfs=
Received: from [192.168.50.71] (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wCnLwyM+wJqRYgUBA--.13809S2;
	Tue, 12 May 2026 18:06:06 +0800 (CST)
Message-ID: <bc68a395-0a66-481a-b6ae-cb10bfb68cb9@163.com>
Date: Tue, 12 May 2026 18:06:04 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] PCI: Add pci_host_common_link_train_delay() helper
To: Claudiu Beznea <claudiu.beznea@kernel.org>, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com,
 pali@kernel.org, ryder.lee@mediatek.com, claudiu.beznea.uj@bp.renesas.com,
 mpillai@cadence.com
Cc: robh@kernel.org, s-vadapalli@ti.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260511055923.37117-1-18255117159@163.com>
 <20260511055923.37117-2-18255117159@163.com>
 <e092cd5d-6a46-4440-9085-95c929e8fb83@kernel.org>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <e092cd5d-6a46-4440-9085-95c929e8fb83@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCnLwyM+wJqRYgUBA--.13809S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF13JFy3JFy5XF1xur48WFg_yoWrGrykpa
	yxJF1akF4kJFW3ua17Za4UuFyYq3Z5Jayjkr9xG3s3ZrnxWrnakryjgwsYqF97Jrs5ZF12
	yF1Ygwn7Cr47taDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U4UDXUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCww494GoC+4645QAA3Q
X-Rspamd-Queue-Id: 7CCDC51E4D5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,google.com,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com,cadence.com];
	FREEMAIL_FROM(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-32461-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[163.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action



On 5/12/26 15:05, Claudiu Beznea wrote:
> Hi, Hans,
> 
> On 5/11/26 08:59, Hans Zhang wrote:
>> PCIe r6.0, sec 6.6.1 (Conventional Reset) requires that for a Downstream
>> Port supporting Link speeds greater than 5.0 GT/s, software must wait a
>> minimum of 100 ms after Link training completes before sending any
>> Configuration Request.
>>
>> Introduce a static inline helper pci_host_common_link_train_delay() that
>> checks the given max_link_speed (2 = 5.0 GT/s, 3 = 8.0 GT/s, etc.) and
>> calls msleep(100) only when the speed is greater than 5.0 GT/s.
>>
>> This allows multiple host controller drivers to share the same mandatory
>> delay without duplicating the logic.
>>
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> ---
>>   drivers/pci/controller/pci-host-common.h | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/ 
>> controller/pci-host-common.h
>> index b5075d4bd7eb..d709f7e3e11a 100644
>> --- a/drivers/pci/controller/pci-host-common.h
>> +++ b/drivers/pci/controller/pci-host-common.h
>> @@ -10,6 +10,9 @@
>>   #ifndef _PCI_HOST_COMMON_H
>>   #define _PCI_HOST_COMMON_H
>> +#include <linux/delay.h>
>> +#include "../pci.h"
>> +
>>   struct pci_ecam_ops;
>>   int pci_host_common_probe(struct platform_device *pdev);
>> @@ -20,4 +23,18 @@ void pci_host_common_remove(struct platform_device 
>> *pdev);
>>   struct pci_config_window *pci_host_common_ecam_create(struct device 
>> *dev,
>>       struct pci_host_bridge *bridge, const struct pci_ecam_ops *ops);
>> +
>> +/**
>> + * pci_host_common_link_train_delay - Wait 100 ms if link speed > 5 GT/s
>> + * @max_link_speed: the maximum link speed (2 = 5.0 GT/s, 3 = 8.0 GT/ 
>> s, ...)
>> + *
>> + * Must be called after Link training completes and before the first
>> + * Configuration Request is sent.
>> + */
>> +static inline void pci_host_common_link_train_delay(int max_link_speed)
>> +{
>> +    if (max_link_speed > 2)
>> +        msleep(PCIE_RESET_CONFIG_WAIT_MS);
> 
> In case of RZ/G3S driver the max_link_speed is populated based on "max- 
> link-speed" DT property (by calling of_pci_get_max_link_speed()). My 
> understanding from [1] (and the review of the initial RZ/G3S driver 
> support) is that this is not a mandatory property (note also the "Host 
> drivers *could* add this" from [1]). At least for the RZ/G3S driver, in 
> case the "max-link-speed" DT property is not present in DT but the 
> controller supports more than 5GT/s (that is possible as the driver 
> supports more controller variants), the max_link_speed argument will be 
> negative. In that case the msleep() will not be called. This looks like 
> an opposite of what the patch set is trying to achieve.

Hi Claudiu,

The situation you mentioned also exists in the dwc common driver. My 
understanding is that we are writing this driver at the normal rate 
which is greater than GEN2. For some exceptions, or when the support is 
greater than GEN2 but the actual operation is less than or equal to 
GEN2, this situation might be unavoidable. Furthermore, for RZ/G3S, the 
"max-link-speed" attribute can be added to the DT.


> 
> Also, if I'm not wrong, there is also the possibility of having the max- 
> link-speed > 2 but the downstream port to not support more than 5GT/s. 
> In that case the mspeep() would also be executed (but I think that 
> wouldn't be really an issue).


Before this patch, the RZ/G3S driver would always perform a msleep(100) 
regardless of whether it was greater than GEN2 or less than or equal to 
GEN2.

Best regards,
Hans

> 
> Thank you,
> Claudiu
> 
> [1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/ 
> schemas/pci/pci-bus-common.yaml#L117
> 
> Thank you,
> Claudiu


