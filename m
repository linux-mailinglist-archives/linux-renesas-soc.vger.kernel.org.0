Return-Path: <linux-renesas-soc+bounces-34316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /NsYJ71HOWpYpwcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 16:33:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3604C6B0585
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 16:33:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=h1dZNLrq;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=FdCx3pp8;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A0BF8300B477
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 14:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666D53AE6EE;
	Mon, 22 Jun 2026 14:33:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7153390CBA;
	Mon, 22 Jun 2026 14:33:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782138808; cv=none; b=OD1Jsg1/Y32VgmLzrDyzF1RnQXB88O6inKTmzTAV4DJNXgCGpJ1fu4T90Rh2VIgGXi4FXGJahaEvVOzWthiRta6WipifrIN1Kv2mFDUcqx8rdSfretwOGQhanETZvrGSG2SWe0a2VOmdN50BMqWzVAS1QhFgWXYc8O453TE5n00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782138808; c=relaxed/simple;
	bh=BBRO4BaVZPNZInZLfWHLLV56eOKNHVltJgJCKNoCM2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t9MBjNPiyHTuUh6T1Z5LGKxNshrjjr2fcwxDPob7QlI9wBUZ88ZnJ9sI/1CZnvXnpZy/tV1gW4gEuETlcfeJ19nlqbaoKPY1viZSCakxNDb+ppja7YuP1NpKbT95JV3kLG7Qrwjx4Ulc28kfpyUYXGLEYEwl5RURdW0cRVS9FX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=h1dZNLrq; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FdCx3pp8; arc=none smtp.client-ip=80.241.56.152
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gkVqF3tyGz9vGs;
	Mon, 22 Jun 2026 16:25:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782138345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OIgTdG49SDgzzqZu1X0DrxQsOeL+D74IHpuZMcKgJbQ=;
	b=h1dZNLrqpWihL5Z8j1HgL/7ltb6LGPc5pnvJ7XfUHI6k6ZxssabXl7UbT4ktm6cUT1muJS
	E5e4FWh5MfNKVPP1Bza4lSvQyfoTM8Qm+u4nblJZSn1yim96Bt3+dog+UwkUeY9p1ZIEzW
	8w6Sh74i/8K3fpU0eiUEiPxwlHuzz4taRDanKOkYTbq49Gg/PzrYB4QcsLi2vWgzYuMSFJ
	qWylKWtFCh8S8YVKg1t0U9E+8stoyXoULsY97EdAaxobxbSw7IvTMmIz3ObGj9uTn22JCQ
	hrT9VW2aESvwsZa0Ywkbzn8ht3y+Ztqi2AHMRwxe7VmD6BIgJ+fBCMnK/X4hDg==
Message-ID: <f980c840-bdf7-4c00-bbdc-ced7b1b9f63f@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782138343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OIgTdG49SDgzzqZu1X0DrxQsOeL+D74IHpuZMcKgJbQ=;
	b=FdCx3pp8lU9ekFGj1xizyWveLlHlfBotiaxbTE7vDgY4F1qMp1UkTG0ENBC8av8OG2LltY
	88VltbsPZan62gDpBmDWIbQH5hSyTccgvoLwUDoYFlcEN3bfmaHj6p3l9MJ8mUakdpy+Na
	apB2EBBt522Z8ZMAZp+5rMK1uI3jdWYTqdsbcvoJ66N4/CAC+8dPzNjRvO66DbzW876cnq
	2Q2ZBbU5Z7bYt7dIA2cChr3jV/3dXzRPODl54Vz2cLEvbHvpShOCPuSno0U3QGNfbR1kil
	bMHdz4L5GRFX+eG0VUtF64/VlstCduExqUrMhARHXYUeTeImQNyp+7pSSwrmVA==
Date: Mon, 22 Jun 2026 16:22:02 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/4] irqchip/gic-v3: Refactor GIC600 limited to 32bit
 PA erratum handling
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
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
References: <20260618220427.14325-1-marek.vasut+renesas@mailbox.org>
 <20260618220427.14325-3-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUxT87M1oQvPP_h4YX4vXFaVbbG+LCG8EdmuLTuHNtybQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdUxT87M1oQvPP_h4YX4vXFaVbbG+LCG8EdmuLTuHNtybQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: h9ynyzsu8mzdxzd9637onuq1ybxfbah7
X-MBO-RS-ID: 86ebaccfe5fcbdd292f
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
	TAGGED_FROM(0.00)[bounces-34316-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:marek.vasut+renesas@mailbox.org,m:linux-pci@vger.kernel.org,m:maz@kernel.org,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3604C6B0585

On 6/22/26 11:52 AM, Geert Uytterhoeven wrote:

Hello Geert,

>> +++ b/drivers/irqchip/irq-gic-v3-its.c
>> @@ -4890,10 +4890,17 @@ static bool __maybe_unused its_enable_quirk_hip09_162100801(void *data)
>>          return true;
>>   }
>>
>> -static bool __maybe_unused its_enable_rk3568002(void *data)
>> +static const char * const dma_32bit_impaired_platforms[] = {
>> +#ifdef CONFIG_ROCKCHIP_ERRATUM_3568002
>> +       "rockchip,rk3566",
>> +       "rockchip,rk3568",
>> +#endif
>> +       NULL,
>> +};
>> +
>> +static bool __maybe_unused its_enable_dma32(void *data)
> 
> __maybe_unused can be dropped...
I will fix that in V3. Thank you !

