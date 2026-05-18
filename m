Return-Path: <linux-renesas-soc+bounces-32745-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMzFOBCCCmqv2AQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32745-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 05:05:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 230155654A4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 05:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 30782300D607
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 03:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB2637C0FD;
	Mon, 18 May 2026 03:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Wht434Ze"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A79413FEE;
	Mon, 18 May 2026 03:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779073547; cv=none; b=AylD62qFlH2EsAsPcjPuAV5rsWy9nmadb3WawBCqrxFRH10Anq3kDZmhDgasdZIW4U5QlK3WRLl0onmoumY4WGw5GuMFC9WN44UUp8EphpBEGfGeGDXUgNmdv9cgC0QFIvX5bIYZ2i/xtEOLyB7bDtgva+cJ1WB0X3pFUk/CAho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779073547; c=relaxed/simple;
	bh=ZSAaMshJZcO8ldY/Au323E855t7+c+67RKwyORxnmBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y843EbTpeLEOmYCya7tnW8v16KuSMQqoJgey61yGDheNMdXPKC+5uqXyaQB8DxwzequhRiywXYsyeXQbLewvyA1/68xzlOmD8cdehdOqLOHiFUnpOO9ggYnQNz4NdN0xcmpwULQqotg9Bp3Ll9v/p9sKCaBVOoR0aMU+5KDlgxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Wht434Ze; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=x0L1YXQpg5cMFdXw90MD+Ygtm1m+OV8hivBqgSqRHhk=;
	b=Wht434ZeCOh98R6ckfracEtlw0fbAaMCxSS0T2qo0yYicqRfE2LDUjRArZh6AV
	J0OCs5vPig7TxU4sDRJiPZlot4ws03HPwV5JvhaiFSiC6x/fp7BUepwRGFTYOYqo
	vImc2ieiHdUWnzkpwnc4U8LXTIj4iS5EggmS1fbbMfC+Q=
Received: from [192.168.50.71] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgAXv_OUgQpqJm4lDw--.152S2;
	Mon, 18 May 2026 11:03:51 +0800 (CST)
Message-ID: <e7143078-0c0a-4c15-a192-081f2a5a5ff8@163.com>
Date: Mon, 18 May 2026 11:03:48 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] PCI: cadence: Add post-link delay for LGA and
 j721e glue driver
To: Manikandan Karunakaran Pillai <mpillai@cadence.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
 "mani@kernel.org" <mani@kernel.org>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "ryder.lee@mediatek.com" <ryder.lee@mediatek.com>,
 "claudiu.beznea.uj@bp.renesas.com" <claudiu.beznea.uj@bp.renesas.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "s-vadapalli@ti.com" <s-vadapalli@ti.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "claudiu.beznea@tuxon.dev" <claudiu.beznea@tuxon.dev>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260518004246.1384532-1-18255117159@163.com>
 <20260518004246.1384532-3-18255117159@163.com>
 <DM6PR07MB67169B65E6B826E24A8E64AEA2032@DM6PR07MB6716.namprd07.prod.outlook.com>
 <c909a890-65cb-444f-9b4f-9482d2f71c6d@163.com>
 <DM6PR07MB6716CC48016E6D44EC5FCAB3A2032@DM6PR07MB6716.namprd07.prod.outlook.com>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <DM6PR07MB6716CC48016E6D44EC5FCAB3A2032@DM6PR07MB6716.namprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:PigvCgAXv_OUgQpqJm4lDw--.152S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxKF4kXrW7XFWxAr4DuFWxJFb_yoWxGw4DpF
	WUGFWxC3WxXrW5Z3Wvv3W5XF1aqF98C3yDXws29w17XrnFyFnxJF42qF1ruF9Igr4DCr17
	ZF1UtF9rWr1ayFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U4xRDUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6xijR2oKgZg1tgAA3t
