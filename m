Return-Path: <linux-renesas-soc+bounces-6318-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE87990A6FB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 09:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF0031C2118C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 07:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3640018C346;
	Mon, 17 Jun 2024 07:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="oW3VgMqQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8207018C326
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 07:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718609158; cv=none; b=U+WfivrKhMDyHfgHqs0/21hJ06nN+H8tOBg/5UL3tx8/mKtlvjUqsbCb9mI02mrepTSD8GzKs+ZEh/gPy+UMf4FAlLclRNaZdZ3Ls9cjbGNgSmamreL8LeQYSl7fS5gzBRA51J1IDK8vD0prrIW3Lo+0BJ6fSPmt3H//tPjQpEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718609158; c=relaxed/simple;
	bh=01nt3v2c8G2IiILApGwbkBZuWwC/TMiw7VCqBF9jxWE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=e3767Rm23PUyrXUE7lXMuC0s1qPm+/7+5e8pkFZxCvqFHyorGqEl9hajU6OqJ8lYen1NCaMAQZVLa2tJJ4RQEGK+xckgTIkaR+KQm4qz2+oCRCIzzK+k9XIEbpU7fxIPNnpTFFLb6OVbAa0oA0f1tb2SZmUAWsqTD68ezPyPxnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=oW3VgMqQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42172ab4b60so35833865e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 00:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718609155; x=1719213955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VAGQjlSoVmUhRRPnFle/Cilr5/xRtzCzsi0PLTzdHq4=;
        b=oW3VgMqQNtSiePkY2uDEjluvv23KE1a0AxzDMX3/uZcdHiIxEEPRtsw56j2i4n/HBX
         QAEig5e+seANcvLv4032NifwT4NUB5nSsS+N+4CR/6JNgsJ5xktwAC0zlr8t/OM8xqtT
         BGuaRi0pBczOrfZWavRb4ukmbB6DDU/rZymTqi/7VV5Ja5X3gEl4CMCAVUVwHezGYrrc
         v1qXhbFWV0d5nPdy5HNYU4c+wf05WGYKsU679QLfRepYvPxg/W9XY/CS47KgD9fVzmyS
         N0ST04PIPWdJlpykW93WrWtu9VrCXarvyuTZ4UNggM9QnuyObwj5u2yT87+ZDb7OSgX1
         GKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718609155; x=1719213955;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VAGQjlSoVmUhRRPnFle/Cilr5/xRtzCzsi0PLTzdHq4=;
        b=ELPM0DZt47RL56Byr0e0aueNZ0AMDRYOSWta0hyf5+ffyO+4U5mcdbPhvqm4lN8NgO
         6cLh+cl62gyLEi/0Xf8W/GJoCzK+v/AFKVXjGAoaiJao3K4B/XEErI6fsYd3lLKX9ayx
         cet2aVaX/mdJ9XlfTsQzYhQ4T9Zzb7A+/j8Rc3V2F0nji0jfd232yv5kWO1B7KoHj9jN
         8n7ai1cxE2nw449mXpBGxRxX6TP7XIRlCYcj6xeXoihjnc0dHsjjURZ7TRcw+LfsijHR
         WuiyaTf0l9W/v0IR8/RC5FWNOU+CafIjmLH8C5trY4TfmPMHL+xtNzi0FYLcIdixkxV1
         60jA==
X-Gm-Message-State: AOJu0YyXieqjZhhKRVDAzP0/22iARHawZxJqg2LWmMUFsHyf+vo0iU3F
	s1dfMSM4ChEABNvEBqgV1GknWycZS590dj4N+QOc+vA2psn7gZAdUOZ8bpHRqM0=
