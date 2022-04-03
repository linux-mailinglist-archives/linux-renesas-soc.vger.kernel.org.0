Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 479974F0855
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Apr 2022 09:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234099AbiDCHyU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 3 Apr 2022 03:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233540AbiDCHyU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 3 Apr 2022 03:54:20 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE66F23BED
        for <linux-renesas-soc@vger.kernel.org>; Sun,  3 Apr 2022 00:52:26 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id v30so2186439wra.8
        for <linux-renesas-soc@vger.kernel.org>; Sun, 03 Apr 2022 00:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OGhR7fsCGdAGY2wOjPk5wHtYldfuj0xXUkoK0MXhdh4=;
        b=Y1o/y0j9gD4Zek8tIWkxDJi0eTT8pRSuJojaaicPJLF6DOdmmdm8buxF/lTxUJmEPg
         0DNz1DWZU12WlTp3nczmn3SBvDZCkUqlSz6PBum4H8zV05wHvvuFRU2H21FRPG3IeFRJ
         B+5maKtruH0ZHsBMi4O7Npk8B2/C1tu6F6ipYU0BLzLuW4vYzlr8B07SJHJtE7JChTAw
         /r5d2aknV/FnMPLhrMU253bNsiM6Upue3K/Eur+kunIR3fVxPNZrhc1mGPGG780HEeae
         B9l16Y1cJjPqknqtMADQmSe7DwTHBaOTskAhVfVerQQS4WPOdkRqxBBe4KR36UgSrRB1
         2Mfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OGhR7fsCGdAGY2wOjPk5wHtYldfuj0xXUkoK0MXhdh4=;
        b=uqriVo9eHqUcdiuPXnAXGAa8BuHCJht4kRzNf0mbCPzAdpvnk7NJsWVe/tG8MnDmjJ
         uJ/eyzSf3Aruoh7x3qwhgtXzFcDl93+qqLz2xg4cIMQGILKd0dBZy8CyVy7Tfr0bnyRk
         jybUGPdclNlQ+cqN4EG9n+3GK7hbn/mu9krGD0xyunG7rJS+z2hsPY17h2fFqh8u9N5u
         IIXVxpsxLhZdw9J2lYIqk/PEjmk11URcGPuvBJ7qb7BEAUnFApq6gcsk1jYtw6Y7nHpf
         oQtfwptt7eDN/1h+nWm2qD21/pkniiFq9NOLZXrMXqmJKmueyL+dwg0soDYExZ8j0DFO
         XuSw==
X-Gm-Message-State: AOAM530bAtsAO0tePcaOMibyodrqDCxxWvFLEQe8i8EE3Km6adXkJCbo
        8m6oP+1C9CCNcPqakCRh0Tzhpw==
X-Google-Smtp-Source: ABdhPJyZyv8GeC4Lg0Bb9bwFkyLvzF9l4kTS9wETtJ4yYkMB1Z4E5y+dyfv6Fo52nW/kTrNi489WMw==
X-Received: by 2002:a5d:594b:0:b0:205:ddb5:84d4 with SMTP id e11-20020a5d594b000000b00205ddb584d4mr13293988wri.200.1648972345179;
        Sun, 03 Apr 2022 00:52:25 -0700 (PDT)
Received: from [192.168.0.171] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id c186-20020a1c35c3000000b0038e6c6fc860sm1825378wma.37.2022.04.03.00.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Apr 2022 00:52:24 -0700 (PDT)
Message-ID: <a5796ff6-a114-e0de-4d86-a82037db4f4a@linaro.org>
Date:   Sun, 3 Apr 2022 09:52:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: renesas: Document Renesas
 RZ/G2UL SMARC EVK
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220402073234.24625-1-biju.das.jz@bp.renesas.com>
 <cf7728fd-b5c8-cd3d-6074-d27f38f86545@linaro.org>
 <OS0PR01MB5922B49ED5DADA5DD3DDA60786E39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <d6989ea9-9e84-0022-aff0-c75b0e3203e2@linaro.org>
 <OS0PR01MB5922C1100BCF87341534FC6E86E39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <e3ebc5d0-d2bc-b5a8-1b19-5e0c2f3d7c41@linaro.org>
 <OS0PR01MB59229D11933BE68648C78B6486E39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <OS0PR01MB59229D11933BE68648C78B6486E39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 02/04/2022 22:48, Biju Das wrote:
