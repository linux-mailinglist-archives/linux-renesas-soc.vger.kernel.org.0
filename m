Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5227F6B1F99
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Mar 2023 10:14:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbjCIJN6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Mar 2023 04:13:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbjCIJN5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Mar 2023 04:13:57 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E45735F514
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Mar 2023 01:13:53 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id cy23so4149257edb.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Mar 2023 01:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678353232;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9CEu2+xzDEP1ysZ2Jodpi5h8X2MlwOBxqMwTYxrM9tE=;
        b=hgV1BzwmBLq1MLu70vByaZViKECvofPPWellrIF9OkLBuk4rfT816uqlpygy1swxrV
         Xamz3U8zY3xv7QXjOruuz3L83l0vgePE3o4vHdrpDGnCo56GXcHTh2iuN8a1HbLhHeUJ
         ry/xlrbQ2mQOoC9sMLUjQtw0leOHkNWS1WURrHWmt7sr0LRiqcwQuXHAU/8fEyAQAn++
         MmO/RpKPjyb4kx32deQyGHlOQ4970vubR6Qd1ubEp9H4ysM7mGyUVFcuSrRTb3wa1XOL
         +i86wsgPTuiuFcwxVS4mc8tPpSqIp0n7mifSjolD3ExreBXW9qJ9tQh0XPEYH7pGp45G
         g+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678353232;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9CEu2+xzDEP1ysZ2Jodpi5h8X2MlwOBxqMwTYxrM9tE=;
        b=d/QiRU9P0jF5kaAhipDg9eqYewG3YSQR6gJeHfjeKwiMn3LWxr56UQQubBn/ukcKhe
         9QfPHwxRIAuuL8qcIIlOgc9Xn6t5WvGulWIgd02bhyQ885wpjiY+LQpafPsmo0JxD45G
         tzG7cAyo/hdllTOAukcZa/NoXYeOzJGTO5nybjz8lcQmWg6YuwkfjZCtkYh4kNgGtvdC
         czOtdBgnandJ20HO+eFpgSoKn4ot879tQfiLAM0NJ3Qe5E4zFh0AOzmrjizk3sukLuK0
         7N7KQVrwXmpQKpiYLJC9+T34LHndVT2VCVjID9pXDyPOe0qDbKHeg4O4M0/Rch7DM3f5
         XWrQ==
X-Gm-Message-State: AO0yUKXyPW1GwMl/OlUWYZZbcE5a8yy5a8h8uVc7AsD7djd2pEQ+LMWx
        tfWnyectaxxTfi7cHUPhLrcXow==
X-Google-Smtp-Source: AK7set/jZEusWLawgfMr+VFVWu7w/eeDzg1P4nP6rbjE5J81n0UA4EyVpXJtA596Z2KHx1Ks+fTLpg==
X-Received: by 2002:a17:907:9703:b0:8af:514f:1078 with SMTP id jg3-20020a170907970300b008af514f1078mr25280900ejc.31.1678353232434;
        Thu, 09 Mar 2023 01:13:52 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:7ee2:e73e:802e:45c1? ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id mb3-20020a170906eb0300b008e772c97db6sm8520392ejb.128.2023.03.09.01.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 01:13:52 -0800 (PST)
Message-ID: <984f1689-459e-bd26-b96c-6c759417b3d1@linaro.org>
Date:   Thu, 9 Mar 2023 10:13:51 +0100
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <TYCPR01MB5933650D5BAB7A3F4BE03BAF86B59@TYCPR01MB5933.jpnprd01.prod.outlook.com>
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

On 09/03/2023 08:57, Biju Das wrote:
>>> It is clk generator HW specific. Clk generator is vital component
>>> which provides clocks to the system.
>>
>> Every clock controller is vital...
>>
>>> We are providing some hardware feature which is exposed as dt
>>> properties.
>>>
>>> Like clock output is fixed rate clock or dynamic rate clock/
>>
>> OK, I wait then for proper description which will explain and justify this.
> 
> Here it is, Please let me know is it ok?
> 
> renesas,output-clock-fixed-rate-mode:
>     type: boolean
>     description:
>       In output clock fixed rate mode, the output clock frequency is always
>       fixed and the hardware will use the values from the OTP or full register
> 	map initialized during boot.
>       If not given, the output clock rate is not fixed.
>     maxItems: 6

boolean is scalar, not array, so no maxItems. If the frequency is taken
from OTP or register map, why they cannot also provide information the
clock is fixed?

> 
> Cheers,
> Biju

Best regards,
Krzysztof

