Return-Path: <linux-renesas-soc+bounces-34632-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Kf8xMfN+RWquBAsAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34632-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 22:56:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C096F1AF0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 22:56:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=fAns894L;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34632-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34632-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E69DF30B84B8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jul 2026 20:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A89A395ADB;
	Wed,  1 Jul 2026 20:52:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8F614B08A;
	Wed,  1 Jul 2026 20:52:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782939144; cv=none; b=X/wmyxJMxQ7K68yjHq220PLlrQVeTcReGFCmvfUlIMb6VXPmhuH5ZxlQi6owNBs9BXjA2I6vRMWhXnol7BjecZaJ3KSRCey+sDRGZBstl6BTVNLh/Q4c8euYuChFgo7aoRMP2SpEiLfee/UCOObZQSEi1FeHFYj9DQXilGwuLWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782939144; c=relaxed/simple;
	bh=+o2phwX2Z5VP++7LZPN8vtoSyAkclhd0tas9DPHpjsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FbFo0LCStho+dxu4aRj2Tr0hiPi1LiENpydUEgnEs2+ikj86z/buIEERbIytbA8lUv5QP5GbdSlHtSl71yxnrcNs8vOW5trSmbcErVbaUktTVEfeG7Gkrz0xQ+NQCnVSh3Q75yhkD7kQ+gVx1MdNOOTNdQK3KHHJ0t4vTQFBV1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fAns894L; arc=none smtp.client-ip=80.241.56.151
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4grBz720vsz8v1C;
	Wed, 01 Jul 2026 22:52:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782939139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ayUOZ2QprH56XGGDon1vuJ84zCr1jeUOuFnvGJtUCCQ=;
	b=fAns894L4EkNHKwaThlEnJ7HXRkYjkE8PqnKTZrmXiTHFLDhD2sADLXT0iSXxl7Y3Z0xSZ
	ihYCfgybwOKGDyjB3idHE8jOuuBwR4K+8as2T4TIEc4sIYBRSRGnoDcynjTL+Qiijlk1yb
	sQPPTyv0Bm/45WS+qPZbM5by4NYgn03uxBkYXKaiy2YFChhrlLYn1g4fvsQ805iH37UYFE
	IO3iRmJATNHhhvii1FaZ5kO3XHQQ8N8w/k0ri3+b8gLfaro6m6uzqZkJg2MPZzEfvboVFN
	IMnUNDwsbLuidVbbxA8GyeaGQ/eDO/WsAav7Ih6JIABYgPT+/nOmXAR6aWF77A==
Message-ID: <9b5efef3-421b-4fce-b299-f3c818cab8b6@mailbox.org>
Date: Wed, 1 Jul 2026 22:40:42 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/4] PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not
 used
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-pci@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260618220427.14325-1-marek.vasut+renesas@mailbox.org>
 <20260618220427.14325-2-marek.vasut+renesas@mailbox.org>
 <ck6i6tdw4ngde6vmtamfrvryg47ixycpmd74ny5hpzury5ekpr@ibgrw7o6uewj>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <ck6i6tdw4ngde6vmtamfrvryg47ixycpmd74ny5hpzury5ekpr@ibgrw7o6uewj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: jz9cyeakpmxsygjbxd35i5fcbz36dybz
X-MBO-RS-ID: ff32e8b634b5259b038
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34632-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:linux-pci@vger.kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:maz@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:dkim,mailbox.org:email,mailbox.org:mid,mailbox.org:from_mime,renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C6C096F1AF0

On 6/30/26 6:22 PM, Manivannan Sadhasivam wrote:

Hello Manivannan,

> On Fri, Jun 19, 2026 at 12:01:59AM +0200, Marek Vasut wrote:
>> In case MSI are enabled, but DWC built-in iMSI-RX is not in use, the
>> MSI are handled via GIC ITS. Configure all controller MSI registers
>> fully.
>>
>> Set or clear MSI capability register MSICAP0 MSI enable MSIE bit and
>> PCIe Interrupt Status 0 Enable register PCIEINTSTS0EN MSI interrupt
>> enable MSI_CTRL_INT bit according to MSI enable state, set both bits
>> if MSI are enabled, clear both bits if MSI are disabled.
>>
>> If MSI are disabled, or MSI are enabled and iMSI-RX is used, then
>> deconfigure AXIINTCADDR and AXIINTCCONT to 0, which disables any
>> pass through of MSI TLPs onto the AXI bus and then further into
>> GIC ITS translation registers.
>>
>> If MSI are enabled and iMSI-RX is not used, the configure AXIINTCADDR
>> with target address of GIC ITS translation registers, and configure
>> AXIINTCCONT to enable MSI TLP pass through onto AXI bus and into the
>> GIC ITS. This specific configuration allows handling of MSI via the
>> GIC ITS instead of integrated iMSI-RX.
>>
>> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Same as patch 3, SoB chain is broken. Rest LGTM!
I hope this is now addressed in V3.

