Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E22466B2117
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Mar 2023 11:17:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231387AbjCIKRR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Mar 2023 05:17:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231159AbjCIKQ6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Mar 2023 05:16:58 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18F23EB8BA
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Mar 2023 02:16:01 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id j11so4878153edq.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Mar 2023 02:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678356959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3iHNnARtiWlelPTEYSklEydU8JYZzWIK8P85AN1yl9I=;
        b=TAtsYU7aL90UK5FAOp1+XUdcU5Rlpm7Id9ve927T/336vQHMBY62g2/iNT6o2J2HIn
         b+WlDBLHkfES74CCLCb//9/bR6GKyEOj5wUpKKfmqVlBxEGnaO9g2WQBbrR9e3nCSouL
         GnBVP4KiV5cGzEKACty3JotTWlQp6nA4jJM0YevVpvlXnd19TApPEnT7DwY6/aHqpAZn
         A8535P1gH9GD0WAIP47ffdUUUkr+2fCI2yY0NtBCai3MVTGhlNq0GHMueNkhLaZzRmmN
         wt/vUl/eLYzGG+uwJXmxr+VuXxeoN2rzJbBOh+sDeDjy+DDUPJToe2vG7ADD8Y6O5H3N
         Ibiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678356959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3iHNnARtiWlelPTEYSklEydU8JYZzWIK8P85AN1yl9I=;
        b=ZSF2V4GHbNYfrfbH6rhFbMk+sLc7Eu+wuBxbC99EoDPTtmKbUv3Q3wCZ/7S6Kvrs9Y
         KP3eThJr4X1kvg2ehme7wICt+bKsCYXzR5y4uKW5YQNgFsr8llO6h2xWlBRfyaGqRGjj
         I7tPdp1MNzebbqL8oWJKBLxOcWMFeDVgGzjPxFRmayHlTSHpdcoKp4p0HxPOG/fJ1xVk
         fJWZX/k72guZvk3H0aY+bDZ++JSRbMhGJ5wx6sMf5Aopw0Zc9k0j1PPs8FUwx0JkBT7V
         XgfmuNIehwjKYuf4ccuAq+jLeJyMptJbhfQpsfUvMoLLKdxzBhsUaxmigA3y5YGlgXPt
         nhSw==
X-Gm-Message-State: AO0yUKVzF9GhdCiDL69zJdUImrj355qq1zXRJdRJ//tESVhX0JTp2rWP
        xBSR/DyqxmvIGE3rzctmPL0TLg==
X-Google-Smtp-Source: AK7set/gymu6PNDxSblX+jHSQQwL7efPZKgV/MKyrwZe++DVIzMiHrNxQ5kYnjxQ1WHIAMJd2RXMpw==
X-Received: by 2002:a17:907:3e8f:b0:8b1:779c:a8b1 with SMTP id hs15-20020a1709073e8f00b008b1779ca8b1mr27320141ejc.5.1678356959585;
        Thu, 09 Mar 2023 02:15:59 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:7ee2:e73e:802e:45c1? ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id lc9-20020a170906f90900b008e34bcd7940sm8570335ejb.132.2023.03.09.02.15.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 02:15:59 -0800 (PST)
Message-ID: <bd181837-2ebe-99a2-800a-30bad080dc4e@linaro.org>
Date:   Thu, 9 Mar 2023 11:15:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3 clock
 generator bindings
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
References: <20230220131307.269100-1-biju.das.jz@bp.renesas.com>
 <20230220131307.269100-2-biju.das.jz@bp.renesas.com>
 <e9e63c87-b491-b4d5-b226-0539ef0de2d0@linaro.org>
 <OS0PR01MB59221C8C937EF20347149E4886B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <36e06397-2189-4f1b-99cc-d39e720ebc71@linaro.org>
 <OS0PR01MB5922BDA0632ACCCC0100EEBD86B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <6cbe6c71-2d2d-0f79-1270-7f8ed2ddc1d6@linaro.org>
 <TYCPR01MB5933650D5BAB7A3F4BE03BAF86B59@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <984f1689-459e-bd26-b96c-6c759417b3d1@linaro.org>
 <TYCPR01MB59335607AE6A2F4FBBA46ACC86B59@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <bc9e8ccd-9f98-6fae-9491-dc2bd96c2e4f@linaro.org>
 <OS0PR01MB59222B5A8747EC2B682AEE3486B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <OS0PR01MB59222B5A8747EC2B682AEE3486B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 09/03/2023 10:53, Biju Das wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Thursday, March 9, 2023 9:44 AM
