Return-Path: <linux-renesas-soc+bounces-32536-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OnSMWSwA2pG9AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32536-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 00:57:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C742852B265
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 00:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D82E3300517F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 22:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E003A3835;
	Tue, 12 May 2026 22:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jb2xToWZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16C23672AE;
	Tue, 12 May 2026 22:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778626654; cv=none; b=X5PckSw+rzQpGT3rmmXU+Sa47z5N2irfJseR8z1/FldeBfCOoKNpBQTKOnScA4cdZsdy0b0JjoQMleW7+b1QRowxfRU5ykPm3UXepAMPpVwhdnKp8eK807Zlea9qODX2LIN3UJ/xjrJz60mw/YJU/zWUpX2KQPslkifJlduDEfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778626654; c=relaxed/simple;
	bh=vF90aZA0vY53mkWKi+xJjkidOGf0G3SJm8xqLVoKAlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sfbpHr4oDKtpgISi1yKQIoQ0hgWQUZhU+g/MBsVD7Lz8DXO6ZcQ72SO0ecsu895z7cGgZiEpmEGArCgNNqQrZhdOtX6xX3h+3vs1Tn+yexPUWrT28B4qJeZMtp4c5bm7ieRKT6XF7rNiR25MFFq3NhNFeXy6t4ahQnimHFZHKwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jb2xToWZ; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gFX6V48tFz9vFX;
	Wed, 13 May 2026 00:57:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778626642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6A39NEfMGoJu1efEcjifwhZtnEoznLleXiDZd9rT9tM=;
	b=jb2xToWZC1jjxcYrjerl5uxVp6tBXxiQZH6T5BUh5HioyyCalaCA9iVJnU/G3zPm8HO042
	8NyXfg7YTB7muf5BsFBFi9tSeEYHy7og04U9khcSNJRCSaGdiueLH/ZkMGIZEmxsXJKSI8
	JhCd5ytJRPOf+wl6Axnqmz7FjyQxYb1Ac6cfbqzMXZA1YP5MJg3lm2gPboDqI9UhzzEKu8
	eis+PP5TK5ctS5jGG7ZY+okLWlcUrIvt7WEynSa0p0VDcjDixEjHWm4uLyxtXlUrlPURvd
	bED7Kr8NT5HE9zh2ujdsb0cdAUZt5blHfiu0+0PvvOxGFfSZ5DhmKXfDHz8c3Q==
Message-ID: <e7078be5-4d95-4b85-9590-d1f0c76b653a@mailbox.org>
Date: Wed, 13 May 2026 00:57:18 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] PCI: rcar-gen4: Limit Max_Read_Request_Size and
 Max_Payload_Size to 256 Bytes
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-pci@vger.kernel.org, stable@vger.kernel.org,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Koichiro Den <den@valinux.co.jp>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260425233845.459175-1-marek.vasut+renesas@mailbox.org>
 <dicudl6knlptqnscyqkedp5zrs4vyosjggysnqsaupxi3g3o4x@rngp35usnurb>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <dicudl6knlptqnscyqkedp5zrs4vyosjggysnqsaupxi3g3o4x@rngp35usnurb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: bqrpnio7jdisor97trrorowu9ro4rbqo
X-MBO-RS-ID: 0d34b8d0c64c5d575d4
X-Rspamd-Queue-Id: C742852B265
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32536-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,google.com,glider.be,valinux.co.jp,gmail.com,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/11/26 4:34 PM, Manivannan Sadhasivam wrote:

Hello Manivannan,

>>   drivers/pci/controller/dwc/pcie-rcar-gen4.c | 56 +++++++++++++++++++++
>>   1 file changed, 56 insertions(+)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
>> index 8b03c42f8c84c..82f0a074a71da 100644
>> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
>> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
>> @@ -576,6 +576,7 @@ static int r8a779f0_pcie_ltssm_control(struct rcar_gen4_pcie *rcar, bool enable)
>>   static void rcar_gen4_pcie_additional_common_init(struct rcar_gen4_pcie *rcar)
>>   {
>>   	struct dw_pcie *dw = &rcar->dw;
>> +	u16 offset = dw_pcie_find_capability(dw, PCI_CAP_ID_EXP);
>>   	u32 val;
>>   
>>   	val = dw_pcie_readl_dbi(dw, PCIE_PORT_LANE_SKEW);
>> @@ -584,11 +585,66 @@ static void rcar_gen4_pcie_additional_common_init(struct rcar_gen4_pcie *rcar)
>>   		val |= BIT(6);
>>   	dw_pcie_writel_dbi(dw, PCIE_PORT_LANE_SKEW, val);
>>   
>> +	val = dw_pcie_readl_dbi(dw, offset + PCI_EXP_DEVCTL);
>> +	val &= ~(PCI_EXP_DEVCTL_PAYLOAD | PCI_EXP_DEVCTL_READRQ);
>> +	val |= PCI_EXP_DEVCTL_PAYLOAD_256B | PCI_EXP_DEVCTL_READRQ_256B;
>> +	dw_pcie_writel_dbi(dw, offset + PCI_EXP_DEVCTL, val);
> 
> Instead of limiting the MRRS/MPS values for all devices through quirks, why
> can't you just limit the Root Port's MPSS value in PCI_EXP_DEVCAP?
The root port MPSS is already 3'b001 = 256 Bytes and is read-only for 
EXPCAP1F0 (PCI_EXP_DEVCAP) .

The controller is limited to MPS 256 Bytes according to V4H rev.1.30 
documentation. There is no explicitly spelled out MRRS limitation in the 
documentation to my knowledge, except for the DMA hint, but please read on.

The root port EXPCAP2F0 MPS is 128 Bytes and MRRS is 512 Bytes .

I now noticed that in V4H rev.1.30 documentation, the EXPCAP2F0 MRRS 
field is default set to 3'b010 = 512 Bytes, but that value is "Reserved" 
and only two non-reserved values are 3'b000 and 3'b001 which are MRRS 
128 Bytes and 256 Bytes respectively. That means MRRS has to be trimmed 
to maximum 256 Bytes in software to avoid "Reserved" settings. I will 
also ask the hardware and documentation team about this.

As a result, I adjust EXPCAP2F0:

- I raise MPS from 128 Bytes to 256 Bytes
- I reduce MRRS from 512 Bytes to 256 Bytes (this is important to 
prevent data corruption)

However, the downstream devices (in my case, PCIe SSD) can still be 
configured with MRRS > 256 (in my case, Crucial P5 Plus 1 TiB has 
MRRS=512 and MPS=128), which is where the quirk kicks in and 
reconfigures MRRS for those downstream devices.

The pci_configure_mps() does propagate MPS from root port EXPCAP2F0 to 
downstream devices, but there is no equivalent for MRRS as far as I can 
find ?

Thank you for your help!

