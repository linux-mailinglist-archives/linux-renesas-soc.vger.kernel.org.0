Return-Path: <linux-renesas-soc+bounces-22052-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E55B8757F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Sep 2025 01:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEAC35241D4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 23:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA60221287;
	Thu, 18 Sep 2025 23:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="iFz3ieaZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BE04A2D;
	Thu, 18 Sep 2025 23:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758237410; cv=none; b=ngj1sPbzUfVgxoy+mu5pqQHsvktVzpU0baWMcW1yUp5ZYya0vtsYaHeL8q7Nqn6v66RtkpF3FpCaXADej0jgPgmVwybcq0iOpNBLmgHmixzHQZIOpOD4CiO1fHDBshTmzOValBRLtCJHArObTHR+NqBp75hUJVUcKMTR2vgBP6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758237410; c=relaxed/simple;
	bh=uLe3Rs76NuC3iXyCx+i0ugiqXnSkTMOx8ZjqX3d1DYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZdjWUVawcCHjVmCerq8niayigNDaGL9LoQSvGnpf7t9wdi/FOF3NXDOp7sAroRF9rCblafrQWSrI14WkW4oAcTPO4qyWt13fioBE7jxrT7N0i/ssi+SrppnLKI+NaHBvghWEg+p2RNmS93S4tYXa7eupVEFT6yKDBvkryMmY5AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=iFz3ieaZ; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cSWjf6qD8z9sss;
	Fri, 19 Sep 2025 01:16:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758237399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AWpAqgCZ+Kq1EB4cSge6b9M96CwK6u9PPFoE3ETCiRI=;
	b=iFz3ieaZ6lgdPd4WmncLZbbrMxReE9O39AOS9Y81ZD2w4AQE0ecl24zru2u4eTCB1SiDHi
	OrBtr6sY8oqL1qJ5Dz8iF7UDbKr0ySC4Mgb+M8uUc2Lb6kLPYLZrxm/1jVZE17+Gjs2tau
	f+/j7VTG8+v0huPg/oQybpmss64z9KJgs+fh+i38y8WOizOJ5/4Rk7BpZvepwmRRNLUwAE
	B47c6xpaYBQ4iEpAc3F734DW+5Y0EMDwkexq3o/x2SL84+4F1/EX7mzScWDcwgy3CTWBQB
	al4xx+8pfzrfh7TRtwktCjrlT2z75aXSJI8vQaG+XDaFsziFY9wp0tJXrnU5kw==
Message-ID: <9dbc6022-eb97-49af-bda7-1a7a8069609a@mailbox.org>
Date: Fri, 19 Sep 2025 01:16:37 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: linux-clk@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
References: <20250918030723.331634-1-marek.vasut+renesas@mailbox.org>
 <CA+V-a8sjPx8U+MB3v-SxErRPqbz4irAgZhCvd5CHY=6uO_VoyQ@mail.gmail.com>
 <353db156-e518-49c8-96ac-bd138ee64a01@mailbox.org>
 <CA+V-a8sLxBq8vSuq2HxcchpLqyQxqTRtkWjUKsRN9tBqGhU7mw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CA+V-a8sLxBq8vSuq2HxcchpLqyQxqTRtkWjUKsRN9tBqGhU7mw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 5ubejjp1t796cok6d6cj5kb96qbkbycs
X-MBO-RS-ID: 4cd4385661fd9ec09cf

On 9/18/25 5:05 PM, Lad, Prabhakar wrote:

Hello Prabhakar,

>>>> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
>>>> index 65dfaceea71f..7b52e8235984 100644
>>>> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
>>>> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
>>>> @@ -688,6 +688,7 @@ static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
>>>>
>>>>           /* Reset module */
>>>>           writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
>>>> +       readl(priv->pub.base0 + priv->reset_regs[reg]);
>>> Fyi on the RZ/T2H and RZ/N2H SoCs which uses the same driver we need
>>> to read the reset register `7` times and confirm [0] (as mentioned in
>>> the HW manual). So after reading do we want to confirm the bit is
>>> set/clear?
>> This is interesting, I wonder if the readback is something more common
>> to this reset controller.
>>
>> Why 7 times ? Is this documented in one of the HW manuals ? Are those
>> public and can you share a link to them , with the specific chapter or
>> page I should read about this 7 times read requirement ?
>>
> Yes this is documented in the HW manual [0] section 6.5.1 Notes on
> Module Reset Control Register Operation:
> 
> 1. To secure processing after release from a module reset, dummy read
> the same register at least seven times except RTC
> and LCDC after writing to initiate release from the module reset, and
> only then proceed with the subsequent processing.
> For RTC, dummy read the same register at least 300 times and for LCDC,
> at least 100 times.
> 
> 2. When module is reset once and released again, make sure that the
> target bit of module reset control register is set to 1 by
> reading the register before releasing from a module reset. Then
> release from a module reset

Thank you for sharing this, but it seems this is not the case for R-Car 
Gen4. I found out that V4H and V4M has additional "synchronized" and 
"asynchronized" reset types according to SRCRn_FSRCHRKRAn attachment to 
the V4H RM. The PCIe resets are "asynchronized". This extra readl() 
added in this patch is turning all the resets into "synchronized" and 
therefore makes them behave as expected.

