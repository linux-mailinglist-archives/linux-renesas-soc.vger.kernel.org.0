Return-Path: <linux-renesas-soc+bounces-32575-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8N2OKtiDBGpwLAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32575-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 15:59:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 240CE5348A7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 15:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09AA831B8D17
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 13:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3ACF2C032C;
	Wed, 13 May 2026 13:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="gtigegsR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF76D285CB9;
	Wed, 13 May 2026 13:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778679440; cv=none; b=YaqiWG3FKp6S1M4CoIg5JwQRdVV5Izyd6cULlt52V4qbR2h0EHBSuXfYk8q6Nz3VKFYjZ8ORrU8JL5EXQWBiwaPFiVzDs6FPjgv2VU/HeoFpOMYCz9Jgwagq9zGQfWmyhVzKGYQEavcaF1iwfBeA4l1H8z6SvqGImwYXYjWUR/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778679440; c=relaxed/simple;
	bh=KEf+9fLGksQz2jePXQWelFajAvEqqbkiD7pIfQ6g3C4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qKkBOFgIx/qxlOENMAicKblSqJQfsg2PYnFICPm/2iqY0Bz+lKrNvOGMQL3clYUJ0HLTGMzuUetxnr+vIrrKJJ9RK1v0gwWeZEGO2cSy2prgZmr3hvlQtj9BjJSq5W2n/OmIRAIugpJAYSafP3C6oX1wwfVKRm0Ewvjg5gU+S94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=gtigegsR; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gFvdk4Ngdz9vfd;
	Wed, 13 May 2026 15:37:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778679434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VvSwoxSiatVvxEWU9UXOMyAINfanvVCSTpfBdY/SsOE=;
	b=gtigegsRzs/PH4410a+01bUv2j2KyUKcwfaWpppuhLu8m2I1YU6obCyivI5oHmQ8FNhKaL
	m3BVDkT61G0Vc7uCDQDg0aJy+YBZaWKAS9a7QH47YSWoSGQqLkPQq/rQISbz+6ZKnND1wG
	rjloA982IY9Bh+5iWCDDt7SlIVVhmJjgcn3l6z/aOYiwH3gyCCzr0gsb9iyvjMlpvY/TT7
	d/NsBbk1oA9BAX6bN9oUxLurQk1s41uLejxMbzJ/KjHhOCtQpvr1lRJNlvayNHPOWG1Ozx
	X55HErnWj2APUmPCcSW42iBSmhFzQt8tWNJ+LilyZpsZRoo7m8bewF818ApU1g==
Message-ID: <c4e6e48d-9a8f-48f0-8666-22efebf86d8a@mailbox.org>
Date: Wed, 13 May 2026 15:37:10 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] clk: renesas: r8a73a4: Implement ZT/ZTR trace clock
 on R-Mobile APE6
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org>
 <20260502185557.93061-3-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUXjwyVk2kuGAJOdPHw=qv_iwO2pSR3Rp+5ayoP2QG25w@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdUXjwyVk2kuGAJOdPHw=qv_iwO2pSR3Rp+5ayoP2QG25w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: gnir56bo4zqqypyqe9fzb64orawq84oz
X-MBO-RS-ID: c62258f6f52ae9b4f90
X-Rspamd-Queue-Id: 240CE5348A7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32575-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,baylibre.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,mailbox.org:mid,mailbox.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/13/26 3:15 PM, Geert Uytterhoeven wrote:

Hello Geert,

> On Sat, 2 May 2026 at 20:56, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>> Implement ZT trace bus and ZTR trace clock on the R-Mobile APE6.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Thanks for your patch!
> 
> /sys/kernel/debug/clk/clk_summary looks a bit off to me:
> 
>      zt                         0       0        0        208000000
>      ztr                        0       0        0        277333334
> 
>> --- a/drivers/clk/renesas/clk-r8a73a4.c
>> +++ b/drivers/clk/renesas/clk-r8a73a4.c
>> @@ -43,6 +43,8 @@ static struct div4_clk div4_clks[] = {
>>          { "m1", CPG_FRQCRA,  4 },
>>          { "m2", CPG_FRQCRA,  0 },
>>          { "zx", CPG_FRQCRB, 12 },
>> +       { "ztr", CPG_FRQCRB, 16 },
> 
> 20?
> 
>> +       { "zt", CPG_FRQCRB, 12 },
> 
> 16? (12 is zx, cfr. above).
> 
> I.e. the same shifts as on R-Mobile A1.
> 
>>          { "zs", CPG_FRQCRB,  8 },
>>          { "hp", CPG_FRQCRB,  4 },
>>          { NULL, 0, 0 },
> 
> After fixing the shifts, I get:
> 
>      zt                         0       0        0        277333334
>      ztr                        0       0        0        277333334
> 
> which looks much better. If you agree, I can fix this while applying.

Yes please. I can confirm in APE6 RM v0.7 that the ZTFC is at bit offset 
16 and ZTRFC at bit offset 20 . Thank you for spotting this.

-- 
Best regards,
Marek Vasut

