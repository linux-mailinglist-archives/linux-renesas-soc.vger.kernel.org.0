Return-Path: <linux-renesas-soc+bounces-32310-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LxRNEdg/2m35wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32310-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 09 May 2026 18:26:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F9B500755
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 09 May 2026 18:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B614D3010C13
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 May 2026 16:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80BE32F1FD0;
	Sat,  9 May 2026 16:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="QNwnNxpr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34F928642B;
	Sat,  9 May 2026 16:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778344001; cv=none; b=ideYrtDSUubg6mjag4GymCx8fu5HMySXSvwnvz7St/mfdn0ZF2PletfecpL5mXM+lVuQVZW01c5chPpwLWbHBYM7dVc/couKPwGahdYEbUi4jxTMNxOjHCvj0ycLQiephCbE/NkPnDX5oCYCsvMHW+n58FN9CnlMVuWaZzqlTLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778344001; c=relaxed/simple;
	bh=aBZF33Pr9/96AEPUQMpQeHadYjHExm9L2z4OKt7kbeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X07UkOEljV7mvn4m5Ltk9g/spswq9XOHZEbeZTTgPc2jh2sR6zquWujh5jkKOBhEYjnXiT4+yjw2n6XUo7A9+tbfN8Ctq24OgCaubwYs3AEYJQdLabLk/ibBcP6v2f3h5BcoPrdSYD2EBGV61DGHaSqZZahXLSa/ew65p0I0bjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=QNwnNxpr; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=Yolk7fPVSsosJ3+V1HG/g+3kb5mEYUGoiAatqyto7So=;
	b=QNwnNxprHHJUW4PbRByVgKv8H/imUdQGoJjvkX/EUA+Eo4EOgoN3fXXG/YFjUD
	RCZw7p7hHvAFaD7xgsZA0twZgcRMC0emc+V0FzVJidZqk4Clo93Xmta7ExoLcWQ1
	mMZ1Fx0EyXnaAa2I8HKBo3TN9DpBamsrne72PUdUBxsnk=
Received: from [192.168.50.71] (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wBnQtTpX_9pIRSmAQ--.47405S2;
	Sun, 10 May 2026 00:25:14 +0800 (CST)
Message-ID: <4f063568-0f5c-42ad-acc5-2d6ca5b546ad@163.com>
Date: Sun, 10 May 2026 00:25:13 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] PCI: rzg3s-host: Add 100 ms delay after link
 training
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com,
 pali@kernel.org, ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
 claudiu.beznea.uj@bp.renesas.com, mpillai@cadence.com
Cc: robh@kernel.org, s-vadapalli@ti.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260506152346.166056-1-18255117159@163.com>
 <20260506152346.166056-9-18255117159@163.com>
 <bd0f4589-b586-4f01-b12c-6ae5c19ec21b@tuxon.dev>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <bd0f4589-b586-4f01-b12c-6ae5c19ec21b@tuxon.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBnQtTpX_9pIRSmAQ--.47405S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFWxAF13Cr4xKF48ArW8Zwb_yoW8Wry3pF
	ZYv3WjyF1UXr4Y9a17X3Z8uFyYq3Z8A34UJ3s3Wa47ZwnxuFZrWF98uF4fJ3Z2grZ7XrW3
	t3W5t3WUGa15AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UEPfQUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7ApsEGn-X+qp5wAA33
X-Rspamd-Queue-Id: 10F9B500755
X-Rspamd-Server: lfdr
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
	FREEMAIL_TO(0.00)[tuxon.dev,google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com,cadence.com];
	FREEMAIL_FROM(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-32310-lists,linux-renesas-soc=lfdr.de];
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



On 5/7/26 00:52, Claudiu Beznea wrote:
> Hi, Hans,
> 
> On 5/6/26 18:23, Hans Zhang wrote:
>> The Renesas RZ/G3S PCIe host driver currently does not enforce the
>> mandatory 100 ms delay after link training completes for speeds > 5.0 
>> GT/s,
>> required by PCIe r6.0 sec 6.6.1.
>>
>> The driver already has a 'max_link_speed' field (derived from the device
>> tree). Add a call to pcie_wait_after_link_train() in
>> rzg3s_pcie_host_init() after reading the link status, ensuring that the
>> delay is applied before any Configuration Request is sent downstream.
>>
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> ---
>>   drivers/pci/controller/pcie-rzg3s-host.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/ 
>> controller/pcie-rzg3s-host.c
>> index d86e7516dcc2..6ab59c5464cf 100644
>> --- a/drivers/pci/controller/pcie-rzg3s-host.c
>> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
>> @@ -1390,6 +1390,8 @@ static int rzg3s_pcie_host_init(struct 
>> rzg3s_pcie_host *host)
>>       val = readl_relaxed(host->axi + RZG3S_PCI_PCSTAT2);
>>       dev_info(host->dev, "PCIe link status [0x%x]\n", val);
>> +    pcie_wait_after_link_train(host->max_link_speed);
> 
> There is an msleep(PCIE_RESET_CONFIG_WAIT_MS) after 
> rzg3s_pcie_set_max_link_speed() call. Shouldn't that msleep() call be 
> replaced with your pcie_wait_after_link_train() ?

Hi Claudiu,

Sorry for the late reply. Thank you for pointing it out. It will be 
replaced.

Best regards,
Hans


> 
> Thank you,
> Claudiu


