Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A59EC3EF050
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Aug 2021 18:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbhHQQmV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Aug 2021 12:42:21 -0400
Received: from mxout04.lancloud.ru ([45.84.86.114]:41782 "EHLO
        mxout04.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbhHQQmT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Aug 2021 12:42:19 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru C46BC20CEA3B
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH v6 3/3] arm64: dts: renesas: r9a07g044: Add USB2.0 device
 support
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210812151808.7916-1-biju.das.jz@bp.renesas.com>
 <20210812151808.7916-4-biju.das.jz@bp.renesas.com>
 <2f5f8999-260d-e9c0-731e-df644b528b61@gmail.com>
 <OS0PR01MB59221C4884E0667F75748A1686F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922205202921BA8EC12C26686FE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <05bdd9e8-e68f-c8b4-a7d9-a83f2ca97a58@omp.ru>
Date:   Tue, 17 Aug 2021 19:41:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <OS0PR01MB5922205202921BA8EC12C26686FE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 8/17/21 2:12 PM, Biju Das wrote:

[...]
>>>> Add USB2.0 device support to RZ/G2L SoC DT.
>>>>
>>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>>> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> [...]
>>>> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
>>> b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
>>>> index de78c921af22..2f313c2a81c7 100644
>>>> --- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
>>>> +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
>>>> @@ -391,6 +391,25 @@
>>>>  			power-domains = <&cpg>;
>>>>  			status = "disabled";
>>>>  		};
>>>> +
>>>> +		hsusb: usb@11c60000 {
>>>> +			compatible = "renesas,usbhs-r9a07g044",
>>>> +				     "renesas,rza2-usbhs";
>>>> +			reg = <0 0x11c60000 0 0x10000>;
>>>> +			interrupts = <GIC_SPI 100 IRQ_TYPE_EDGE_RISING>,
>>>> +				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
>>>
>>>    Don't we need to specify "interrupt-names" when there a more than 1
>>> interrupts?
>>
>> This dtsi changes, as per binding documentation [1]. As you see,
>> "interrupt-names" is optional.
> 
> For now I will go with current dt changes.
> 
> Later  I will create incremental patches for dt-binding with optional "interrupt-names",
> "clock-names" and "reset names" for all the SoC's supported by this binding doc. 
> 
> After that, will send an incremental patch with adding optional properties in all SoC dtsi.
> 
> Does it make sense?

   I had the impression that the "*-names" prop was mandatory for a "*" prop having 2 values or mores.
If it's now allowed to be optional, don't bother with that at all.

> Regards,
> Biju


MBR, Sergei
