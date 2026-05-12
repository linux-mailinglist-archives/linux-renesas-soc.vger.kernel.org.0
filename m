Return-Path: <linux-renesas-soc+bounces-32537-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id isJLDe2yA2rt9AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32537-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 01:08:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9758D52B302
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 01:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8FE2E3030999
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 23:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0763A383E;
	Tue, 12 May 2026 23:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="LeeHESL0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3773EDE65;
	Tue, 12 May 2026 23:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778627307; cv=none; b=lJanz2WNh2Zl3Hu+fqsQ+j7fnYfXu2erCjTA9PHHV/QZ6i6O6cEnOcEWngdTp7M4RvEoZTrKiwx4xoF7SlCMDp2lcJQtgpztuSUP43d8jrgM4VYehiJcF7E8ql/ZDcZGt1mTZRY5JYEUwD0wl094GHjSzuOGOoNeaNlUC7JoUiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778627307; c=relaxed/simple;
	bh=+CvUzwMoXENolBa+N0Pvry9Xw77B+aukPz7/yzHxU8A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZprhC6oUGvNdoh02HCXlXp9TgYvSC/yFQe9zpmorGPGRvmUEOhucFPuLTo1uzlGsMkCRuzZLVCrlBo4GHJOg89KPXhbRgJZHtPkeqq1qd/q8o4LzM9L6lx4brrQf1JUc93XVztB2+JvWGFXU6qFUxI2s3rlQV+lastvJhmfCUeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=LeeHESL0; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gFXM95w4bz9vhM;
	Wed, 13 May 2026 01:08:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778627301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ELY7KUdDrMOjVGQ1v67qIaL9CWAZzVesRkRPtVTR5JY=;
	b=LeeHESL0/cXw8HfPP/8ZWShX3SoCm27B6X/L6A2thn8Pnlt95Mkx+B2zDKN7ZURAMtktBF
	w8Bb0CglvmI9BwvpPsYaFR8x6Jv4Be+2FFCD0fJN/Z+PsF0UTL8Wu7jWEiuw9yi1wKw5Jv
	VoemvVVul/XNRfmhdk1zM6CznH25ixboDzsB+sHKTPgZYBhnb0wuO4eAuo7S8PZCdgf1NK
	hIcySoicLsGKCd3lvRAUyJnRgadoHw7G063Rivy5PwHbWbZ5tX2TExHE2seOYSD6p8E/an
	4erkPqyZD5+rgSHy2tapwaecwgK1xQbhALTk8w9BAF45bdU6FouZe0YyYIt3Bg==
Message-ID: <fe94b338-a143-4d5b-90fc-8096a15f598a@mailbox.org>
Date: Wed, 13 May 2026 01:08:18 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] PCI: rcar-gen4: Limit Max_Read_Request_Size and
 Max_Payload_Size to 256 Bytes
From: Marek Vasut <marek.vasut@mailbox.org>
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
 <e7078be5-4d95-4b85-9590-d1f0c76b653a@mailbox.org>
Content-Language: en-US
In-Reply-To: <e7078be5-4d95-4b85-9590-d1f0c76b653a@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: frhs3ioenk3oo7xrx6xuxap8uecehurd
X-MBO-RS-ID: d5866a8f63b4a11ff1c
X-Rspamd-Queue-Id: 9758D52B302
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32537-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/13/26 12:57 AM, Marek Vasut wrote:
> On 5/11/26 4:34 PM, Manivannan Sadhasivam wrote:
> 
> Hello Manivannan,
> 
>>>   drivers/pci/controller/dwc/pcie-rcar-gen4.c | 56 +++++++++++++++++++++
>>>   1 file changed, 56 insertions(+)
>>>
>>> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/ 
>>> pci/controller/dwc/pcie-rcar-gen4.c
>>> index 8b03c42f8c84c..82f0a074a71da 100644
>>> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
>>> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
>>> @@ -576,6 +576,7 @@ static int r8a779f0_pcie_ltssm_control(struct 
>>> rcar_gen4_pcie *rcar, bool enable)
>>>   static void rcar_gen4_pcie_additional_common_init(struct 
>>> rcar_gen4_pcie *rcar)
>>>   {
>>>       struct dw_pcie *dw = &rcar->dw;
>>> +    u16 offset = dw_pcie_find_capability(dw, PCI_CAP_ID_EXP);
>>>       u32 val;
>>>       val = dw_pcie_readl_dbi(dw, PCIE_PORT_LANE_SKEW);
>>> @@ -584,11 +585,66 @@ static void 
>>> rcar_gen4_pcie_additional_common_init(struct rcar_gen4_pcie *rcar)
>>>           val |= BIT(6);
>>>       dw_pcie_writel_dbi(dw, PCIE_PORT_LANE_SKEW, val);
>>> +    val = dw_pcie_readl_dbi(dw, offset + PCI_EXP_DEVCTL);
>>> +    val &= ~(PCI_EXP_DEVCTL_PAYLOAD | PCI_EXP_DEVCTL_READRQ);
>>> +    val |= PCI_EXP_DEVCTL_PAYLOAD_256B | PCI_EXP_DEVCTL_READRQ_256B;
>>> +    dw_pcie_writel_dbi(dw, offset + PCI_EXP_DEVCTL, val);
>>
>> Instead of limiting the MRRS/MPS values for all devices through 
>> quirks, why
>> can't you just limit the Root Port's MPSS value in PCI_EXP_DEVCAP?
> The root port MPSS is already 3'b001 = 256 Bytes and is read-only for 
> EXPCAP1F0 (PCI_EXP_DEVCAP) .

I have to correct myself here -- EXPCAP1F0 Type 0 MPSS is 256 Bytes and 
Read-Only, Type 1 MPSS is 128 Bytes and Read-Write . I will now try to 
increase the later, but the MRRS topic below remains.

> The controller is limited to MPS 256 Bytes according to V4H rev.1.30 
> documentation. There is no explicitly spelled out MRRS limitation in the 
> documentation to my knowledge, except for the DMA hint, but please read on.
> 
> The root port EXPCAP2F0 MPS is 128 Bytes and MRRS is 512 Bytes .
> 
> I now noticed that in V4H rev.1.30 documentation, the EXPCAP2F0 MRRS 
> field is default set to 3'b010 = 512 Bytes, but that value is "Reserved" 
> and only two non-reserved values are 3'b000 and 3'b001 which are MRRS 
> 128 Bytes and 256 Bytes respectively. That means MRRS has to be trimmed 
> to maximum 256 Bytes in software to avoid "Reserved" settings. I will 
> also ask the hardware and documentation team about this.
> 
> As a result, I adjust EXPCAP2F0:
> 
> - I raise MPS from 128 Bytes to 256 Bytes
> - I reduce MRRS from 512 Bytes to 256 Bytes (this is important to 
> prevent data corruption)
> 
> However, the downstream devices (in my case, PCIe SSD) can still be 
> configured with MRRS > 256 (in my case, Crucial P5 Plus 1 TiB has 
> MRRS=512 and MPS=128), which is where the quirk kicks in and 
> reconfigures MRRS for those downstream devices.
> 
> The pci_configure_mps() does propagate MPS from root port EXPCAP2F0 to 
> downstream devices, but there is no equivalent for MRRS as far as I can 
> find ?
> 
> Thank you for your help!