>> To: Biju Das <biju.das.jz@bp.renesas.com>; Michael Turquette
>> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Rob Herring
>> <robh+dt@kernel.org>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>; linux-renesas-
>> soc@vger.kernel.org; linux-clk@vger.kernel.org; devicetree@vger.kernel.org;
>> Fabrizio Castro <fabrizio.castro.jz@renesas.com>
>> Subject: Re: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3 clock
>> generator bindings
>>
>> On 09/03/2023 10:18, Biju Das wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Sent: Thursday, March 9, 2023 9:14 AM
>>>> To: Biju Das <biju.das.jz@bp.renesas.com>; Michael Turquette
>>>> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Rob
>>>> Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
>>>> <krzysztof.kozlowski+dt@linaro.org>
>>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>; linux-renesas-
>>>> soc@vger.kernel.org; linux-clk@vger.kernel.org;
>>>> devicetree@vger.kernel.org; Fabrizio Castro
>>>> <fabrizio.castro.jz@renesas.com>
>>>> Subject: Re: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3
>>>> clock generator bindings
>>>>
>>>> On 09/03/2023 08:57, Biju Das wrote:
>>>>>>> It is clk generator HW specific. Clk generator is vital component
>>>>>>> which provides clocks to the system.
>>>>>>
>>>>>> Every clock controller is vital...
>>>>>>
>>>>>>> We are providing some hardware feature which is exposed as dt
>>>>>>> properties.
>>>>>>>
>>>>>>> Like clock output is fixed rate clock or dynamic rate clock/
>>>>>>
>>>>>> OK, I wait then for proper description which will explain and
>>>>>> justify
>>>> this.
>>>>>
>>>>> Here it is, Please let me know is it ok?
>>>>>
>>>>> renesas,output-clock-fixed-rate-mode:
>>>>>     type: boolean
>>>>>     description:
>>>>>       In output clock fixed rate mode, the output clock frequency is
>>>> always
>>>>>       fixed and the hardware will use the values from the OTP or
>>>>> full
>>>> register
>>>>> 	map initialized during boot.
>>>>>       If not given, the output clock rate is not fixed.
>>>>>     maxItems: 6
>>>>
>>>> boolean is scalar, not array, so no maxItems. If the frequency is
>>>> taken from OTP or register map, why they cannot also provide
>>>> information the clock is fixed?
>>>
>>> OK, I will make an array property instead. From HW perspective each
>>> clock output from the Clock generator is controllable ie, fixed rate or
>> dynamic rate.
>>>
>>> If all the output clocks are fixed rate one, then frequency is taken
>>> from OTP or register map. But if any one clock output generates
>>> dynamic rate, then it uses dynamic settings.
>>
>> Second try, same question, let me know if it is not clear:
>>
>> "why they cannot also provide information the clock is fixed?"
> 
> This information we are providing through dt.

No, you are not. We just discuss it. If we do not agree, you are not
going to provide information through DT.

> 
> It is a complex clock generator which provides 6 HW clock outputs.
> The 6 HW clock outputs can be individually controllable to generate
> Either fixed frequency or dynamic frequency.

Ah, indeed. 6 clock outputs prohibits configuring this from OTP. If only
there were 5 outputs then it would be possible...

> 
>  Output clk1 "diff2",
>  Output clk2 "diff1",
>  Output clk3 "se3",
>  Output clk4 "se2",
>  Output clk5 "se1",
>  Output clk6 "ref"
> 
> I want to make "Output clk4" from clock generator as dynamic frequency one
> And make other clock frequency from clock generator as fixed one.
> 
> How do you describe this in dt? Please share your thoughts.

Read from OTP or registers.

Best regards,
Krzysztof

