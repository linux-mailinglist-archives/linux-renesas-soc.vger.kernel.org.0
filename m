Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEC136258B6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Nov 2022 11:50:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233525AbiKKKuu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Nov 2022 05:50:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233305AbiKKKus (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Nov 2022 05:50:48 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A60A657E5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Nov 2022 02:50:39 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id be13so7783735lfb.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Nov 2022 02:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q6uzXd9rjr0+MjLzY/HrG+pQd4oP8LwDd91lEObJUaQ=;
        b=I9WKwUNhIR5elOxoGTRWpNTjG31YTLcg0Ktty6H3+BrT/cqTYe7o5P5iUL7WJFUnCH
         jNESdIU7GUhNIopL3UXPPS5cbBIjaTgZYqVeLF8Q9biYlbgsLBoGYi7FsNmc75pbyzXf
         W9oOTpZt9iyxAdBlU3YElS8nOlXyoXqaJ1rK6OwzcTjRyZI8J1KxvGx3xk+YtAVlHSKf
         gGq4xu2/bLNoYz+uaMCcFWOqUOiSDVZ8qjK9GlPTTxMvg7ljYZD7YEEbzAGWlPDOUSJH
         Q9JKS9mGf32vmmM9s9Kcn4Yxc/QEQ9P+i5M3fSseJHD+LdfwKEAkjY3Ya5HxgwgXf+0q
         G9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q6uzXd9rjr0+MjLzY/HrG+pQd4oP8LwDd91lEObJUaQ=;
        b=3t2gqZAtlYIjRw8Sg0yGzYXJNdi+ugtCTKWGheEA21lw6XKfYn+2IZQHrHYLQOxABa
         WE8elNbYwyM8KLK4RFaSR9Vx5FEkyXLUUAAofRAnXltV4sdcosFfVHhIDpkg+UbwgcIH
         ye3zcxTGBb1qc5SsA4zFVvxWcE6F6q6d4v313SAmv7BRm/Lkt3RS0UAq7zaVvxPnP7kI
         gONzuDDY82QJhQaAqbcY5WZ6oE1vtAUSDHXJGdb0Rku5Tg0eDfnpTvwQ6d7/ZjuAb1kB
         wlsN+mpewPwp4muC8rnxh7I9De1pwxfJK18KBLYJAyocTbBIzFbs8ptjuwczHXE8sDg5
         e4kQ==
X-Gm-Message-State: ANoB5pk6CbTh/LKTYQs+Apt2ctXpVMWEGOBBGCzIQK/GA7xZ4WA+zydC
        W/gw8++LeVDSgZf5uoEmprrs+A==
X-Google-Smtp-Source: AA0mqf6cgJitB+6WrjolHrR4FTBiJloBk88LOICcNXtAeUiCVl88D+f0zoTJ4+uDUUmEJqCHTZJxTg==
X-Received: by 2002:a05:6512:401d:b0:4b1:25ff:28aa with SMTP id br29-20020a056512401d00b004b125ff28aamr517492lfb.547.1668163837807;
        Fri, 11 Nov 2022 02:50:37 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id q26-20020a2eb4ba000000b0026e0434eb1esm327348ljm.67.2022.11.11.02.50.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 02:50:37 -0800 (PST)
Message-ID: <b4e54a00-cc37-8c3a-8f72-289fdff5f1d2@linaro.org>
Date:   Fri, 11 Nov 2022 11:50:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: r9a09g011: Add system
 configuration node
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
References: <20221110162126.103437-1-biju.das.jz@bp.renesas.com>
 <20221110162126.103437-4-biju.das.jz@bp.renesas.com>
 <b28c469b-f0f0-47c0-dd07-bf2dcde55824@linaro.org>
 <OS0PR01MB5922ADB9F181E6745FE46EE986009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <OS0PR01MB5922ADB9F181E6745FE46EE986009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 11/11/2022 10:10, Biju Das wrote:
> Hi Krzysztof Kozlowski,
> 
> Thanks for the  feedback.
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: 11 November 2022 08:35
>> To: Biju Das <biju.das.jz@bp.renesas.com>; Rob Herring <robh+dt@kernel.org>;
>> Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>; Magnus Damm
>> <magnus.damm@gmail.com>; linux-renesas-soc@vger.kernel.org;
>> devicetree@vger.kernel.org; Chris Paterson <Chris.Paterson2@renesas.com>;
>> Fabrizio Castro <fabrizio.castro.jz@renesas.com>
>> Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: r9a09g011: Add system
>> configuration node
>>
>> On 10/11/2022 17:21, Biju Das wrote:
>>> Add system configuration node to RZ/V2M SoC dtsi.
>>>
>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>> ---
>>> v2:
>>>  * New patch
>>> ---
>>>  arch/arm64/boot/dts/renesas/r9a09g011.dtsi | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
>> b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
>>> index 7b949e40745a..07164d9e4a0f 100644
>>> --- a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
>>> +++ b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
>>> @@ -130,6 +130,12 @@ cpg: clock-controller@a3500000 {
>>>  			#power-domain-cells = <0>;
>>>  		};
>>>
>>> +		sysc: system-configuration@a3f03000 {
>>> +			compatible = "renesas,r9a09g011-sys";
>>> +			reg = <0 0xa3f03000 0 0x400>;
>>> +			status = "disabled";
>>
>> Why disabled? You do not have any other resources needed. This is odd.
> 
> OK, will enable by default. Currently the driver compatible is used for getting SoC
> Major and Minor versions. But later will enhance to support more features.

Whatever your driver is doing, should be rather independent of
enabling/disabling nodes in DTS. Generic rule is that all SoC
components, which do not need external resources from board, should be
enabled by default. Of course there are exceptions to this rule. DTS is
anyway description of hardware, so "driver compatible" is not
appropriate argument for this (or I miss the meaning behind this).

Best regards,
Krzysztof

