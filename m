Return-Path: <linux-renesas-soc+bounces-11217-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 486D69ECBF3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 13:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D79642842A3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 12:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E31225A52;
	Wed, 11 Dec 2024 12:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GcnlZ1le"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B66A1C1F10
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Dec 2024 12:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733919792; cv=none; b=nuee2R2tj36xcF17oNmaZpAn0LHByoFkQbD4yXdGI+RoQhpC9wHsLyA+7TG26szRjd/nXgTArNK7105UA86sSuC61Ur4w5izE1p6/qrmRYu3B2AI37aPjXfelXbhesZWDR0VViWfRetBrI9UjSx1S2aOOvg6joMqiNgJZHSVbu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733919792; c=relaxed/simple;
	bh=4LmoThFKiCg6NPxt1pwJQOCUq4Ty9Yrn6QdEkSulcGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jqEIOaG3q5hzbGtV0h/X1LNAebwmQJvM5OAwTrl8D/ceAxN3plipwgmoBOLUuJbtAoqO714Wxy3SPkZwi02PlPX89f6ACt0XQlVzgd7n3BfW/SkTPPcXqDEWmS4tlbNkGafN+WsOSodBolLvfi4fwj9MH88jowYaewAsbNVOMls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=GcnlZ1le; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d122cf8e52so10567133a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Dec 2024 04:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733919788; x=1734524588; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ASQKGpCO7s4KPkalfOXfelNyrTTyYMkGNmfArDEmeBM=;
        b=GcnlZ1leTt1dsahBLq9jtbzrF5Pac0t0OTfPep3wmLSznG3bp99gbGHJykUPgrJa1D
         UbBKKdwv6ytOjGz8rvT5bJwyTntg245NuHeDrgQuQdACLrCM2jtpdTBFihzb90WvxPdi
         4/8WTry2UzERCxS+XDvYeyVviYK1MwUw+NlrhqN2hC18O+KUykMwXzr8jWreVJSjozdt
         6VC2zLm7P9imTSQD3rBbSDQ3yw/DrXP2fcVVFsZ52CMHqa9GcPZRUSjNg5+hjvzFtswU
         ORDmhc4k4297RaMxUDLaYLPPp3uKsgLmnksRvRfYpXkqlS8nEi3l4cuSqAsrjs0IoiRe
         kpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733919788; x=1734524588;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ASQKGpCO7s4KPkalfOXfelNyrTTyYMkGNmfArDEmeBM=;
        b=Aiy1hdaKnpKsJpdhr+QO07Fi9HZyMPyLIzb6h8abymR8cmVyh87BwStf4XBjIM5y0l
         9HQjwfXoMwqlI8LEOG2gvzBCu7pBajtVUdrGcJugW7mo5hW7gvu9EOcEKyLMGepNfjXh
         EG8ws8n2bL5tGLVjEi8zTEcIh2UHD4b9QnflBm62ZYQmY7rfGVMfZe2B9tKrj7bVxTi3
         RH5ZkVDjAg/1lYJyXHx8X/fyJSP3rrdOq3O1Aq42DYTWphs9juR+FSNBevAdEPIexUxr
         cfitwLuAVjRCsE9PCvjnoKSQI/4pxzmEx8DOaf4+R1Np4hzvc0nVopw+VOD3vRdmEPXi
         +faQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSLdEQNZ6/A279USnDlAJnQpKgfMOyWJtoKuW8xsc7bG4EDW6hQYqYjJDfjEWkUExLWWJdhPTccEnTWJkA+FYOLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzihm3kFnL5HN9AgWBPxGjKWEN4/SLkLqryD7nJ9QME1dPP1buc
	qmkqvL+rkQy/KL/VISJHtiVHrsLcdIChHGuBmu6OAGjPmPdvsT/LGLfh7KJpIQg=
X-Gm-Gg: ASbGnctGcaPCRXkTVxG2lbQIwe03puWAUHzyMMmhV05Ql7UbOUfSces93JXjs3r1P0a
	YONtnqB59f5Avpl0XPQYOyQDVCeMYfM3lKRZMSURn0DbQQ/FMZMHX/E7OVR8wHJ3kwj+scsGX6J
	c2wAnJCr6H3p4pTeKS23Y35yOF01upjWaYdO+gsqZhlfrPZRu5NOfElvm5jUyHYQ1vKdCvRhBC8
	6/WTpS7v65UR7o6QFsLTG8f6Jo8nqTrUGvLbHbqw/83AytH2UtNmUAGHu0XbRs=
X-Google-Smtp-Source: AGHT+IGes3nVxEDSBxlaHGZVONLhxg58Ob1fOjsVMtO4m5ilIn457hh6A+FzVBWpzlcY83VX6o4HaQ==
X-Received: by 2002:a05:6402:4305:b0:5d0:8498:8bed with SMTP id 4fb4d7f45d1cf-5d4330a5ce2mr2727865a12.15.1733919787869;
        Wed, 11 Dec 2024 04:23:07 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14c7aa441sm8847370a12.72.2024.12.11.04.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 04:23:07 -0800 (PST)
Message-ID: <437b8d13-8ec1-40c7-b95c-ddb836e123d6@tuxon.dev>
Date: Wed, 11 Dec 2024 14:23:02 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/15] dt-bindings: soc: renesas: renesas,rzg2l-sysc:
 Add #renesas,sysc-signal-cells
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: vkoul@kernel.org, kishon@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, geert+renesas@glider.be,
 magnus.damm@gmail.com, gregkh@linuxfoundation.org,
 yoshihiro.shimoda.uh@renesas.com, christophe.jaillet@wanadoo.fr,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-usb@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
 <20241126092050.1825607-2-claudiu.beznea.uj@bp.renesas.com>
 <20241210184542.GA4077820-robh@kernel.org>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20241210184542.GA4077820-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Rob,

