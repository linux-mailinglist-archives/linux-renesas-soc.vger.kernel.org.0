Return-Path: <linux-renesas-soc+bounces-22034-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F5FB84E43
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 15:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AC891C83E66
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 13:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE35930CB2C;
	Thu, 18 Sep 2025 13:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VFy57kr/";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="KUIa3cke"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBF630C377;
	Thu, 18 Sep 2025 13:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758202979; cv=none; b=sN1NrJXv9zRregZnnlbrglaqmBZuOrt7pD8jbmUNb6vFSSa199pQAHjc+0YpPnfd+0aDkvbM4DX/eWwcj6LFvx6tVutl3S3WaogrscxM204Lvni9DMTOHpq5eRZFAbqng5JGO/PswBD3/wRYX3xXX5i8R20lQ0vPMOU806meeZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758202979; c=relaxed/simple;
	bh=GZe0sxEXk98WkzIWcVhMeCE+7L1gNGBRs4YCaaFsMZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ffCsiJu8Wk8x1XTz+TCYJvy4MmpSnRxivAmC+33lZDupaurVEYSoWkpP8Hxq9btOoNfzGHTDR/PHImIAw6wdoJiuzwcjdz43ypecJVmow98NGyU4e9FbH6uCa7lEJlINBoKicXoafBPKiZ+n9x4e+leQcWzP6bDzHzlcRxsFSng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VFy57kr/; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=KUIa3cke; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cSGzg5yQ1z9s2t;
	Thu, 18 Sep 2025 15:42:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758202975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gZ8xuaSg+Y3ak/XhVzDYdGSf9qdz/gdxWVoVCqGy8fY=;
	b=VFy57kr/2A5GstTpO1JvK1gKFqdohwlNfxIuGAQgBJoFc7qd/OWIaEgV5PYPVB8xXRQpQr
	XEbpoxnkS9p3MEApR7bxc6gAHOoM1JRaDG2/+01SoNqYREHpjnbb0pQ7GqRKE96HccSJPP
	1hvRYKPYZlU6LZLM0E7C7S+4OUxlsPUeXPaqH2K2ccZn8dsBR7kdCnM5Jen9J/suuW/2bd
	Sc6bNFTed6w/WgwptL/b2w1HzKXqwjCXbxKWAQ/E6mscmFEKrwSifNfh20S5oUrymwGqAt
	Crj8wCqMG5hgnGCLzLMGkKw7IESLxp+Ke35eXm5np9YA7oMCXmS/ipCHc6W+Ug==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=KUIa3cke;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <353db156-e518-49c8-96ac-bd138ee64a01@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758202973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gZ8xuaSg+Y3ak/XhVzDYdGSf9qdz/gdxWVoVCqGy8fY=;
	b=KUIa3ckeXWsC2EMndtGsI8JVBZZTgBP6J9EFKmPQ/h1r8mfDFT4UxgoQOE48dVSWJwgqxx
	AXFWtIdgOdHERsb+00jZ+6dgWhC6cZuTW8m/erhtSwGhGBjowTqOCt+my9qcmaMO2tppth
	U+1tn+12vCDQJba5jsx80nbWLBcWvmUCTtVdwPf7QqGXwanOaTges+x/8NZaLy5ZLKLfoa
	Onl/vkS9eeVMWADJNPC6HdwEGPF7LhNNIQYi5TLlCjmKxtuV/nssEI0Y+jGtdOqRxZxj+4
	J3uyroZAZN1bHBZ833+kZOz8/aXtijbGcNtzdRWSaX4WUK5kwcaBZ3XAPaKI2g==
Date: Thu, 18 Sep 2025 15:42:52 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
References: <20250918030723.331634-1-marek.vasut+renesas@mailbox.org>
 <CA+V-a8sjPx8U+MB3v-SxErRPqbz4irAgZhCvd5CHY=6uO_VoyQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CA+V-a8sjPx8U+MB3v-SxErRPqbz4irAgZhCvd5CHY=6uO_VoyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: h5d8tsnith6i63wqmopobtg47ngkp9g1
X-MBO-RS-ID: 99ac9da3a84910e1d60
X-Rspamd-Queue-Id: 4cSGzg5yQ1z9s2t

On 9/18/25 1:11 PM, Lad, Prabhakar wrote:

Hello Prabhakar,

>> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
>> index 65dfaceea71f..7b52e8235984 100644
>> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
>> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
>> @@ -688,6 +688,7 @@ static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
>>
>>          /* Reset module */
>>          writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
>> +       readl(priv->pub.base0 + priv->reset_regs[reg]);
> Fyi on the RZ/T2H and RZ/N2H SoCs which uses the same driver we need
> to read the reset register `7` times and confirm [0] (as mentioned in
> the HW manual). So after reading do we want to confirm the bit is
> set/clear?
This is interesting, I wonder if the readback is something more common 
to this reset controller.

Why 7 times ? Is this documented in one of the HW manuals ? Are those 
public and can you share a link to them , with the specific chapter or 
page I should read about this 7 times read requirement ?

