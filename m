Return-Path: <linux-renesas-soc+bounces-35170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V3BTLqV0VWqYogAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 01:28:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ADF74FB77
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 01:28:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=eeFZ4MWu;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7184130C9C94
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 23:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275473D7A01;
	Mon, 13 Jul 2026 23:27:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E1E3B8BD8;
	Mon, 13 Jul 2026 23:27:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783985244; cv=none; b=eJBGJwxLB5nzubMB5tZctdVzb3MnQKwV8pGD1Z+rnf+U7aXvSq2Yovr1CL6ZMLnb/p5cKlV9ddvU0/j1XTsqbk2IiWet1i7f0E/LQ4Z7vschFAebLCB0wegJw+NaaCqAsAeLG4+/ZgEFWeNK98TiQCm4mzIH8Sl/R/Rxu1MIw1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783985244; c=relaxed/simple;
	bh=H1hj1fKdkFAMfe6aV1gB0KI7JUT6T6OHj293Gpx6mDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s9RcLAMjySjro+3HUWKtaTX1Qyqmft/VB1ROSLVcOg8lKeEivY1MOuvcriLLDHbZ5sGTLuRE1DydGKeruDvoQRTi4BAn1sC4Kx4f3X/78L+ogJH76Tgy7MQjYIBWKMpUIYo2ZI7TgWziqposGE2UauG4BikBOvqnEU+HziEZxFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=eeFZ4MWu; arc=none smtp.client-ip=80.241.56.151
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gzdrN5XjXz8v6x;
	Tue, 14 Jul 2026 01:27:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783985236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a6jyp32uUawh83SRhr8POWlLF0OVHeuNyqGYp5nxZsY=;
	b=eeFZ4MWuPw2jU5Jcg7tSt39IfugRem3NikpSYn2zhVLCahxbtlWJdjgXDpQfyxw4LG+Bw6
	aFInhLaVgicO1NFdzknmCWt9l5VsdB9KnpHor1SiPt3gYaxV/Kqx0Erhau2IJWA/s0q8PV
	UUVD2H0b3QfX7LGqCfUUSKN41g1RJc5h9ewzCb4tbC5eBdty4zW9yChEp0C98o4VdDtKRD
	qr/kbY5B9jBMmrD4Ju2rNBFuzdxSSCpNwQpINvcdpb3Ltvo5kY4+Bbg3A2UBYdBmAhGcq2
	EP5h2nU9DRLck57ikG3T0RmATVVo8wdJ9DUEjTMOTYfQAIdzm/VF/cOfYyQaVA==
Message-ID: <7715ca62-be37-4c6e-86d1-3d0816bf9bfb@mailbox.org>
Date: Mon, 13 Jul 2026 18:20:14 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] PCI: rcar-gen4: Inline GIC_TRANSLATER offset macro
To: Marc Zyngier <maz@kernel.org>
Cc: linux-pci@vger.kernel.org, kernel test robot <lkp@intel.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260709201103.90162-1-marek.vasut+renesas@mailbox.org>
 <87qzlb5jsl.wl-maz@kernel.org>
 <2cb03029-0957-4ed8-98bd-9b3e0e0bce2d@mailbox.org>
 <87fr1m6hma.wl-maz@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <87fr1m6hma.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 870d1a74b75403cd9a9
X-MBO-RS-META: m76s4j99tj8fo9x8q4hzjed7j1qa4ujj
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35170-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:maz@kernel.org,m:linux-pci@vger.kernel.org,m:lkp@intel.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29ADF74FB77

On 7/13/26 5:20 PM, Marc Zyngier wrote:
> On Fri, 10 Jul 2026 14:35:10 +0100,
> Marek Vasut <marek.vasut@mailbox.org> wrote:
>>
>> On 7/10/26 10:30 AM, Marc Zyngier wrote:
>>> On Thu, 09 Jul 2026 21:10:03 +0100,
>>> Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
>>>>
>>>> Instead of pulling in the whole linux/irqchip/arm-gic-v3.h , copy the
>>>> one GITS_TRANSLATER register offset macro directly into the driver.
>>>> This repairs the ability to build the driver on non-ARM non-GIC targets
>>>> the way it was possible until now, which retains good build test coverage.
>>>>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Closes: https://lore.kernel.org/oe-kbuild-all/202607100310.iQw5m9Uo-lkp@intel.com/
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>> ---
>>>> Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
>>>> Cc: Bjorn Helgaas <bhelgaas@google.com>
>>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>>> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
>>>> Cc: Manivannan Sadhasivam <mani@kernel.org>
>>>> Cc: Marc Zyngier <maz@kernel.org>
>>>> Cc: Rob Herring <robh@kernel.org>
>>>> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>>>> Cc: devicetree@vger.kernel.org
>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>> Cc: linux-doc@vger.kernel.org
>>>> Cc: linux-kernel@vger.kernel.org
>>>> Cc: linux-pci@vger.kernel.org
>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>> ---
>>>> Note: The alternative I could think of would be ifdeffery which
>>>>         is not nice and thwarts the build coverage, or limit the
>>>>         driver to ARM/ARM64 in Kconfig which also thwarts the build
>>>>         coverage. I could also split off the register macros in
>>>>         linux/irqchip/arm-gic-v3.h into some separate header
>>>>         linux/irqchip/arm-gic-v3-regs.h and include that which
>>>>         might be OKish and avoids duplication. Thoughts ?
>>>
>>> No, I'm not hacking something that is purely architecture specific for
>>> the purpose of a bizarre integration quirk that should be handled by
>>> the boot firmware, and not Linux.
>>
>> The PCIe controller is fully controlled by Linux.
> 
> And it shouldn't. Why can't your favourite boot-loader use it, like on
> any reasonable machine?
Because U-Boot is designed to boot as quickly as possible and get out of 
the way, which means lazy initialization of any and all resources, which 
means skip initialization of any and all hardware that is not needed to 
boot the machine. It is one of the core design decisions behind the 
U-Boot driver model [1].

The R-Car V4H using mainline U-Boot can boot from PCIe/NVMe SSD, but 
that is purely optional and some users might instead boot from SD cards 
or eMMCs, and even then the PCIe hardware is shut down before booting 
the OS to prevent any issues during OS boot or reinitialization by the OS.

[1] 
https://git.u-boot-project.org/u-boot/u-boot/-/blob/main/doc/develop/driver-model/design.rst?ref_type=heads&plain=1#L794

