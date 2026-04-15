Return-Path: <linux-renesas-soc+bounces-31312-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPozFd0g4GlMcwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31312-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 01:35:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA92940900C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 01:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6065D301876B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 23:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11743311C2D;
	Wed, 15 Apr 2026 23:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CynTRqs/";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="kyhxDupA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6562505B2;
	Wed, 15 Apr 2026 23:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776296076; cv=none; b=VQOTfAPQvcdyMACJHuzMUV8QoudfWJaSXp2DTaLKizpiuUKMHAljn5AIE6pK6Ng6gDks6u7ZbhIC4k3XnjsE7jVU6+2Cxnt9dNjHVtIq9QSs8x1gtOVYgs5nFgFoyNVaOu2QAkRZ2rEwauGUxZMbAsGxnHa0OrsESMXDhnkZx5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776296076; c=relaxed/simple;
	bh=W6TOZ3/W10UA8LLPOF9Vqlmcg2KhiYantW2FWW02nho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dBqcglxqsQLDq+tQbz1FVK/UD+KmKT4i1nnclV1GLzWOqaEdhktlgmU1UgnnJerUiFJ58WtWSz3ynch/zja+RSUq7rkqmVQJFT/bUIhugwGD49ZLhPyJ+7wGq39pEvufweo65qnKmRXA3lcma6Ik2PjgE2L7gcj19pfxRLuuSiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CynTRqs/; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=kyhxDupA; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fwyCs19qBz9tQR;
	Thu, 16 Apr 2026 01:34:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776296073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QAh9to5467+gnOb00NYAiKWmE2uQaHHB013hJTcUdMA=;
	b=CynTRqs/sDc3j0nfYYUPy9X2NzMsm5Vnr3ESiKhHOUZvEbxWvBJuCibKIQ7rX+uHH+MN2+
	DOZX1TAQyXNUOlGFvG8sJ2XIBjJ3FduNKmfij7XdccgDcWNLmbHkAUyb2x75lAihaMjgAV
	UyN/aEuMid638kD+NOzLjCijfIEYzrCWANw7iQE+Wm26pB2Qs97KGBlmadVgYGwrg0uJHC
	oiO57N+MjPLxqJzXDotba9IWeLeN7rCCOMtNGEopmv7GxaboYz3dMfcnRf270eh4PfY+Oa
	Cbp6/PDKOcaETGyL/Da2W3aJLFgWdGd1ApH/Fztc4fm4foZSd5juCoNaSlOEWg==
Message-ID: <c79016f7-ee5f-4b32-91f6-9a2ca40436e8@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776296071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QAh9to5467+gnOb00NYAiKWmE2uQaHHB013hJTcUdMA=;
	b=kyhxDupAXS3XvO1q79TSS7h1Wt+/QkZHu7VBte5iuExFl3tOHKolFq4WiI3PDJVY/a79gU
	04jIGpRYNc3CrIxklQz5Bj2OPF4PLNvasZAb1Ea17Ylby68dxojD84rY9WawpVlOWiDje/
	0hy9522XSHz5iStpc1MhIto/PhyH5PRwpvUEZ9uEnjIqchKMPf4Y1Qc6cE+YkG8K2WgKu9
	jLja179bgfPKqnsZC0Hu7oJo/KK1yt1LTBDkDk3vg1OoKGFS19tW3y+mJxX4YT6obVIcNp
	KlJjiMJpbeBckiwhh9mOW9vIm6i7Qip5BmyJBNeUrDs5CLdaYrkCCP0AKOoqrQ==
Date: Thu, 16 Apr 2026 01:34:28 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RFC][PATCH 3/4] ARM: dts: renesas: r8a7740: Add ZT/ZTR trace
 clock on R-Mobile A1
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260328000031.94645-1-marek.vasut+renesas@mailbox.org>
 <20260328000031.94645-4-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVOHaQU0qAYYQV3u7bAm3jzKmQM=btnpFaToxGxPrVGXA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVOHaQU0qAYYQV3u7bAm3jzKmQM=btnpFaToxGxPrVGXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 9ba0599e0c6be236990
X-MBO-RS-META: 3hn3zg9cf1ged7k1jpsycw1w3sdf678j
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
	TAGGED_FROM(0.00)[bounces-31312-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,baylibre.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[e6150000:email,mailbox.org:dkim,mailbox.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AA92940900C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 2:06 PM, Geert Uytterhoeven wrote:

Hello Geert,

>> --- a/arch/arm/boot/dts/renesas/r8a7740.dtsi
>> +++ b/arch/arm/boot/dts/renesas/r8a7740.dtsi
>> @@ -551,9 +551,9 @@ cpg_clocks: cpg_clocks@e6150000 {
>>                          clock-output-names = "system", "pllc0", "pllc1",
>>                                               "pllc2", "r",
>>                                               "usb24s",
>> -                                            "i", "zg", "b", "m1", "hp",
>> -                                            "hpp", "usbp", "s", "zb", "m3",
>> -                                            "cp";
>> +                                            "i", "zg", "b", "m1", "ztr", "zt",
>> +                                            "hp", "hpp", "usbp", "s", "zb",
>> +                                            "m3", "cp";
> 
> The order of the names must match the indices in the DT bindings below.
> Else consumers end up with a wrong parent clock, leading to issues
> like the I2C controller driver failing to probe because its parent
> clock is out of range.
Fixed in V2, thanks !

