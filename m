Return-Path: <linux-renesas-soc+bounces-34182-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tjlGMOldM2pE/wUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34182-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 04:54:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 421AA69D2D9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 04:54:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=DnyO2zxF;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=lHMu8ryT;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34182-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34182-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79ECF3046500
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 02:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44D12FDC5E;
	Thu, 18 Jun 2026 02:54:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F633296BCB;
	Thu, 18 Jun 2026 02:54:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781751249; cv=none; b=bckx0xkXLusfNwyBIhXpQP9WOn/YEock5WzLrpA2tuQ2Zr1mdyFJRnL4J5vT8MCqH4rUrv7yxnijYTNes9WLgfwnPqr4/aGyWo9lGf4+KddnL9URbQntfnLKLsWSthBcb6PKNhiq7gkIwFQgltmr6xvFlQ2xP67gcy+bdb0aQ5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781751249; c=relaxed/simple;
	bh=HAr2iq8Shkt5x1RGNaseiIkTcHwdORNa3jfcC8nPI2A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MZmNCNFCHkzBBq+ooOeFh8M9CXdorWsKB55AbqtQ7w7+6VTqffsg0z0Vg2ZSsztyKQi/0v5FuIVgJvrKGKbs2UZuGj8sUuyxkH3pcy3hoUSJsGODtHaX0DqvmQl0vV4UvRu10nVEGaREiBM5Faoba5Qd+vPUtnDg7d1/DlSpUPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DnyO2zxF; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=lHMu8ryT; arc=none smtp.client-ip=80.241.56.172
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gglfw0nP7z9v2W;
	Thu, 18 Jun 2026 04:54:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781751240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8xXDiAxEFwyAProbdrm+uUTrK71kU+kKOZY+CjZ1YNI=;
	b=DnyO2zxFhkzhydI3TxPM7sUiLIlggbgInwByWW6FoKV3DabwHZXW8CPuub0zGUULodGpcf
	RnIrZbSOuh87N1jJcmi3ArJFct5sKoaBimaDxsfJHk32NLGd3bJy3EofjupIZ9e90M8fke
	ay8ULx7feekJ2kuCE5IZDctdtYroJVxwkUTQHcJA4QJSA5nrJceky32gJaAMYatlGlM/9H
	werau6XyUjZwu/bFDAEF86IXGIFQoHqvWAs8fEFWdl67NNOmCvkn/gFDI9apdGPXl82zQu
	jwUACTmNZ1Jptt73STom0ec60B8mB2Cft0i111iTHwml5eh6Qxr3BvkLQDg4gw==
Message-ID: <3fb1433d-604b-4598-9f6a-ae130c613d07@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781751238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8xXDiAxEFwyAProbdrm+uUTrK71kU+kKOZY+CjZ1YNI=;
	b=lHMu8ryTAHld6UQ7P6HwAwwVqnAf7abS6Oy9wMJeAQF2oKHwG5JOjoDV5lTUsBAcVRpn4D
	v2PJqXuieWuP3yD7krRBKH7ZHcSSIewDa++7SLQvIILOQqvCkC+phedR9u28pwp3/xJ7Gc
	XQaw2J9Ab3Y7epZ5ccUpSqp3qipQVHsWTKpjQgQCjFg1Mf9NulDUeJdIcMspG0WuumitAq
	tIaxSRaWC5mFbXa88zlu7RdNGBLLytgox72L2opQd8cNc84JION2qpGzVQf7a/8K/184Er
	TMUFoxBJUPCCwYQ0V70BuPbUlDKD6BfLtq+h8he9R4kOH+34UsPA1tDy4Ox1Hg==
Date: Thu, 18 Jun 2026 04:38:00 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Marek Vasut <marek.vasut@mailbox.org>
Subject: Re: [PATCH 2/3] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum
 workaround
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260617030008.154449-1-marek.vasut+renesas@mailbox.org>
 <20260617030008.154449-2-marek.vasut+renesas@mailbox.org>
 <CAMuHMdX7XuHQDSsX4P7NZ46_OnCX2o25szuALwSs2z+PHq+JNg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAMuHMdX7XuHQDSsX4P7NZ46_OnCX2o25szuALwSs2z+PHq+JNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 5fc08f1b7a6d7969849
X-MBO-RS-META: 1imfw9c1rkfizt9npf5dc3bznq391u1a
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34182-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:marek.vasut+renesas@mailbox.org,m:linux-pci@vger.kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:maz@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 421AA69D2D9

On 6/17/26 9:09 AM, Geert Uytterhoeven wrote:

Hello Geert,

>> --- a/drivers/irqchip/irq-gic-v3-its.c
>> +++ b/drivers/irqchip/irq-gic-v3-its.c
>> @@ -4901,6 +4901,18 @@ static bool __maybe_unused its_enable_rk3568002(void *data)
>>          return true;
>>   }
>>
>> +static bool __maybe_unused its_enable_renesas_gen4(void *data)
>> +{
>> +       if (!of_machine_is_compatible("renesas,r8a779f0") &&
>> +           !of_machine_is_compatible("renesas,r8a779g0") &&
>> +           !of_machine_is_compatible("renesas,r8a779h0"))
> 
> of_machine_compatible_match() with an array of strings might generate
> smaller code (I didn't check if 3 entries is enough to trip the balance).

Let me handle that as part of suggestion from Marc.

