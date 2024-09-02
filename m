Return-Path: <linux-renesas-soc+bounces-8614-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F473968A71
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Sep 2024 16:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01B551F22B46
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Sep 2024 14:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3542210191;
	Mon,  2 Sep 2024 14:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Zl0uvYjT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FDE21018F
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Sep 2024 14:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725288924; cv=none; b=LcofQXPrBmKNY4FGJNA1DDmdSkH8FrnJhfdv+3nq4Zc8XNNr9k0vh5iGlwyBehwTOvbP0axMstnEGQNVvlNr9/21ekmIzkQAGNeXjK2HlwLtfRIJAoZ7jx/RXG3Cv4QFmjOpogzY3LcVxfKCO/bMc5SaVxrA0KhTZM20+nYUEac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725288924; c=relaxed/simple;
	bh=8SlZUFryXJrm68jQ50NWK0B6fJBIRODDLJSlDmtuRMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MZqMruTrL6jt+A50uUOnZXG9BuPfy36m32JhIgUWN7ZI9p20I4rch1anPdkR4eBe9ROEo7CTq/CYIjtv6SUUH+FYXqmrxnEGw2IkMJmKXlbyUU/nlCPUfUXQsjkvSWl9J5y/Q0KRAvKLb879Ku6RDjPHxluM5jh0dGiBlDA6O80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Zl0uvYjT; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a8695cc91c8so432557566b.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Sep 2024 07:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725288921; x=1725893721; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Naf0XscJRnO2TJWmGa7OVEJLkB3kuTYZUkolR4Kul4=;
        b=Zl0uvYjTgdKVxIshwt/xykbntOLOUVd4w0PMVaLNpYFhU/2K3/pH6xww4DZQ7nY4QG
         SdXSw4YuBCAYS1vbCYpOfzUtVokwuhUllWJHUO98K+sIbH6XLMFD+aiS9yHv0RdEPQo8
         CuyzcF/x6k/zoFquYQEhZPiH7ywTOgHA364QE8j8I1V1wl9e6cQy4QCKk0gzSEJy6Uo4
         sHFHU9J+VLee/jIhLrZzfC3vz1J9dsVTqqZP7ybFYQdpZ+nnucR0xPXg2e78kStGoKn9
         ZboSDt7R2K09dmTasEapNpncx4LK+6xVP/+IXyMAOMAPkN12iNpLsT7gadxkgY7ilrlQ
         UZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725288921; x=1725893721;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Naf0XscJRnO2TJWmGa7OVEJLkB3kuTYZUkolR4Kul4=;
        b=gMB10l3RE8WxilsiAqE5tP1GiavX8r5juE3Wgg8xhCJFmD1BxR5fZMfvegsAAhPCX5
         ad/CVchTIzVRZcmPi5hFCPwPvhmwPfSLAzJaqz31WjuO//kBvgOa/OB4Ia9z+eO0+8oB
         W0XiRuk5dVMW0QKez1/6YYT9nBg/zRgzhd9Xa/nQMxm3xLPZXs2PsrHcLUY2oORAAMP5
         S90dYTlX6kJaVIdwp/0JjyVVY0/TFH2uO5zJD+KVmelVkTY6dD+9LVnc2vcn2H23E7ou
         bk38Wyz2oWKkM5uwug5BOiLCkfOdKGCKE3TDxck+LkkLOS2rrnc/j9zOVSWTN/kjysxJ
         xrbw==
X-Forwarded-Encrypted: i=1; AJvYcCX0HX5SYSZEBheie9rd3bIom05p6BFGFaslsRYKYWDlb9ZNXy0JVSR6aARs8qdAlNxr8eqtc2pT0PSUlWlIuaVscw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx+Zfa6QZWY2n/t1hqqFVeJwWIIkwoMBUzX+LD8ya1GaHfqTjd
	QT15qVg8yh7udZb8niTPPly1f2+sS1BJAfg+5s827EM70DQ2KXsQDPzI40T0Egs=
X-Google-Smtp-Source: AGHT+IH88P2UchQfuyJn4Ig/8aL8sFGLYB2Le79fmkAMZIjuFdt4o/On+vh4v2Bfc56FcpWJDt9N3A==
X-Received: by 2002:a17:906:6a09:b0:a7d:9f92:9107 with SMTP id a640c23a62f3a-a897fad4ec9mr1154579666b.58.1725288920667;
        Mon, 02 Sep 2024 07:55:20 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989196980sm566454166b.126.2024.09.02.07.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 07:55:20 -0700 (PDT)
