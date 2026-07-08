Return-Path: <linux-renesas-soc+bounces-34913-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m6QVF/PHTmrETwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34913-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 23:58:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFF172AB8C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 23:58:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="wjFK/kaf";
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=qj8cBGg7;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34913-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34913-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55630311583D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 21:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217F23FBB7E;
	Wed,  8 Jul 2026 21:56:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD553FBB6B;
	Wed,  8 Jul 2026 21:56:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783547763; cv=none; b=DrtWurjwEx6fTgES8P1TGNtV0fJTRvSqvEX96OKBiZV+wUdv6Ciz+7jebOy6xv6zwUE++bJCeoEp76kkr1rUKTA68LL87HmxT/7PcwGvUwwfsv2+OWA7/fXIuFr/eghRLmSUfFIgOZsv4FxfZaPwktddbHpmRlLGAQrfehe3BPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783547763; c=relaxed/simple;
	bh=kdjKpT+assoZeilYr2LxQKuL8Nmo+KGDFz0y8VqXiEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y6SLeyY5M9qsk2t6SzrE9aLTDVLkIh9lwfK/tqBiKpZIgknFYhruWeINA+oCOS1fuuVEE2uqj/snbCF80vNqGRPtA+3iBMV3DBQxn6OyzxRVu6v5pzjecUV7qSfx+UmEKzf2W2ZjFzTL30RbsQrQsQG+rQDrfWnIoRgPHUN++O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wjFK/kaf; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qj8cBGg7; arc=none smtp.client-ip=80.241.56.152
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gwX3N0DMLzKw3Y;
	Wed, 08 Jul 2026 23:56:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783547760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XjBrVwKo19OFb5JA1WR5qxGZI/M4aEQHwbmWPVH9Fks=;
	b=wjFK/kaf3QZ/nDdcK3LeRFORDcRmlnZiUfoggHfLBBeTN7gSKVvaucq7jvglASAtoG5sit
	n/jo6T8f46y0Sc/sXaLsy3n4FkrQJokveJC3UtuyUqECqrvibEQmXoUHRh0Y4t8MBkgWJ/
	x2p+OZ4x73BxE3CrW6OJNpONdckpUQPHMZxK2g5Nwbu7DXQ5WzMvdGTetRilULoHb3PC6h
	jsuWaR/huwwAxV+2l813NtMEinZsTnA1O2ZcOH9ocGmg5dvVywLtcUgM3h+0d/8roN02RL
	eGweCpGG7R5mgGoHs46NaiHtb2d/aOJMzNQzviyBdzA8iBhCCqPNuM1A7KZK2g==
Message-ID: <7377ecb9-f9c7-4f48-8fb7-655822a8f526@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783547758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XjBrVwKo19OFb5JA1WR5qxGZI/M4aEQHwbmWPVH9Fks=;
	b=qj8cBGg7BDmYDT3tr4495TkhB0y/gZRXQBV3ehVl0zvm4DuZP68iMhQYizADZmhUOQb3eF
	Q8coBPUBKq7g7n97/rjfX2pOWlka8Jr2cNEk22VqRc57JYl+vBsgPb4boBz/AZWHEQQZjq
	UJILwMFL06icODVX05wiIfqpCyNxMEmL9Nesl+2ehWqEC+veKpANMAp1xxtWQm4ROaBqTb
	FEecuxnXsfkMOfW3QG28KE5HUCDAv26QDIr4HMoMjdE4iAGxaAh7ifXA+7n5+QhaLQ4Lz4
	PIe2xrvIBNIs96Okks+1/mNgR0z0gnOWBreyqC4nDBAhwNaFnT/N0v9oft4yLw==
Date: Wed, 8 Jul 2026 14:51:27 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 5/6] arm64: dts: renesas: r8a78000: Add CPG node
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1783505142.git.geert+renesas@glider.be>
 <b3beaabd77ec73d3dea43cc603f2cae31290e273.1783505142.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <b3beaabd77ec73d3dea43cc603f2cae31290e273.1783505142.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: u5q1xmaq9dmwg7pe7hht3rgzq961ntaq
X-MBO-RS-ID: 17fff366f2498b566c2
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
	TAGGED_FROM(0.00)[bounces-34913-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:ulfh@kernel.org,m:p.zabel@pengutronix.de,m:wsa+renesas@sang-engineering.com,m:marek.vasut+renesas@mailbox.org,m:kuninori.morimoto.gx@renesas.com,m:devicetree@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,glider.be:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:from_mime,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9BFF172AB8C

On 7/8/26 12:15 PM, Geert Uytterhoeven wrote:
> Add a device node for the Clock Pulse Generator (CPG) on the R-Car X5H
> (R8A78000) SoC.
> 
> Convert all (H)SCIF serial ports from dummy to CPG clocks, removing the
> need for any dummy clocks.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

