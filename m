Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B638E521056
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 May 2022 11:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238440AbiEJJNb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 May 2022 05:13:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238411AbiEJJNa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 May 2022 05:13:30 -0400
Received: from mxout01.lancloud.ru (mxout01.lancloud.ru [45.84.86.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0DCD2555B8;
        Tue, 10 May 2022 02:09:30 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru D27C520B8F35
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH] arm64: dts: renesas: r9a07g043: Add ADC node
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220505184353.512133-1-biju.das.jz@bp.renesas.com>
 <b89be37d-ec17-8b6f-561b-63781352e774@gmail.com>
 <OS0PR01MB592248147BA1A775236B080186C99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <530ed78e-bce5-09bd-f0ef-f20de956cfcf@omp.ru>
Date:   Tue, 10 May 2022 12:09:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <OS0PR01MB592248147BA1A775236B080186C99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 5/10/22 11:24 AM, Biju Das wrote:
[...]

>>> Add ADC node to R9A07G043 (RZ/G2UL) SoC DTSI.
>>>
>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>> ---
>>>  arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 21 ++++++++++++++++++++-
>>>  1 file changed, 20 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
>> b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
>>> index b31fb713ae4d..40201a16d653 100644
>>> --- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
>>> +++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
>>> @@ -483,8 +483,27 @@ i2c3: i2c@10058c00 {
>>>  		};
>>>
>>>  		adc: adc@10059000 {
>>> +			compatible = "renesas,r9a07g043-adc", "renesas,rzg2l-
>> adc";
>>>  			reg = <0 0x10059000 0 0x400>;
>>> -			/* place holder */
>>> +			interrupts = <GIC_SPI 347 IRQ_TYPE_EDGE_RISING>;
>>> +			clocks = <&cpg CPG_MOD R9A07G043_ADC_ADCLK>,
>>> +				 <&cpg CPG_MOD R9A07G043_ADC_PCLK>;
>>> +			clock-names = "adclk", "pclk";
>>> +			resets = <&cpg R9A07G043_ADC_PRESETN>,
>>> +				 <&cpg R9A07G043_ADC_ADRST_N>;
>>> +			reset-names = "presetn", "adrst-n";
>>
>>    Not "adrst_n"?
> 
> As per bindings[1], it is correct ie, "adrst-n"
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml?h=next-20220509#n51

   Then I think the bindings aren't actually correct. But nevermind... :-)

> Cheers,
> Biju

MBR, Sergey
