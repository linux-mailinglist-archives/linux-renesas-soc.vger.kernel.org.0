Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E73750D252
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 Apr 2022 16:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239350AbiDXOm6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 24 Apr 2022 10:42:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235840AbiDXOml (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 24 Apr 2022 10:42:41 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F8E038198
        for <linux-renesas-soc@vger.kernel.org>; Sun, 24 Apr 2022 07:39:40 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id w16so3785763ejb.13
        for <linux-renesas-soc@vger.kernel.org>; Sun, 24 Apr 2022 07:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=sGIGnRcORiyz6ALQ2u4/pZkSv1Oidm+ZI/regT6wqA0=;
        b=MQS6HpnygwWQ+v5+kClKwPDQHTPm64pwU9XSQQ3KS6db3seA1YQXaxQ4o/uT2C75zo
         uMDjJpNo0TX0chwCXWdtiboO14vckMdPSvzWKVfUQOQk+uv40sZ3So6PIHJYHPiiBUoB
         R4EY2KHxl4hlJKBqCDGasw4XNF0tioJO2pM77PRwFHZRPihzDmByf9hSVgqM8YLM4WT4
         XY4QkGeVblat4vTJ3voaSh/hhF7G2hVvKHwt0z8fi2ohQy6lZNo9l6NKVC0ZGn5m/ERp
         IWqeGh+ncW6v8sYCwAEMT/Ro4ZIMJ0QrDqfSDll5Qr9VdiegtHzFw9cqbZwjf2DMoDih
         rLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sGIGnRcORiyz6ALQ2u4/pZkSv1Oidm+ZI/regT6wqA0=;
        b=DwGE/42/w4wvwcc3/nSm4AfpAOsbDD7WoPVmB6d8VKj1miY7IFhQ3+URzJcvoSP13m
         f6eplrpJBExFIxmdS7aMppKhRQN09JXewwfMBrTHXv2k9/vcmQ7G9xEa6YWS3YbPxZ9p
         PDxO4+5hAkDdKizDeQxFwF7cM97whp3uKjX3QkSlQOa9UGZw6xSW/GDPVLytmjgGdFys
         Zw+hAjc5wVWGR+JHfRFn3Cokh1HtQmVOYtrLLCDXgjWxLiUXb5tsVJjKD2eQCfFVQrN6
         aLZU1ZKnQiqTFbubcxijKU/LBmVYDc7s1I9ZjmFAlhFxl1prb6ySWUcvd7FUotF3cOyY
         JAdw==
X-Gm-Message-State: AOAM532HazP2A4BTWMZ4faGyB5F3fWTQVs9s9+Ncl4uFuqDTfYxDB4Um
        tKi0+QS4ZvaxzPnU0AugXZ+t2w==
X-Google-Smtp-Source: ABdhPJz72ENByBRkGeBbYwsJp+HUH6S8fiVg+HyFSfdr1+pHiyApAc3ejCoh3y/jBuCAJdnW+69Iqw==
X-Received: by 2002:a17:906:974c:b0:6ef:f428:d527 with SMTP id o12-20020a170906974c00b006eff428d527mr11974862ejy.166.1650811178771;
        Sun, 24 Apr 2022 07:39:38 -0700 (PDT)
Received: from [192.168.0.235] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a19-20020a50c313000000b0041fb0f2e155sm3419768edb.20.2022.04.24.07.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Apr 2022 07:39:38 -0700 (PDT)
Message-ID: <ddf78c65-7cac-04cf-9f8d-e19335815473@linaro.org>
Date:   Sun, 24 Apr 2022 16:39:37 +0200
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <OS0PR01MB5922619EE8816DA1676BAB4D86F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 24/04/2022 12:22, Biju Das wrote:
> Hi Krzysztof Kozlowski,
> 
> Thanks for the feedback.
> 
>> Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a07g044: Fix external clk
>> node names
>>
>> On 24/04/2022 09:50, Biju Das wrote:
>>>> Subject: RE: [PATCH 1/2] arm64: dts: renesas: r9a07g044: Fix external
>>>> clk node names
>>>>
>>>> Hi Krzysztof Kozlowski,
>>>>
>>>> Thanks for the feedback.
>>>>
>>>>> Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a07g044: Fix
>>>>> external clk node names
>>>>>
>>>>> On 23/04/2022 16:06, Biju Das wrote:
>>>>>> Fix audio clk node names with "_" -> "-" and add suffix '-clk' for
>>>>>> can and extal clks.
>>>>>>
>>>>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 8 ++++----
>>>>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
>>>>>> b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
>>>>>> index 19287cccb1f0..4f9a84d7af08 100644
>>>>>> --- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
>>>>>> @@ -13,14 +13,14 @@ / {
>>>>>>  	#address-cells = <2>;
>>>>>>  	#size-cells = <2>;
>>>>>>
>>>>>> -	audio_clk1: audio_clk1 {
>>>>>> +	audio_clk1: audio-clk1 {
>>>>>
>>>>> How about in such case keeping suffix "clk" everywhere and moving
>>>>> the index
>>>>> (1/2) to the first part? This way one day maybe schema will match
>>>>> the clocks.
>>>>
>>>> Just a question,
>>>>
>>>> Your suggestion is "audio_clk1: audio-clk1" -> "audio_clk1: audio-clk"
>>>>
>>>> In that case, If you plan to drop the label in future, how will you
>>>> differentiate between
>>>> audio-clk1 and audio-clk2 with just node names?
>>>
>>> Or
>>>
>>> Do you want me to do the change like this?
>>>
>>> "audio_clk1: audio-clk1" -> "audio_clk_1: audio-clk-1"
>>>
>>> And fix the phandle reference in other dtsi files??
>>
>> My suggestion was to move the [12] part into the first part, so the suffix
>> "clk" stays consistent:
>> audio1-clk
>> audio2-clk
> 
> From HW perspective,  there are 2 audio clocks, audio clock1(multiple and sub multiple of 44.1 Khz) 
> and audio clk 2(Multiple and submultiple of 48Khz) connected to a single audio Codec.
> 
> Based on the sampling rate, through clock generator driver we can switch the clock source for 
> audio mclock along with audio clock for SSI and we can support both these rates 
> 
> Since there is a single audio codec, I am not sure, audio1-clk and audio2-clk is a good choise.

The name of the clock is not "audio clock" but "audio", because you do
not call a car "Ford Mustang car", but just "Ford Mustang". Therefore
"clock" is not part of the name, but just description of a type.

> 
> What about like 
> 
> audio_clk1: audio-clk-1 ?
> audio_clk2: audio-clk-2 ?
> 
> Which is consistent with naming used for cpu and opp-tables?


It's not consistent with clk naming. Nodes should have generic names, so
the generic part is "clk". You add specific audio/audio-X prefix or
suffix - it's fine, but not both.

This is exactly the trouble when you start using specific names and
Devicetree spec explicitly asks for generic names. So maybe go with the
spec and call of these "clk-[0-9]" and problem is gone.


Best regards,
Krzysztof
