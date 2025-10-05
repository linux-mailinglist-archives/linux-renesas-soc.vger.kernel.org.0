Return-Path: <linux-renesas-soc+bounces-22664-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85631BB9734
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 05 Oct 2025 15:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDE423BCA74
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Oct 2025 13:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10F30126C1E;
	Sun,  5 Oct 2025 13:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="YPEDkdym";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Pn6f0bnX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BF01400E;
	Sun,  5 Oct 2025 13:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759670231; cv=none; b=kaDOKx08slgYoLVt0LRgI0ina4lFdR0MfcyqJoSAA7ePIECYIVOig4NjLSVjlYyfBXVUtXIQM3f6kz4W4wJ1/1pimGxMesGn3oDd5KpAXZbbMN+fVi2YQyA0IaV+BDMlPIaU5th7PXaRVLfrT+wqJCpmvxsBr3M+T+xdgdZZiXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759670231; c=relaxed/simple;
	bh=8kXCECZbBNlbt+z3+ZKP2DWagAhSrqJvwvm14hpHidI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nSHGeZ7/Y0thJMWFbsYNaFD7ITjqJ6oAh5yCF91I2iSkR2c25r2d98O+PIIZx/JcPdj4oIwVljT1Y3E3kCdhnKgtMV2vNpJS2FTYttg7pdnKQIugaMaPtXZs51k9KmrQ2v7mTgeAvZ4Scna7X1XMZxef0220S8Nx4m2qlTKQjSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=YPEDkdym; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Pn6f0bnX; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cfjc20bRXz9vPD;
	Sun,  5 Oct 2025 15:17:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1759670226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GXDQaZ70i3QHUEwWtTisUZgi0y8mkeUVbAMFP2egUrU=;
	b=YPEDkdymvWKcgq4vTceuOrAbYWpuC71SNPNKvrkiM/lFDqfMpOLy3RANgcVq+EsJBQk+kL
	iOEXQbSDNjg3I/D63XYVq8618YXt1B8v6mRwBg/FTbej+dOzBIJCdybcAXfY34AUzJjdkJ
	Z7s6Y2fFZjaygC+gGbs/+9wXueMjXJX+tF7IIFsQVeF+vnZjR+TrZ1LaTsKFEi07RieXDW
	1uVtHUowFB+bRQ/yck5u3GDhIVw+KlrtC/pksJ8eoFFYLoPnQmnM5gX44nMblmkmB8/PoM
	EksOhDicXjxY+4Q2sT1exeifzZgwGdGmR5kwlX6/6OceJKyxcn/5RLamPvo+Zw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Pn6f0bnX;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <d3d7a87c-889a-4e63-8a38-8cbea7383ee0@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1759670224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GXDQaZ70i3QHUEwWtTisUZgi0y8mkeUVbAMFP2egUrU=;
	b=Pn6f0bnX61QbpRhpQhvd1IQRCjzV42gjbV5oNlaoFsPlQz1qCjEpAI17u85wmf9pE2ME/E
	FRMZXfRsDps9AaIBmqkmdHiyn6NkzIi5MEkhsrpVwcmcqLZiZERiDTfhGIypyk7+AJo3td
	07r8rxQYLhk6dqDiwQZguiD2+3jNrq+YZIx6DEsfbZ11egpGP8R50VQy/Rm8Qtx68iQiPf
	Kc2c3v596RQqSvvPkhsdTNsCw8lj3ZcAWuwQ0UpBhHEuVFDPifkTggmh5MV+jfUPlg1FiD
	hPmAECx5O6C+nR0nIus3nP1dK43rs6OclF9/kBtv7K/LmZbTrXfcQ6zmq8xsPw==
Date: Sun, 5 Oct 2025 15:17:02 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add missing 1ms delay into reset
 toggle callback
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-clk@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
References: <20250918030552.331389-1-marek.vasut+renesas@mailbox.org>
 <20251003150819.GC344149@ragnatech.se>
 <a59212ef-3555-4003-9c71-4ac80eac5cc8@mailbox.org>
 <20251005071219.GD399701@ragnatech.se>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251005071219.GD399701@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: xopbkeckn4y864544w9htuxqmsds7xnp
X-MBO-RS-ID: 74b467b182c878cf70d
X-Rspamd-Queue-Id: 4cfjc20bRXz9vPD

On 10/5/25 9:12 AM, Niklas Söderlund wrote:

Hello Niklas,

> On 2025-10-05 06:00:15 +0200, Marek Vasut wrote:
>> On 10/3/25 5:08 PM, Niklas Söderlund wrote:
>>
>> Hello Niklas,
>>
>>> On 2025-09-18 05:04:43 +0200, Marek Vasut wrote:
>>>> R-Car V4H Reference Manual R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 page 583
>>>> Figure 9.3.1(a) Software Reset flow (A) as well as flow (B) / (C) indicate
>>>> after reset has been asserted by writing a matching reset bit into register
>>>> SRCR, it is mandatory to wait 1ms.
>>>>
>>>> This 1ms delay is documented on R-Car V4H and V4M, it is currently unclear
>>>> whether S4 is affected as well. This patch does apply the extra delay on
>>>> R-Car S4 as well.
>>>>
>>>> Fix the reset driver to respect the additional delay when toggling resets.
>>>> Drivers which use separate reset_control_(de)assert() must assure matching
>>>> delay in their driver code.
>>>>
>>>> Fixes: 0ab55cf18341 ("clk: renesas: cpg-mssr: Add support for R-Car V4H")
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>> ---
>>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>>> Cc: Michael Turquette <mturquette@baylibre.com>
>>>> Cc: Stephen Boyd <sboyd@kernel.org>
>>>> Cc: linux-clk@vger.kernel.org
>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>> ---
>>>>    drivers/clk/renesas/renesas-cpg-mssr.c | 11 +++++++++--
>>>>    1 file changed, 9 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
>>>> index be9f59e6975d..65dfaceea71f 100644
>>>> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
>>>> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
>>>> @@ -689,8 +689,15 @@ static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
>>>>    	/* Reset module */
>>>>    	writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
>>>> -	/* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
>>>> -	udelay(35);
>>>> +	/*
>>>> +	 * On R-Car Gen4, delay after SRCR has been written is 1ms.
>>>> +	 * On older SoCs, delay after SRCR has been written is 35us
>>>> +	 * (one cycle of the RCLK clock @ cca. 32 kHz).
>>>> +	 */
>>>> +	if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4)
>>>> +		usleep_range(1000, 2000);
>>>> +	else
>>>> +		usleep_range(35, 1000);
>>>
>>> I rebased the R-Car ISP work to renesas-drivers today and it included
>>> this change, and I seem to have hit an issue with the switch form
>>> udelay() to usleep_range() I'm afraid. I can't find any other good
>>> reproducer of the issue however.
>>>
>>> THe core of the issue seems to be that if a reset is issued from an
>>> atomic context bad things happen if you try to sleep. I get this splat
>>> and the board is completer dead after it, needing a power cycle to
>>> recover.
>>>
>>> If I revert this patch things work as expected.
>> Thank you for testing. Does it work well if you replace those
>> usleep_range()s with plain udelay() ?
> 
> With this change it do work. I'm testing on V4H so I assume it's the
> Gen4 branch that is taken here?
Yes it is.

I sent a V2 of this with udelay(), thank you for testing.

I do wonder, would it be better if risp used 
reset_assert()/reset_deassert() when performing reset in atomic context 
? Also, why is it even performing reset in atomic context ?

