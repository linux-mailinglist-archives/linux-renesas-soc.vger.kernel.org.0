Return-Path: <linux-renesas-soc+bounces-34972-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m+yUO0++T2rAngIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34972-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 17:29:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A87CC732E74
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 17:29:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="rtC/EAly";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34972-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34972-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34ABA30C67B8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 15:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EDA9370AC1;
	Thu,  9 Jul 2026 15:22:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E4A36827E;
	Thu,  9 Jul 2026 15:22:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783610548; cv=none; b=Jm//J7XON4oOEIZkFzOv5/L3I218JdFqWlRiaC2agLZoiqGKEqSznZPfotjCi8NNNnB86qCXheVC0nY3XwiUog/fhNRUQkDx1m4++3xMJfUsKoqlZdtD+hH1Dq9cB4iho1G8GybHu1X2Xxx27DP1BTzCPK0BiXnnkNrUODQCU7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783610548; c=relaxed/simple;
	bh=BSIfjK1k/RavKFMkJAdhOhD5k3mXFCRucl7IdwdjzMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cu+JzI67yc9nCsOeREatajyr419LLzaunvj/Zkr9KLlnjwOvhHZDf4LJ07b9Nbd+pdX0YWtfPNgEqh8Nia80Y+ivF3SvoaVLw+FJe8mvngh0h1QjEJQKHNf51Drsa3999wKv1FegTRl/9sZK8Pflyffey98e7J1irH7Pynf1Kcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rtC/EAly; arc=none smtp.client-ip=80.241.56.172
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gwzGl2hsWzMlFX;
	Thu, 09 Jul 2026 17:22:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783610543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dsIcksqCjHhl+PgskQMA9X+AMXn/bCWoXZcBglPsCLQ=;
	b=rtC/EAlyOKiXirZSk/d71ooja/c7nLc/BRFJk2yPB9Kp77blaHjJixRruUPHZShcnQmrMh
	7+SMmdJEdMxFsB5ZS7lZPfaJ+uVcB/KjL9gMSXOj56cxfdFXHHhVVxljxPCcL6NsH/puCO
	FoVe9kapTLf4GFyfNn/3znlCX6oEG7hqvtGSw4XwUWovt25rISI/AKNsA66c4U8xvMxhPx
	3c6MvDftlnqEPNrogLW4S8YKlLwiEb1GkNAos/eb8XFxS23SScur9PYnsWuljTvW1QQ6fM
	29aOllfZZP/td96j/NbsGuV27BUOp/FVm82DoRkNx1FQ6FwOEnIxfqooQWgq2w==
Message-ID: <a8eaf0be-175e-4e3e-a773-d0684a23b396@mailbox.org>
Date: Thu, 9 Jul 2026 17:22:18 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/5] PCI: rcar-gen4: irqchip/gic-v3: Handle GIC ITS
To: Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-pci@vger.kernel.org, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260707203743.88299-1-marek.vasut+renesas@mailbox.org>
 <ybnitlgx3dcqsesubz6jz7pn6snseuxhtz564tinbtvukianaq@33ubmcynyqmt>
 <c12941e4-3715-404e-b674-090c62b868b8@mailbox.org>
 <87v7ao5o5t.wl-maz@kernel.org>
 <lkxuw3lgr6gbi4vnj33pfq5kh7h7qefkwiovlqsltnfivbrfit@khnoyfmibg5f>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <lkxuw3lgr6gbi4vnj33pfq5kh7h7qefkwiovlqsltnfivbrfit@khnoyfmibg5f>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 329c7eef028ecd092b3
X-MBO-RS-META: tctohij9qgjyajkrm4cs6844iwq15twh
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34972-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:maz@kernel.org,m:linux-pci@vger.kernel.org,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:robh@kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:from_mime,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A87CC732E74

On 7/9/26 2:57 PM, Manivannan Sadhasivam wrote:
> On Thu, Jul 09, 2026 at 01:43:26PM +0100, Marc Zyngier wrote:
>> On Thu, 09 Jul 2026 13:33:22 +0100,
>> Marek Vasut <marek.vasut@mailbox.org> wrote:
>>>
>>> On 7/9/26 2:19 PM, Manivannan Sadhasivam wrote:
>>>> On Tue, Jul 07, 2026 at 10:35:38PM +0200, Marek Vasut wrote:
>>>>> Configure all R-Car Gen4 PCIe controller MSI registers fully, both in
>>>>> case MSI are enabled and disabled.
>>>>>
>>>>> Patch GIC ITS driver and add quirks for R-Car Gen4 GIC ITS, which is
>>>>> configured to 32-bit address width for AXI or APB interface.
>>>>>
>>>>> Switch R-Car V4H to use GIC ITS in its DT and describe the GIC ITS
>>>>> implementation cacheable and shareable limitations.
>>>>>
>>>>> Marek Vasut (5):
>>>>>     PCI: dwc: Determine whether iMSI is used before calling .init
>>>>>     PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
>>>>>     irqchip/gic-v3: Refactor GIC600 limited to 32bit PA erratum handling
>>>>>     irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
>>>>
>>>> Is there a functional dependency between irqchip and PCI patches? Since the
>>>> irqchip patches touch ARM64 Kconfig etc... I'm wondering if it still need to go
>>>> through PCI tree.
>>> I do not believe there is.
>>>
>>> These two configure the PCIe controller hardware:
>>>    PCI: dwc: Determine whether iMSI is used before calling .init
>>>    PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
>>>
>>> These two fill in GIC ITS quirks:
>>>    irqchip/gic-v3: Refactor GIC600 limited to 32bit PA erratum handling
>>>    irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
>>>
>>> This one does yes depend on the two and two patches above, and can
>>> only be applied once all four aforementioned patches land, otherwise
>>> things really yes will break:
>>>    arm64: dts: renesas: r8a779g0: Add GICv3 ITS and update PCIe nodes
>>>
>>> Would you like me to split the series up , or can you and Marc (?)
>>> pick the relevant parts via matching trees ?
>>
>> I don't think there's anything for me to pick. The whole thing looks
>> like a consistent set, and it probably should be kept together.
>>
>> Given that the irqchip stuff has been acked by the relevant party, and
>> that the last patch will cause havoc if taken on its own, the only
>> course of action is to route the whole thing together, the PCI tree
>> being the most obvious victim.
> 
> Alright then. I'll merge all 4 patches to PCI tree.
Thank you all.