On 10.12.2024 20:45, Rob Herring wrote:
> On Tue, Nov 26, 2024 at 11:20:36AM +0200, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The RZ/G3S system controller (SYSC) has registers to control signals that
>> are routed to various IPs. These signals must be controlled during
>> configuration of the respective IPs. One such signal is the USB PWRRDY,
>> which connects the SYSC and the USB PHY. This signal must to be controlled
>> before and after the power to the USB PHY is turned off/on.
>>
>> Other similar signals include the following (according to the RZ/G3S
>> hardware manual):
>>
>> * PCIe:
>> - ALLOW_ENTER_L1 signal controlled through the SYS_PCIE_CFG register
>> - PCIE_RST_RSM_B signal controlled through the SYS_PCIE_RST_RSM_B
>>   register
>> - MODE_RXTERMINATION signal controlled through SYS_PCIE_PHY register
>>
>> * SPI:
>> - SEL_SPI_OCTA signal controlled through SYS_IPCONT_SEL_SPI_OCTA
>>   register
>>
>> * I2C/I3C:
>> - af_bypass I2C signals controlled through SYS_I2Cx_CFG registers
>>   (x=0..3)
>> - af_bypass I3C signal controlled through SYS_I3C_CFG register
>>
>> * Ethernet:
>> - FEC_GIGA_ENABLE Ethernet signals controlled through SYS_GETHx_CFG
>>   registers (x=0..1)
>>
>> Add #renesas,sysc-signal-cells DT property to allow different SYSC signals
>> consumers to manage these signals.
>>
>> The goal is to enable consumers to specify the required access data for
>> these signals (through device tree) and let their respective drivers
>> control these signals via the syscon regmap provided by the system
>> controller driver. For example, the USB PHY will describe this relation
>> using the following DT property:
>>
>> usb2_phy1: usb-phy@11e30200 {
>> 	// ...
>> 	renesas,sysc-signal = <&sysc 0xd70 0x1>;
>> 	// ...
>> };
>>
>> Along with it, add the syscon to the compatible list as it will be
>> requested by the consumer drivers. The syscon was added to the rest of
>> system controller variants as these are similar with RZ/G3S and can
>> benefit from the implementation proposed in this series.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v2:
>> - none; this patch is new
>>
>>
>>  .../soc/renesas/renesas,rzg2l-sysc.yaml       | 23 ++++++++++++++-----
>>  1 file changed, 17 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml
>> index 4386b2c3fa4d..90f827e8de3e 100644
>> --- a/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml
>> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml
>> @@ -19,11 +19,13 @@ description:
>>  
>>  properties:
>>    compatible:
>> -    enum:
>> -      - renesas,r9a07g043-sysc # RZ/G2UL and RZ/Five
>> -      - renesas,r9a07g044-sysc # RZ/G2{L,LC}
>> -      - renesas,r9a07g054-sysc # RZ/V2L
>> -      - renesas,r9a08g045-sysc # RZ/G3S
>> +    items:
>> +      - enum:
>> +          - renesas,r9a07g043-sysc # RZ/G2UL and RZ/Five
>> +          - renesas,r9a07g044-sysc # RZ/G2{L,LC}
>> +          - renesas,r9a07g054-sysc # RZ/V2L
>> +          - renesas,r9a08g045-sysc # RZ/G3S
>> +      - const: syscon
>>  
>>    reg:
>>      maxItems: 1
>> @@ -42,9 +44,17 @@ properties:
>>        - const: cm33stbyr_int
>>        - const: ca55_deny
>>  
>> +  "#renesas,sysc-signal-cells":
>> +    description:
>> +      The number of cells needed to configure a SYSC controlled signal. First
>> +      cell specifies the SYSC offset of the configuration register, second cell
>> +      specifies the bitmask in register.
>> +    const: 2
> 
> If there's only one possible value, then just fix the size in the users. 
> We don't need #foo-cells until things are really generic. Plus patch 
> 8 already ignores this based on the schema. And there's implications to 
> defining them. For example, the pattern is that the consumer property 
> name is renesas,sysc-signals, not renesas,sysc-signal.

OK, I'll fix the size in users.

> 
> Maybe someone wants to create a 'h/w (signal) control' subsystem (and 
> binding) that is just 'read, assert, or deassert a h/w signal'. Perhaps 

Until then, is it OK for you to keep it as proposed here?

> even the reset subsystem could be morphed into that as I think there 
> would be a lot of overlap. 

The USB PWRRDY signal handling has been initially implemented though a
reset controller driver but, after discussion with Philipp it has been
concluded that it should be handled differently, since it is not a reset
signal.

> Maybe that would cut down on a lot of these 
> syscon phandle properties. I would find that a lot more acceptable than 
> the generic 'syscons' and '#syscon-cells' binding that was proposed at 
> some point.
> 
> 
>> +
>>  required:
>>    - compatible
>>    - reg
>> +  - "#renesas,sysc-signal-cells"
> 
> New required properties are an ABI break.

I've added it as in the old DTs the system-controller node is disabled.
With that, do you consider it OK to keep it?

> 
>>  
>>  additionalProperties: false
>>  
>> @@ -53,7 +63,7 @@ examples:
>>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>>  
>>      sysc: system-controller@11020000 {
>> -            compatible = "renesas,r9a07g044-sysc";
>> +            compatible = "renesas,r9a07g044-sysc", "syscon";
> 
> What happens on a new kernel and a DT without this change?

The older DT have the system-controller node disabled, thus nothing will be
probed for it.

Thank you for your review,
Claudiu

> 
> Rob

