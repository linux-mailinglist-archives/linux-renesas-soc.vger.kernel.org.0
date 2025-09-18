Return-Path: <linux-renesas-soc+bounces-22033-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4723CB84E16
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 15:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E251A7BF415
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 13:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D4A30BF65;
	Thu, 18 Sep 2025 13:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="gbSUnWpG";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="m7VBRfpQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980521A9FBD;
	Thu, 18 Sep 2025 13:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758202713; cv=none; b=d6eJFt9CSq5MCmBQ+RuGVmB9acGPrvuQBfKBehGyRcSIFj6EWtuBTAJb/jZcCCqWGuAjoulrPaE1bVBaBBBzkr0NN3LhO9kIQeShvRP73uFAVEHj4sRzsFu2FJhb0K5UKqhN5lRG/AI9Q8JNnzBsRU5OAaBfKJ4paDFsMi+wADQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758202713; c=relaxed/simple;
	bh=LE74p65rXice0GYMxN6kn22eWwTEtJcqvbQKKmA72FI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dwC0IjKHNvc7HBfH579j3zbMXWs2ZkxYE0gO9w4uNak7mKaSucfefEvPREIUXdLRK/ZskFhC7z4+2zjbSd0TwF4x1QTix/0vDgDdGfrl5Oitd9u1Wsa6My4sPxaVN2wvUaS5PK53PDxqEiE8VLCGaW801PqOzSf3iUl0bpKjzUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=gbSUnWpG; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=m7VBRfpQ; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cSGtX3nY0z9sXk;
	Thu, 18 Sep 2025 15:38:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758202708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CTXJFZY89W1xIW+68E1GPIDuYngZWsUoGtV6lF3HZgE=;
	b=gbSUnWpGlga7dAHp+tR59sqXxdYxlzPzTWrXK3dOGMDw4YG4AamYv96BBixm0Z7tXlsLRo
	amr8Xmff/RpaRHsCqetcYWhfX5eJJXqZJcL52A5xeMdXMubmhiJiytybbQ5D7EsTlaPZzU
	RPSy5SV1ds2B06BZCPJ6bH8yv0ZaTkrlwfcsvHtFNJDkEQ4IuTrP9C/itBDJsZp1tASbI2
	16/Ia8sQAYFk54bKoJ3seJ+tsvZ7fjYyj3m2C1t74YumoK+yzod+QchXTn0Ecz4BLNk6SC
	Rdo3dsa1IzSKGZJQopvdhp9L6jAM2BF0/yt6Eggxuo+HaqSoAS/z4aSU7h8yZg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=m7VBRfpQ;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <f8dd5b40-ac22-4ce4-8318-4e2877465ddf@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758202706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CTXJFZY89W1xIW+68E1GPIDuYngZWsUoGtV6lF3HZgE=;
	b=m7VBRfpQ4//LHAyLd0dNrwxxq0LF23iXIXQIlz+tGw+DvhfEsNeSztrKUX6YIjsL0F3Wd8
	AWNhvWQeMwg41ytf4+TWeDU9/TWUHNNttdNkoabBfavmVKpyPfj9+6pgfCOYTzkaRNH1pk
	jFUPKmoJzURlT3tNiya+YjlAr4TnL2pCRloigRPUblxdr0piew2YUFltEbkB8A/o4txF8e
	eMHGt95rr+xPTZTq9e3MGBq5SHotV9+OOEqcwoSPPwdjaY8iQLdaozSRjfNMa6UhskUhlL
	PllykY5mFsshAULrr8TGCOgg0VKjQ3OlubwtpZaC3mP/6M8JfBpsE3dGlLtQRw==
Date: Thu, 18 Sep 2025 15:38:24 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
References: <20250918030723.331634-1-marek.vasut+renesas@mailbox.org>
 <aMuh-K8d_d2GETga@shikoro>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aMuh-K8d_d2GETga@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: c407a1be2c49c790d62
X-MBO-RS-META: fzkon8d7dgdp6564iuxarp9kn7e4ro8f
X-Rspamd-Queue-Id: 4cSGtX3nY0z9sXk

On 9/18/25 8:08 AM, Wolfram Sang wrote:
> Hi Marek,

Hello Wolfram,

> thanks for your hard work on the PCIe issue.
> 
>>   	/* Reset module */
>>   	writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
>> +	readl(priv->pub.base0 + priv->reset_regs[reg]);
> 
> Maybe it makes sense to introduce a light helper function
> 'writel_with_latch' or something?

Sure, done in V2 with a bit more deduplication.

> a) we can have a central documentation point to describe why this is
> needed and for which registers

The part which worries me is that I don't have a clear information that 
my hypothesis is correct.

> b) this makes it hopefully more likely that future additions will use
> the helper right away and not forget to latch their access
This is fine by me.

