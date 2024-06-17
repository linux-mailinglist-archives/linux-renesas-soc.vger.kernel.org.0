Return-Path: <linux-renesas-soc+bounces-6324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7326A90A75E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 09:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2573C1F22550
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 07:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D37AE190498;
	Mon, 17 Jun 2024 07:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="CD1ALidB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B9A18FDA1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 07:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718609657; cv=none; b=aNOXMKtf2g8SrBxowCmXYi9/L5ju0uBcJl9UBmzPLcQmndkc99AyAWzQ4wJw0g85I3ZmqZP2m9V1NAGNqk+LTnwEcWcVnXhbgtSQIjqvDBH+EcLSxDML+pfK8AWa2Uykuo8Pw2BRmLOAMT6NDnUS9RiP6HE1seE2P5VQSFJDHS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718609657; c=relaxed/simple;
	bh=zeWiuilCPHFFpyWvuMbpXBQefcVonCeBKJtUM5B3kRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gh5dOZ37c2erDov9YldcofS2E7HqqT6FRu3SDvakpALKQA28mSsl35qyWyjnum+LFcrj/COuet55iEpO/hJoivxnYSER8WSV5A/UW3EWPcRagVabteXbKNEfIBeRV6oT8EFWJGgSMj9qcGTTFAa69PW/NHIVtT3xGUauo7WthrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=CD1ALidB; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52c84a21c62so4607520e87.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 00:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718609654; x=1719214454; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AClyXU1pi3aF85OV5YDv3ie7wh1G6ZH8NgIWnD9i/jI=;
        b=CD1ALidB2NBE+jyz18WgTrkyh1PcGsIpx0OD1yxDjw8IhXyMEC9nW9gzCqJNKMgAFy
         b2tM/7cMPIlzx3cDlRx9vIEZyuxazR0Cmm5F30Tps65sxf9BXKk9QyXLBV5qIyeVEQ82
         8avBt4ggoF0IobsaHiK2Wn7ZU999KDtOKmrC5xaWLLUuBuqLjDrBpkoVNluj6zZEI7TL
         3r10AC84w9zLhG0FFKhWGILoJdPlj50nAIewh4kv+1QaNZ8hIUSj8GUSk9hSAKRmE+/R
         viyKPF1SsmQxglIgBB5Yee3FHsMH3IgbLkUtRxEJpmj+K4QyGTjl03GsdnQa/TYCl3re
         npWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718609654; x=1719214454;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AClyXU1pi3aF85OV5YDv3ie7wh1G6ZH8NgIWnD9i/jI=;
        b=N6hh96eCOyzeGEvoFgXsYN08bloDonjaXxlQa1I+rA8aJufp9fsFPFrpPLwI5iP65p
         WLVylG9IROf+8FV2KjQqkSJhF5qcrzHC0zcdmfVIYiedq0tnMbAyEFUUKKiYFmxyLK/w
         JvvwCye0vp7ELW6NNwsGJMAppMZ0IF0Sx2xw3nfrrCq9PYRqlInnL/U2+ExusoTmvq0u
         iV79wx5rlBL/s+JShxgCe71+QLc9UT7JXE1TN5ElGy5k7/ydwwMS7RuD2cZBtBcCV2fN
         0tfXNkwhP82KVk4Jwh4FzjgkXHU9CM1L/M5JEed76vWFfeI3dRpm5vKZC/a92j8Lig0a
         NpJg==
X-Gm-Message-State: AOJu0Yyw9Nx90NyUyYzESnUgblP9qBuE8BomDSzguJZ4X1T8bpzDB4Eu
	V7lYXSL4kn8PAd5ZNxeVzpS4k0LMaHTySoDDX0aQVsLuNCPzq4Q6uaky8iWl8Tc=
X-Google-Smtp-Source: AGHT+IHUlZ9yVF0/d21oqhr/RhfPE4nfbgHcDlIeSpz0UE5KNmeRW7vE44kzi3qUrQ4kCBqjj8nN7Q==
X-Received: by 2002:a19:6a02:0:b0:52c:81fc:eba2 with SMTP id 2adb3069b0e04-52ca6e91456mr5494441e87.44.1718609654566;
        Mon, 17 Jun 2024 00:34:14 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360751037b6sm11240074f8f.98.2024.06.17.00.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 00:34:14 -0700 (PDT)
Message-ID: <035457e2-c1ea-4a9d-9bbe-486f74074cdb@tuxon.dev>
Date: Mon, 17 Jun 2024 10:34:12 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] dt-bindings: clock: renesas,rzg3s-vbattb-clk:
 Document the VBATTB clock driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, geert+renesas@glider.be,
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 alexandre.belloni@bootlin.com, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
 <20240614071932.1014067-3-claudiu.beznea.uj@bp.renesas.com>
 <dfb0680e-7592-48dc-b4a3-5aec3a6bb188@kernel.org>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <dfb0680e-7592-48dc-b4a3-5aec3a6bb188@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 16.06.2024 10:38, Krzysztof Kozlowski wrote:
> On 14/06/2024 09:19, Claudiu wrote:
>> +    #include <dt-bindings/clock/r9a08g045-cpg.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    vbattb: vbattb@1005c000 {
>> +        compatible = "renesas,rzg3s-vbattb", "syscon", "simple-mfd";
>> +        reg = <0x1005c000 0x1000>;
>> +        ranges = <0 0 0x1005c000 0 0x1000>;
>> +        interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-names = "tampdi";
>> +        clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>;
>> +        clock-names = "bclk";
>> +        power-domains = <&cpg>;
>> +        resets = <&cpg R9A08G045_VBAT_BRESETN>;
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +        status = "disabled";
> 
> Drop.

OK.

> 
> And keep only one complete example, instead of two. See other complex
> devices as example.
Do you have in mind an example that you can point me to?

Thank you,
Claudiu Beznea

> 
> 
> Best regards,
> Krzysztof
> 

