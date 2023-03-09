Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 730356B212B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Mar 2023 11:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230509AbjCIKTB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Mar 2023 05:19:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231422AbjCIKSN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Mar 2023 05:18:13 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D679DE8AA6
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Mar 2023 02:17:34 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id cw28so4881526edb.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Mar 2023 02:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678357053;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=md6odnYbBSl7NY+rTHHXsU7CF8nz8Tv8Lg0MchDzXC8=;
        b=MgamqNki88oOAt+21Ha3VCekhgc0pgKgPZndswz5crOCZgNQxVtB0Q+e4e6y0AyrKO
         XWyZztp+NRQbmd50uGQGC9XuZMiwv1XvaI9PfqJ8Hg13ZApvBxxRZHI42l9aFT8VMpLD
         oDXa9v/+ieyPlVAj9iKMRLd0jGbs1VtmuW5+D7vOqERrQh9zQKtOEYMz8NO4GW4nqlFO
         JdnaRUpJloKl3NP3Dz2XYumTcw8U+yAtf0V3j5H2lnIB7/RJuHf8zw4GtUcOcetUzrsH
         t32psPtkIqVWonlUdU0B/xUQXA9uoNcIQc0ZHmbjBH4BMJSNgisgh0MX310k89LJVJCB
         NAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678357053;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=md6odnYbBSl7NY+rTHHXsU7CF8nz8Tv8Lg0MchDzXC8=;
        b=Nnuh7Yf+5Gs0Obd6weKogKN/0nbUMVlfqlY7lOJURqI8OntasezOZgcUCKyhOt0kxL
         EauSDl5dIGLk3CsJVrfYmrNAj/fz+giHLKQUVg/UOanpFdl7PGsO+ivbkzvjLR6SQASm
         3bEN8Ph0T3QuLg5YxkSA6VRtimjWmra6oIXjJEkFRH5OVjO/vXz8/PPrlDheri0y7gw9
         aMBoAb0A+LQM87ApNT9sm5uNOftxle/0pRi9qTSus1gsWwjjWyd75hSzBhs2r71YH/h7
         HYVnvl1bcizZAXzsWhscYpUQeh+rafSVlAY7le5NMg9wk6XCbagB2l5YXajU9a57+iO9
         0eyg==
X-Gm-Message-State: AO0yUKW98funV7Ddv5H0UUd8nNOSpADbi8SzJdb3kPCgvUR/6cPZCzOm
        oL/QPc+0R0EXIIgAdtZEjSz64w==
X-Google-Smtp-Source: AK7set+nbySTb0bh2fkXC/brcsywYVyDbvQZ0Hu22x1Cr6Ow1/sIgw95zzkVT38cT8e2fmInkCDIVw==
X-Received: by 2002:a17:907:9615:b0:914:859:1408 with SMTP id gb21-20020a170907961500b0091408591408mr13551085ejc.25.1678357053347;
        Thu, 09 Mar 2023 02:17:33 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:7ee2:e73e:802e:45c1? ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id n24-20020a1709062bd800b008b17aa6afc8sm8642441ejg.30.2023.03.09.02.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 02:17:32 -0800 (PST)
Message-ID: <2bb458ba-ef70-86f3-de89-0102e27aa0fc@linaro.org>
Date:   Thu, 9 Mar 2023 11:17:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3 clock
 generator bindings
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
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
 <CAMuHMdVNCvu6La_=f=6i4Kj3UXeFU6McnNSkXb0PVjVyzdNR4Q@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMuHMdVNCvu6La_=f=6i4Kj3UXeFU6McnNSkXb0PVjVyzdNR4Q@mail.gmail.com>
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

On 09/03/2023 10:58, Geert Uytterhoeven wrote:
>>>>> Here it is, Please let me know is it ok?
>>>>>
>>>>> renesas,output-clock-fixed-rate-mode:
>>>>>     type: boolean
>>>>>     description:
>>>>>       In output clock fixed rate mode, the output clock frequency is
>>>> always
>>>>>       fixed and the hardware will use the values from the OTP or full
>>>> register
>>>>>     map initialized during boot.
>>>>>       If not given, the output clock rate is not fixed.
>>>>>     maxItems: 6
>>>>
>>>> boolean is scalar, not array, so no maxItems. If the frequency is taken from
>>>> OTP or register map, why they cannot also provide information the clock is
>>>> fixed?
>>>
>>> OK, I will make an array property instead. From HW perspective each clock output from the
>>> Clock generator is controllable ie, fixed rate or dynamic rate.
>>>
>>> If all the output clocks are fixed rate one, then frequency is taken from OTP or
>>> register map. But if any one clock output generates dynamic rate, then it uses
>>> dynamic settings.
>>
>> Second try, same question, let me know if it is not clear:
>>
>> "why they cannot also provide information the clock is fixed?"
> 
> What is the actual use case?
> My understanding is:
>   1. If the OTP is programmed, the clock generator will be configured
>      from the OTP on power-on,
>   2. The clock generator can be (re)configured from software.
>      a. If the OTP is programmed, this is not needed,
>      b. For critical clocks, you may want to prevent this.
> 
> Also, AFAIUI, "fixed frequency" or "dynamic frequency" is a policy,
> and purely software? Or are there OTP bits to enforce this?
> 
> Perhaps you need a per-output "do-not-change-frequency" flag,
> probably with a generic name, in the spirit of "regulator-always-on"
> for regulators?
> 
> Now, if all the output clocks are fixed rate, you might want to describe
> this in DTS using a set of fixed{,-factor-}-clocks?
> 

I would also argue that fixed frequency is actually also dynamic
frequency, just with a limit to one frequency...

Best regards,
Krzysztof

