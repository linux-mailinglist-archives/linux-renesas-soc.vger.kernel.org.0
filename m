Return-Path: <linux-renesas-soc+bounces-20146-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B73F8B1E73B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 13:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E08934E34CF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 11:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A7327A133;
	Fri,  8 Aug 2025 11:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fN9GHOOf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E8A275854
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Aug 2025 11:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754652288; cv=none; b=oxdln1uOHEq/6PeuK6ofgoEPNTtArd80w5ZIV6EgEtDwOG7OabwsWzGvYrbPPozQ97RkY5mrLF8whieKUT7ZS/5zZGF9VpmvX+EBuXcZCl6XJy7BqePqbNyiyH+EFbtUDhgdVWOwmok4erEqN2SgM8+/nnlu+qlfCnipnMF+Cco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754652288; c=relaxed/simple;
	bh=tdqmTZskz+yQCU0OtNWJ7hb3SLauZy7LX8Gd3jyLS4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VEx1IL87a6r5AjmCrOPhXuO1tsC3LKjVF94NmlAQsg48/8YTUpf/eHwgSxmFKA1dMcIDRE+sOKeFWc2s9qMRlf5nKL6Z3p7Tum97eeHnRuACeBjMEHXx0h1HrvV9tgNywhsIB0WNcVqqEi+ZuIGFAvpQ5Rvqj99l/Id/70UIjrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fN9GHOOf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4563cfac2d2so16748725e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Aug 2025 04:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754652285; x=1755257085; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WDaDKFrE9tePMwqIpXfK3gAKisGxx+wlPAiFTrZ+JsA=;
        b=fN9GHOOff3ZEYCkEguHUtX8uGA0gAEZF67S3H+eextsE/KrKMpS1HFfVm/Q/Hf8dSd
         EaIz3Bxxa6hXvRNGpAjtqCgcNmT1nIwRJcZcI+Zhy0iO+tJ4HqxL7zo6W2PBxzGANZkv
         NSk6tPHvj1kBAfo5igO9cOejjMtv9LsyVBMMMdeJw5Efe1gCCdNhhBLaDBUYcyZJYmWr
         aIx7qnHovjrVuEm/BbShu2n9m5m2/y6zZdo0diZL3qyym22CfSBQHA77RpswFKDrqpF8
         xxBwLfAm47whs8aXsUmU+mhcPHTlPIieoPS/VmvVQgQy8rYAJxDupii152uNWYHfVTj6
         jKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754652285; x=1755257085;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WDaDKFrE9tePMwqIpXfK3gAKisGxx+wlPAiFTrZ+JsA=;
        b=JpNCFqRZvEyvRdUdsTXYIeTnZT7FqQF+d6UW6+nv5fX8EDncXtwKvGUFq1Mnxqbaus
         9SwQ9hXIxAJCArD2UMzbfKbrD8rIKPjysBy1++Bg7WPBtuwd6xe9qRK0QjmO7l/AAHcL
         0WiX+5cuwPSFnK8SLmFSEd8bq+Fdt/x5ov5mJPCluJNev6GtCeGhqfHm85dejTfobisl
         se6nQ/szz3zXHiiBq96XZ36XcQ6NqKLFwTIysbeY0KE5qY89sFOfMOf7JweyMfsT9jrl
         uz9u3RVJtNkxjW5MVGV0QpnPJwIQUdVqjzibhK65s50deA5arI6uLrKZsZ8bAvV47pbN
         Fysg==
X-Forwarded-Encrypted: i=1; AJvYcCUplQlWxu0aDZgmjUWxPFLw86u77zlL3bPi+Tfg8DSd0a6cEOLGAjCbxCsXt/LhIZxJbMRLuWGxXHuugY5zjTXTLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwraCQR5SnhF2ikVl3Gb/9YZhUHi62BhCsKe2Z7jcyIutjDMOtJ
	NhHMUMum9NAKf55VQuHBor7ebz7etnL8mCocDGisIuke5599yUu5XtxdP82qgLMoUwo=
X-Gm-Gg: ASbGncuCUZK4LZoSWW5HmgUBZIY40DOlnLvbVkyx8tM8ZArXzRTXnFH32XuCFQNZBY8
	P3PTRgoq6hnSTO06KfvNwJXALWf1DhpLi/QTiIrSSFn/nBPqw8aqvtomxKKw/rRcN7IItPM4Xq8
	giDilVxFi5Swh9o+c1dFmiPxBaZ5mlvmZgwA16oXZX+IX/Pxk/5oHd0NExxLH8rwk8x22D1WO+Z
	FtwrwSoqeH3+GX5DiBTGjH7VUqJtpc0cJ/tZ+w1Xzo3AhznZvKTRgZ8+lfztbQ/s7Gun6H8xuDf
	l6bsJNbZCM4z8adfFrjyqwpu5UAclEdEUWLWjZbH0riu+eM6qSfm+oiARS8K/yyAw8TDx9mvj9D
	eocN+deEhML8NM1KoxU/9PxSBq0mJLYA=
X-Google-Smtp-Source: AGHT+IGFc+AaIxGFA2SLKc1CBodgdE5FKKCWRuNF/M1Z18xEptVX+bZf7YDkhLJM8Nb3ewYalAQT8w==
X-Received: by 2002:a05:600c:4f4b:b0:456:f1e:205c with SMTP id 5b1f17b1804b1-459f4e9df86mr24463835e9.4.1754652284753;
        Fri, 08 Aug 2025 04:24:44 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm128153435e9.6.2025.08.08.04.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 04:24:44 -0700 (PDT)
Message-ID: <efdf5d48-c105-4e1b-8dbe-14706302aa2d@tuxon.dev>
Date: Fri, 8 Aug 2025 14:24:42 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/9] arm64: dts: renesas: rzg3s-smarc-som: Update
 dma-ranges for PCIe
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, lizhi.hou@amd.com, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250708165540.GA2148533@bhelgaas>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250708165540.GA2148533@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Bjorn,

On 08.07.2025 19:55, Bjorn Helgaas wrote:
> On Fri, Jul 04, 2025 at 07:14:07PM +0300, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The first 128MB of memory is reserved on this board for secure area.
>> Update the PCIe dma-ranges property to reflect this.
> 
> Can we include a sentence or two about what the "secure area" means?

I'll update it.

Basically, it is a RAM region that is used by firmware.

Thank you for your review,
Claudiu

> I don't know how to connect this with anything in the driver.
> 
>> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v3:
>> - collected tags
>>
>> Changes in v2:
>> - none, this patch is new
>>
>>  arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
>> index 39845faec894..1b03820a6f02 100644
>> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
>> @@ -214,6 +214,11 @@ &sdhi2 {
>>  };
>>  #endif
>>  
>> +&pcie {
>> +	/* First 128MB is reserved for secure area. */
>> +	dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0x0 0x38000000>;
>> +};
>> +
>>  &pinctrl {
>>  #if SW_CONFIG3 == SW_ON
>>  	eth0-phy-irq-hog {
>> -- 
>> 2.43.0
>>