X-Google-Smtp-Source: AGHT+IHGTLig64RZScCxEgxVs7DaULrPVWEgwJ03TPdeRQTj+7cL+VH6g1Og+GMfyv9gu7deldJu4w==
X-Received: by 2002:a05:600c:3107:b0:423:499:a1ce with SMTP id 5b1f17b1804b1-42304d934c4mr82449965e9.32.1718609154783;
        Mon, 17 Jun 2024 00:25:54 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f641a64bsm151553735e9.46.2024.06.17.00.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 00:25:54 -0700 (PDT)
Message-ID: <f0f77eda-b7f4-4a3b-a0e6-a3d5a78419fb@tuxon.dev>
Date: Mon, 17 Jun 2024 10:25:52 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] dt-bindings: mfd: renesas,rzg3s-vbattb: Document
 VBATTB
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
To: Krzysztof Kozlowski <krzk@kernel.org>, geert+renesas@glider.be,
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 alexandre.belloni@bootlin.com, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
 <20240614071932.1014067-4-claudiu.beznea.uj@bp.renesas.com>
 <936beb9a-2701-476c-8f5a-4b6b06d4f87d@kernel.org>
 <c882bac6-9cb9-4ba2-9bc4-967c03fcb031@tuxon.dev>
In-Reply-To: <c882bac6-9cb9-4ba2-9bc4-967c03fcb031@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 17.06.2024 10:16, claudiu beznea wrote:
> 
> 
> On 16.06.2024 10:38, Krzysztof Kozlowski wrote:
>> On 14/06/2024 09:19, Claudiu wrote:
>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>>> +
>>> +maintainers:
>>> +  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - const: renesas,rzg3s-vbattb
>>> +      - const: syscon
>>> +      - const: simple-mfd
>>
>> No, mfd does no look good. That's not a simple device anymore and you
>> claim here child does not need vbat bclk, power domains and resets? That
>> would be a big surprise, although technically possible.
> 
> I wasn't sure how this MFD will be received by the Renesas maintainers so I
> kept it simple for this version.
> 
> In theory the VBAT clk, power domain and resets are specific to VBAT module
> itself but, indeed, the child cannot work w/o these.
> 
>>
>> Please clarify: which of parent resources are needed for children?
> 
> VBAT clock, power domain are needed. Reset, too. In the current
> implementation the reset is deasserted though parent by calling the
> syscon_node_to_regmap(np->parent) in the clock driver.
> 
>>
>> ...
>>
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/r9a08g045-cpg.h>
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +
>>> +    vbattb: vbattb@1005c000 {
>>> +        compatible = "renesas,rzg3s-vbattb", "syscon", "simple-mfd";
>>> +        reg = <0x1005c000 0x1000>;
>>> +        ranges = <0 0 0x1005c000 0 0x1000>;
>>> +        interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
>>> +        interrupt-names = "tampdi";
>>> +        clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>;
>>> +        clock-names = "bclk";
>>> +        power-domains = <&cpg>;
>>> +        resets = <&cpg R9A08G045_VBAT_BRESETN>;
>>> +        #address-cells = <2>;
>>> +        #size-cells = <2>;
>>> +        status = "disabled";
>>
>> Drop
> 
> Could you please clarify this? Would you want me to drop the full node
> (same for clock-controller node)?

Looking at your review on patch 05/12 from this series I noticed you're
taking about the status = "disabled" lines.

I'll drop it as suggested.

Thank you,
Claudiu Beznea

> 
> Can you point me an example that you are thinking about?
> 
> Thank you,
> Claudiu Beznea
> 
>>
>>> +
>>> +        vbattclk: clock-controller@1c {
>>> +            compatible = "renesas,rzg3s-vbattb-clk";
>>> +            reg = <0 0x1c 0 0x10>;
>>> +            clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb_xtal>;
>>> +            clock-names = "bclk", "vbattb_xtal";
>>> +            #clock-cells = <0>;
>>> +            power-domains = <&cpg>;
>>> +            status = "disabled";
>>
>> Drop
>>
>>> +        };
>>> +    };
>>> +
>>> +...
>>
>> Best regards,
>> Krzysztof
>>

