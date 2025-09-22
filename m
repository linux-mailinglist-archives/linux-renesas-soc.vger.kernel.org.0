Return-Path: <linux-renesas-soc+bounces-22174-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 543FFB9236C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 18:24:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 234727A2B9D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 16:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D013112DB;
	Mon, 22 Sep 2025 16:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="X5tILOzJ";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="YyK1ST7o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746733112B6;
	Mon, 22 Sep 2025 16:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758558255; cv=none; b=kue2ip6J02+GbV6FRA56y0q00cjuAI2kZQ2UOztbxcC+CM765mAKyl7QfIPX8ZDv2VBAwPczaYWtC2cFGJsn5TDhqXfQ7cisqaUkCLcdSI2krJ8Wq0VNDOmpticP+jjDpWiglJZRM1eESvMgM+Duyi5gItvOAw+S2y2v2ghJJf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758558255; c=relaxed/simple;
	bh=W67bb5xeAKFD4WCeyNYvkxIaDMl2y52xZkQejnTNGDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kfKKKKkMT9Q7hXCiERCIE1GnuZ99Koq5rZ/4ucByOF0Ka66U8UTOV5VXo2t6wV6E+U+zq7Ql2qnHf4vQ7Lz5oZs2yd6uKf7G7P2QYJ/vpBSbKMAvMkOtV70pGM8jz7nteyK4LqYYRIJHIIAHdil3lJ30a/SBfDxSMFl4Q5rN2AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=X5tILOzJ; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=YyK1ST7o; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cVpMv4Kh5z9ssn;
	Mon, 22 Sep 2025 18:24:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758558251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BmryXecZqKgG8YIjdIfh3974+nF+dOHXJtr8s2DrvYA=;
	b=X5tILOzJ10dSZRDPuissL2Md6+nNcfNNrYKVXciXm0s7OT1bRcsgQahXeeafexCNP0Xcj7
	LB5BPTJ2NTci7VTtDONg2D5QNSoN0uAFoHtaMDSCDmvP0wfqSeXwL8U+Xcc9f/R+NGTb27
	TzHlhgQxtcULy+x/pnmCkX2B33JFwFRgUFfk+f+v2+DAbwMsrwQkTvoBTwgwC2ahkKK+93
	7GyOFvtGSRAyrd2zUzHp/4OYyGMIUCcsho4h71QsxyBb333IleCtRoZ2whMwWFD7+LNpCX
	aAL6uXf0jOzxlcwe4AZOADMKxPQr7HQPqu2YtTLCYjUkNg93Se6gzIYCYZwWhg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=YyK1ST7o;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <196d5c6d-0bd6-4dd5-b3ea-c8166b2bd830@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758558249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BmryXecZqKgG8YIjdIfh3974+nF+dOHXJtr8s2DrvYA=;
	b=YyK1ST7otpjwIFGeNTOCqfE4981N9nYdM5iTdK1M7W7RV7WimQTZra9E7KNvR5Nq2GsOu3
	Yr9jPALMG5sEZcKS3iQbw9DAiz5M79qkIhMvlP1aGyqXNOLUudOaSNUReAltKHKwCLAG6M
	LaPV5gqrt4D6VQD7A21DGl86nJc/CdzSR5qM9CPb2HDA/3nrd0Cq49qbfnAq7zcZGBZ7xV
	fP2VM8Q1X6xz0I8f8uRyxMh+IdbWlY9Tv+FUMrV2lZNHqCPzeI0OxXeiYjQGY4i6gnN3ya
	xyi8o7yJaYMvyRmQky/fMFLpFqqhvvUZXd+bUVpSTxWQgl4xR3Soy7IKzET9yg==
Date: Mon, 22 Sep 2025 18:24:08 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
References: <20250918134526.18929-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdWncCJQ_5uiATC+JhGr8K2ewO72L0DTWXtcx-OF-P=zVQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdWncCJQ_5uiATC+JhGr8K2ewO72L0DTWXtcx-OF-P=zVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: jnc1m8ydpxy71fpzg6ij6fuwoh7wr1aa
X-MBO-RS-ID: d2deca2706d36c40ebe
X-Rspamd-Queue-Id: 4cVpMv4Kh5z9ssn

On 9/22/25 1:35 PM, Geert Uytterhoeven wrote:

Hello Geert,

>> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
>> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
>> @@ -676,18 +676,31 @@ static int __init cpg_mssr_add_clk_domain(struct device *dev,
>>
>>   #define rcdev_to_priv(x)       container_of(x, struct cpg_mssr_priv, rcdev)
>>
>> -static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
>> -                         unsigned long id)
>> +static int cpg_mssr_writel_with_latch(struct reset_controller_dev *rcdev,
>> +                                     char *func, bool set, unsigned long id)
> 
> This function does a bit more than writel()-with-latch, so please find
> a more suitable name. Or... continue reading.

I did so in V4.

>>   {
>>          struct cpg_mssr_priv *priv = rcdev_to_priv(rcdev);
>>          unsigned int reg = id / 32;
>>          unsigned int bit = id % 32;
>> +       const u16 reset_reg = set ? priv->reset_regs[reg] : priv->reset_clear_regs[reg];
>>          u32 bitmask = BIT(bit);
>>
>> -       dev_dbg(priv->dev, "reset %u%02u\n", reg, bit);
>> +       if (func)
>> +               dev_dbg(priv->dev, "%s %u%02u\n", func, reg, bit);
>> +
>> +       writel(bitmask, priv->pub.base0 + reset_reg);
>> +       readl(priv->pub.base0 + reset_reg);
>> +
>> +       return 0;
>> +}
> 
> Now, do we want a special de(reset)-with-latch() function (which does
> reduce code duplication), or would a simpler variant be more useful?
> After this, we have three different "dummy read" mechanisms in this
> driver:
> 
>    1. Clock enable/disable and resume on RZ/A:
> 
>           writeb(value, priv->pub.base0 + priv->control_regs[reg]);
> 
>           /* dummy read to ensure write has completed */
>           readb(priv->pub.base0 + priv->control_regs[reg]);
>           barrier_data(priv->pub.base0 + priv->control_regs[reg]);
> 
>    2. Reset handling on R-Car:
> 
>           writel(bitmask, priv->pub.base0 + reset_reg);
>           readl(priv->pub.base0 + reset_reg);
> 
>    3. Reset release on RZ/T2H and RZ/N2H:

Maybe T2H support is not yet upstream , even in next ?

In any case, 2 and 3 could be merged into single write-and-latch function.

>           writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> 
>           /*
>            * To secure processing after release from a module reset, dummy read
>            * the same register at least seven times.
>            */
>           for (i = 0; i < 7; i++)
>                   readl(priv->pub.base0 + priv->reset_regs[reg]);
> 
> So perhaps a simple helper like
> 
>      void writel_with_latch(u32 val, volatile void __iomem *addr, unsigned int n)
>      {
>              writel(val, addr);
>              while (n-- > 0)
>                      readl(addr);
>      }
> 
> ? Do we need barrier_data(), like on RZ/A?

I think so.

> Unfortunately RZ/A uses byte-wide registers, so that one needs another
> copy.
> 
>> +
>> +static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
>> +                         unsigned long id)
>> +{
>> +       struct cpg_mssr_priv *priv = rcdev_to_priv(rcdev);
> 
> "priv" is unused (no compiler warning on your side?)
I also have [PATCH] clk: renesas: cpg-mssr: Add missing 1ms delay into 
reset toggle callback applied in tree, rebase was not accurate, dropped 
in V4.

