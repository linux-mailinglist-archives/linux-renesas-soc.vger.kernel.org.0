Return-Path: <linux-renesas-soc+bounces-27312-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 25o8C2R2cmn3lAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27312-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 20:11:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABF86CE87
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 20:11:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A63C3300B9FA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 19:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEFCD3859E5;
	Thu, 22 Jan 2026 19:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="q8vFWeq7";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hxsCnpwp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D861D385ED4;
	Thu, 22 Jan 2026 19:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769109088; cv=none; b=B8BWOQanKBy0tWVuP9u5BU5foO72mp6SC+8UEbHmOH8hFOJNvAIOr5CI5DVE9SJyGZQLWpAG7Ai/08pC1FMyGDC24ePD13cnqmy5kCjroIVhUL8wDMnEcEPAwJ9PehEUAarQyGlL3I9TeDnuxU8EktB1ogPSNTkuBUWuV/Nu+GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769109088; c=relaxed/simple;
	bh=V4MqKdcmNUDueQiIyKWd529B5AQkiUI8raNRH/4ysRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IgnSVq3o14Je4q+OWgh0btYqPnR5gxP1YxBTjk7MNJPqRvaYb3u67Aqz48moRk+ZKtZoJL9ZAjzwdQufAM46jXBwtwh6nsforBPIX9UEVXMcq5gBpEKbcMQP7o+Mt+D8NMGg06edHr4CGh95gOnBpbbE92l+OJ8GH8Ar+ARKgE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=q8vFWeq7; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hxsCnpwp; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dxrJF2GKtz9tmc;
	Thu, 22 Jan 2026 20:11:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769109069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=89hnRfGT6K5DVFBx65KY1V2Qu8HMKDj7OT53Y0FKeI8=;
	b=q8vFWeq7mYuSSaLZlr4UO+0xrR9hfyUHisMRDRBoJTB67J+6eN6R7ZDVQ89/aVvGFSeYp3
	ka9qlSvAFmEZ02kcOj6qhM5lzRfP9cBELgI9vsfBDJhiCXokvfphvSU2lI5aj53Jy/t4W/
	coziVMi7lTSsf5zhnpnsgDFPzS29TJ1Vb4BjF8Y1ODlrY7ygsCiwpABsbPrbki2Xxcy4IZ
	CeGBV/sWK5ZfQTi90hj1+1ubnpmEK/TTboA9lsBwraWpqgcRZP2ibV9n5OF+EWRKrLsiXF
	NeSTX1OSR31KxKf/y2ce1EsWEh7rZ6L96Lja3uYbiMhM53QXhS6LRJsnW/VslQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=hxsCnpwp;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <66ff3c90-8c14-462d-9a86-0a3ff1df2c25@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769109067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=89hnRfGT6K5DVFBx65KY1V2Qu8HMKDj7OT53Y0FKeI8=;
	b=hxsCnpwpIdCQRmfbpaGVRALcd7g2yqfONlt1vbR4k4lV1+cLFMysOWZ0kVs3jNaXmDUNLP
	wxqEAyINCdQgjA2SQ+JqdGJPbyYCLAk36RreEzNsZO8LZDTre2kRmt1GvJJV1TZMNzCVQp
	CnX9wsrE/TTdU5GbsZXriDiq6c6tUw6whrGywIC2hsbi5OfO3UODeHkmRua4zLuHyC/Q0u
	D8sFlgbABD6wJimcSmDqXOft0IIQoGSXvSiIpEdz/3/A47yFtsgmHHgzCzuZqhl62W/pRA
	CKl7tUosutbiEw4/URqImQSuQwZxzBW4RP6zmbf/UUwv2pLRVtzf7MVvmR4mdA==
Date: Thu, 22 Jan 2026 20:11:02 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] linux/interrupt.h: allow "guard" notation to disable
 and reenable IRQ with valid IRQ check
To: Frank Li <Frank.li@nxp.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-input@vger.kernel.org, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, Cheng-Yang Chou <yphbchou0911@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jinjie Ruan <ruanjinjie@huawei.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Marc Zyngier <maz@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260121232522.154771-1-marek.vasut+renesas@mailbox.org>
 <aXJEaTPIhDGFb11C@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aXJEaTPIhDGFb11C@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: rz4noihj8t11tb5kefn3bk6fdkiufpoc
X-MBO-RS-ID: d278257d69abddd5482
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-27312-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,infradead.org,gmail.com,glider.be,huawei.com,oss.qualcomm.com,kernel.org,linutronix.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7ABF86CE87
X-Rspamd-Action: no action

On 1/22/26 4:38 PM, Frank Li wrote:
> On Thu, Jan 22, 2026 at 12:23:47AM +0100, Marek Vasut wrote:
>> Introduce disable_valid_irq scoped guard. This is an extension
>> of disable_irq scoped guard, which disables and enables IRQs
>> around a scope. The disable_valid_irq scoped guard does almost
>> the same, except it handles the case where IRQ is not valid,
>> in which case it does not do anything. This is meant to be used
>> by for example touch controller drivers, which can do both IRQ
>> driven and polling mode of operation, and this makes their code
>> slighly simpler.
> 
> I think it'd better to give simple example here.
Patch 2/2 is that example , but I can also include it in the commit 
message if this 1/2 is even acceptable.

