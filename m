Return-Path: <linux-renesas-soc+bounces-32743-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMwfEz55Cmqe1wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32743-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 04:28:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB3C56511D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 04:28:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1BD0530082BC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 02:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02884376465;
	Mon, 18 May 2026 02:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RmLFt8cf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87148376473;
	Mon, 18 May 2026 02:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779071289; cv=none; b=Zf42e7sKsAYiOg3OFrQ15qDf2UAQGz5tvitZpp7MgBrMOXlSJEynYOYIZ0jR46OnYOc7ETI3baJMs8toQGmIkns+9zHuzr2klcShE45HjeoeivWFsqJF8owdMQ2CgBLBvePbqiWHmFT08VA6+Yh3jzkRtARe1caUliTAWDmuioo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779071289; c=relaxed/simple;
	bh=fxhyvREpEendYiAmr/+gqwEF8rYjHgmyjVUx6ftyuVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b803GaY9QzN5HIpy2zumvVVuZcEWkJ8Edkqa1X0H6GxR20+GB4UQLSNr1FgVHIvxWWTymHHP7+UnZS0h5yyr5jHSrMjw35XtuZqgXf6pNAs03F90X9FI9YvPRrC9ePy3Sp+iLbEC9nENoPkcPehCCDvgeD5K2OWJIFx45QR/z1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RmLFt8cf; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=bzMPsyU3cTQF48tb6lC6yXy72kh3ESylZnKuLeinuiQ=;
	b=RmLFt8cfKGwpfgTZYDiTvbYUOu6ZQaY0k0+ZZJ0RwUI/+VM8Nndkswo/vJNqq0
	4mmIe2dslN1Xiyg/u8q2n/rnwoz86j3ypEyKmz9YXPBw+DHIHr76SerhZPBT33aS
	+uZhuPfSt3rYtf/rb4IIivahFUAOiDo9ed4rxDhTMqz4A=
Received: from [192.168.50.71] (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD35jX_eApqje7VBw--.34067S2;
	Mon, 18 May 2026 10:27:12 +0800 (CST)
Message-ID: <f7ca2fde-9f20-4a12-ae75-58ec3fda124a@163.com>
Date: Mon, 18 May 2026 10:27:11 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] PCI: cadence: HPA: Add post-link delay
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
 <20260518004246.1384532-4-18255117159@163.com>
 <DM6PR07MB671635EE7FF28BD2FA5DDE36A2032@DM6PR07MB6716.namprd07.prod.outlook.com>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <DM6PR07MB671635EE7FF28BD2FA5DDE36A2032@DM6PR07MB6716.namprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wD35jX_eApqje7VBw--.34067S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFyxXr4fCry7GFWDCF1fXrb_yoW5XFyxpa
	4DWFWfGF18Xr45uan7Z3W5XFyavFn8A347t39a93W8XrnrCrsrtF9FgF1fuasxKFWqyr1x
	JF17tFsrWF1avF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2ZXOUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7AB7H2oKeQDB1gAA3G
X-Rspamd-Queue-Id: BEB3C56511D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32743-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[163.com];
	FREEMAIL_TO(0.00)[cadence.com,google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action



On 5/18/26 10:16, Manikandan Karunakaran Pillai wrote:
> 
> 
>> EXTERNAL MAIL
>>
>>
>> The Cadence HPA (High Performance Architecture IP) specific link setup
>> function cdns_pcie_hpa_host_link_setup() waits for the link to come up
>> but does not implement the required 100 ms delay after link training
>> completes for speeds > 5.0 GT/s (PCIe r6.0 sec 6.6.1).
>>
>> Add a call to pci_host_common_link_train_delay() immediately after the
>> link is confirmed to be up, using the max_link_speed field. Also, in the
>> HPA host setup function, read the device tree property "max-link-speed"
>> to initialize max_link_speed if not already set by a glue driver.
>>
>> This ensures compliance for HPA-based platforms.
>>
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> ---
>> drivers/pci/controller/cadence/pcie-cadence-host-hpa.c | 8 ++++++++
>> 1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host-hpa.c
>> b/drivers/pci/controller/cadence/pcie-cadence-host-hpa.c
>> index 0f540bed58e8..8ef58ed01daa 100644
>> --- a/drivers/pci/controller/cadence/pcie-cadence-host-hpa.c
>> +++ b/drivers/pci/controller/cadence/pcie-cadence-host-hpa.c
>> @@ -15,6 +15,8 @@
>>
>> #include "pcie-cadence.h"
>> #include "pcie-cadence-host-common.h"
>> +#include "../pci-host-common.h"
>> +#include "../../pci.h"
>>
>> static u8 bar_aperture_mask[] = {
>> 	[RP_BAR0] = 0x3F,
>> @@ -304,6 +306,8 @@ int cdns_pcie_hpa_host_link_setup(struct cdns_pcie_rc
>> *rc)
>> 	ret = cdns_pcie_host_wait_for_link(pcie, cdns_pcie_hpa_link_up);
>> 	if (ret)
>> 		dev_dbg(dev, "PCIe link never came up\n");
>> +	else
>> +		pci_host_common_link_train_delay(pcie->max_link_speed);
>>
>> 	return ret;
>> }
>> @@ -313,6 +317,7 @@ int cdns_pcie_hpa_host_setup(struct cdns_pcie_rc *rc)
>> {
>> 	struct device *dev = rc->pcie.dev;
>> 	struct platform_device *pdev = to_platform_device(dev);
>> +	struct device_node *np = dev->of_node;
>> 	struct pci_host_bridge *bridge;
>> 	enum   cdns_pcie_rp_bar bar;
>> 	struct cdns_pcie *pcie;
>> @@ -343,6 +348,9 @@ int cdns_pcie_hpa_host_setup(struct cdns_pcie_rc *rc)
>> 		rc->cfg_res = res;
>> 	}
>>
>> +	if (pcie->max_link_speed < 1)
>> +		pcie->max_link_speed = of_pci_get_max_link_speed(np);
>> +
> 
> Similar queries as for Cadence LGA controllers. Why do you need the max_link_speed check for "<1" and
> What would be the consequences of not defining the max-link-speed in dts ?

Hi Manikandan,

It has been replied in patch 0002.

Best regards,
Hans

> 
>> 	/* Put EROM Bar aperture to 0 */
>> 	cdns_pcie_hpa_writel(pcie, REG_BANK_IP_CFG_CTRL_REG,
>> CDNS_PCIE_EROM, 0x0);
>>
>> --
>> 2.43.0


