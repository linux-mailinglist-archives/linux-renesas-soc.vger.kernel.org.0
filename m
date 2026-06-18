Return-Path: <linux-renesas-soc+bounces-34223-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lPk6N15sNGo/XwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34223-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 00:08:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9356A2E53
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 00:08:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=MLPaW2n4;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=l7JqWS1c;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34223-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34223-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2758830BC489
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 22:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06ED7325491;
	Thu, 18 Jun 2026 22:05:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB1832B12A;
	Thu, 18 Jun 2026 22:05:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781820332; cv=none; b=tlu+yr6J2eGXcno4Yr774GdWsp9D8WKKhVurjBwB7ZHwkZwgmJmr2u/YGWxl1ljftvg9Knk9r9puGg5nm6XFgtJhEQ8aS3s0pnfd2PvT1x0q3y8FeYxCMinzRa+VZdNO5DNGXF7k4Tu+SX3ER342aJBkHOtJbMS2ELGkFTdpQW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781820332; c=relaxed/simple;
	bh=kgfKpMsSSrRVpUjlD+SkqNdIzaa8rHn/BNneTTyVDIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VHu5EaxN0yDvLFqFEAxRhb1pTfCybg5BRfepe/45XS0RbS4ou4NTconQfAqwsEGSA4v2+kcqosbGiw2dzan1pgdUrb2ha33XwctPnszqYiSVPNbeN/mqe6Ti2SgjfTBFJHf0K9hPyelqBJoDuP3ek2tooK+JOzlePmf1jEbjLE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=MLPaW2n4; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=l7JqWS1c; arc=none smtp.client-ip=80.241.56.151
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ghFCY6prBz9tFt;
	Fri, 19 Jun 2026 00:05:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781820330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TVPca2W85m+WmiLy6hXkm+KXlzNSHX/SVNrgp/WFCYs=;
	b=MLPaW2n459d+ZgMQupaC9cF9NkFnV8HVsA7YZFIOL4YDnDdYKBu2HHWsJmxlacmjhSC0+j
	m9YUvZ5OLeiNwf27VA8VFjPlG9ydb+0z3coInn8B0CCcPSkA6ZpySvAe7vrxwKdJFm6Pgz
	r5bxrKBhvCOfEnYAYY7z+Mb7kcqXEf1+4W74LUKTLFDwHBy3QU0qmzs0c5fu8VnyYf3kIf
	f66wT9fzcnpzfc6mwGyNpQASIRihVjZRbGGYw0kF0IK/R8JfNmqBwhof92OBh8ic9/B8z8
	oIbvD5UdtpNqtNllporgkNR++Aypq6qyZJJ0sCZNGoq9jhnwcKI74I52LF2Ptw==
Message-ID: <4fcdc951-e3be-4ae4-8d60-03fd496baec4@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781820328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TVPca2W85m+WmiLy6hXkm+KXlzNSHX/SVNrgp/WFCYs=;
	b=l7JqWS1c9Nbgd+oxIvdhdZQFRMrMzI7ax8TH2QPOzHcz/1mY9EWngrrtKXZmc3BT6CT6wz
	NyuUGcPjNljxdPwvkYOVPUQnXtOmWgGQgr+zFAcIzPxld27e1kaOkDKvFileIdklavCK9E
	XM0mGvwpbvnozt7A4aDSUK7QvGAJy8ZwqgwPt5/VO7imOiYiQyox0BHp9fzT6uIyUM+kBY
	3/jQxfaoa+E9LJ/2gv0Co1T7/hy6qgZ3Iqm0xPN1YycpIcv2k1dgM7I8G7bIq6cAgZGili
	sdKtkRZiDQUn+X1y2nnYEESGXPFV9hctt+5Z8MlBvKjekDA5s/M/A6ZZsGTO1A==
Date: Thu, 18 Jun 2026 23:54:43 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum
 workaround
To: Marc Zyngier <maz@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-pci@vger.kernel.org,
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
References: <20260617030008.154449-1-marek.vasut+renesas@mailbox.org>
 <20260617030008.154449-2-marek.vasut+renesas@mailbox.org>
 <864ij1tyrj.wl-maz@kernel.org>
 <0935eb67-83d2-49ea-89ab-0d0aa51ead8a@mailbox.org>
 <86ldccs0oj.wl-maz@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <86ldccs0oj.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 4c9c6b62bae1d8a0379
X-MBO-RS-META: 1e9soejg6nzs4wwimrf51bf5maqubzyy
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
	TAGGED_FROM(0.00)[bounces-34223-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:maz@kernel.org,m:marek.vasut+renesas@mailbox.org,m:linux-pci@vger.kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:dkim,mailbox.org:mid,mailbox.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B9356A2E53

On 6/18/26 10:38 AM, Marc Zyngier wrote:

Hello Marc,

>>>> Renesas R-Car S4/V4H/V4M GIC600 integration has address width for AXI
>>>> or APB interface configured to 32 bit, it can therefore access only
>>>> the first 4 GiB of physical address space. This information comes from
>>>> R-Car V4H Interface Specification sheet, there is currently no technical
>>>> update number assigned to this limitation. Further input from hardware
>>>> engineer indicates that this limitation also applies to R-Car S4 and V4M.
>>>> Name the limitation GEN4GICITS1, and add a driver quirk to mitigate this
>>>> limitation.
>>
>> My concern is this ^ , I do not have an erratum number, because there
>> isn't one. I am in touch with the hardware engineer and I did get a
>> glimpse at internal details of the three SoC, which confirm the
>> limitations. Is this sufficient ?
> 
> To be honest, this is between you and the SoC vendor. I'll take
> whatever symbol you come up with at face value, and will assume that
> the vendor agrees with it. After all, they are on Cc and have their
> SoB on the patch.

All right.

>>>> Note that the 0x0201743b GIC600 ID is not Renesas-specific, it is
>>>> common for many ARM GICv3 implementations. Therefore, add an extra
>>>
>>> Not quite. It designates GIC600 unambiguously.
>>
>> What I am trying to communicate is, that the 0x0201743b ID is not ID
>> of the Renesas GIC implementation, but it is a generic ARM GIC600
>> ID. That is why we cannot match the quirk on the ID (it is generic ARM
>> GIC600 ID), and instead we have to match the quirk on the [ ID
>> combined with of_machine_is_compatible("renesas,...") ].
> 
> This is understood, and is no different from the other broken
> platforms in the tree.
> 
>>
>>> It is just that GIC600
>>> is integrated in zillions of SoCs, most of which don't have this
>>> problem (the machine I'm typing this from has a GIC600 *and* 96GB of
>>> RAM).
>>
>> Right.
>>
>> Shall I reword this paragraph somehow to make it clearer ?
> 
> I'd simply say that the workaround is keyed on the combination of the
> GIC implementation and the platform identification in the device tree.

OK

>>>> of_machine_is_compatible() check.
>>>>
>>>> The GIC600 implementation in R-Car S4/V4H/V4M is r1p6.
>>>
>>> Is this relevant?
>>
>> I included it for the sake of completeness and to provide all relevant
>> information, based on previous discussions about similar limitations
>> that I could find on lore.k.o
> 
> This information is already contained in the ID you quote (bits
> [19:12]), and can be decoded using the public TRM [1].
I'll drop it then.

Thanks

