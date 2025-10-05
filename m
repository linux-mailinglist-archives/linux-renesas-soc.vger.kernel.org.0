Return-Path: <linux-renesas-soc+bounces-22654-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E893BB93EE
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 05 Oct 2025 06:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2DBA64E10D0
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Oct 2025 04:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B594CA93D;
	Sun,  5 Oct 2025 04:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ASNtZo5o";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hlFr1UtA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3642E2905;
	Sun,  5 Oct 2025 04:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759636824; cv=none; b=q5wKYRCksIf09z7rdVtrnya34z+GM6gEAuNZ88lpiLF+bc9B0PCGT+IcJtlnFaOuNvbPheOFPy8IwnSSl/MaKiJTRH4iIB6bReG5aejHsJbwTOFyaMh9nhzuHkgircDQU7SNawt1GaKNRVNWuUTnNPt5jBPWmAY6gF2v59hdd8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759636824; c=relaxed/simple;
	bh=wlnCOX+67XfaGMGbG87kU4jUOi+a6CQ+UrR3wEyKfOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HGVTc6rnHelOOO7PGJ7oqTEHjdgSFf8q9QPb3ZozAJEGBxFUrmK+Lu1w6943EMu4MOWM7YQwnz3eoNpUyqvzwJBeluOdn5njVcwKsIHC9JxaIb1N8279YoyEwBhu6/xdzVtmA+stzpJ4nb3dD4/3L63Yk79YaX1e6Ew0BR3z9lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ASNtZo5o; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hlFr1UtA; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cfTFc1pwVz9vQh;
	Sun,  5 Oct 2025 06:00:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1759636820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VL6nAJwaC7sCapEGrJW3fRmB2emPVD690TICEO6QHUY=;
	b=ASNtZo5oUa1ORzy+mFsdTmnFIjgJ20lP2GSUBWoKJcaiA+tY4QUZVp8iXKhZ8HoHvoATZ4
	/+r236NqQvEo6/tEdBhaBKmM6qWYqF4Q08IMW8Z7aT4j0njCCWgXw2RF7rFUxZfpWKj2iI
	zbdpVa7gqkbHgLyE83bYObHriArctfMSDVLi4I4fK/FykpEeCGRfrCcAPFCpHxrnFrKKHV
	63VO+9Pt4ekdhIgdSaNGypnb5R1U7B4kvbCvc9Kw8Ti6Q2jH8dT6jCBSxDrye0ogyDhOVT
	BSkuRNLXs4qWm2KGec15HCCpVCayfFPKiiEgLPz8+b5XVoImKAH//CzF20lDug==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=hlFr1UtA;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <a59212ef-3555-4003-9c71-4ac80eac5cc8@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1759636818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VL6nAJwaC7sCapEGrJW3fRmB2emPVD690TICEO6QHUY=;
	b=hlFr1UtA5U/TgM367Udb8BFIUoD23rroBhaeYjWH0arKGVYTyT02XYOraynVgyM29FMeqg
	8HF+QV8F5HWJBMEb973kcL/7skhG1FGG1VAysH2wa4b4HvGVSNG++KJPf7emRNi7tJALe1
	F3+GlzEy4mGc+79R5uSPLXCu0oz+Vaxp96wBW+JU2cEseIYIsBsThQtrCHjsAHxOR4KIKq
	IaM/sAyiO+U2ZWTbfjiXdV5DY+1q0KmWHe0P6A8N142hZxg9L7mQLMI8/L8y+aDdCdM90+
	0kuqf8BlxZJIJUOL9lgelQVy2uv3cCtn4oyuYF4BsB90AAS+1blIwxXp9aMcvw==
Date: Sun, 5 Oct 2025 06:00:15 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add missing 1ms delay into reset
 toggle callback
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
References: <20250918030552.331389-1-marek.vasut+renesas@mailbox.org>
 <20251003150819.GC344149@ragnatech.se>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251003150819.GC344149@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: n7n5ydiyq3aym6bh6pgzdinfktk5apcm
X-MBO-RS-ID: 94e2aca0927c824e8c3
X-Rspamd-Queue-Id: 4cfTFc1pwVz9vQh

On 10/3/25 5:08 PM, Niklas Söderlund wrote:

Hello Niklas,

> On 2025-09-18 05:04:43 +0200, Marek Vasut wrote:
>> R-Car V4H Reference Manual R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 page 583
>> Figure 9.3.1(a) Software Reset flow (A) as well as flow (B) / (C) indicate
>> after reset has been asserted by writing a matching reset bit into register
>> SRCR, it is mandatory to wait 1ms.
>>
>> This 1ms delay is documented on R-Car V4H and V4M, it is currently unclear
>> whether S4 is affected as well. This patch does apply the extra delay on
>> R-Car S4 as well.
>>
>> Fix the reset driver to respect the additional delay when toggling resets.
>> Drivers which use separate reset_control_(de)assert() must assure matching
>> delay in their driver code.
>>
>> Fixes: 0ab55cf18341 ("clk: renesas: cpg-mssr: Add support for R-Car V4H")
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Michael Turquette <mturquette@baylibre.com>
>> Cc: Stephen Boyd <sboyd@kernel.org>
>> Cc: linux-clk@vger.kernel.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>>   drivers/clk/renesas/renesas-cpg-mssr.c | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
>> index be9f59e6975d..65dfaceea71f 100644
>> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
>> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
>> @@ -689,8 +689,15 @@ static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
>>   	/* Reset module */
>>   	writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
>>   
>> -	/* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
>> -	udelay(35);
>> +	/*
>> +	 * On R-Car Gen4, delay after SRCR has been written is 1ms.
>> +	 * On older SoCs, delay after SRCR has been written is 35us
>> +	 * (one cycle of the RCLK clock @ cca. 32 kHz).
>> +	 */
>> +	if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4)
>> +		usleep_range(1000, 2000);
>> +	else
>> +		usleep_range(35, 1000);
> 
> I rebased the R-Car ISP work to renesas-drivers today and it included
> this change, and I seem to have hit an issue with the switch form
> udelay() to usleep_range() I'm afraid. I can't find any other good
> reproducer of the issue however.
> 
> THe core of the issue seems to be that if a reset is issued from an
> atomic context bad things happen if you try to sleep. I get this splat
> and the board is completer dead after it, needing a power cycle to
> recover.
> 
> If I revert this patch things work as expected.
Thank you for testing. Does it work well if you replace those 
usleep_range()s with plain udelay() ?

