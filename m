Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68E6F50E4C3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 17:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242711AbiDYPxs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 11:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243038AbiDYPxp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 11:53:45 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEE703A72E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2022 08:50:40 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id p18so13789302edr.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2022 08:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=PYLQycevSzi4tL2WdwyMagoUb8rFgRrz33radZLcMd0=;
        b=ZgjvAM+ZqtHsmn6SjoPSWIUopXkarEsFiH0XHaPnkKcAZ5Jn+7TTcIwrFtbJOoNOWY
         gmxale4xvy5QIO6ESP1HvOkzrn5igeOYKiRPYGjLrVVe6HbjGIU68ZHT8e26dYp8g0zC
         vnchqUHtFqX3AQmPXwRqvZgarrzbvKGVMQRQRs6ehlblH8NgQ+rhstLXkG1ylXjq8JUz
         h4CRw4GtENQRfdOxLH0iy9w7q8slzmp26CaUxtRUnA153mP8HHcKXtc08/QSm6PfU9LW
         93Ibq/9YOMZLtQHZNdYZMt2U+i2XZXVzGWnnYEtzE8PPVmFqbb+B2OfRtxIZCC21Gf40
         OLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PYLQycevSzi4tL2WdwyMagoUb8rFgRrz33radZLcMd0=;
        b=ydsNA3AVkNcAmtzFQ9nOXss8isTCnPcnbtq/aDceUPc3Slw3J2TT+Vvps8tqAeP7mH
         nfJbquO7IoEQsxy+fqj3xPqb0SfxdnF92wjUGJU5oUlZKFGcVjXw8bjcsHSD0xFS8pdi
         xcek23FwXwKLde3H7viXiqqqvHR0lKMv7anA5J9UhURlzE3atw4/tdrQFwpNSsNYkqRB
         9nY3WtNrIim3Si7irYJYGfNLOEAIVy2IK7nKQg13u3GwY23lad/eOi9rhwy14G6DgBRI
         XzjEaIIXvcu7VFJQuSrlye5g+xQ+aKMluPfZtislYJbeKN1qVSozGxMLIsKWV51GO1QS
         x8uA==
X-Gm-Message-State: AOAM530aZYdGxGv16CHmw9m8DHJKSUG6jdJJnuqAbkHW0UlQnVWH+kpT
        4ML4QpdN3i33RmdSY8NClTqOjQ==
X-Google-Smtp-Source: ABdhPJzzizUnNNmbYcKKYRk3MT2+N6aSaIwnrYS/1gK8XUgwi9cO4Xc0VfcTeqLygekgq9cD2GUxTw==
X-Received: by 2002:aa7:c946:0:b0:416:226f:f8a6 with SMTP id h6-20020aa7c946000000b00416226ff8a6mr19656971edt.360.1650901839436;
        Mon, 25 Apr 2022 08:50:39 -0700 (PDT)
Received: from [192.168.0.243] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id s11-20020a170906284b00b006e108693850sm3701064ejc.28.2022.04.25.08.50.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 08:50:38 -0700 (PDT)
Message-ID: <886fda10-fad9-83c4-10f1-1ae36cf0a6b0@linaro.org>
Date:   Mon, 25 Apr 2022 17:50:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a07g044: Fix external clk node
 names
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
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220423140658.145000-1-biju.das.jz@bp.renesas.com>
 <f9c6e5e2-c819-d309-0c11-b87deb772858@linaro.org>
 <OS0PR01MB5922CFACC8FEC6D67E6BFC4986F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB59220968EBDF76A16F7E63A386F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <7bd2ae6d-c55f-4ab7-0c98-72da0d5d4050@linaro.org>
 <OS0PR01MB5922619EE8816DA1676BAB4D86F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ddf78c65-7cac-04cf-9f8d-e19335815473@linaro.org>
 <OS0PR01MB59222BF5C0D4749C8AAFC57F86F89@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <OS0PR01MB59222BF5C0D4749C8AAFC57F86F89@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 25/04/2022 17:28, Biju Das wrote:
>>>> My suggestion was to move the [12] part into the first part, so the
>>>> suffix "clk" stays consistent:
>>>> audio1-clk
>>>> audio2-clk
>>>
>>> From HW perspective,  there are 2 audio clocks, audio clock1(multiple
>>> and sub multiple of 44.1 Khz) and audio clk 2(Multiple and submultiple
>> of 48Khz) connected to a single audio Codec.
>>>
>>> Based on the sampling rate, through clock generator driver we can
>>> switch the clock source for audio mclock along with audio clock for
>>> SSI and we can support both these rates
>>>
>>> Since there is a single audio codec, I am not sure, audio1-clk and
>> audio2-clk is a good choise.
>>
>> The name of the clock is not "audio clock" but "audio", because you do not
>> call a car "Ford Mustang car", but just "Ford Mustang". Therefore "clock"
>> is not part of the name, but just description of a type.
> 
> The hardware mention the name as AUDIO_CLK1 and AUDIO_CLK2.

The hardware document might call it "AUDIO_CLK_REAL_CLK_CLK" and it
won't be an argument to call device node that way in DTS.

> There are 2 Clock availables for audio interface.
> In that case if you term it as audio1-clk and audio-clk2,
> But as you said clk-1-audio and clk-2-audio will be correct?

If you change all other clocks to follow same principle - generic name
followed by specific suffix - then yes. Then you should have
"clk-extal", "clk-can" etc.

> 
>>
>>>
>>> What about like
>>>
>>> audio_clk1: audio-clk-1 ?
>>> audio_clk2: audio-clk-2 ?
>>>
>>> Which is consistent with naming used for cpu and opp-tables?
>>
>>
>> It's not consistent with clk naming. Nodes should have generic names, so
>> the generic part is "clk". You add specific audio/audio-X prefix or suffix
>> - it's fine, but not both.
>>
>> This is exactly the trouble when you start using specific names and
>> Devicetree spec explicitly asks for generic names. So maybe go with the
>> spec and call of these "clk-[0-9]" and problem is gone.
> 
> Ok Will change like
> 
> "audio_clk1: clk-1-audio"
> 

What do you mean "ok"? I said "clk-[0-9]", so "clk-0", "clk-1", "clk-2"
and so on. No specific prefix.

> Label name matches with hardware manual and node names as per Device tree spec.


Best regards,
Krzysztof
