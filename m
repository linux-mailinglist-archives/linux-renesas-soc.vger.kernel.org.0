Return-Path: <linux-renesas-soc+bounces-34899-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AeHPL3B/TmqsNwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34899-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 18:48:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6405A728DF8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 18:48:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=yY1xJQwb;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="HyyEMk/D";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34899-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34899-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D4AC2300B45F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 16:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B0D43803D;
	Wed,  8 Jul 2026 16:48:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5960F40245F;
	Wed,  8 Jul 2026 16:48:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783529325; cv=none; b=dvojIpiqH0sdOm3yCpYY+BbmmqW0CC3iU9muUgJtqUInSxO4BB64wLrUNCzLcFNb8IgJN6swRVdgSCHjfyDMy4unZj0FKXa0CrUAqEMAbAqxF0uBU+Qt/O7mKVissAIGCBKR2kDC8nEmd06DmQQpzeQBKdn+H4VsmBUErSRbY34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783529325; c=relaxed/simple;
	bh=fofBQvPVcd3NX+xdJivf5D8jfwRM6c2GJjKIcT6JUBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MyCQadAH7qFUZ8lqUyYc1mQsdHlL2W1c5xTAeVKgdLYjmALN4w7Ujx2jVYK6WG5EtwUdbJpeAa/iCDDRBaMM/FFN0opkhNAVI0ndswt/G7fTJ12MsdV39eVzknN9XvM+J5pN9B99Yo0x3vWd7eTQmTVoCwu6bWTKaXgus+KOtoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=yY1xJQwb; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=HyyEMk/D; arc=none smtp.client-ip=80.241.56.171
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gwPDm6s9TzMlKN;
	Wed, 08 Jul 2026 18:48:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783529321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G2F8UTbrQpHAZf8UnpKm16ni9iweS0yaca1Uv+SwEYc=;
	b=yY1xJQwbYy4eG2NsyWzBCVrlkg0EcBjFvdcuFovEC2IbWp3kU60JKjSAKSzLMciR1EsPdu
	ejjAFDe+JVF9Sr9+3QhhAur1hoqUsx/BwX/PDpB/e8Nwa0hOuypUuMHhL9Uwujrw7tbXNH
	/j35Zda5HbVnuqxQP84QRGA1FV25MuMpNgpXQAo9aBYw2ylltxz5DS3qGE2Xk/tripSQUp
	4rigneeHGxJ162cClnDzNhffDU/3Eo9bSvYV4qi7/wkQ7qcrWGAK6XA2NN2uE2+bIhKC0P
	Ov74Ct4qnnCl6FDRTICjToZjcoBT48/7DeD44GFkfO2C13KILjQU/E9XLhZq4w==
Message-ID: <1c072a8f-a854-4b72-be43-7fdb50b14653@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783529319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G2F8UTbrQpHAZf8UnpKm16ni9iweS0yaca1Uv+SwEYc=;
	b=HyyEMk/DEMoJgPcxBr0Pq212SsCaf5NsNufZl8aXOfXzinVkcA2D20WAtT1qmT/1tWXXMm
	UH50YgTdA4l+ihaYZ8AdS5GPRPKEWGAfhLKMXCMjNamAB+octGR79OarG/cz3sMKyDkx1A
	szPV4dYYdC5rvgx5AsAU0aYRIKTDw8GV5rWRlZOBrOKKCq6a8ETtr4NOv7JDltLeNkzqFP
	htLjbKZpYH65f3a2eeCxEaLRBnkYPYfr7gjm6vahw3qM7uspJlzPtCdzwIAwcuWPBU7FOI
	s9p//CTQHqCgonVROF8iPyh9bmOz2wBDEdSqly1oBaTIk4J6CdcFB+d1/rb0jQ==
Date: Wed, 8 Jul 2026 18:48:31 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 00/10] R-Car X5H Ironhide CPG/MDLC SCMI remapping
 support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Ulf Hansson <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1783505329.git.geert+renesas@glider.be>
 <3c76a2d4-a8b8-493a-9196-c5cc72958118@mailbox.org>
 <CAMuHMdUVUKYrrms0Vd4i3_nwq2LVjvnvFRWswi8UY3cA67u2-w@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdUVUKYrrms0Vd4i3_nwq2LVjvnvFRWswi8UY3cA67u2-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 09e4c3dda12fcca6b00
X-MBO-RS-META: na9n8ju6zp3juk8qegttrip714c8zcby
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
	TAGGED_FROM(0.00)[bounces-34899-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:geert+renesas@glider.be,m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:ulfh@kernel.org,m:rafael@kernel.org,m:p.zabel@pengutronix.de,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:bartosz.golaszewski@oss.qualcomm.com,m:vkoul@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:khilman@baylibre.com,m:florian.fainelli@broadcom.com,m:wsa+renesas@sang-engineering.com,m:marek.vasut+renesas@mailbox.org,m:kuninori.morimoto.gx@renesas.com,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6405A728DF8

On 7/8/26 6:04 PM, Geert Uytterhoeven wrote:

Hello Geert,

> On Wed, 8 Jul 2026 at 17:42, Marek Vasut <marek.vasut@mailbox.org> wrote:
>> On 7/8/26 12:16 PM, Geert Uytterhoeven wrote:
>>> Geert Uytterhoeven (10):
>>>     firmware: arm_scmi: Add scmi_get_base_info()
>>>     of: property: fw_devlink: Add support for firmware
>>>     pmdomain: Make genpd_get_from_provider() public
>>>     reset: Add reset_controller_get_provider()
>>>     dt-bindings: clock: renesas,r8a78000-cpg: Add firmware property
>>>     dt-bindings: power: renesas,r8a78000-mdlc: Add firmware property
>>>     clk: renesas: r8a78000: Add SCMI remapping support
>>>     pmdomain: renesas: r8a78000: Add SCMI remapping support
>>>     arm64: dts: renesas: ironhide: Enable SCMI devpd, sys, clock, and
>>>       reset
>>>     arm64: dts: renesas: ironhide: Add CPG/MDLC firmware properties
>>
>> I think 10/10 did not make it either to my inbox or lore.k.o , but the
>> remaining 9 patches look good. Thank you !
> 
> Thanks, I did something silly while sending.
> Lore now has it, b4 still seems to miss it, unless I specify the
> Message-ID of 10/10.

Thank you, it looks just fine.

-- 
Best regards,
Marek Vasut