X-Rspamd-Queue-Id: 230155654A4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32745-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[163.com];
	FREEMAIL_TO(0.00)[cadence.com,google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	REDIRECTOR_URL(0.00)[urldefense.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,urldefense.com:url]
X-Rspamd-Action: no action



On 5/18/26 10:38, Manikandan Karunakaran Pillai wrote:
> 
> 
>> EXTERNAL MAIL
>>
>>
>>
>>
>> On 5/18/26 10:12, Manikandan Karunakaran Pillai wrote:
>>>
>>>
>>>> EXTERNAL MAIL
>>>>
>>>>
>>>> The Cadence LGA (Legacy Architecture IP) PCIe host controller currently
>>>> lacks the mandatory 100 ms delay after link training completes for speeds
>>>>> 5.0 GT/s, as required by PCIe r6.0 sec 6.6.1.
>>>>
>>>> Add a 'max_link_speed' field to struct cdns_pcie. In the common host
>>>> layer function cdns_pcie_host_start_link(), after the link has been
>>>> successfully established, call pci_host_common_link_train_delay() to
>>>> insert the required delay.
>>>>
>>>> For the j721e glue driver, set cdns_pcie.max_link_speed from the existing
>>>> link speed logic. For other LGA-based glue drivers (sky1, sg2042), the
>>>> common LGA host setup (pcie-cadence-host.c) provides a fallback reading
>>>> of the device tree property "max-link-speed" when available. This ensures
>>>> that the delay is not missed on those platforms once they enable the
>>>> property.
>>>>
>>>> Signed-off-by: Hans Zhang <18255117159@163.com>
>>>> ---
>>>> drivers/pci/controller/cadence/pci-j721e.c                | 1 +
>>>> drivers/pci/controller/cadence/pcie-cadence-host-common.c | 4 ++++
>>>> drivers/pci/controller/cadence/pcie-cadence-host.c        | 4 ++++
>>>> drivers/pci/controller/cadence/pcie-cadence.h             | 2 ++
>>>> 4 files changed, 11 insertions(+)
>>>>
>>>> diff --git a/drivers/pci/controller/cadence/pci-j721e.c
>>>> b/drivers/pci/controller/cadence/pci-j721e.c
>>>> index bfdfe98d5aba..ae916e7b1927 100644
>>>> --- a/drivers/pci/controller/cadence/pci-j721e.c
>>>> +++ b/drivers/pci/controller/cadence/pci-j721e.c
>>>> @@ -206,6 +206,7 @@ static int j721e_pcie_set_link_speed(struct
>> j721e_pcie
>>>> *pcie,
>>>> 	    (pcie_get_link_speed(link_speed) == PCI_SPEED_UNKNOWN))
>>>> 		link_speed = 2;
>>>>
>>>> +	pcie->cdns_pcie->max_link_speed = link_speed;
>>>> 	val = link_speed - 1;
>>>> 	ret = regmap_update_bits(syscon, offset, GENERATION_SEL_MASK,
>>>> val);
>>>> 	if (ret)
>>>> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>>>> b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>>>> index 2b0211870f02..18e4b6c760b5 100644
>>>> --- a/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>>>> +++ b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>>>> @@ -14,6 +14,7 @@
>>>>
>>>> #include "pcie-cadence.h"
>>>> #include "pcie-cadence-host-common.h"
>>>> +#include "../pci-host-common.h"
>>>>
>>>> #define LINK_RETRAIN_TIMEOUT HZ
>>>>
>>>> @@ -115,6 +116,9 @@ int cdns_pcie_host_start_link(struct cdns_pcie_rc
>> *rc,
>>>> 	if (!ret && rc->quirk_retrain_flag)
>>>> 		ret = cdns_pcie_retrain(pcie, pcie_link_up);
>>>>
>>>> +	if (!ret)
>>>> +		pci_host_common_link_train_delay(pcie->max_link_speed);
>>>> +
>>>> 	return ret;
>>>> }
>>>> EXPORT_SYMBOL_GPL(cdns_pcie_host_start_link);
>>>> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c
>>>> b/drivers/pci/controller/cadence/pcie-cadence-host.c
>>>> index 0bc9e6e90e0e..058e4e619654 100644
>>>> --- a/drivers/pci/controller/cadence/pcie-cadence-host.c
>>>> +++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
>>>> @@ -13,6 +13,7 @@
>>>>
>>>> #include "pcie-cadence.h"
>>>> #include "pcie-cadence-host-common.h"
>>>> +#include "../../pci.h"
>>>>
>>>> static u8 bar_aperture_mask[] = {
>>>> 	[RP_BAR0] = 0x1F,
>>>> @@ -397,6 +398,9 @@ int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
>>>> 	rc->device_id = 0xffff;
>>>> 	of_property_read_u32(np, "device-id", &rc->device_id);
>>>>
>>>> +	if (pcie->max_link_speed < 1)
>>>> +		pcie->max_link_speed = of_pci_get_max_link_speed(np);
>>>> +
>>> Why is the conditional if required here as during cdns_pcie_host_setup(), the
>> value of
>>> max_link_speed is expected to be '0', unless specifically initialized by the
>> platform code separately.
>>>
>>> What happens if the max_link_speed is not defined in the corresponding dts
>> ? Would not the -EINVAL returned from the function create issues ?
>>
>> Hi Manikandan,
>>
>> Please see:
>>
>> https://urldefense.com/v3/__https://github.com/torvalds/linux/blob/v7.1-
>> rc4/drivers/pci/controller/dwc/pcie-
>> designware.c*L191__;Iw!!EHscmS1ygiU1lA!EDHVakD3QN0gGza3V1__qzHgDG9
>> RZlq7LzC5AFsYLV2i5FcoveNFsjWORRgRdHCAmOI-LizY5cJvGIWBOFJG$
>>
>>
>> Best regards,
>> Hans
>>
> That is how Designware has implemented it but that does not answer my query. Becos both these implementations do
> not take care of the error returned, and it could well be the case for many of the current implementations.

Hi Manikandan,

If "max-link-speed" is not defined in the DT, then:

of_pci_get_max_link_speed
   of_property_read_u32
     of_property_read_u32_array
       of_property_read_variable_u32_array
         return -EINVAL;


For patch 0001, no actions will be executed. I wonder if this answers 
your question?

Best regards,
Hans


> 
>>>
>>>> 	pcie->reg_base = devm_platform_ioremap_resource_byname(pdev,
>>>> "reg");
>>>> 	if (IS_ERR(pcie->reg_base)) {
>>>> 		dev_err(dev, "missing \"reg\"\n");
>>>> diff --git a/drivers/pci/controller/cadence/pcie-cadence.h
>>>> b/drivers/pci/controller/cadence/pcie-cadence.h
>>>> index 574e9cf4d003..042a4c49bb9a 100644
>>>> --- a/drivers/pci/controller/cadence/pcie-cadence.h
>>>> +++ b/drivers/pci/controller/cadence/pcie-cadence.h
>>>> @@ -86,6 +86,7 @@ struct cdns_plat_pcie_of_data {
>>>>    * @ops: Platform-specific ops to control various inputs from Cadence PCIe
>>>>    *       wrapper
>>>>    * @cdns_pcie_reg_offsets: Register bank offsets for different SoC
>>>> + * @max_link_speed: Maximum supported link speed
>>>>    */
>>>> struct cdns_pcie {
>>>> 	void __iomem		             *reg_base;
>>>> @@ -98,6 +99,7 @@ struct cdns_pcie {
>>>> 	struct device_link	             **link;
>>>> 	const  struct cdns_pcie_ops          *ops;
>>>> 	const  struct cdns_plat_pcie_of_data *cdns_pcie_reg_offsets;
>>>> +	int				     max_link_speed;
>>>> };
>>>>
>>>> /**
>>>> --
>>>> 2.43.0
> 


