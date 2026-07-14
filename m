Return-Path: <linux-renesas-soc+bounces-35204-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Vx3jDD85Vmru1gAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35204-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:27:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76419755160
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:27:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=a6Bkgyoh;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35204-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35204-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE5BC3297A21
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 13:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3051526A0A7;
	Tue, 14 Jul 2026 13:17:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8818925F7A9;
	Tue, 14 Jul 2026 13:17:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035078; cv=none; b=t8eSntR96eb01YqNx99JGf7St7SfPGcEq5b5dv8OI4SvB/zgO87A23BttSAO36HsOaQfNzsPRf3PR5pO5B84YaEE0LLV2FDfuiqUFpxEORhSx8RXHq2rMhPCehaNTSrg+usaCvMxkJRSXQWEzN3uZiOKomlrYoeYCRaS6OSGU2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035078; c=relaxed/simple;
	bh=uyHTyo6BlQ8apSEosH8aRF5IYuQJO2rsniW4LEhh/PA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qe58k0dNyg962eABT6FRMP+UE+SDuETv0Fv1O8uIY70B3Bz3C4GOZ4Ho1w7zL45elA5DxXAVkzP/bwECpKAsuQW3Qtn43ZKVDgBTtDl/bWj6ULsS1i/Ll0WUadsS0YaF2TlreEUHmgEPI9nYH8bCfMfAFcnc+wH+37cEGDQ6g5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=a6Bkgyoh; arc=none smtp.client-ip=80.241.56.172
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4h00Gl6g31zMlV7;
	Tue, 14 Jul 2026 15:17:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784035071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G/cRu//uWOT+qbh6qti9TRa8/+CwFICDDK98F8HF74U=;
	b=a6BkgyohfmFI+SrqxlZSKaV8Mxro64qxCsTaKQUj57vVL1YP83+ZmREJX+WB8HYThSsolS
	fzdGccDFmlRU021CFKT+MLG3V5KkSvexSHlDHUNn8dMFXIO9tKqUVjzuLccjIZPSPZZ1gT
	UitCI1+6i4QFVrOhd+Y26YV92pmFlqNsaWO9Tjp9Gjkud5SegyW/7ASV9X7Nz+ilqNgOUw
	uVeCcB4bUeMqAC1/IxZADk2PgVQEepEp1Pt1hN9WPWbq9lnLEq2US+FINcmGYTcWBi8GP8
	Zu4YnuDP/2MPORP2mYESX/Kevt630h1jrXBgd6OKFgpOtZUrn9lWXEn7pd+HPw==
Message-ID: <43b0883c-8ade-4129-8fe3-bd6fcb191ea5@mailbox.org>
Date: Tue, 14 Jul 2026 15:17:46 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] PCI: rcar-gen4: Inline GIC_TRANSLATER offset macro
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-pci@vger.kernel.org,
 kernel test robot <lkp@intel.com>,
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
References: <20260714110041.GA1349622@bhelgaas>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260714110041.GA1349622@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 32a8528cd2be18f19ff
X-MBO-RS-META: 4qmkcnquwqej65t44z98iiowifkh7d94
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
	TAGGED_FROM(0.00)[bounces-35204-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:helgaas@kernel.org,m:maz@kernel.org,m:linux-pci@vger.kernel.org,m:lkp@intel.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:from_mime,mailbox.org:mid,mailbox.org:email,mailbox.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76419755160

On 7/14/26 1:00 PM, Bjorn Helgaas wrote:
> On Mon, Jul 13, 2026 at 08:05:38PM +0200, Marek Vasut wrote:
>> On 7/13/26 7:54 PM, Bjorn Helgaas wrote:
>>> On Fri, Jul 10, 2026 at 03:35:10PM +0200, Marek Vasut wrote:
>>>> On 7/10/26 10:30 AM, Marc Zyngier wrote:
>>>>> On Thu, 09 Jul 2026 21:10:03 +0100,
>>>>> Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
>>>>>>
>>>>>> Instead of pulling in the whole linux/irqchip/arm-gic-v3.h ,
>>>>>> copy the one GITS_TRANSLATER register offset macro directly into
>>>>>> the driver.  This repairs the ability to build the driver on
>>>>>> non-ARM non-GIC targets the way it was possible until now, which
>>>>>> retains good build test coverage.
>>>> ...
>>>
>>>> So in the end, it is either this patch or limit the build to
>>>> arm/arm64 . At least this patch still allows building this driver
>>>> with more compilers on the various build bots, so I would opt for
>>>> this patch here.
>>>
>>> I like the build coverage, but duplicating the #define doesn't really
>>> seem good to me.  It makes readability worse because cscope/tags now
>>> sees two definitions without an obvious reason.
>>
>> I can rename the macro, or ... sigh ... I can reduce the driver to build
>> only on ARM/ARM64. Which one do you prefer ?
> 
> I think a dependency on ARM/ARM64 is preferable.

I will send a V2 shortly.

