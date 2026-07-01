Return-Path: <linux-renesas-soc+bounces-34633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W0YzASJ/RWq5BAsAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 22:57:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB4E6F1B12
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 22:57:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=llrXo7fJ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D179E30EC94C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jul 2026 20:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DCFA395ADB;
	Wed,  1 Jul 2026 20:52:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA0439901A;
	Wed,  1 Jul 2026 20:52:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782939148; cv=none; b=kL8FH02exQil+wfV0dwOJgBsTs0LhvFqNBj7nv7hM00ERhUzrQuTLWJV7qWrJ8oAdXNSm8j3Dmhj99wAQ3JH685LIeRjYRxpS075ukn17BGpPY2lEnmNcSeL5V7A+PGnoFGn4WkceKuBHcad8Y1bGNAhXaeiiPWiedMqzMFrdrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782939148; c=relaxed/simple;
	bh=S5lxwaDUlg3hPhzbjhLS8dF4IGAdpEgdctptljqQd20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lq3t20p10wsDpv6pK56MajF8P555cW370N9WJVqjM7mctRwl29tIAvBRCIuMSeCY9gN2J4jxW+tyZvXABBT8oseZWAVy+eoR+rbGdZCB5GI3tMUBWnTKJ0PNBuL6YVfOeozcbEJVUXg3fYbvdbVowGJk3FkfB1EX4ZsK4DCv/L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=llrXo7fJ; arc=none smtp.client-ip=80.241.56.151
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4grBzB6Pfbz8v10;
	Wed, 01 Jul 2026 22:52:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782939142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KDjDTATqNVEjy4/eLFLsbZrtthmvzujKNtPqmpMmWw8=;
	b=llrXo7fJqzU25O+uRx7CnozwD4Mcym6LY6K5YXRFfFtVDwy0QlOiP0qKviM9Aj42qCw2BK
	BCwD5CwLgBLBu+d4dCL9QrXomsHp0agyWSyNtjaqgmu2+xplFT0k7H5x8if6hrJUnAiGVR
	MjyFDptl2S7hTBcEtK5rul5B9jnObE4b+vN37Sg56q1jGj8Ngw50RFb4z7srI2ApixgYne
	ySpBU593s5Ub3YBOQw5I/s1FIo0dAkSZGlDHHhiCK0CfLd5t5NtPdoMyWvmzaA5++zFe5r
	H906D5ZN5YVmMDLEYl9SfnZJjgcFJ9rCn8lYzhuXKVtxtVrnoxP/dpUgHtTp4Q==
Message-ID: <4ab6c86a-d809-47c3-bfb3-28da499a1457@mailbox.org>
Date: Wed, 1 Jul 2026 22:42:21 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/4] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum
 workaround
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-pci@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260618220427.14325-1-marek.vasut+renesas@mailbox.org>
 <20260618220427.14325-4-marek.vasut+renesas@mailbox.org>
 <87cxxkma5p.ffs@fw13> <d6fce333-4353-4e49-873f-eb3187a631e4@mailbox.org>
 <8633yfrrnc.wl-maz@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <8633yfrrnc.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: f3b0010bad76142726e
X-MBO-RS-META: ydwdkqwy6x9kt434cjesqq4qbeoj6erp
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
	TAGGED_FROM(0.00)[bounces-34633-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:maz@kernel.org,m:tglx@kernel.org,m:linux-pci@vger.kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid,mailbox.org:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5AB4E6F1B12

On 6/22/26 8:55 AM, Marc Zyngier wrote:

Hello Marc,

>> On 6/21/26 12:59 PM, Thomas Gleixner wrote:
>>> On Fri, Jun 19 2026 at 00:02, Marek Vasut wrote:
>>>> Renesas R-Car S4/V4H/V4M GIC600 integration has address width for AXI
>>>> or APB interface configured to 32 bit, it can therefore access only
>>>> the first 4 GiB of physical address space. This information comes from
>>>> R-Car V4H Interface Specification sheet, there is currently no technical
>>>> update number assigned to this limitation. Further input from hardware
>>>> engineer indicates that this limitation also applies to R-Car S4 and V4M.
>>>> Name the limitation GEN4GICITS1, and add a driver quirk to mitigate this
>>>> limitation.
>>>>
>>>> The quirk is keyed on the combination of the GIC implementation
>>>> and the platform identification in the device tree.
>>>>
>>>> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>
>>> This SOB chain is broken.
>>
>> Broken ? I don't understand , could you please elaborate ?
> 
> Either Shimoda-san is the sole author of the change and you are
> posting their work, then the first line of the patch should say:
> 
>   From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 
> with your own SoB immediately following their SoB (see [1]).
> 
> Or this has been co-developed, and both of you should be credited as
> authors. then Shimoda-san's SoB should be preceded by their
> Co-developed-by: tag (see [2]).
> 
>   Co-developed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>   Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>   Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> This shows exactly who did what, who forwarded whose patch, and forms
> the base of the DCO which is documented at [3].
> 
> Thanks,
> 
> 	M.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n449
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n503
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n396
Thank you very much for the clarification!

