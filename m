Return-Path: <linux-renesas-soc+bounces-16834-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D781EAB10C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 12:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18ADE188AC67
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 10:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2304A28F521;
	Fri,  9 May 2025 10:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ik+AR7KN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533C128ECE9
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 May 2025 10:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746786598; cv=none; b=cWEwI2Y0ymOm6q0Yu3rWpp+aB0x42XUk9mNe9RUeeJUczH5rPgIX5AdaffAc+vT9A8gjOYUqvvdxZ6gWPlmi6iu+B3c/EMtTmWNbsYkbMNn2Lj/HG0djqFYumaVjPWV1W1syuBKSxxSS6vsqN7885oR0PO+OGQyUL2m79/If/o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746786598; c=relaxed/simple;
	bh=Bgh8+VpXWqodyRXBeHA1Dsg9667GzQ82hiWcMQGPrYY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=H5X0cfZcEOIEjxWSWklQPaIzps/WQI0SH75SjNY3zhnThUptAJEk+j10cnyuRZXTzxU4E44jbUzvtRbMzCH0TfdfvoWlOANdPLSnIDENiCgUJdrRwh/rXawD5soZp8GlA287VroQKgqi0WYb9/kAc6IpgAbXaK78MeGQVpnEmF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ik+AR7KN; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2c663a3daso380302766b.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 May 2025 03:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746786593; x=1747391393; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OxDhZkSCewSzQX7ua1xIREYWkVFp8sJWfjRRBdflZuc=;
        b=ik+AR7KNGnBn9y1sm8nJT0BUk2ad8+MTQG+Zj/kPTqDMzwb9/7c3HJN3BbrqmV88ji
         fhLaTqr9mLgHqJHFyxjePOFEjm5m6wAGRxbiCO3gzi2OTIXhNQxYvTCo+w1rdOyJI7Yc
         Rv81GmdVqvORuYBzlItvlNvHnpJhfl+5JvxwuTqrzNJk40zaASfr29rg0oN29QeYmi+W
         UdWhQetoOAfTpPoJ/CGyJs6x6Whl2ftDFLAGC9QS4gChCkPt7IaSbA80VzpiP++R2HQP
         p2WUH0SRAkV/o7Lp59OzQFfRd9xVVpRmepECPdzH+cTH6bE36NFbI7QgtoeqygTYBQil
         BHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746786593; x=1747391393;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OxDhZkSCewSzQX7ua1xIREYWkVFp8sJWfjRRBdflZuc=;
        b=XhjSRF++w5VCFbGQ5PUSDxxhbHyVovSB/v0v1QCrMezFS4ZcPlq1pjxnm1iguJQ2N+
         zJAmpp4PdrYfISn52PiKtfTjXRuW605JL3lybR8flHa4tqb3B/Ap5s13UOn54SBxto5m
         U8T6Iuxvfyxbd7q9m3A6bXMbotcJ6FORemVuksKvPj7CUBoVeYjGbahUAz6UAFhKU/dS
         wwghAcAyI2DnL3dkiiMAWYBJawBC8t0kwyg7jnFUwQslbarsVbrpJUuZaXgK5gvOci1X
         kyH0sIh55adiP8Ntj+014RpdqT7TNerKUgcEjD88sHPfDaNa7/OGd+fFZ9F57jHEg2sC
         VSNg==
X-Forwarded-Encrypted: i=1; AJvYcCW9mw7VSRe1xJN633lhPzdFFAtUGiMpRLuyb6/NSH4afPPdOqd5TicwkY+nnfDqiQ+vEXwqwwBt49g9TEirKy7Jjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/CActBLq9gdLFuTJwpIY4185MDTHbztHUu/Qx8KBXGfqn0ERE
	yQNw7erHesVI+W2M2PzWfwODlf87jGwhmF35VRGHgm25hkiGqP7Z1js2hfyN+49N3UyJ+pRVIai
	0
