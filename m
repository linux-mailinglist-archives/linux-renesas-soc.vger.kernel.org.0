Return-Path: <linux-renesas-soc+bounces-32622-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cZt7BAnEBWrDbAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32622-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 14:46:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A68EF541DEF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 14:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6C14F3016794
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 12:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8326A30F958;
	Thu, 14 May 2026 12:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="X0gHDrKh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBAC13959D;
	Thu, 14 May 2026 12:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778762749; cv=none; b=d+T63AYxcx1hbeX25UHBNvYlqIG9vtzac2mC16VhtGPGoKGeRH4n6rUIkY12SmGNIqV+tAbSG+WUiUF/et1Y4dsiSwtw8y/LIhzXkvXghgqpPpNcMY+2GJJiNo3CZkDmw6J2IrbnzjYRaZ2HQihM6m3KfHHyypaOv08LvLgTKs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778762749; c=relaxed/simple;
	bh=CPgMSu3h0HxGRDzdEwloCejk2cDJ6kxBXycnyfh/pFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pwxgg9qMxxX2BEselJolh5VTMsr81wwWv/1AXIJxONBhHCdnRjAB1jhfmFQ1LOJjWYzerWdOGgvfvZMXHRJ5oyvT+4B/jGQWJGay84tDVV0yGHT/fEITRstV+XViLHGYgaagvXPb1e3VJ0oRY7fbKYgf3v8DninChgispy+0kPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=X0gHDrKh; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gGVRj1mYbz9v8n;
	Thu, 14 May 2026 14:45:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778762737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g0meuM2dktCGP0Ls8RIINE+UeHLH/T7v1m7onF+s9Lw=;
	b=X0gHDrKhxCF5P/S4fvZMjURB8scyGQPD6vgQH1LSOYcaVs0C6y8eR5jEz4ayx0eidhSlqo
	ZbUQQfm1ro4j1scJaCrqedXSe50WOM6fvlJiFjmxANS2zY8mUXJWy5Ozge3SnOW0j6It/Q
	FJQUHiDVFpWxUixizV21HEkIpIh+G8sByKSw3J09xaHsi/1itxZzULmA/s6CqCU9c+7tHd
	IO7zl/Y+6RKYD5uTQMLb/CZ3MwLsxdfnuLvPtc8B0NxA08z8JrChbZcDYAA9txf5Ug8MUc
	QwNgXHqZqC1fepxEbWT1V01HFGv31mOfbXsTkKuEldmgeBhWAJ5grhBPfucIcA==
Message-ID: <32ace62d-2faf-4197-a548-93111b2a68ea@mailbox.org>
Date: Thu, 14 May 2026 14:45:21 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: r8a78000: Fix GIC-720AE View 1
 Redistributor description
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260513223125.43337-1-marek.vasut+renesas@mailbox.org>
 <86bjeixyi1.wl-maz@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <86bjeixyi1.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 68hnufgn5133ui5p9dmagwrtyamem9zr
X-MBO-RS-ID: 8326ad8e9f3d17f6c68
X-Rspamd-Queue-Id: A68EF541DEF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,glider.be,renesas.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32622-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim,arm.com:url]
X-Rspamd-Action: no action

On 5/14/26 9:04 AM, Marc Zyngier wrote:
> On Wed, 13 May 2026 23:30:08 +0100,
> Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
>>
>> The Renesas R-Car X5H (R8A78000) SoC contains Arm CoreLink GIC-720AE
>> Generic Interrupt Controller with Multi View capability. Firmware has
>> access to configuration View 0, Linux kernel has access to View 1.
> 
> Huh. That's pretty unexpected. The usual wisdom is to give the APs
> view 0 so that it looks like a "normal" machine, rather than only a
> partition of the system (which is what view != 0 indicates).
> 
> I guess there is some additional fun going on there, such as other
> CPUs getting a portion of the GIC for themselves, and firmware
> preventing whatever is running on the APs to interact with them...

This is my understanding as well, partitioning of the system is an 
intended use case. On the development hardware I have access to, no 
partitioning is applied, all cores are available to Linux.

>> The Arm CoreLink GIC-720AE Generic Interrupt Controller Technical
>> Reference Manual, currently latest r2p1 [1], chapter "Programmers model
>> for GIC-720AE", subchapter "Redistributor registers for control and
>> physical LPIs summary", part "GICR_TYPER, Redistributor Type Register"
>> clarifies register "GICR_TYPER" bit 4 "Last" behavior in Multi View
>> setup as follows:
>>
>> "
>> Last
>> Last Redistributor:
>>
>> 0 ... This Redistributor is not the last Redistributor on the chip.
>> 1 ... This Redistributor is the last Redistributor on the chip.
>>        When GICD_CFGID.VIEW == 1, for views 1, 2, or 3 this bit
>>        always returns 1.
>> "
>>
>> On this SoC, GICD_CFGID.VIEW is 1 and the Linux kernel has access to
>> View 1, therefore Linux kernel GICv3 driver will interpret register
>> "GICR_TYPER" bit 4 "Last" = 1 in the first Redistributor in continuous
>> Redistributor page as that first Redistributor being the one and only
>> Redistributor and will stop processing the continuous Redistributor
>> page further. This will prevent the other Redistributors from being
>> recognized by the system and used for other PEs.
>>
>> Because the hardware indicates that the continuous Redistributor page
>> is not continuous for View 1, 2, or 3, describe every Redistributor
>> separately in the DT. This makes all Redistributors for all cores
>> accessible in Linux.
>>
>> [1] https://developer.arm.com/documentation/102666/0201/Programmers-model-for-GIC-720AE/Redistributor-registers-for-control-and-physical-LPIs-summary/GICR-TYPER--Redistributor-Type-Register?lang=en
>>
> 
> I am amazed that you managed to find anything at all on this web site.
> 
> I would refrain from adding links to any ARM web sites in a commit
> message though. They tend to have a 10 minutes half-life period, and
> whole specs to disappear from public view when they are not flavour of
> the week anymore.
> 
> A link to the equivalent PDF has better chances to survive further
> creative^WAI slop driven reorg of the documentation:
> 
> https://documentation-service.arm.com/static/69ef3c1cd35efd294e335c43
> 
> but your best bet is to download it, archive it, and refer to it
> yourself.

Thank you for that. That is the one thing I did not manage to find on 
that website, a PDF of the GIC-720AE manual. I will include that link in 
a V2.

>> Fixes: 63500d12cf76 ("arm64: dts: renesas: Add R8A78000 SoC support")
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Acked-by: Marc Zyngier <maz@kernel.org>
> 
> 	M.
> 


-- 
Best regards,
Marek Vasut

