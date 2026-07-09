Return-Path: <linux-renesas-soc+bounces-34954-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2/S7EM+WT2pVkQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34954-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 14:40:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B496373117C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 14:40:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=tyMdvF2x;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34954-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34954-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 566003162800
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 12:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2BD42315F;
	Thu,  9 Jul 2026 12:33:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13304229B9;
	Thu,  9 Jul 2026 12:33:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600413; cv=none; b=czYTjW0xnOS6CwGhXDl5Vfu6jG9GHjT3QG+CF4zVSt6nldTGzYCewqNKKnn+VXJjfm/biCUuxD22ktARzejmCIiCsYZZfvmWd2CI6nrnY5nXzWarwVIe9TFQN4MJYKmFegKPuXVwcw+WwdI1oNfaUwQdVPCBmjhkY+x3ifxzHaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600413; c=relaxed/simple;
	bh=5SS856U/nCy4jJiMrV8ZnkSZPJeo0BvH/8EL343aghc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YRJojjeXSnLvt/YA27LJmhYuIt6rv5wqv9BEUk3CK/eKlNY5N1ZHplTUM67XpXQHLjd7HyGPkrjGMijWnJ+iD8uTJ1jX4Tgl1Rr9ejCFgv92X7x0ZZo6yvZFTb+T5x2a2EG/vtZReeNuHyho3+5ZKCbqu7ZAYlzb+MbFQq7RVlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tyMdvF2x; arc=none smtp.client-ip=80.241.56.172
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gwvWr1BmTzMlHC;
	Thu, 09 Jul 2026 14:33:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783600408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bTRYbwF/XxEjYYFob5S+WLNVX0HYy0ckmE1WUa6o3cY=;
	b=tyMdvF2xv5nIaXfmCYxbD6fRdAiNP55s0Xay6tcyDLZrqQOMXLTJyKpAAw0Axl9uJsn9H/
	p8JvUbMcfGOoTIZRbQddoYA0iZ7D5dLVGObch3s0ZKgetZBbBOuGBJHV3zuvlpjIjec333
	maPFXff9ntUELPQ7/XzebTVp/tx9R/9W2i+mzO9lF9F82FWnTE/+jTH05RsMS1XGZOS7nu
	zSibBMFF8pCrKFwSRGQfvwvyVTLwG83C9AF0CW0YzlkPEd/nTsLetHNaY1d2vL2XZWF3SK
	262lnO+lrhsIe+m5MAM8+pTj4smXWeFKJM2iZC7KXGU/1xScS8lLbZhzoKdiWg==
Message-ID: <c12941e4-3715-404e-b674-090c62b868b8@mailbox.org>
Date: Thu, 9 Jul 2026 14:33:22 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/5] PCI: rcar-gen4: irqchip/gic-v3: Handle GIC ITS
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-pci@vger.kernel.org, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260707203743.88299-1-marek.vasut+renesas@mailbox.org>
 <ybnitlgx3dcqsesubz6jz7pn6snseuxhtz564tinbtvukianaq@33ubmcynyqmt>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <ybnitlgx3dcqsesubz6jz7pn6snseuxhtz564tinbtvukianaq@33ubmcynyqmt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: a566168d3a29b829815
X-MBO-RS-META: r9xtkd8txggmkzk54mcmgk1r644y6icg
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
	TAGGED_FROM(0.00)[bounces-34954-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:linux-pci@vger.kernel.org,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:maz@kernel.org,m:robh@kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:from_mime,mailbox.org:dkim,mailbox.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B496373117C

On 7/9/26 2:19 PM, Manivannan Sadhasivam wrote:
> On Tue, Jul 07, 2026 at 10:35:38PM +0200, Marek Vasut wrote:
>> Configure all R-Car Gen4 PCIe controller MSI registers fully, both in
>> case MSI are enabled and disabled.
>>
>> Patch GIC ITS driver and add quirks for R-Car Gen4 GIC ITS, which is
>> configured to 32-bit address width for AXI or APB interface.
>>
>> Switch R-Car V4H to use GIC ITS in its DT and describe the GIC ITS
>> implementation cacheable and shareable limitations.
>>
>> Marek Vasut (5):
>>    PCI: dwc: Determine whether iMSI is used before calling .init
>>    PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
>>    irqchip/gic-v3: Refactor GIC600 limited to 32bit PA erratum handling
>>    irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
> 
> Is there a functional dependency between irqchip and PCI patches? Since the
> irqchip patches touch ARM64 Kconfig etc... I'm wondering if it still need to go
> through PCI tree.
I do not believe there is.

These two configure the PCIe controller hardware:
   PCI: dwc: Determine whether iMSI is used before calling .init
   PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used

These two fill in GIC ITS quirks:
   irqchip/gic-v3: Refactor GIC600 limited to 32bit PA erratum handling
   irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround

This one does yes depend on the two and two patches above, and can only 
be applied once all four aforementioned patches land, otherwise things 
really yes will break:
   arm64: dts: renesas: r8a779g0: Add GICv3 ITS and update PCIe nodes

Would you like me to split the series up , or can you and Marc (?) pick 
the relevant parts via matching trees ?