X-Gm-Gg: ASbGncvqCLW/phv46s+3x1olTaUM46hNQ8A8RkIriqPl0d0s9KIMMMcWwHHysadfc1X
	6wujh4Ot4+yTc/RqR2zA7edvdiq86rE232oq8WtiJIuk/yr6rF33VRdpYzRYU/cell0JTRfq6ja
	kiu9KOmFYqkgUZi/jRYwYwo4Nmh6ManvVYqe1ZLKNGTAyLZ3h95JvYz+txaM3ZteqwiprtZsoMN
	gy6okdg5rTtJ4ydvH4YSupz+w/jcRdAqbhOAHJR+h0UVtWtQhjkbYNqE3aVVXnT9EKRApmZ91Y5
	dgHjlE3opuTnwFkCrBwUVi4R2tEmuC/XhEU6Qyr07meUGPck
X-Google-Smtp-Source: AGHT+IEJa8UJZWqTw9Q0EAr9PxAZseg++6SUc4a2N49f6rYLuvjP7U+hvo7avLnkTy2C6pjkRuSQbA==
X-Received: by 2002:a17:906:c102:b0:acb:711d:36c8 with SMTP id a640c23a62f3a-ad219170decmr305473466b.38.1746786583223;
        Fri, 09 May 2025 03:29:43 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd3easm129122566b.147.2025.05.09.03.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 03:29:42 -0700 (PDT)
Message-ID: <869269a7-8267-45f3-9e4d-678de18c0888@tuxon.dev>
Date: Fri, 9 May 2025 13:29:40 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] PCI: rzg3s-host: Add Initial PCIe Host Driver for
 Renesas RZ/G3S SoC
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
 manivannan.sadhasivam@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, saravanak@google.com,
 p.zabel@pengutronix.de, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250501201211.GA768334@bhelgaas>
 <26bdfbd6-7bf5-4688-b793-5d0f613d340b@tuxon.dev>
Content-Language: en-US
In-Reply-To: <26bdfbd6-7bf5-4688-b793-5d0f613d340b@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Bjorn,

On 05.05.2025 14:26, Claudiu Beznea wrote:
> Hi, Bjorn,
> 
> On 01.05.2025 23:12, Bjorn Helgaas wrote:
>> On Wed, Apr 30, 2025 at 01:32:33PM +0300, Claudiu wrote:
>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
>>> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
>>> only as a root complex, with a single-lane (x1) configuration. The
>>> controller includes Type 1 configuration registers, as well as IP
>>> specific registers (called AXI registers) required for various adjustments.
>>>
>>> Other Renesas RZ SoCs (e.g., RZ/G3E, RZ/V2H) share the same AXI registers
>>> but have both Root Complex and Endpoint capabilities. As a result, the PCIe
>>> host driver can be reused for these variants with minimal adjustments.
>>
>> I guess this current driver only supports RZ/GS3 in Root Complex mode?
> 
> That's right.
> 
>> If so, I don't think this paragraph is necessary or really relevant.
> 
> OK, I'll drop it.
> 
>>
>>> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
>>> @@ -0,0 +1,1561 @@
>>
>> I can't figure out the line width you're using.  Generally code in
>> drivers/pci/ is formatted to fit in 80 columns.  Much of this file is
>> formatted for that, but there are many cases that seem to use 90 or
>> 100 columns.
> 
> I formated it at 100 columns where the lines were longer. I wasn't aware
> the PCI rule is to have line formated at 80 columns. I'll switch to it in
> the next version.
> 
>>
>> For single-line comments that are not a sentence or are a single
>> sentence, it's typical to omit the period at end.
> 
> I'll follow this rule, too.
> 
>>
>>> +static void rzg3s_pcie_update_bits(void __iomem *base, u32 offset, u32 mask, u32 val)
>>> +{
>>> +	u32 tmp;
>>> +
>>> +	tmp = readl(base + offset);
>>> +	tmp &= ~mask;
>>> +	tmp |= val & mask;
>>> +	writel(tmp, base + offset);
>>> +}
>>
>> Nothing rzg3s-specific here.
>>
>> I think u32p_replace_bits() (include/linux/bitfield.h) is basically this.
> 
> I wasn't aware of it. I'll use it in the next version. Thank for pointing it.

I look into changing to u32p_replace_bits() but this one needs a mask that
can be verified at build time. It cannot be used directly in this function.
Would you prefer me to replace all the calls to rzg3s_pcie_update_bits() with:

tmp = readl();
u32p_replace_bits(&tmp, ...)
writel(tmp);

or is it OK for you to keep it as is?

Thank you,
Claudiu

