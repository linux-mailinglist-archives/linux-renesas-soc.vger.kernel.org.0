Return-Path: <linux-renesas-soc+bounces-34973-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TU7YGhy9T2pQngIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34973-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 17:24:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D82A1732D1A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 17:24:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=BQ7qj2ik;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34973-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34973-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1CEFD3005AA8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 15:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C09636A37B;
	Thu,  9 Jul 2026 15:23:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFD6364943;
	Thu,  9 Jul 2026 15:23:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783610611; cv=none; b=HHwLFyW4ULMbzme28gMQMtd9c2OAEOlv6CNKx/hRx+SMyAij9SYzv7BHlhwkeioz4aTrLikhcT9QkWZ3DLklZ41Vh1ItveNGyNLBtctf92W6UEP7qhtC7Pif3JW/lS/5aHJ4/C4g1GeOSf6b/aTLEj3Icr7E2cSrUTEg3XlU0yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783610611; c=relaxed/simple;
	bh=FGj4BXdhDBDAGB4iwVbKiirOotKTnPLYsioMLbfUeUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q3juqexYkXskWGmCDZeGO5bvn9GCPcAocBjM8QSqp31FI1FoOH3RWISKY8Dvzaw2kbWWc46CaHBNUPP9Z94sk+5fXoBLfpeXuuMpHLCPa4wcs6gUlZus/XBmo1YqGYQ0JesUv9ZLwEayRmw3muZnrEImjAlyvIEQm+mOyMMuXXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=BQ7qj2ik; arc=none smtp.client-ip=80.241.56.161
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gwzHx3V6xzKnRd;
	Thu, 09 Jul 2026 17:23:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783610605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3DJtdglWdhtyGucyQVZjA4gR9eVcUWIO30Bf0LYMArA=;
	b=BQ7qj2ikuao6hCeNkVjToIpnnOPPxG5jLL+0iwcDY8+7B7zpJJg/zpTeSP5IbLZ8+ZWSRw
	6d2K7pJtenD3l95c1cNZ607GCFfxVCL0xxYrQ4HPV6X67laguX9IYzI47FAe+b26xXYuyf
	IbB8N0JFDswID8N6f56VF8LqEBBu647mV4rLfIgEecghLbjO76iBIWz5NEyCaDXcxDx1GG
	/O1Ee4jE3Xd5C06TR67+43tHw3bMAZ5jcrb+UdDsi0yjhGF6mm9KwxUhpF8YLHx8yyDfwN
	b3Dr6ijdLOJDKKBhZvUuNkfh4kVcJPO+PxgQAQm7HO8qhwYCGZCUcuGspnEq3A==
Message-ID: <6c93677c-974b-46d5-aa81-1ab04c8dd940@mailbox.org>
Date: Thu, 9 Jul 2026 17:23:21 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: (subset) [PATCH v4 0/5] PCI: rcar-gen4: irqchip/gic-v3: Handle
 GIC ITS
To: Manivannan Sadhasivam <mani@kernel.org>, linux-pci@vger.kernel.org
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
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
 <178360186732.755595.3582150626313807959.b4-ty@b4>
 <ael3rodbevow3q7r4y6zavouh3pvoljmyaev5it6dknyaw7vcb@szfampjit4ds>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <ael3rodbevow3q7r4y6zavouh3pvoljmyaev5it6dknyaw7vcb@szfampjit4ds>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 4a5df62b25b95807fda
X-MBO-RS-META: t18uwoiuq7fkdmahe51a9qkz95ma4n46
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34973-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mailbox.org:from_mime,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D82A1732D1A

On 7/9/26 2:59 PM, Manivannan Sadhasivam wrote:
> On Thu, Jul 09, 2026 at 02:57:47PM +0200, Manivannan Sadhasivam wrote:
>>
>> On Tue, 07 Jul 2026 22:35:38 +0200, Marek Vasut wrote:
>>> Configure all R-Car Gen4 PCIe controller MSI registers fully, both in
>>> case MSI are enabled and disabled.
>>>
>>> Patch GIC ITS driver and add quirks for R-Car Gen4 GIC ITS, which is
>>> configured to 32-bit address width for AXI or APB interface.
>>>
>>> Switch R-Car V4H to use GIC ITS in its DT and describe the GIC ITS
>>> implementation cacheable and shareable limitations.
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [3/5] irqchip/gic-v3: Refactor GIC600 limited to 32bit PA erratum handling
>>        commit: 96b193897fd374fcb63a782c52f8b079134d0222
>> [4/5] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
>>        commit: 14e8394423ffd4fd28884ec8b4d5ba15be6e7e0d
> 
> B4 got confused here. I applied all 4 patches.
Understood.

5/5 should go through Geert / Renesas SoC tree ?

Thank you !

