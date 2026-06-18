Return-Path: <linux-renesas-soc+bounces-34222-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ycqaAzxsNGouXwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34222-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 00:07:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB096A2E44
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 00:07:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="Vr7/kDwQ";
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=XKITqWdx;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34222-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34222-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2CB130067AE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 22:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE913264D7;
	Thu, 18 Jun 2026 22:05:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A06325491;
	Thu, 18 Jun 2026 22:05:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781820330; cv=none; b=JvSnjivPffR3vnxHMRQk8YMSI4Tkw4f7C4H38MYKO4yeUCormgdKltFpueXxEZvkIgHEi4HqfbmpxcMexGvl4TT0r/V0Cra7zXSDcWH9kqfEVyJoz9YEu8CdM1gs9FqEKWek3oWeEWY0TyXrvFsjyu6V2DooyiZa9dPe45nZOSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781820330; c=relaxed/simple;
	bh=dMTTPiqpSCdDk0Nr5xUPnfTfhOEFl/85MFehssEP3tE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IaivUhFLtRcnuYmniISg2FJlBIJyN2ABN5EGd0xh0lgEYfNoEMdOGvvarcbud6INzmcCufymjagEkvY2M+69L6J0uygKIo4fixbF4ovB4ol0bYd8638Vw5nTeA/i4W+ddE0D7hhi8hSRHJ4ZyNL3ZC/+hQxtYssVSpXL+ZyggyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Vr7/kDwQ; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=XKITqWdx; arc=none smtp.client-ip=80.241.56.152
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ghFCW2Z5Bz9v9m;
	Fri, 19 Jun 2026 00:05:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781820327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HsG+kwh/RE2Th17kyeIVSQQjjEmBmAST5wWlz7L+k/A=;
	b=Vr7/kDwQQVyyn7Q9L3WMvbAOf0DmSjZsRwNWCVqbAQ3K0mvmVR5JS+ubzjuiSOY0fLOK4Z
	9WzXQa4PQq/TcS5Cgr9WSLEW8fsC2f1O459t50DuJI/I5rXphumG2oHZqifo7/xCSxsG/4
	Vu01PmHLcwFD8XBORfut00GHNKW7L7PBK3TGrZIXu5Wcw81fah1hwL8PMS2KICSg8rvjiA
	Tn5smT+NBBaWlH2WP0VwTBO3LUDEmltgLki7OypGLYr5HkK/kJNkm7apAmSHk0D/ay7I9V
	9C/UsgPEY0f0lXVnS7h9xtdd2NdZ2Hh2ZkNSZUMlPjGWkzBet6tc/mTMKK6a1A==
Message-ID: <6ac0dd7d-e6f2-4af8-8a8c-0c04b80fe84c@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781820325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HsG+kwh/RE2Th17kyeIVSQQjjEmBmAST5wWlz7L+k/A=;
	b=XKITqWdxP93mTM7BWv5LdSPVNU80VmN3Eo0nPVObPZnqcYoefywgvnU0qGrD930f190Kvk
	bPGTQ6G0ROgP0jyLS57mN2Zga90ceidoNxWV8tfikrnOtVT3vqPGUaag2AEgrEIzWZuI+L
	JYowfbuAOmVfK04HzsvDxAIVZ0NDBYbeWfHuWPJvSRdFgLyRh20BvpK+wbPINeOCVNDP44
	/+n7REpcVwlhV7N4Es2gxRZQ5y4mLAkyRtupwfvQOd2Vj8AISY4JfAGlL7FYe0UlsOxtpe
	+RO3z0NlsWn0Oj7QQylYMxTV2Oj3af46V9WNJeF2AFDQVH4V/XIwaq+6RSNtgw==
Date: Thu, 18 Jun 2026 23:53:16 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
To: Marc Zyngier <maz@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org,
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
 <8633yltylq.wl-maz@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <8633yltylq.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: ucoytqqaddo4u58bqotznotj7opphcfn
X-MBO-RS-ID: 4481829806dbe33cd5c
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
	TAGGED_FROM(0.00)[bounces-34222-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 1EB096A2E44

On 6/17/26 9:28 AM, Marc Zyngier wrote:

[...]

>> +/* INTC address */
>> +#define AXIINTCADDR		0x0a00
>> +/* GITS GIC ITS translation register */
>> +#define AXIINTCADDR_VAL		0xf1050000
> 
> Wouldn't it be preferable to source the address from the device tree,
> rather than hardcoding this?
It would, I will do so in V2.

