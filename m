Return-Path: <linux-renesas-soc+bounces-35056-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3zkmJVX1UGpA9AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35056-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 15:36:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E2773B4EB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 15:36:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=FJJxmCIV;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35056-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35056-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40BF83017C1A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 13:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F0E377544;
	Fri, 10 Jul 2026 13:35:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877373B2AA;
	Fri, 10 Jul 2026 13:35:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783690525; cv=none; b=VopLgL2QnhxawIUDVd+ZWQe2Kv7DRkYSQsztPg/MGq3PAR/s+BVn372Qd24SULQFvRSUw5FLdgsz+AtQRFpKl5XgEWJxrQHzr39OIomSLtndr3zmAwEC43mNSl0rNzN5X5AzwrtPU4zbG2I56QdZkJ4a016YXGL7+Kz6YFWXa9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783690525; c=relaxed/simple;
	bh=qfIZLF+bh/b40e3fxtqo0rkYJysVYWbXTttsLuuzEFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OpXUm8eFPNqAZtMILgkRie9Peynq4Z8Pz/PHjZ41SJn9/jStbn72LC3b9hetAK7PaDd9xQAXW9gn8721m2Er/vN5pQfU2SVH9ARNff0bScDf2cpP6woV9hLM3mmDNbQwsacrID7hpl0m5lN1nvJ3DEnWitrRv638ECNZNQi4cS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FJJxmCIV; arc=none smtp.client-ip=80.241.56.151
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gxXrj5TZ7z8txZ;
	Fri, 10 Jul 2026 15:35:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783690517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zlKLNJPOGiDKqWlVl/uUtpjI3Xr5vwkpin4+jwj51A4=;
	b=FJJxmCIVt4hbz0GcuAzOD5mSpmcsjTnSJgrxCHghbGivf1Dkcd3M4z9rFhJWFg20UWKD39
	mArdJWRl/y32FYiRJQcatQdN091jZQoC7Paz6gweqie3AqfP8b6Hp4l78nu5krwcRynQwB
	4zegO5t8mrZbHwC4YIpuMZfrrw/tAOfbJFyWOa0af5cIGCXt3egqU7eCBQGOr70+rJa4hV
	gKVylEMRpUk3b6H63tA8q6QuhGvLnvHZIwWDCclCxm/A7KSmn7v7xf0jgjI4khnE+8O4Ew
	PauB/VmiEs60KqqKfk88beChhnqUwcN8Mq/q0Ry67f685oyQY4bl7WYxSDW+3Q==
Message-ID: <2cb03029-0957-4ed8-98bd-9b3e0e0bce2d@mailbox.org>
Date: Fri, 10 Jul 2026 15:35:10 +0200
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
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <87qzlb5jsl.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 39334qfx7t74yz6t7hkn76hnui4r95h5
X-MBO-RS-ID: c43d4b05b532b168186
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
	TAGGED_FROM(0.00)[bounces-35056-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 32E2773B4EB

On 7/10/26 10:30 AM, Marc Zyngier wrote:
> On Thu, 09 Jul 2026 21:10:03 +0100,
> Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
>>
>> Instead of pulling in the whole linux/irqchip/arm-gic-v3.h , copy the
>> one GITS_TRANSLATER register offset macro directly into the driver.
>> This repairs the ability to build the driver on non-ARM non-GIC targets
>> the way it was possible until now, which retains good build test coverage.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202607100310.iQw5m9Uo-lkp@intel.com/
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
>> Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
>> Cc: Bjorn Helgaas <bhelgaas@google.com>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
>> Cc: Manivannan Sadhasivam <mani@kernel.org>
>> Cc: Marc Zyngier <maz@kernel.org>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-doc@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-pci@vger.kernel.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>> Note: The alternative I could think of would be ifdeffery which
>>        is not nice and thwarts the build coverage, or limit the
>>        driver to ARM/ARM64 in Kconfig which also thwarts the build
>>        coverage. I could also split off the register macros in
>>        linux/irqchip/arm-gic-v3.h into some separate header
>>        linux/irqchip/arm-gic-v3-regs.h and include that which
>>        might be OKish and avoids duplication. Thoughts ?
> 
> No, I'm not hacking something that is purely architecture specific for
> the purpose of a bizarre integration quirk that should be handled by
> the boot firmware, and not Linux.

The PCIe controller is fully controlled by Linux. I don't think this can 
be handled by the boot firmware. The GIC ITS TRANSLATER address could be 
derived from the DT compatible string of the PCIe controller (I had that 
implemented before), but that is the less generic option.

> Add whatever you want to the PCI glue code, limit this to arm64 (which
> is the only architecture this can ever be used on, and the build
> coverage argument really doesn't hold), but please leave the GIC code
> alone.
So in the end, it is either this patch or limit the build to arm/arm64 . 
At least this patch still allows building this driver with more 
compilers on the various build bots, so I would opt for this patch here.

Thank you for your help !