Message-ID: <e307b4a9-09ba-4200-98f7-1a830e3e0fb8@tuxon.dev>
Date: Mon, 2 Sep 2024 17:55:18 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] dt-bindings: clock: renesas,r9a08g045-vbattb:
 Document VBATTB
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
 p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
 <20240830130218.3377060-2-claudiu.beznea.uj@bp.renesas.com>
 <20240830174633.GA559043-robh@kernel.org> <20240830220644b8b36293@mail.local>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240830220644b8b36293@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 31.08.2024 01:06, Alexandre Belloni wrote:
> On 30/08/2024 12:46:33-0500, Rob Herring wrote:
>> On Fri, Aug 30, 2024 at 04:02:07PM +0300, Claudiu wrote:
>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock for RTC,
>>> the tamper detector and a small general usage memory of 128B. Add
>>> documentation for it.
>>>
>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>> ---
>>>
>>> Changes in v3:
>>> - moved the file to clock dt bindings directory as it is the
>>>   only functionality supported at the moment; the other functionalities
>>>   (tamper detector, SRAM) are offered though register spreaded
>>>   though the address space of the VBATTB IP and not actually
>>>   individual devices; the other functionalities are not
>>>   planned to be supported soon and if they will be I think they
>>>   fit better on auxiliary bus than MFD
>>> - dropped interrupt names as requested in the review process
>>> - dropped the inner node for clock controller
>>> - added #clock-cells
>>> - added rtx clock
>>> - updated description for renesas,vbattb-load-nanofarads
>>> - included dt-bindings/interrupt-controller/irq.h in examples section
>>>
>>> Changes in v2:
>>> - changed file name and compatible
>>> - updated title, description sections
>>> - added clock controller part documentation and drop dedicated file
>>>   for it included in v1
>>> - used items to describe interrupts, interrupt-names, clocks, clock-names,
>>>   resets
>>> - dropped node labels and status
>>> - updated clock-names for clock controller to cope with the new
>>>   logic on detecting the necessity to setup bypass
>>>
>>>  .../clock/renesas,r9a08g045-vbattb.yaml       | 81 +++++++++++++++++++
>>>  1 file changed, 81 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml b/Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
>>> new file mode 100644
>>> index 000000000000..29df0e01fae5
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
>>> @@ -0,0 +1,81 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/clock/renesas,r9a08g045-vbattb.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Renesas Battery Backup Function (VBATTB)
>>> +
>>> +description:
>>> +  Renesas VBATTB is an always on powered module (backed by battery) which
>>> +  controls the RTC clock (VBATTCLK), tamper detection logic and a small
>>> +  general usage memory (128B).
>>> +
>>> +maintainers:
>>> +  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: renesas,r9a08g045-vbattb
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    items:
>>> +      - description: tamper detector interrupt
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: VBATTB module clock
>>> +      - description: RTC input clock (crystal oscillator or external clock device)
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: bclk
>>> +      - const: rtx
>>> +
>>> +  '#clock-cells':
>>> +    const: 1
>>> +
>>> +  power-domains:
>>> +    maxItems: 1
>>> +
>>> +  resets:
>>> +    items:
>>> +      - description: VBATTB module reset
>>> +
>>> +  renesas,vbattb-load-nanofarads:
>>
>> Use defined units, don't add your own. So -picofarads should work for 
>> you.
> 
> We have a generic quartz-load-femtofarads property for RTCs which is
> what you define because the driver has VBATTB_XOSCCR_XSEL_4_PF which I
> guess is 4 pF which is 0.004 nF and 4000 fF.

I'll use this one in the next version.

Thank you for your review,
Claudiu Beznea

> 
>>
>>> +    description: load capacitance of the on board crystal oscillator
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    enum: [ 4000, 7000, 9000, 12500 ]
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - interrupts
>>> +  - clocks
>>> +  - clock-names
>>> +  - '#clock-cells'
>>> +  - power-domains
>>> +  - resets
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/r9a08g045-cpg.h>
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>> +
>>> +    vbattb@1005c000 {
>>
>> clock-controller@...
>>
>>> +        compatible = "renesas,r9a08g045-vbattb";
>>> +        reg = <0x1005c000 0x1000>;
>>> +        interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
>>> +        clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb_xtal>;
>>> +        clock-names = "bclk", "rtx";
>>> +        #clock-cells = <1>;
>>> +        power-domains = <&cpg>;
>>> +        resets = <&cpg R9A08G045_VBAT_BRESETN>;
>>> +        renesas,vbattb-load-nanofarads = <12500>;
>>> +    };
>>> -- 
>>> 2.39.2
>>>
> 

