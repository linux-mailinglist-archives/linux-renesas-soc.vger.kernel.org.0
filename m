Return-Path: <linux-renesas-soc+bounces-22076-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 630BBB896A5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Sep 2025 14:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95DF57BE74C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Sep 2025 12:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E2B30FF3A;
	Fri, 19 Sep 2025 12:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="aTLVuzXq";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xcU5dyp9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D8B30EF97;
	Fri, 19 Sep 2025 12:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758284380; cv=none; b=fVclTzzBVjwdAEWlsh+s/K9nvlUtU+fDFhfSAuGR/W76tZnX60Akh5DkPaYb8S26wFSr6iytmhuiY1myBwTp2tWcli6XGsGAKIhyR4tNAUTLFcCU6IWAkfXn+GlkxKX3QS25zpVIehOqBxtt0zS0+uLkw0nvm3fPHtQREYKeWug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758284380; c=relaxed/simple;
	bh=s61a/yp1wfMmIUuIrqwP0YUZ7l3wMSZcSYjOwEKNHUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PxBRnt+S2RAt+jPPdeX9azen0V9vL+6P1tamaj1qc+AoVD1ocP2NSdN6HpG8g4v0jU7yoim2w5nyAsJgf9nO/eLMTN50rplFTzE7Efxd5YLV1t9rS5TZGBeVcXzeA/NaM52uQ9he+gTAp5xTET5LQ3HGjKmgx+hyt+whluPapdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=aTLVuzXq; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xcU5dyp9; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cSs4z2Bcqz9sdH;
	Fri, 19 Sep 2025 14:19:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758284371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C7OrMoU3Lsx8RxrhmwIrFS2FblgYqLM3hYfHo+fqPTY=;
	b=aTLVuzXq3ROwHxW2eNcQacyCs+kz/fDnTENfKXEWfr0gxGWDiJvsnW4qMJWHt+21PmcduT
	zek9vtlBxsjTSuUq+XTBZvsKozF2EEsDS6GSHO5gq0z3Ut8+5ykC9XUl1ICwDFPQFSxk5i
	ynfbR1M0f4ikztt1joLqMXk4mHdZ5U44yS9OirvisFGqkuMRHI9MaK+6N9WSH1WjZD3jnt
	kyNun+FOffU0J0b6JN8cuF36SBmuBIkknjfzPwwr13AdW6rMCQWq9KyJuscvWAc/oec9fB
	Rt8v3d0TEr1KjyOnTcbOXB5wysgzw4On8DUvEzc14ZsJsjj7OC9n7A0j6W/rGA==
Message-ID: <066d5882-89d4-4d10-a054-4d0fdec88cd7@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758284369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C7OrMoU3Lsx8RxrhmwIrFS2FblgYqLM3hYfHo+fqPTY=;
	b=xcU5dyp9uWVB/WfyYLifydQLi/tumthbNNJdKmXXQ1sH6XSRIOV5j5jjnSClX+vnD6mFyL
	tZa78pqfJ9AUv6pEEAjlRjNXjSGiAT9vbRcDwrH+oH+ZswcEYYTT8TJkSiZcZi8DTTNLIF
	ZgU4l02hnToKJjDHBiWT5m1AwNvQqJqrrwIEdmYOW4BTqkZyfuCrI5Juu8VFkQpLV2/9lv
	1+CP/zGTm5BlW2y+6AaWSttL2+Sn2AUJcGwtBtxY+3EVNoKJ2vdO/5vGZ7+x/v/iClTCSj
	KEVzQf7ueSHcn9xnjcbDMvmf04yfFZ0qc4pAbRYAKvlTLRh8dMrINqvm6v3vUw==
Date: Fri, 19 Sep 2025 14:19:27 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-clk@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
References: <20250918030723.331634-1-marek.vasut+renesas@mailbox.org>
 <CA+V-a8sjPx8U+MB3v-SxErRPqbz4irAgZhCvd5CHY=6uO_VoyQ@mail.gmail.com>
 <353db156-e518-49c8-96ac-bd138ee64a01@mailbox.org>
 <CA+V-a8sLxBq8vSuq2HxcchpLqyQxqTRtkWjUKsRN9tBqGhU7mw@mail.gmail.com>
 <CAMuHMdXN2=0KRhBy-pW_ah7mL6iU+8O9pGD20dhSxk4-5R5ckg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdXN2=0KRhBy-pW_ah7mL6iU+8O9pGD20dhSxk4-5R5ckg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: dajori9jqiuixj5uegaj8bufk5wprot8
X-MBO-RS-ID: fd5d281c595cb7b9d5a

On 9/19/25 9:21 AM, Geert Uytterhoeven wrote:

Hello Geert,

> On Thu, 18 Sept 2025 at 17:05, Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
>> On Thu, Sep 18, 2025 at 2:42 PM Marek Vasut <marek.vasut@mailbox.org> wrote:
>>> On 9/18/25 1:11 PM, Lad, Prabhakar wrote:
>>>>> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
>>>>> index 65dfaceea71f..7b52e8235984 100644
>>>>> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
>>>>> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
>>>>> @@ -688,6 +688,7 @@ static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
>>>>>
>>>>>           /* Reset module */
>>>>>           writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
>>>>> +       readl(priv->pub.base0 + priv->reset_regs[reg]);
>>>> Fyi on the RZ/T2H and RZ/N2H SoCs which uses the same driver we need
>>>> to read the reset register `7` times and confirm [0] (as mentioned in
>>>> the HW manual). So after reading do we want to confirm the bit is
>>>> set/clear?
>>> This is interesting, I wonder if the readback is something more common
>>> to this reset controller.
>>>
>>> Why 7 times ? Is this documented in one of the HW manuals ? Are those
>>> public and can you share a link to them , with the specific chapter or
>>> page I should read about this 7 times read requirement ?
>>>
>> Yes this is documented in the HW manual [0] section 6.5.1 Notes on
>> Module Reset Control Register Operation:
>>
>> 1. To secure processing after release from a module reset, dummy read
>> the same register at least seven times except RTC
>> and LCDC after writing to initiate release from the module reset, and
>> only then proceed with the subsequent processing.
>> For RTC, dummy read the same register at least 300 times and for LCDC,
>> at least 100 times.
> 
> Ugh, the number of times depends on the module to reset :-(
> Do we need #reset-cells = <2> to encode the number?

This does seem like an reference manual issue and will be updated.

However, it also seems if this encoding of per-reset properties is 
necessary in the future, it would be better to have reset property 
tables (similar to clock property tables) in the kernel instead of 
encoding the per-reset properties in DT?

-- 
Best regards,
Marek Vasut