> Hi Krzysztof Kozlowski,
> 
> Thanks for the feedback.
> 
>> Subject: Re: [PATCH v4 1/5] dt-bindings: arm: renesas: Document Renesas
>> RZ/G2UL SMARC EVK
>>
>> On 02/04/2022 21:54, Biju Das wrote:
>>>>
>>>> I understand that carrier board is the same, so the SoM differs.
>>>
>>> For R9A07G043 case, even SoM is same, only SOC differs.
>>
>> I assumed that you cannot have same SoMs with different SoCs...
> 
> OK, What I meant here is pin-mapping of 2 SoC's(RZ/G2UL and RZ/Five) are same on the SoM.
> 
>>
>>>
>>>> In your
>>>> model to figure out what type of hardware is it, your choice is to
>>>> compare two compatibles:
>>>> renesas,smarc-evk + renesas,r9a07g043u11
>>>>
>>>> If user-space compares only last compatible, it get's only SMARC, so
>>>> it does not know on what hardware it runs.
>>>
>>> But Here user-space can easily identify the H/W with existing scheme.
>> See the logs from user-space.
>>>
>>> / # for i in machine family soc_id revision; do echo -n "$i: "; cat
>>> /sys/devices/soc0/$i;done
>>> machine: Renesas SMARC EVK based on r9a07g043u11
>>> family: RZ/G2UL
>>> soc_id: r9a07g043
>>> revision: 0
>>
>> User-space is one example. We don't limit to this. Anyway, the compatible
>> is the main way to check it. Machine is just test, not compatible, not
>> part of ABI. soc_id and revision could help, but these are separate ABIs.
>> They can be not compiled-in and then you have only compatible.
>>
>> Regardless whether there is another way for user-space to figure out
>> hardware, it does not change the fact that such usage of compatibles does
>> not look correct with Devicetree spec.
>> "...They
>>  allow a device to express its compatibility with a family of similar
>> devices, potentially allowing a single  device driver to match against
>> several devices."
> 
> Soc specific driver compatible will take care of this. If any quirks to be added
> Soc-id and revision will take care that.

soc_id is independent mechanism and is not related to the discussion
whether Devicetree binding is correct or not.

Soc specific compatible in the driver does not solve this case, because
the top level compatible describes the machine. In this case the machine
is SMARC and it is indistinguishable from other SMARC machines, even
though they are quite different.

> 
>>
>> The "renesas,smarc-evk" compatible is not the most specific one, because
>> different configurations have it.
> 
> It is just a compatible for the carrier board.

Yes, I understand that and you we agreed on that before.

The last compatible (counting from the right in the list), according to
devicetree, is the most specific compatible describing the device. Using
here compatible for a generic carrier board is therefore not correct
from the Devicetree point of view.

> 
>>
>> Again - you intend to use a pair or even a triple of compatibles to
>> uniquely identify type of hardware. I don't think it is correct - the
>> final, most specific compatible, uniquely identifies the hardware. All
>> other compatibles are just for fallback.
> 
> See the examples we have discussed. Geert Do you agree with Krzysztof Kozlowski
> Suggestion?
> 
> 
> If we have 2 boards Board-a and Board-B based on SoCX
> ----------------------------------------------------
> 
> Case 1: As per your example with freescale,
> 
> Enum
>  - Board-a-SoCX
>  - Board-b-SoCX
> Const
>  - SoCX
> 
> Case 2: our case
> Enum
>  - Board-a
>  - Board-b
> 
> Const
>  - SoCX
> 
> 
> If Same board used by different SoC's of same SoC faily
> ====================================
> 
> Case 1: As per your example with freescale,
> 
> Enum
>  - Board-SoCA
>  - Board-SoCB
> Enum
>  - SoCA
>  - SoCB
> Const
>  - SoC

No, that case will look different:

Const
 - Board-SoCA
 - SoCA
 - SoC

Const
 - Board-SoCB
 - SoCB
 - SoC

> 
> Case 2: Our case
> Enum
>  - Board
> Enum
>  - SoCA
>  - SoCB
> Const
>  - SoC
> 
> Cheers,
> Biju


Best regards,
Krzysztof
