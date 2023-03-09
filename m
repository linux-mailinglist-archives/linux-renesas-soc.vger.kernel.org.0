Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A03526B2080
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Mar 2023 10:45:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbjCIJp1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Mar 2023 04:45:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231394AbjCIJop (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Mar 2023 04:44:45 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61907E4DB5
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Mar 2023 01:44:16 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id cw28so4546459edb.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Mar 2023 01:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678355055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=90Jk3Si6uTonOJsmd1LEY+OgSQcggQy5RH+0SOt5I8s=;
        b=dOhfUTM41wZZ96IVAsxvpXoIm+09crL9OwtPpXO2/9C3WgCiOgQZoWbhveayDi1l8i
         wEe52WGnCGz1MKwEyybqdKHQZ2+B8EM9x9RjxxQmRrtYN8Wh+HWlx9h9JKXMlsrwXs5u
         FA1npzSSv0YVzkcPFsrp2dtjCguP3lL0J9MFBsvksphVWFybyzIdT7rGGX5yR9D+eVyT
         dg+tJ9iTLBkhSDYByY37IZ6P8q0+N7SJTiR1y37UgeeUgIbY0nDqbpe+hQP3FB3Jg5Ug
         vMJTxWeEqi/6ggbuBkha2QJDmG7a4qTy4ZExIR6cQAnQ73CH9voEHo1rAnJmBEZ7leeQ
         kLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678355055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=90Jk3Si6uTonOJsmd1LEY+OgSQcggQy5RH+0SOt5I8s=;
        b=D7l4UWgBz+JFvanyMLK1nVWTzR2SVVBHjPDaBCaeWQfRraQd/LEoCgTRmbQjvAl5H2
         UG2JCIQZaP8XkWaGsoxLz3v1sFtsJxaoax6gHQVRPGeVmLmUQsY2MLd+1nNFAmWNikjB
         q/WgTfwwgFKdYlFQi1gtmBrVD3BT4pDGzHGSgn5F+WL17MihtyjmF8S9Gq/YZuf34J1x
         UKv6q++SiR944c9T+zI/LdJi8XJhFfDA7sByajQWqCt5JmZhLjNOez1u11ZhXJceFfJi
         AGv73ses2TVXo6Bhgj8ikWfSKOhyRAFDK/2ofIscCKilh/Wwdqt0M7+NHlK2vIhb5p+y
         zU7g==
X-Gm-Message-State: AO0yUKU1KbhDocGcL8756Kb/QcC8MhAZhpHyhEHBkWgg2ghu00yQUQlL
        CVFWhGSCHx3pDfvXDAaGu3auoQ==
X-Google-Smtp-Source: AK7set/09lealAERy2wlmKs4hx+r/IyEPo7WcB5f+6WlfwAJt2Ph/Ds4GDlHx/FkRyfe1i9oY+Q35w==
X-Received: by 2002:a17:907:c0c:b0:8af:2cf7:dd2b with SMTP id ga12-20020a1709070c0c00b008af2cf7dd2bmr26863543ejc.13.1678355054869;
        Thu, 09 Mar 2023 01:44:14 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:7ee2:e73e:802e:45c1? ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id fw20-20020a170907501400b00914fec9f40esm4206511ejc.71.2023.03.09.01.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 01:44:14 -0800 (PST)
Message-ID: <bc9e8ccd-9f98-6fae-9491-dc2bd96c2e4f@linaro.org>
Date:   Thu, 9 Mar 2023 10:44:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3 clock
 generator bindings
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
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <TYCPR01MB59335607AE6A2F4FBBA46ACC86B59@TYCPR01MB5933.jpnprd01.prod.outlook.com>
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

On 09/03/2023 10:18, Biju Das wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Thursday, March 9, 2023 9:14 AM
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
>> On 09/03/2023 08:57, Biju Das wrote:
>>>>> It is clk generator HW specific. Clk generator is vital component
>>>>> which provides clocks to the system.
>>>>
>>>> Every clock controller is vital...
>>>>
>>>>> We are providing some hardware feature which is exposed as dt
>>>>> properties.
>>>>>
>>>>> Like clock output is fixed rate clock or dynamic rate clock/
>>>>
>>>> OK, I wait then for proper description which will explain and justify
>> this.
>>>
>>> Here it is, Please let me know is it ok?
>>>
>>> renesas,output-clock-fixed-rate-mode:
>>>     type: boolean
>>>     description:
>>>       In output clock fixed rate mode, the output clock frequency is
>> always
>>>       fixed and the hardware will use the values from the OTP or full
>> register
>>> 	map initialized during boot.
>>>       If not given, the output clock rate is not fixed.
>>>     maxItems: 6
>>
>> boolean is scalar, not array, so no maxItems. If the frequency is taken from
>> OTP or register map, why they cannot also provide information the clock is
>> fixed?
> 
> OK, I will make an array property instead. From HW perspective each clock output from the
> Clock generator is controllable ie, fixed rate or dynamic rate.
> 
> If all the output clocks are fixed rate one, then frequency is taken from OTP or
> register map. But if any one clock output generates dynamic rate, then it uses
> dynamic settings.

Second try, same question, let me know if it is not clear:

"why they cannot also provide information the clock is fixed?"

Best regards,
Krzysztof

