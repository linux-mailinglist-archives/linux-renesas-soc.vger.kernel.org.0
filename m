Return-Path: <linux-renesas-soc+bounces-6316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 660F790A6DD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 09:20:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BFE61C250CC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 07:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834E718C322;
	Mon, 17 Jun 2024 07:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="HLCfSLSr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF854188CC2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 07:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718608801; cv=none; b=ueryRnRTRBwmpSJ6mTIUDIcxbGRfs6vCzRl6kjRVZn4rdZoplcbWMwAJ7g7Os1L0UeiyplJEk+vLIPYUfeWUFqW5zimwXSRua2CIfRgnS3rbvvaqgs/V057DetMSFCPISphmYmYZbVZCVMHPl14fBxqQkW9puR/SKwjZqt7w+cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718608801; c=relaxed/simple;
	bh=c+CjBespsozkl/hbKd5LlHMHMFUXXbK2hmkdWbYlXtc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ghGlrWHquFyNrq3SKBfM1P/Z0zQcwnGJctVgJz8Ptp3tIMU2jtwKD+kPHr2TjM8XkslajoIiqTgEyWgfbJnOMPGCPir6icMuwbWdxeSDyeZtYdeWgYaPdxWHCi2Are7LlVmY2eXc8VoarauSKhTbHkf/dvAKdXwnRv2s32uLhlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=HLCfSLSr; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-35f1bc63981so3041473f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 00:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718608798; x=1719213598; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Tab2IYdHp6eDoo6cWzEE1Fk/6i2xco+HgcNyr6amI8=;
        b=HLCfSLSrDxg9+y5mp5CCYXjmdjuX/K72dQH7Foo3NtAezoJ3jrStDN1rZG7stZftOn
         yqXy0bfALOQxRCPswM30W3sOIGsmWV+Oa0OdSlRh2AetFfClj7X+12YKrnCltY6fkLMI
         cLkZYuFLOPjKDBXtFjupEzcoL3ckYblvZRYe3dVJJXOTlOdPOPyRdU9xzcPt+SuKO7uW
         RT6T4Mpi631uy44FSenPKXIm9yhxjRADjVGrIOgV3eXWqG30eQ/8+oRVBBEcbtP1IPAE
         eg6d0WmZG4A2Rl+phk2JUl/Rpj3qkC6gpoS2s8np1dRaboaZ94veCZMMTv9B6yHjkUi0
         aguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718608798; x=1719213598;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Tab2IYdHp6eDoo6cWzEE1Fk/6i2xco+HgcNyr6amI8=;
        b=VEb2xUfgLMCCeJvVM3hLXQCUT8t8OrTNd+oGgeWkA1x46zoxoaj2kgPa6ZKQmeZJJ9
         5+JgsSgTf4vPy3wSqjJRdd8BdM92hFsy6YKyxFWT+W0Gz21X4OBSyBlVULvVtRxci2a5
         VSdRa28oTgDQ42DwLB/FmZa+4U40tK3p7offtjECuL7Twk7DuJQK9ManCHp2lDfD6UKX
         4D5JuRU1OUu2iqRvWkEZ6yZYwyzk0KILluFJ+IzrBrkHxtvvlFuQBkRrazj0xjlJJkGK
         VhUvvxCUJzMelV3Jz/lWSwbgu/cpbTIb/LxrbFomUQh5soEnzRQwfYOcj/WQ+iwWJTMM
         GM1g==
X-Forwarded-Encrypted: i=1; AJvYcCWhBJXbRQ7BIygva6TXYW9soWzPSWBX8891CiQKtxgLaH5cTRp6Du16ea87z0cYWhLIHl2NJAfV9RapiMgcpZow7qUt+IwmHq92AIl0GzdDooo=
X-Gm-Message-State: AOJu0YxKNvHQlHh+XCNXbViCp2KvqSYfcSYOE75cG4fmi9eKRrMP1SYi
	HJii4hdRKnHxVK02rXx1gNCNyCHJtWGYymyvrNoWqIt4Bs+/dBPUCSMPvqGCqHY=
X-Google-Smtp-Source: AGHT+IHbwhH/VddMC+zVrrDdtAOvUQdyzGBIoHvhoB0F8F6pIHkpvfyUbpHuousSx8SxIn7Pcd9sjw==
X-Received: by 2002:adf:ee90:0:b0:360:728d:840c with SMTP id ffacd0b85a97d-360728d8598mr11238048f8f.2.1718608798025;
        Mon, 17 Jun 2024 00:19:58 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286eef970sm185922645e9.10.2024.06.17.00.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 00:19:57 -0700 (PDT)
Message-ID: <7768f3e5-0574-4d9b-baff-8a35792cc854@tuxon.dev>
Date: Mon, 17 Jun 2024 10:19:55 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] dt-bindings: rtc: renesas,rzg3s-rtc: Document the
 Renesas RZ/G3S RTC
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 alexandre.belloni@bootlin.com, magnus.damm@gmail.com,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
 <20240614071932.1014067-6-claudiu.beznea.uj@bp.renesas.com>
 <20240615-clench-turbofan-024a14939897@spud>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240615-clench-turbofan-024a14939897@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 15.06.2024 15:20, Conor Dooley wrote:
> On Fri, Jun 14, 2024 at 10:19:25AM +0300, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Document the RTC IP (RTCA-3) available on the Renesas RZ/G3S SoC.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>  .../bindings/rtc/renesas,rzg3s-rtc.yaml       | 60 +++++++++++++++++++
>>  1 file changed, 60 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rzg3s-rtc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzg3s-rtc.yaml b/Documentation/devicetree/bindings/rtc/renesas,rzg3s-rtc.yaml
>> new file mode 100644
>> index 000000000000..0e17f8a36155
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rtc/renesas,rzg3s-rtc.yaml
>> @@ -0,0 +1,60 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/rtc/renesas,rzg3s-rtc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Real Time Clock for Renesas RZ/G3S SoC
>> +
>> +maintainers:
>> +  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> +
> 
> Missing a ref to adc.yaml,

I guess you mean rtc.yaml?

I missed that rtc.yaml. I'll update it.

> or can this rtc not serve as a wakeup-source
> or use any of the common properties?

It can act as wakeup-source but not for all the supported power save modes.

> 
> Cheers,
> Conor.
> 
>> +properties:
>> +  compatible:
>> +    const: renesas,rzg3s-rtc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 3
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: alarm
>> +      - const: period
>> +      - const: carry
>> +
>> +  clocks:
>> +    maxItems: 1
>> +    description: RTC counter clock
>> +
>> +  clock-names:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - interrupt-names
>> +  - clocks
>> +  - clock-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    rtc: rtc@1004ec00 {
>> +        compatible = "renesas,rzg3s-rtc";
>> +        reg = <0x1004ec00 0x400>;
>> +        interrupts = <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-names = "alarm", "period", "carry";
>> +        clocks = <&vbattclk>;
>> +        clock-names = "counter";
>> +        status = "disabled";
>> +    };
>> -- 
>> 2.39.2
>>

